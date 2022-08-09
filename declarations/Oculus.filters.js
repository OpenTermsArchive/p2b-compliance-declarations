export function cleanUrls(document) {
  const links = document.querySelectorAll('[href*="&e="]');

  links.forEach(link => {
    const url = new URL(link.href);

    url.searchParams.delete('e');
    link.href = url.href;
  });
}
