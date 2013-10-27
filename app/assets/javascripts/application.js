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
//= require underscore
//= require backbone
//= require util
//= require post
//= require post-view
//= require post-stream-view

jQuery(document).ready(function($) {

  var $calendarDays = $('.calendar .day');
  $calendarDays.each(function() {
    var slot = parseInt($(this).data('slot')),
        slotPercentage = 100 - ((slot / 24) * 100),
        $bg = $(this).find('.bg');

    $bg.empty().append($('<div class="progress" style="top: ' + slotPercentage + '%;" />'));
  });

  $('.register-url').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('.modal--register').show();
    $('.modal--register').find('form').find('input[type="text"], input[type="email"], input[type="password"], select, textarea').first().focus();
  });

  $('.login-url').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('.modal--login').show();
    $('.modal--login').find('form').find('input[type="text"], input[type="email"], input[type="password"], select, textarea').first().focus();
  });

  $(document).on('click', function(e) {
    $('.modal').hide();
  });

  $(document).on('click', '.modal__form', function(e) {
    e.stopPropagation();
  });

  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      $('.modal').hide();
    }
  });

  $('[name="church_type"]').on("change", function(e) {
    $(this).closest('form').find("[class$='-church']").hide();
    $(this).closest('form').find('.' + $(this).val() + '-church').show();
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

  var iconSize = 26;
  var churchIcon = L.icon({
    iconUrl: '/assets/church-marker.svg',

    iconSize:     [iconSize, iconSize], // size of the icon
    iconAnchor:   [iconSize/2, iconSize/2], // point of the icon which will correspond to marker's location
    popupAnchor:  [15, 0] // point from which the popup should open relative to the iconAnchor
  });

  $.getJSON( "/churches", function( churches ) {
    if (churches) {
      for (var i = 0; i < churches.length; i++) {
        var church = churches[i];
        L.marker([church.lat, church.lng], {icon: churchIcon}).addTo(map);
        L.circle([church.lat, church.lng], (church.slots * 400) + 3200, {
          stroke: false,
          fillColor: '#0aa',
          fillOpacity: 0.125
        }).addTo(map);
      }
    }
  });

});

