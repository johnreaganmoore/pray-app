(function () {

  window.PostView = Backbone.View.extend({
    className: 'post',
    template: _.getTemplate('post'),
    render: function () {

      var newPostHtml = this.template( this.model.toJSON() );

      $(this.el).html(newPostHtml);
    }
  });

})();
