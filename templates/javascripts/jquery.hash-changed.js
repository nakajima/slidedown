(function($) {
  var currentHash = document.location.hash;
  
  var checkHash = function checkAgain() {
    var newHash = document.location.hash;
    if (currentHash != newHash) {
      currentHash = newHash;
      $(document).trigger('hash.changed');
    }
    window.setTimeout(checkAgain, 10);
  }

  checkHash();
})(jQuery);
