// Adds a one-time error display
let oneTimeError = (classNameOfElements, elementsEvent) => {
  document.querySelectorAll(`.${classNameOfElements}`).forEach (element => {
    if (element.localName == 'input' ||
        element.firstChild.localName == 'input' ||
        element.firstChild.localName == 'textarea') {
      element.addEventListener(elementsEvent, (event) => {
        element.parentNode.lastChild.remove();
        element.classList.remove('field_with_errors');
      }, { once: true });
    } else {
      element.classList.remove('field_with_errors');
    }
  });
};

// Adds errors a class to the given elements
let addShowingErrorsToField = (itemsPlace, checkedItemsClass, givenClass) => {
  let container = document.getElementById(itemsPlace)
  container.querySelectorAll(`.${checkedItemsClass}`).forEach(messageElement => {
  	if (messageElement.textContent.length > 0) {
  		messageElement.previousSibling.classList.add(givenClass);
  	} else {
      messageElement.previousSibling.classList.remove(givenClass);
    }
  });
};

export { oneTimeError, addShowingErrorsToField }
