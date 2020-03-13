$( document ).on('turbolinks:load', function() {
//     (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
//    m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
//    (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

//    ym(48045371, "init", {
//         clickmap:true,
//         trackLinks:true,
//         accurateTrackBounce:true,
//         webvisor:true
//    });
    (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
    m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
    (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

    ym(48045371, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true
    });
    
    // (function() { 
    //     var s = document['createElement']('script');
    //     s.type = 'text/javascript'; 
    //     s.async = true; 
    //     s.charset = 'utf-8';	
    //     s.src = '//cleversite.ru/cleversite/widget_new.php?supercode=1&referer_main='+encodeURIComponent(document.referrer)+'&clid=58945FfebN&siteNew=77074'; 
    //     var ss = document['getElementsByTagName']('script')[0]; 
    //     if(ss) {
    //         ss.parentNode.insertBefore(s, ss);
    //     } else {
    //         document.documentElement.firstChild.appendChild(s);
    //     };
    // })(); 
    // (function (d, w, c) {
    //     (w[c] = w[c] || []).push(function() {
    //         try {
    //             w.yaCounter48045371 = new Ya.Metrika({
    //                 id:48045371,
    //                 clickmap:true,
    //                 trackLinks:true,
    //                 accurateTrackBounce:true,
    //                 webvisor:true
    //             });
    //         } catch(e) { }
    //     });
    
    //     var n = d.getElementsByTagName("script")[0],
    //         s = d.createElement("script"),
    //         f = function () { n.parentNode.insertBefore(s, n); };
    //     s.type = "text/javascript";
    //     s.async = true;
    //     s.src = "https://mc.yandex.ru/metrika/watch.js";
    
    //     if (w.opera == "[object Opera]") {
    //         d.addEventListener("DOMContentLoaded", f, false);
    //     } else { f(); }
    // })(document, window, "yandex_metrika_callbacks");

    // (function(w,d,u){
    //     var s=d.createElement('script');s.async=true;s.src=u+'?'+(Date.now()/60000|0);
    //     var h=d.getElementsByTagName('script')[0];h.parentNode.insertBefore(s,h);
    // })(window,document,'https://cdn.bitrix24.ru/b11089610/crm/site_button/loader_2_hkhbwb.js');
    // (function(d, w, m) {
	// 	window.supportAPIMethod = m;
	// 	var s = d.createElement('script');
	// 	s.type ='text/javascript'; s.id = 'supportScript'; s.charset = 'utf-8';
	// 	s.async = true;
	// 	var id = 'a5b9503208dc960c60af1b3fb77a08ef';
	// 	s.src = 'https://admin.verbox.ru/support/support.js?h='+id;
	// 	var sc = d.getElementsByTagName('script')[0];
	// 	w[m] = w[m] || function() { (w[m].q = w[m].q || []).push(arguments); };
	// 	if (sc) sc.parentNode.insertBefore(s, sc); 
	// 	else d.documentElement.firstChild.appendChild(s);
	// })(document, window, 'Verbox');
})
