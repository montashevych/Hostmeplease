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

function validateFile(picture){
  const allowedExtensions =  ['jpg', 'jpeg', 'gif', 'png'],
        sizeLimit = 1000000; // 1 megabyte

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
    picture.classList.add('has-errors');
    alert("file type not allowed");
    event.originalTarget.value = null;

    return false;
  }else if(fileSize > sizeLimit){
    picture.classList.add('has-errors');
    alert("file size too large")
    event.originalTarget.value = null;

    return false;
  }
  picture.classList.remove('has-errors');

  return true;
}
