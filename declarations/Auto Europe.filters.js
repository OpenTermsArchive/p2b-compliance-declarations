export async function moveModalContentFromAttributeToBody(document, declaration) {
  const modalParamsString = decodeURIComponent(document.querySelector('[data-aff-terms]').getAttribute('data-aff-terms'));
  const modalParams = JSON.parse(modalParamsString);

  document.body.insertAdjacentHTML('beforeend', `<div 
id="open-terms-archive-content"><h1>${modalParams.HEAD}</h1>${modalParams.BODY}</div>`);
}
