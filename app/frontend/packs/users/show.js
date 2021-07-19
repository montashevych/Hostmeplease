import { validateFile } from '../shared/validations'

let preview_avatar = document.getElementById('avatar-preview');
let preview_avatar_src = preview_avatar.src;

document.getElementById('user_image').addEventListener('change', (event) => {
  if (validateFile(preview_avatar)) {
    let pictureURL = URL.createObjectURL(event.originalTarget.files[0]);

    preview_avatar.src = pictureURL;
  }  else {
    preview_avatar.src = preview_avatar_src;
  }
});
