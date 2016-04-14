(function($){

    "use strict";

    /* ---------------------------------------------- /*
     * Preloader
    /* ---------------------------------------------- */

    $(window).load(function() {
        $('.page-loader').delay(350).fadeOut('slow');
    });

    $(document).ready(function() {

        var moduleHero = $('.module-hero, .module-map'),
            mobileTest;

        /* ---------------------------------------------- /*
         * Mobile detect
        /* ---------------------------------------------- */

        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            mobileTest = true;
        } else {
            mobileTest = false;
        }

        /* ---------------------------------------------- /*
         * Full height module
        /* ---------------------------------------------- */

        $(window).resize(function() {
            if (moduleHero.length > 0) {
                if (moduleHero.hasClass('js-fullheight')) {
                    moduleHero.height($(window).height());
                } else {
                    moduleHero.height($(window).height() * 0.65);
                }
            }
        }).resize();


        /* ---------------------------------------------- /*
         * Setting background of modules
        /* ---------------------------------------------- */

        var modules = $('.module-hero, .module, .module-sm, .module-xs, .sidebar');

        modules.each(function() {
            if ($(this).attr('data-background')) {
                $(this).css('background-image', 'url(' + $(this).attr('data-background') + ')');
            }
        });

        /* ---------------------------------------------- /*
         * Parallax
        /* ---------------------------------------------- */

        if (mobileTest === true) {
            modules.css({'background-attachment': 'scroll'});
        }

        $('.counter').each(function() {
            $(this).appear(function() {
                var number = $(this).find('.counter-timer').attr('data-to');
                $(this).find('.counter-timer').countTo({from: 0, to: number, speed: 1500, refreshInterval: 30});
            });
        });

    });

})(jQuery);
