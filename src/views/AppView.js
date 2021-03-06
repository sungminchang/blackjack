// Generated by CoffeeScript 1.9.0
var __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  __hasProp = {}.hasOwnProperty;

window.AppView = (function(_super) {
  __extends(AppView, _super);

  function AppView() {
    return AppView.__super__.constructor.apply(this, arguments);
  }

  AppView.prototype.template = _.template('<button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <div class="player-hand-container"></div> <div class="dealer-hand-container"></div>');

  AppView.prototype.initialize = function() {
    this.render();
    console.log(this.model);
    this.$('.hit-button').on('click', (function(_this) {
      return function() {
        return _this.model.get('playerHand').hit();
      };
    })(this));
    this.$('.stand-button').on('click', (function(_this) {
      return function() {
        return _this.model.get('playerHand').stand();
      };
    })(this));
    return this.model.on('change:end', (function(_this) {
      return function() {
        _this.$('.hit-button').off('click');
        return _this.$('.stand-button').off('click');
      };
    })(this));
  };

  AppView.prototype.render = function() {
    this.$el.children().detach();
    this.$el.html(this.template());
    this.$('.player-hand-container').html(new HandView({
      collection: this.model.get('playerHand')
    }).el);
    return this.$('.dealer-hand-container').html(new HandView({
      collection: this.model.get('dealerHand')
    }).el);
  };

  return AppView;

})(Backbone.View);
