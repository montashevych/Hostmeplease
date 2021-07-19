// Number field validation with regex for price
let numberFieldValidation = (numberFieldElement) => {
  numberFieldElement.addEventListener('input',  (event) => {
    let getValue = (element) => {
      return element.originalTarget.value
    };

    let value = getValue(event);
    let regex = /^\d+(\.\d{0,2})?$/g;

    if (!regex.test(value)) {
      event.originalTarget.value = value.slice(0, -1);
    }
  });
}

let flashMessage = message => {
  document.body.innerHTML += `
    <div class="alert alert-danger alert-dismissible position-absolute start-50 fade show" role="alert">
      <button class="btn-close" data-bs-dismiss="alert" type="button"></button>
      <span>${message}</span>
    </div>
    `;
}

let validateFile = (picture, pictureErrors = '') => {
  const PICTURES_ERRORS_CLASS = 'has-errors';
  const allowedExtensions =  ['jpg', 'jpeg', 'gif', 'png'],
        sizeLimit = 1048576; // 1 megabyte

  // destructuring file name and size from file object
  const { name:fileName, size:fileSize } = event.originalTarget.files[0];

  /*
  * if filename is apple.png, we split the string to get ["apple","png"]
  * then apply the pop() method to return the file extension
  *
  */
  const fileExtension = fileName.split(".").pop();

  /*
    check if the extension of the uploaded file is included
    in our array of allowed file extensions
  */
  if(!allowedExtensions.includes(fileExtension)){
    picture.classList.add(PICTURES_ERRORS_CLASS);
    flashMessage(`File type .${fileExtension} is not allowed.`);
    event.originalTarget.value = null;

    return false;
  }else if(fileSize > sizeLimit){
    picture.classList.add(PICTURES_ERRORS_CLASS);
    flashMessage('File is too large');
    event.originalTarget.value = null;

    return false;
  }
  picture.classList.remove(PICTURES_ERRORS_CLASS);
  pictureErrors.outerHTML ? pictureErrors.outerHTML = '' : false;

  return true;
}

export { numberFieldValidation, validateFile }
