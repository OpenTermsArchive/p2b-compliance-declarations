export function replaceTimeAgoByDate(document) {
  [...document.querySelectorAll('time')].forEach(timeAgo =>
    timeAgo.parentNode.replaceChild(document.createTextNode(timeAgo.getAttribute('datetime')), timeAgo));
}
