// Generated by CoffeeScript 1.7.1
(function() {
  var DefaultObject, Framework,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DefaultObject = (function() {
    DefaultObject.events = function(events) {
      var _base;
      if ((_base = this.prototype).events == null) {
        _base.events = {};
      }
      if (!this.prototype.hasOwnProperty("events")) {
        this.prototype.events = $.extend({}, this.prototype.events);
      }
      return this.prototype.events = $.extend(true, {}, this.prototype.events, events);
    };

    DefaultObject.onDomReady = function(initializers) {
      var initializer, _base, _i, _len, _results;
      if ((_base = this.prototype).onDomReady == null) {
        _base.onDomReady = [];
      }
      if (!this.prototype.hasOwnProperty("onDomReady")) {
        this.prototype.onDomReady = this.prototype.onDomReady.slice(0);
      }
      _results = [];
      for (_i = 0, _len = initializers.length; _i < _len; _i++) {
        initializer = initializers[_i];
        _results.push(this.prototype.onDomReady.push(initializer));
      }
      return _results;
    };

    function DefaultObject() {
      this._setupEventListeners = __bind(this._setupEventListeners, this);
      this._setupEventListeners();
    }

    DefaultObject.prototype.domReady = function() {
      return this._loadOnDomReadyMethods();
    };

    DefaultObject.prototype._loadOnDomReadyMethods = function() {
      var callback, _i, _len, _ref, _results;
      _ref = this.onDomReady;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        callback = _ref[_i];
        _results.push(this[callback]());
      }
      return _results;
    };

    DefaultObject.prototype._setupEventListeners = function() {
      var $document, action, actions, callback, selector, _ref, _results;
      $document = $(document);
      _ref = this.events;
      _results = [];
      for (selector in _ref) {
        actions = _ref[selector];
        _results.push((function() {
          var _results1;
          _results1 = [];
          for (action in actions) {
            callback = actions[action];
            if (!this[callback]) {
              throw "" + callback + " doesn't exist when trying to bind " + action + " on " + selector;
            }
            if (selector === 'document') {
              _results1.push($document.on(action, this[callback]));
            } else {
              _results1.push($document.on(action, selector, this[callback]));
            }
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    return DefaultObject;

  })();

  Framework = (function(_super) {
    __extends(Framework, _super);

    function Framework() {
      this.setContentHeight = __bind(this.setContentHeight, this);
      this.askConfirmationAndPostAsAForm = __bind(this.askConfirmationAndPostAsAForm, this);
      this._postAsForm = __bind(this._postAsForm, this);
      this.toggleSubNavigation = __bind(this.toggleSubNavigation, this);
      this._setClassesBasedOnSubNavigation = __bind(this._setClassesBasedOnSubNavigation, this);
      return Framework.__super__.constructor.apply(this, arguments);
    }

    Framework.events({
      '#navbar .nav li a': {
        click: 'toggleSubNavigation'
      },
      '#toggleTabletNavbar': {
        click: 'toggleMediumMenu'
      },
      '#toggleMenu': {
        click: 'toggleSmallMenu'
      },
      '#content.open': {
        touchend: 'toggleSmallMenu'
      },
      '.dropdownToggle': {
        click: 'toggleDropdown'
      },
      'a.backToTop': {
        click: 'scrollToTop'
      },
      'a[href*="#"]': {
        click: 'scrollTo'
      },
      'a.confirm': {
        click: 'askConfirmation'
      },
      'a.confirmPostForm': {
        click: 'askConfirmationAndPostAsAForm'
      },
      '.nav-tabs a': {
        click: 'changeTab'
      },
      'document': {
        form_submitting: 'showLoadingBar',
        ajax_start: 'showLoadingBar',
        ajax_stop: 'hideLoadingBar'
      }
    });

    Framework.onDomReady(['_initAjax', '_initForm', '_initTabs', '_calculateActionsWidths', 'setContentHeight', 'loginAutoFocus']);

    Framework.prototype._initAjax = function() {
      $.ajaxSetup({
        cache: false,
        type: 'POST',
        dataType: 'json',
        timeout: 5000
      });
      $(document).ajaxError(function(event, XMLHttpRequest, ajaxOptions) {
        var json, textStatus;
        if (XMLHttpRequest.status === 403) {
          window.location.reload();
        }
        if (ajaxOptions != null) {
          textStatus = Locale.err('GeneralError');
          if (XMLHttpRequest.responseText != null) {
            json = $.parseJSON(XMLHttpRequest.responseText);
            if (json.message != null) {
              textStatus = json.message;
            } else {
              textStatus = XMLHttpRequest.responseText;
            }
          }
          $('#header').after('<div class="alert alert-error" role="alert">' + '  <div class="container">' + '    <button type="button" class="close" data-dismiss="alert"' + '       title="' + Locale.lbl('Close') + '">' + Locale.lbl('Close') + '    </button>' + '    ' + textStatus + '  </div>' + '</div>');
        }
        return false;
      });
      $(document).ajaxStart((function(_this) {
        return function() {
          return $.event.trigger('ajax_start');
        };
      })(this));
      return $(document).ajaxStop((function(_this) {
        return function() {
          return $.event.trigger('ajax_stop');
        };
      })(this));
    };

    Framework.prototype._initForm = function() {
      return $('form').each(function() {
        var className, formClass;
        className = $(this).data('formClass') || 'Form';
        if (!window[className]) {
          throw className + ' is not defined';
        }
        formClass = window[className];
        return new formClass(this);
      });
    };

    Framework.prototype._initTabs = function() {
      var anchor, url;
      url = document.location.toString();
      if (url.match('#')) {
        anchor = '#' + url.split('#')[1];
        if ($('.nav-tabs a[href=' + anchor + ']').length > 0) {
          $('.nav-tabs a[href=' + anchor + ']').tab('show');
        }
      }
      return $('.tab-content .tab-pane').each(function() {
        if ($(this).find('.error').length > 0) {
          return $('.nav-tabs a[href="#' + $(this).attr('id') + '"]').parent().addClass('error');
        }
      });
    };

    Framework.prototype.changeTab = function(e) {
      var scrolled;
      if (window.history && window.history.pushState) {
        window.history.pushState({}, document.title, this.getAttribute('href'));
      } else {
        scrolled = $(window).scrollTop();
        window.location.hash = '#' + this.getAttribute('href').split('#')[1];
        $(window).scrollTop(scrolled);
      }
      return $(this).tab('show');
    };

    Framework.prototype._calculateActionsWidths = function() {
      return $('.actions li a').each(function() {
        var $this;
        $this = $(this);
        $this.attr('data-width', $this.width());
        $this.width(0);
        return $this.hover(function() {
          return $this.width($this.data('width') + 20);
        }, function() {
          return $this.width(-20);
        });
      });
    };

    Framework.prototype.showLoadingBar = function() {
      $('#header').addClass('progress progress-striped active');
      $('#header .container').addClass('bar');
    };

    Framework.prototype.hideLoadingBar = function() {
      $('#header').removeClass('progress progress-striped active');
      $('#header .container').removeClass('bar');
    };

    Framework.prototype._setClassesBasedOnSubNavigation = function() {
      if ($('#navbar .nav ul.open').length === 0) {
        return $('#toggleTabletNavbar, #navbar, #content, .alert').removeClass('subnav');
      } else {
        return $('#toggleTabletNavbar, #navbar, #content, .alert').addClass('subnav');
      }
    };

    Framework.prototype.toggleSubNavigation = function(e) {
      var $subNav, $this;
      this.subNavOpen;
      $this = $(e.currentTarget);
      $subNav = $this.next('ul');
      if ($subNav.length > 0) {
        e.preventDefault();
        if (!this.subNavOpen) {
          $this.addClass('active');
          $subNav.addClass('open').slideDown();
          this._setClassesBasedOnSubNavigation();
          this.subNavOpen = true;
        } else {
          if ($subNav.is('.open')) {
            $this.removeClass('active');
            $subNav.removeClass('open').slideUp();
            this._setClassesBasedOnSubNavigation();
            this.subNavOpen = false;
          } else {
            $('#navbar .nav li a.active').removeClass('active');
            $('.subNavigation.open').removeClass('open');
            $this.addClass('active');
            $subNav.addClass('open').slideDown();
            this._setClassesBasedOnSubNavigation();
          }
        }
        return false;
      }
    };

    Framework.prototype.toggleMediumMenu = function(e) {
      e.preventDefault();
      $('#navbar').toggleClass('open');
      return $(e.currentTarget).toggleClass('open');
    };

    Framework.prototype.toggleSmallMenu = function(e) {
      e.preventDefault();
      return $('#content').toggleClass('open');
    };

    Framework.prototype.toggleDropdown = function(e) {
      var $this;
      e.preventDefault();
      $this = $(e.currentTarget);
      $this.toggleClass('open');
      return $this.next('ul').slideToggle();
    };

    Framework.prototype.scrollTo = function(e) {
      var $anchor, hash, href, url;
      $anchor = $(e.currentTarget);
      href = $anchor.attr('href');
      url = href.substr(0, href.indexOf('#'));
      hash = href.substr(href.indexOf('#'));
      if ((url === '' || url.indexOf(document.location.pathname) >= 0) && !$anchor.is('[data-no-scroll]') && $(hash).length > 0 && !$anchor.parents().is('.nav-tabs')) {
        $('html, body').stop().animate({
          scrollTop: $(hash).offset().top
        }, 500);
        return false;
      }
    };

    Framework.prototype.scrollToTop = function(e) {
      e.preventDefault();
      return $('html, body').stop().animate({
        scrollTop: $('#content').offset().top
      }, 500);
    };

    Framework.prototype.askConfirmation = function(e) {
      var $this;
      e.preventDefault();
      $this = $(e.currentTarget);
      $('#confirmModalOk').attr('href', $this.attr('href'));
      $('#confirmModalMessage').html($this.data('message'));
      return $('#confirmModal').modal('show');
    };

    false;

    Framework.prototype._postAsForm = function(e) {
      var $element, $form, name, value, _ref;
      $form = $('<form></form>').attr('style', 'display: none;').attr('action', e.attr('href')).attr('method', 'POST').append($('<input type="hidden">').attr('name', 'form_token').attr('value', Data.get('core.form_token')));
      _ref = e.data();
      for (name in _ref) {
        value = _ref[name];
        if (name.substr(0, 5) === 'field') {
          $element = $('<input>').attr('type', 'hidden').attr('name', name.substr(5).toLowerCase()).attr('value', value);
          $form.append($element);
        }
      }
      $('#confirmModal').modal('hide');
      $('body').append($form);
      $.event.trigger('show_loading_bar');
      return $form.submit();
    };

    false;

    Framework.prototype.askConfirmationAndPostAsAForm = function(e) {
      var $modal, $this;
      e.preventDefault();
      $this = $(e.currentTarget);
      $modal = $('#confirmModal');
      $('#confirmModalMessage').html($this.data('message'));
      return $modal.on('click', '#confirmModalOk', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this._postAsForm($this);
        };
      })(this)).modal('show').on('hide', (function(_this) {
        return function(e) {
          return $modal.off('click', '#confirmModalOk');
        };
      })(this));
    };

    false;

    Framework.prototype.setContentHeight = function() {
      var timeout;
      $('#content').css('minHeight', $(window).height());
      timeout = null;
      return $(window).on('resize', function(e) {
        clearTimeout(timeout);
        return timeout = setTimeout(function() {
          return $('#content').css('minHeight', $(window).height());
        }, 200);
      });
    };

    Framework.prototype.loginAutoFocus = function() {
      return $('#users input[id="login"]').focus();
    };

    return Framework;

  })(DefaultObject);

  window.Framework = Framework;

}).call(this);
