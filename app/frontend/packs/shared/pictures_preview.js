//*******************************************
//*
//* Preview and deleting images befor upload
//*
//*******************************************
import { validateFile } from '../shared/validations'

const PICTURES_INPUT = 'place_pictures_attributes_image'
const PICTURES_UPLOAD_BUTTON = 'place_pictures_label'
const INPUTS_COLUMN_NAME = 'fileInputColumn';
const PICTURES_COLUMN_ID = 'image-column';
const PICTURES_ERRORS_CLASS = 'has-errors';
const PICTURES_ERRORS_TEXT = 'image-error';

let pictureIdNumber = 1;
let uploadButton = document.getElementById(PICTURES_UPLOAD_BUTTON);
let picturesErrorsText = document.getElementById(PICTURES_ERRORS_TEXT);

document.getElementById(PICTURES_INPUT).addEventListener('change', (event) =>{
  if (validateFile(uploadButton, picturesErrorsText)) {
    let picturesInput = document.getElementById(PICTURES_INPUT);
    let selectedPictures = Array.from(event.target.files);
    // Counters
    let pictureNumber = 0;

    selectedPictures.forEach((picture) => {
      // Copy original files input
      let clonedPicturesInput = picturesInput.cloneNode();
      // Create new elements
      let newPictureContainer = document.createElement('div');
      let newPicture = document.createElement('img');

      // set custom FileList
      let getPictureFromList = (input) => {
        let fileListOfPictures = input.files;
        // Transferring picture to cloned input
        let list = new DataTransfer();
        let listItem = fileListOfPictures[pictureNumber++];

        list.items.add(listItem);
        return list.files
      };

      // Creating new input
      let newInput = (input, inputsColumn) => {
        let fileInputColumn = document.getElementById(inputsColumn);

        input.files = getPictureFromList(picturesInput);
        input.id = 'place_picture_image-' + (pictureIdNumber++);
        fileInputColumn.appendChild(input);
      };

      // Creating a button to remove picture
      let createDeleteButton = (removeableElemet, container) => {
        let buttonToDelete = document.createElement('a');

        buttonToDelete.text = 'delete';
        buttonToDelete.className = 'delete_image';
        buttonToDelete.id = 'delete-' + removeableElemet.id;
        container.appendChild(buttonToDelete);

        buttonToDelete.addEventListener('click', () => {
          document.getElementById(removeableElemet.id).outerHTML = '';
          document.getElementById(container.id).outerHTML = '';
        });
      };

      // Creating preview picture
      let createPreview = (pictureElement, picturesColumnId, container, input) => {
        let pictureURL = URL.createObjectURL(input.files[0]);

        pictureElement.src = pictureURL;
        container.id = 'preview-' + input.id;
        container.className = 'preview-div';
        createDeleteButton(input, container);
        container.appendChild(pictureElement);
        document.getElementById(picturesColumnId).appendChild(container);
      };

      newInput(clonedPicturesInput, INPUTS_COLUMN_NAME);
      createPreview(newPicture, PICTURES_COLUMN_ID, newPictureContainer, clonedPicturesInput);
    });
    picturesInput.value = '';
  }
});
