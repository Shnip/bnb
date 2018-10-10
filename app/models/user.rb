class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :conversations

  attr_accessor :activation_token

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 200},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}

  before_create :create_activation_digest


  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def check_activation_token(token)
    digest = self.activation_digest
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

    def create_activation_digest
      self.activation_token = SecureRandom.urlsafe_base64
      self.activation_digest = User.digest(activation_token)
    end

    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

end
