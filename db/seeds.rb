# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
User.create(first_name: "John", last_name: "Connor", email: "ruby@example.com", password: "foobar", password_confirmation: "foobar").activate

3.times do |i|
  User.create(  first_name: "Terminator",
                last_name: "T#{600 + i}",
                email: "term#{i}@example.com",
                password: "foobar",
                password_confirmation: "foobar"
              ).activate
end

# ROOMS

rome_rooms = [
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 2,
    bath_room: 1,
    listing_name: "APT 5 NEAR THE VATICAN",
    summary: "Apartment suitable for couples and families.The apartment is a lovely vacation home located in very strategic point for those who want to visit Rome. It is situated in a central district that offers the opportunity to walk to St. Peter's Basilica, as well as easy access to all tourist attractions of Rome (the Vatican Museums, Colosseum, Campo de 'Fiori, Spanish Steps, Trevi Fountain , Piazza Navona, etc..)",
    address: "Via Anastasio II, 35, 00165 Roma RM, Italy",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 55,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 2,
    bath_room: 1,
    listing_name: "PANTHEON 2 - LARGE APARTMENT IN THE HEARTH OF ROME",
    summary: "Large and sunny apartment in the heart of Rome, 350 meters from the Pantheon and 700 meters from Piazza Navona, on the third floor of a 1500s building, on entering you will find a small living room with table and chairs. A full kitchen, two large double bedrooms with air conditioning, closets and ceilings with wooden beams, as well as a bathroom with a large shower. Wi fi for the whole accommodation, provision of linen towels and bath products. And 'ideal for families or groups of friends who want to visit Rome just walking, experiencing the atmosphere of the ancient city." ,
    address: "Rione IX Pigna 00186 Rome",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 35,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Elegante Appartamento in Puro Stile Trasteverino",
    summary: "Fatti inondare dalla luce mediterranea di Roma in questo elegante e accogliente appartamento nel quartiere di Trastevere, proprio di fronte all'Isola Tiberina in pieno centro. Vivi l'esperienza romana nel suo massimo tripudio di voci, odori e sapori." ,
    address: "Lungotevere degli Anguillara 00153 Roma RM Italy",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 151,
    active: true
  },
  { home_type: "House",
    room_type: "Entire",
    accommodate: 3,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Romantico Appartamento con Vista sulla Fontana",
    summary: "Prepara un caffè con una delle viste più famose al mondo, in questo elegante appartamento di fronte alla Fontana di Trevi. L’appartamento ha materiali di alta qualità, finiture di pregio e un’atmosfera ideale per delle indimenticabili vacanze romane." ,
    address: "Via Poli, 3, 00187 Roma RM, Italy",
    is_tv: true,
    is_kitchen: true,
    is_air: false,
    is_internet: true,
    is_heating: true,
    price: 98,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 1,
    bath_room: 2,
    listing_name: "My Suite Rome' Luxury Apartment at the Pantheon",
    summary: "Stay in the heart of Rome, in a historic home on the 3rd floor(No elevator)with all the comforts!You can go everywhere on foot and taste the best Roman cuisine!Contact us for all,nothing is more important for us than your stay!!",
    address: "Via del Collegio Capranica, 4, 00186 Roma RM, Italy",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 140,
    active: true
  }
]

# PARIS

paris_rooms = [
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 2,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Appartement atypique entre Bastille, République et Père Lachaise",
    summary: "Cet appartement semblable à nul autre allie une décoration d'inspiration zen, symbolisée par une authentique armure japonaise ou encore des estampes, à une esthétique industrielle, avec ses plinthes et sa verrière en acier.",
    address: "54 Rue Léon Frot, 75011 Paris, France",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: false,
    price: 110,
    active: true
  },
  { home_type: "House",
    room_type: "Entire",
    accommodate: 5,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Small house in Paris Center 5p",
    summary: "Small house in a courtyard.
    In Paris center of Paris, 1 minute walk of the subway Réaumur-Sébastopol (line 3 and line 4), at 2 minutes of the subway Strasbourg-Saint-Denis (line 8, line 9) and at 5 minutes of the subway Arts and Métiers (line 11). With the intersection of 2nd, 3rd and 10th district.",
    address: "13 Rue des Petits Carreaux, 75002 Paris, France",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 105,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 1,
    bath_room: 2,
    listing_name: "Modern Upscale Flat Eiffel Beaugrenelle",
    summary: "Beautiful studio flat in the center of prestigious 15th district just moments away from the main attractions: Eiffel tower, Champs de Mars or Seine river. You will enjoy your stay in this lively area with many options to discover and embrace the city",
    address: "23 Boulevard de Grenelle, 75015 Paris, France",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 127,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 2,
    bath_room: 1,
    listing_name: "Large sunny loft" ,
    summary: "You will stay in a large bright loft (60 m2) fully equiped. Metro station is just down the building and close to main Paris Spots. Quiet oasis in the middle of Belleville vibrant neighborhood, an apartment to live a Parisian experience with a lot of local colors.
    Check in and check out are flexible, depending on previous and next guests. But we always find the best solution for you.",
    address: "4 Cour de la Grâce de Dieu, 75010 Paris, France",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 104,
    active: true
  },
  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 4,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Spazioso e Affascinante Loft nel Cuore del 2° Arrondissement",
    summary: "Fatti ammaliare da questo loft dall'intrigante atmosfera. L'insieme di travi a vista e parquet originali dell'800, mobili in stile classico e di design e alcune chicche rare per Parigi (come avere le finestre in bagno e in cucina) lo rendono unico." ,
    address: "25 Rue de Choiseul, 75002 Paris, France",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 166,
    active: true
  }
]

#NEW YORK

ny_rooms = [
  { home_type: "House",
    room_type: "Entire",
    accommodate: 2,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Private Studio Apartment in Harlem",
    summary: "A newly renovated, clean, modern, private studio apartment in my family's house on a cute block in Harlem. A/C and heating system, free Wifi, cable television, fridge, microwave, queen size bed and optional airbed for an extra guest.
    I love to meet my guests and welcome them personally, but when this is not possible I can leave a key and information about the apartment so a guest can check in at anytime of day or night." ,
    address: "87 Hamilton Pl, New York, NY 10031 USA",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 100,
    active: true
  },

  { home_type: "Bed & Breakfast",
    room_type: "Private",
    accommodate: 2,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Sunny, Modern room in East Village!",
    summary: "This listing is for 1 private room w/ a large queen size bed in a 3 bedroom luxury duplex with a large private terrace on East 9th Street.
    The Apartment: Just one block off Tompkins Square Park in an elevator building. The apartment is a large luxury 2-floor, 3-bedroom, 2-bath duplex in Alphabet City/ East Village and a short walk away from Lower East Side, West Village, SoHo, Noho, Chinatown, Little Italy, and the rest of downtown Manhattan!
    The Room: A large, bright room with a very comfortable queen-sized bed, AC, large closet, and spectacular views of lower Manhattan.
    The Host: Friendly, creative female who loves to travel, write, make movies, listen to music, and meet new people! I've lived in the neighborhood for over 10 years and have lots recommendations for favorite coffee shops, bars, restaurants, bookstores, museums, and anything else you can think of in the city.
    Feel free to write if you have any questions!" ,
    address: "539 E 11th St, New York, NY 10009, USA",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 106,
    active: true
  },

  { home_type: "Apartment",
    room_type: "Entire",
    accommodate: 3,
    bed_room: 1,
    bath_room: 1,
    listing_name: "Times Square Luxury Place",
    summary: "Beautifuly designed apartment in Times Square, perfect for two guest to enjoy New York to the fullest. Clean, bright and comfortable space with it's own bathroom. Close to every cool area to see when visiting the city.
    If you are more than 2 person I will put Sofa bed for 2 extra person.
    Parking is available -- the cost is $34 to $45 for 24 hour" ,
    address: "433 W 43rd St, New York, NY 10036, USA",
    is_tv: true,
    is_kitchen: true,
    is_air: true,
    is_internet: true,
    is_heating: true,
    price: 110,
    active: true
  }
]

def add_rooms(rooms)
  until rooms.empty? do
    User.all.each do |user|
      break if rooms.empty?
      user.rooms.create(rooms.first)
      rooms.slice!(0)
    end
  end
end

rooms = rome_rooms.concat(paris_rooms).concat(ny_rooms)
add_rooms(rooms)

images_path = "app/assets/images/seed"

# attach photos to rooms in rome
Room.first(5).each_with_index do |room, i|
  dir = Dir.children("#{images_path}/Rome #{i+1}").each do |img|
    image = File.new("#{images_path}/Rome #{i+1}/#{img}")
    room.photos.create(image: image)
  end
end

# attach photos to rooms in paris
Room.near("Paris").each_with_index do |room, i|
  dir = Dir.children("#{images_path}/Paris #{i+1}").each do |img|
    image = File.new("#{images_path}/Paris #{i+1}/#{img}")
    room.photos.create(image: image)
  end
end

# attach photos to rooms in new york
Room.last(3).each_with_index do |room, i|
  dir = Dir.children("#{images_path}/NY #{i+1}").each do |img|
    image = File.new("#{images_path}/NY #{i+1}/#{img}")
    room.photos.create(image: image)
  end
end
