// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery(document).ready(function($) {

  var $calendarDays = $('.calendar__day');
  $calendarDays.each(function() {
    var slot = parseInt($(this).data('slot')),
        slotPercentage = 100 - ((slot / 24) * 100),
        $bg = $(this).find('.bg');

    $bg.empty().append($('<div class="progress" style="top: ' + slotPercentage + '%;" />'));
  });

});
