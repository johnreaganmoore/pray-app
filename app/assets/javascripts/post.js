(function () {

  window.Post = Backbone.Model.extend({});

  window.PostCollection = Backbone.Collection.extend({
    model: Post
  });

})();
