let oneTimeError = (classNameOfElements, elementsEvent) => {
  document.querySelectorAll(`.${classNameOfElements}`).forEach (element => {
    console.log(element);
    if (element.firstChild.localName == 'input') {
      element.addEventListener(elementsEvent, (event) => {
        element.parentNode.lastChild.remove();
      }, { once: true });
    } else {
      element.classList.remove('field_with_errors');
    }
  });
};

oneTimeError('field_with_errors', 'input');
