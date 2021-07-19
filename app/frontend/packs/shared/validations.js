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
};

let flashMessage = message => {
  let div = document.createElement('div');
  let button = document.createElement('button');
  let message_span = document.createElement('span');

  div.classList.add('alert', 'alert-danger', 'alert-dismissible',
                              'position-absolute', 'start-50', 'fade', 'show');
  div.role = 'alert';
  button.classList.add('btn-close');
  button.setAttribute('data-bs-dismiss', 'alert');
  button.type = 'button';
  message_span.textContent = message;
  div.appendChild(button);
  div.appendChild(message_span);
  document.body.appendChild(div);
}

let addErrorsClass = (element, className) => {
  element.classList.add(className);
}

let resetFiles = fileHandler => {
  fileHandler.originalTarget.value = null;
}

let validateFile = picture => {
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

    return `File type .${fileExtension} is not allowed.`;

  } else if(fileSize > sizeLimit){

    return 'File is too large';
  }

  return true;
}

export { numberFieldValidation, validateFile, addErrorsClass, resetFiles,
                                                                  flashMessage }
