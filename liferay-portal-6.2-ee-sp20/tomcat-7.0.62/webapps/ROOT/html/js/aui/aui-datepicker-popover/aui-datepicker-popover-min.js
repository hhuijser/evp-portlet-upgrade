YUI.add("aui-datepicker-popover",function(e,t){function d(){}var n=e.Lang,r=e.one(e.config.doc),i="activeElement",s="activeInput",o="bottom",u="boundingBox",a="click",f="clickoutside",l="esc",c="key",h="popover",p="popoverCssClass";d.ATTRS={autoHide:{validator:n.isBoolean,value:!0},popover:{setter:"_setPopover",value:{},writeOnce:!0},popoverCssClass:{validator:n.isString,value:e.getClassName("datepicker-popover")}},e.mix(d.prototype,{popover:null,alignTo:function(e){var t=this,n=t.getPopover();n.set("align.node",e)},getPopover:function(){var t=this,n=t.popover;return n||(n=new e.Popover(t.get(h)),n.get(u).on(f,t._onPopoverClickOutside,t),t.popover=n),n},hide:function(){var e=this;e.getPopover().hide()},show:function(){var e=this;e.getPopover().show()},_isActiveInputFocused:function(){var e=this,t=e.get(s);return t===r.get(i)},_onPopoverClickOutside:function(e){var t=this,n=e.target,r=t.get(s);r&&!t._isActiveInputFocused()&&!r.contains(n)&&t.hide()},_setPopover:function(t){var n=this;return e.merge({bodyContent:"",cssClass:n.get(p),constrain:!0,hideOn:[{node:r,eventName:c,keyCode:l}],position:o,render:!0,triggerShowEvent:a,triggerToggleEvent:null,visible:!1},t)}},!0),e.DatePickerPopover=d},"2.0.0",{requires:["aui-classnamemanager","aui-popover"]});
