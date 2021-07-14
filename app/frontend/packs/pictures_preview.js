let itemNumber = 1;

// Preview and deleting images befor upload
document.getElementById('place_pictures_attributes_image').addEventListener('change', (event) => {
  let inputImage = document.getElementById('place_pictures_attributes_image');
  let selectedFiles = Array.from(event.target.files);
  let imageNumber = 0;

  selectedFiles.forEach((file) => {
    let newimage_div = document.createElement('div');
    let newimage = document.createElement('img');
    let link_to_delete = document.createElement('a');
    let clonedInput = inputImage.cloneNode();
    let image = URL.createObjectURL(file);
    const COLUMN_NAME = 'fileInputColumn';

    let newInput = (input) => {
      let fileInputColumn = document.getElementById('fileInputColumn');
      let fileList = inputImage.files;

      // set custom FileList
      let list = new DataTransfer();
      let listItem = fileList[imageNumber++];

      list.items.add(listItem);

      let myImage = list.files;

      // Creating new input
      input.files = myImage;
      input.id = 'place_picture_image-' + (itemNumber++);
      fileInputColumn.appendChild(input);
    };

    newInput(clonedInput, COLUMN_NAME);

    // Creating a link to remove image
    link_to_delete.text = 'delete';
    link_to_delete.className = 'delete_image';
    link_to_delete.id = 'delete-' + clonedInput.id;
    newimage_div.appendChild(link_to_delete);

    // Creating preview
    newimage.src = image;
    newimage_div.id = 'preview-' + clonedInput.id;
    newimage_div.className = 'preview-div';
    newimage_div.appendChild(newimage);
    document.getElementById('image-column').appendChild(newimage_div);

    // Add eventListener for delete image
    document.getElementById(link_to_delete.id).addEventListener('click', () => {
      document.getElementById(clonedInput.id).outerHTML = '';
      document.getElementById(newimage_div.id).outerHTML = '';
    });
  });
  inputImage.value = '';
});
