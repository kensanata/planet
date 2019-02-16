var entries = []; // list of news items

// event complete: stop propagation of the event
function stopPropagation(event) {
  if (event.preventDefault) {
    event.preventDefault();
    event.stopPropagation();
  } else {
   event.returnValue = false;
  }
}

// scroll back to the previous article
function prevArticle(event) {
  for (var i=entries.length; --i>=0;) {
    if (entries[i].anchor.offsetTop < document.documentElement.scrollTop) {
      window.location.hash=entries[i].anchor.id;
      stopPropagation(event);
      break;
    }
  }
}

// advance to the next article
function nextArticle(event) {
  for (var i=1; i<entries.length; i++) {
    if (entries[i].anchor.offsetTop-20 > document.documentElement.scrollTop) {
      window.location.hash=entries[i].anchor.id;
      stopPropagation(event);
      break;
    }
  }
}

// process keypresses
function navkey(event) {
  if (!event) event=window.event;
  key=event.keyCode;
  if (!document.documentElement) return;
  if (key == 'J'.charCodeAt(0)) nextArticle(event);
  if (key == 'K'.charCodeAt(0)) prevArticle(event);
}

function personalize() {
  var span = document.getElementsByTagName('span');
  for (var i=0; i<span.length; i++) {
    var parent = span[i];
    while (parent && parent.className != 'news') {
      parent = parent.parentNode;
    }
    
    if (parent) {
      var info = entries[entries.length] = new Object();
      info.parent = parent;
      info.anchor = document.createElement('a');
      info.anchor.id = "news-" + i;
      parent.insertBefore(info.anchor, parent.firstChild);
    }
  }

  document.onkeydown = navkey;
}

// hook event
window.onload = personalize;
if (document.addEventListener) {
    onDOMLoad = function() {
      window.onload = undefined;
      personalize();
    };
    document.addEventListener("DOMContentLoaded", onDOMLoad, false);
}
