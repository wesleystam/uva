// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip();

  $('[data-href]').on('click', function(e) {
    e.preventDefault();
    Turbolinks.visit(e.currentTarget.dataset.href);
  });
});
