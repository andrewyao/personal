AJS.toInit(function(D){var B=D(".help-section-div");var C=D(".help-section-link");var A=function(F,E){B.each(function(){var G=!E&&(F=="help-section-div-all"||F==this.id);AJS.setVisible(this,G)})};C.each(function(){var G=D(this);var E=G[0].id.replace("help-section-link-","");var F="help-section-div-"+E;G.click(function(J){var I=G.hasClass("active");var H=I?"":E;jQuery.post(AJS.params.contextPath+"/notationhelp-bookmark.action",{section:H});C.removeClass("active");if(!I){G.addClass("active")}A(F,I);return AJS.stopEvent(J)})});D("#print-friendly-help-toggle").click(function(){D("#lefthand-nav").toggleClass("hidden")})});