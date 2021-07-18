document.getElementById('user_image').addEventListener('change', (event) => {
  let avatar = document.getElementById('avatar-preview');
  let pictureURL = URL.createObjectURL(event.originalTarget.files[0]);

  avatar.src = pictureURL;
});
