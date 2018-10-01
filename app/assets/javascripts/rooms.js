class PhotoPreview {
  constructor(options = {}) {
    this.container = options.container;
    this.input = options.input;
    this._handleFile(this.input);
    // this.files = [];
    // this._handleDestroyFile();
  }

  _createElem(elem, className = ""){
    let div = document.createElement(elem);
    div.className = className;
    return div;
  }

  _createCard(file){
    let colDiv = this._createElem("div", "col-sm-4");
    let cardDiv = this._createElem("div", "card");
    let cardHeaderDiv = this._createElem("div", "card-header photo-preview");
    let cardBodyDiv = this._createElem("div", "card-body");
    colDiv.appendChild(cardDiv);
    cardDiv.appendChild(cardHeaderDiv);
    cardDiv.appendChild(cardBodyDiv);
    // let i = this._createElem("i", "fas fa-times fa-lg float-right");
    // i.setAttribute('data-destroy-photo', '');
    // cardBodyDiv.appendChild(i);

    let img = this._createElem("img", "card-img-top");
    img.src = file.result;
    cardHeaderDiv.appendChild(img);

    return colDiv;
  }

  _handleFile(input){

    input.oninput = (event) => {
      let files = event.target.files;

      for (var i = 0; i < files.length; i++) {
        let file = files[i];

        if (!file.type.match("image.*")) {
          continue;
        };

        var reader = new FileReader();

        reader.onload = (event) => {
          let card = this._createCard(event.target);
          this.container.appendChild(card);
        };

        reader.onerror = function(event) {
          console.error(
            `The file ${event.target.name} can't be readed. Error code: ${event.target.error.code}`
          );
        };
        reader.readAsDataURL(file);
      }
    }
  }

  _handleDestroyFile(){
    this.container.onclick = (event) => {
      if (!event.target.hasAttribute('data-destroy-photo')){
        return;
      }
      let colDiv = event.target.closest('.col-sm-4');
      colDiv.parentElement.removeChild(colDiv);

    }
  }
};

function preparePreview(){
  let input = document.querySelector('.btn-file input');
  let container = document.getElementById('photo-preview');
  if(!input || !container ){
    console.log("Input or Container don't exist")
    return false;
  }
  new PhotoPreview({container: container, input: input});
}

document.addEventListener("DOMContentLoaded", preparePreview);
