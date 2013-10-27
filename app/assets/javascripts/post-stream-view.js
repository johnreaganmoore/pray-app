(function () {

  window.PostStreamView = Backbone.View.extend({
    initialize: function (options) {
      this.listenTo(this.collection, 'add', this.addPostToView);
    },

    addPostToView: function (post) {
      var view = new PostView({ model: post });
      view.render();
      $(this.el).prepend(view.el);
    },
  });

})();
