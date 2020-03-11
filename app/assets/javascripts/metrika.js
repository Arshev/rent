$( document ).on('turbolinks:load', function() {
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter48045371 = new Ya.Metrika({
                    id:48045371,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });
    
        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";
    
        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
    (function(w,d,u){
        var s=d.createElement('script');s.async=true;s.src=u+'?'+(Date.now()/60000|0);
        var h=d.getElementsByTagName('script')[0];h.parentNode.insertBefore(s,h);
    })(window,document,'https://cdn.bitrix24.ru/b11089610/crm/site_button/loader_2_hkhbwb.js');
    // turbolinks reload
    // $(document).on('turbolinks:before-visit', function () {
    //     window.turbolinks_referer = location.href;
    // });
    
    // $(document).on('turbolinks:load', function () {
    //     if (window.turbolinks_referer) {
    //         // yandex metrika
    //         if (window.yaCounter48045371) {
    //             window.yaCounter48045371.hit(location.href, $('title').html(), window.turbolinks_referer);
    //         }
    //     }
    // });
})
