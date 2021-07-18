let oneTimeError = (classNameOfElements, elementsEvent) => {
  document.querySelectorAll(`.${classNameOfElements}`).forEach (element => {
    element.addEventListener(elementsEvent, (event) => {
      element.parentNode.lastChild.remove();
    }, { once: true });
  });
};

oneTimeError('field_with_errors', 'input');
