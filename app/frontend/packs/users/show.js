import { validateFile,
         addErrorsClass,
         resetFiles,
         flashMessage } from '../shared/validations'

const PICTURES_ERRORS_CLASS = 'has-errors';

let preview_avatar = document.getElementById('avatar-preview');
let preview_avatar_src = preview_avatar.src;

document.getElementById('user_image').addEventListener('change', (event) => {
  // Gives me true or errors message
  let valideOrMessage = validateFile(preview_avatar);

  if (valideOrMessage == true) {
    let pictureURL = URL.createObjectURL(event.originalTarget.files[0]);

    preview_avatar.classList.remove(PICTURES_ERRORS_CLASS);
    preview_avatar.src = pictureURL;
  }  else {
    flashMessage(valideOrMessage);

    preview_avatar.src = preview_avatar_src;

    addErrorsClass(preview_avatar, PICTURES_ERRORS_CLASS);
    resetFiles(event);
  }
});
