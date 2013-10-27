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

  var map = L.map($('.map')[0], {
    zoomControl: false,
    attributionControl: false,
    center: [30.264998, -97.740083],
    zoom: 10,
    minZoom: 10,
    dragging: false,
    scrollWheelZoom: false
  });

  L.tileLayer('http://b.sm.mapstack.stamen.com/((toner-lines,$fff[hsl-saturation])[overlay],streets-and-labels[@60])/{z}/{x}/{y}.png', {
    attribution: false,
    maxZoom: 18
  }).addTo(map);

  $.getJSON( "/churches", function( churches ) {
    if (churches) {
      for (var i = 0; i < churches.length; i++) {
        var church = churches[i];
        L.circle([church.lat, church.lng], church.slots * 200, {
          stroke: false,
          fillColor: '#0aa',
          fillOpacity: 0.125
        }).addTo(map);
      }
    }
  });

});
