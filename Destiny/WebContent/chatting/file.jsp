<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en-US" itemscope itemtype="https://schema.org/WebPage">
<head>
		<title>
		File API Simple	</title>
	<!--[if lt IE 9]>
	<script src="https://bestvpn.org/wp-content/themes/focusblog/js/html5/dist/html5shiv.js"></script>
	<script src="//css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="https://bestvpn.org/wp-content/themes/focusblog/css/ie8.css"/>
	<![endif]-->
	<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="https://bestvpn.org/wp-content/themes/focusblog/css/ie7.css"/>
	<![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta charset="UTF-8">

	
			
<!-- All in One SEO Pack 2.10.1 by Michael Torbert of Semper Fi Web Designob_start_detected [-1,-1] -->
<!-- /all in one seo pack -->
<link rel='dns-prefetch' href='//a.optmnstr.com' />
<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<link rel='dns-prefetch' href='//s.w.org' />
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/bestvpn.org\/wp-includes\/js\/wp-emoji-release.min.js?ver=5.0.3"}};
			!function(a,b,c){function d(a,b){var c=String.fromCharCode;l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,a),0,0);var d=k.toDataURL();l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,b),0,0);var e=k.toDataURL();return d===e}function e(a){var b;if(!l||!l.fillText)return!1;switch(l.textBaseline="top",l.font="600 32px Arial",a){case"flag":return!(b=d([55356,56826,55356,56819],[55356,56826,8203,55356,56819]))&&(b=d([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]),!b);case"emoji":return b=d([55358,56760,9792,65039],[55358,56760,8203,9792,65039]),!b}return!1}function f(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var g,h,i,j,k=b.createElement("canvas"),l=k.getContext&&k.getContext("2d");for(j=Array("flag","emoji"),c.supports={everything:!0,everythingExceptFlag:!0},i=0;i<j.length;i++)c.supports[j[i]]=e(j[i]),c.supports.everything=c.supports.everything&&c.supports[j[i]],"flag"!==j[i]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[j[i]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(h=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",h,!1),a.addEventListener("load",h,!1)):(a.attachEvent("onload",h),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),g=c.source||{},g.concatemoji?f(g.concatemoji):g.wpemoji&&g.twemoji&&(f(g.twemoji),f(g.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='wp-block-library-css'  href='https://bestvpn.org/wp-includes/css/dist/block-library/style.min.css?ver=5.0.3' type='text/css' media='all' />
<link rel='stylesheet' id='contact-form-7-css'  href='https://bestvpn.org/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.1.1' type='text/css' media='all' />
<link rel='stylesheet' id='toc-screen-css'  href='https://bestvpn.org/wp-content/plugins/table-of-contents-plus/screen.min.css?ver=1509' type='text/css' media='all' />
<link rel='stylesheet' id='wp-date-remover-css'  href='https://bestvpn.org/wp-content/plugins/wp-date-remover/public/css/wp-date-remover-public.css?ver=1.0.0' type='text/css' media='all' />
<link rel='stylesheet' id='yasrcss-css'  href='https://bestvpn.org/wp-content/plugins/yet-another-stars-rating/css/yasr.css' type='text/css' media='all' />
<style id='yasrcss-inline-css' type='text/css'>

		.star-rating {
            background-image: url("https://bestvpn.org/wp-content/plugins/yet-another-stars-rating/img/star_2.svg");
        }
        .star-rating .star-value {
            background: url("https://bestvpn.org/wp-content/plugins/yet-another-stars-rating/img/star_3.svg") ;
        }
	
</style>
<link rel='stylesheet' id='dashicons-css'  href='https://bestvpn.org/wp-includes/css/dashicons.min.css?ver=5.0.3' type='text/css' media='all' />
<link rel='stylesheet' id='yasrcsslightscheme-css'  href='https://bestvpn.org/wp-content/plugins/yet-another-stars-rating/css/yasr-table-light.css' type='text/css' media='all' />
<link rel='stylesheet' id='wp_review_comments-css'  href='https://bestvpn.org/wp-content/plugins/wp-review-pro/assets/css/comments.css?ver=2.1.4' type='text/css' media='all' />
<link rel='stylesheet' id='googleapis-fonts_fix-css'  href='https://bestvpn.org/wp-content/themes/child_focusblog/assets/css/fix.css?ver=5.0.3' type='text/css' media='all' />
<link rel='stylesheet' id='wpb-google-fonts-css'  href='//fonts.googleapis.com/css?family=Montserrat%3A400%2C400italic%2C500&#038;ver=5.0.3' type='text/css' media='all' />
<link rel='stylesheet' id='focusblog-style-css'  href='https://bestvpn.org/wp-content/themes/child_focusblog/style.css?ver=5.0.3' type='text/css' media='all' />
<link rel='stylesheet' id='thrive-reset-css'  href='https://bestvpn.org/wp-content/themes/focusblog/css/reset.css?ver=20120208' type='text/css' media='all' />
<link rel='stylesheet' id='thrive-main-style-css'  href='https://bestvpn.org/wp-content/themes/focusblog/css/main_blue.css?ver=5566' type='text/css' media='all' />
<link rel='stylesheet' id='tablepress-default-css'  href='https://bestvpn.org/wp-content/plugins/tablepress/css/default.min.css?ver=1.9.1' type='text/css' media='all' />
<link rel='stylesheet' id='html5-css'  href='https://bestvpn.org/html5demos/css/html5demos.css?ver=5.0.3' type='text/css' media='all' />
<script type='text/javascript' src='https://bestvpn.org/wp-includes/js/jquery/jquery.js'></script>
<script type='text/javascript' src='https://bestvpn.org/wp-includes/js/jquery/jquery-migrate.min.js'></script>
<script type='text/javascript' src='https://bestvpn.org/wp-content/plugins/wp-date-remover/public/js/wp-date-remover-public.js?ver=1.0.0'></script>
<script type='text/javascript' data-cfasync="false" id="omapi-script" async="async" src='https://a.optmnstr.com/app/js/api.min.js'></script>
<script type='text/javascript' src='https://bestvpn.org/html5demos/js/h5utils.js?ver=5.0.3'></script>
<script type='text/javascript' src='https://bestvpn.org/html5demos/js/modernizr.custom.js?ver=5.0.3'></script>
<link rel='https://api.w.org/' href='https://bestvpn.org/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://bestvpn.org/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://bestvpn.org/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 5.0.3" />
<!-- HFCM by 99 Robots - Snippet # 3: Improvely -->
<script type="text/javascript">
var im_domain = 'wr';
var im_project_id = 9;
(function(e,t){window._improvely=[];var n=e.getElementsByTagName("script")[0];var r=e.createElement("script");r.type="text/javascript";r.src="https://"+im_domain+".iljmp.com/improvely.js";r.async=true;n.parentNode.insertBefore(r,n);if(typeof t.init=="undefined"){t.init=function(e,t){window._improvely.push(["init",e,t])};t.goal=function(e){window._improvely.push(["goal",e])};t.conversion=function(e){window._improvely.push(["conversion",e])};t.label=function(e){window._improvely.push(["label",e])}}window.improvely=t;t.init(im_domain,im_project_id)})(document,window.improvely||[])
</script>

<!-- /end HFCM by 99 Robots -->
<!--[if IE 7]>
<link rel="stylesheet" href="https://bestvpn.org/wp-content/plugins/wp-review-pro/assets/css/wp-review-ie7.css">
<![endif]-->
		<style type="text/css">.wp-video-shortcode {
				max-width: 100% !important;
			}body { background:#; }.cnt .sAs .twr { background:#; }.cnt article h1.entry-title a { color:#424242; }.cnt article h2.entry-title a { color:#424242; }.bSe h1 { color:#424242; }.bSe h2 { color:#424242; }.bSe h3 { color:#424242; }.bSe h4 { color:#424242; }.bSe h5 { color:#424242; }.bSe h6 { color:#424242; }.cnt p { color:#424242; }.cnt .bSe article { color:#424242; }.cnt article h1 a, .tve-woocommerce .bSe .awr .entry-title, .tve-woocommerce .bSe .awr .page-title{font-family:Lato,sans-serif;}.bSe h1{font-family:Lato,sans-serif;}.bSe h2,.tve-woocommerce .bSe h2{font-family:Lato,sans-serif;}.bSe h3,.tve-woocommerce .bSe h3{font-family:Lato,sans-serif;}.bSe h4{font-family:Lato,sans-serif;}.bSe h5{font-family:Lato,sans-serif;}.bSe h6{font-family:Lato,sans-serif;}#text_logo{font-family:Lato,sans-serif;}.bSe h1 { text-transform:none; }.bSe h2 { text-transform:none; }.cnt, .bp-t, .tve-woocommerce .product p, .tve-woocommerce .products p{font-family:Open Sans,sans-serif;}article strong {font-weight: bold;}.bSe h1, .bSe .entry-title { font-size:38px; }.cnt { font-size:16px; }.thrivecb { font-size:16px; }.out { font-size:16px; }.aut p { font-size:16px; }.cnt p { line-height:1.6em; }.dhgh { line-height:1.6em; }.lhgh { line-height:1.6em; }.dhgh { font-size:16px; }.lhgh { font-size:16px; }.thrivecb { line-height:1.6em; }.cnt .cmt, .cnt .acm { background-color:#4174dc; }.trg { border-color:#4174dc transparent transparent; }.str { border-color: transparent #4174dc transparent transparent; }.pgn a:hover, .pgn .dots a:hover { background-color:#4174dc; }.brd ul li a { color:#4174dc; }.bSe a { color:#4174dc; }.bSe h1 { text-transform:none; }.bSe .faq h4{font-family:Open Sans,sans-serif;}article strong {font-weight: bold;}header ul.menu > li > a { color:#424242; }header ul.menu > li > a:hover { color:#4174dc; }header ul.menu > li.h-cta > a { color:#FFFFFF!important; }header ul.menu > li.h-cta >a  { background:#4d7fe3; }header ul.menu > li.h-cta >a  { border-color:#4d7fe3; }header ul.menu > li.h-cta:hover > a { color:#4d7fe3!important; }header ul.menu > li.h-cta > a:hover { background:#transparent; }header nav > ul > li.current_page_item > a:hover { color:#4174dc; }header nav > ul > li > a:active { color:#4174dc; }header #logo > a > img { max-width:200px; }</style>
					<style type="text/css">header nav ul li a {
 font-weight: normal;
 font-size: 16px;
 font-type: "Montserrat", sans-serif; !important;
 }

@media only screen and (max-width: 768px) {
header nav ul li ul
{ display: block; }
}</style>
		</head>


<body>


<article>
  <p id="status">File API &amp; FileReader API not supported</p>
  <p><input type=file></p>
  <p>Select an image from your machine to read the contents of the file without using a server</p>
  <div id="holder"></div>
</article>
<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script>
	</div>
</div>
<div class="clear"></div>

<script type="text/javascript">
var clicky_site_ids = clicky_site_ids || [];
clicky_site_ids.push(101037519);
(function() {
  var s = document.createElement('script');
  s.type = 'text/javascript';
  s.async = true;
  s.src = '//static.getclicky.com/js';
  ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
})();
</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/101037519ns.gif" /></p></noscript>
<!-- /end HFCM by 99 Robots -->
<!-- HFCM by 99 Robots - Snippet # 2: Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-96856212-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- /end HFCM by 99 Robots -->
<script async>(function(s,u,m,o,j,v){j=u.createElement(m);v=u.getElementsByTagName(m)[0];j.async=1;j.src=o;j.dataset.sumoSiteId='8cd63400cd3141008697a600833b7300510e4b00219cc0003c1d6600bee9b400';j.dataset.sumoPlatform='wordpress';v.parentNode.insertBefore(j,v)})(window,document,'script','//load.sumo.com/');</script>    <script type="application/javascript">
      var ajaxurl = "https://bestvpn.org/wp-admin/admin-ajax.php";

      function sumo_add_woocommerce_coupon(code) {
        jQuery.post(ajaxurl, {
          action: 'sumo_add_woocommerce_coupon',
          code: code,
        });
      }

      function sumo_remove_woocommerce_coupon(code) {
        jQuery.post(ajaxurl, {
          action: 'sumo_remove_woocommerce_coupon',
          code: code,
        });
      }

      function sumo_get_woocommerce_cart_subtotal(callback) {
        jQuery.ajax({
          method: 'POST',
          url: ajaxurl,
          dataType: 'html',
          data: {
            action: 'sumo_get_woocommerce_cart_subtotal',
          },
          success: function(subtotal) {
            return callback(null, subtotal);
          },
          error: function(err) {
            return callback(err, 0);
          }
        });
      }
    </script>
            <script type="text/javascript">
        jQuery( document ).ready( function($) {
            $('body').on( 'click' , 'a' , function(e){

                var $this       = $( this ),
                    linkID      = $this.data( 'linkid' ),
                    href        = linkID ? $this.attr( 'href' ) : thirstyFunctions.isThirstyLink( $this.attr( 'href' ) ),
                    action_name = 'Partner Link',
                    page_slug   = '/html5demos/file-api-simple/',
                    home_url    = 'https://bestvpn.org';

                if ( ! href || typeof ga !== 'function' )
                  return;

                var is_uncloak  = href.indexOf( home_url + '/' + thirsty_global_vars.link_prefix ) < 0,
                    href_parts  = href.split('/'),
                    href_last   = href_parts[ href_parts.length - 1 ] ? href_parts[ href_parts.length - 1 ] : href_parts[ href_parts.length - 2 ],
                    link_text   = $this.text(),
                    link_uri    = linkID && is_uncloak ? href : href.replace( home_url , '' ),
                    link_slug   = linkID && is_uncloak ? href : href_last;

                ga( 'send' , 'event' , {
                    eventCategory : action_name,
                    eventAction   : link_uri,
                    eventLabel    : page_slug,
                    transport     : 'beacon'
                } );
            });
        });
        </script>
        		
	</body>
</html>