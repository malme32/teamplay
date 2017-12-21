 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<!doctype html>
<html class="no-js" lang="en">

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:37:07 GMT -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>Soccer HTML5 Template</title>
<%@include  file="prereq.jsp" %>

</head>
<body ng-app="appMain" ng-controller='indexController'  ng-cloak class="ng-cloak">

<!--   <div id="fb-root"></div>
    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/nl_NL/all.js#xfbml=1&appId=643503385720456";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
 -->

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=168415953609149';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="wrap push">

<!--  <div ng-include="'header1.html'"></div>   -->
<%@include  file="header.jsp" %> 




<div ng-view class="main"></div>

<footer class="main-footer style-2">

<div class="container">

<div class="footer-column border-0">
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<div class="logo-column p-white">
<img class="footer-logo" src="${resources}/images/footer-logo.png" alt="">
<ul class="address-list style-2">
<li><span>Address:</span>1782 Harrison Street Sun Prairie</li>
<li><span>Phone Number:</span>49 30 47373795</li>
<li><span>Email Address:</span><a href="http://html.crunchpress.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6a070503042a080603040e1e0f121e0d0f040f180b1e0518440e0f">[email&#160;protected]</a></li>
</ul>
<span class="follow-us">follow us </span>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
<li><a class="tumblr" href="#"><i class="fa fa-tumblr"></i></a></li>
</ul>
</div>
</div>
</div>


<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Advertisment</h5>
<a href="#"><img src="${resources}/images/footer-add.jpg" alt=""></a>
</div>
</div>


<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Sponcer</h5>
<ul id="brand-icons-slider-2" class="brand-icons-slider-2">
<li>
<a href="#"><img src="${resources}/images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-6.png" alt=""></a>
</li>
<li>
<a href="#"><img src="${resources}/images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-6.png" alt=""></a>
</li>
</ul>
</div>
</div>

</div>
</div>

</div>


<div class="copy-rights">
<div class="container">
<p>Â© Copyright by <i class="red-color">FineLayers</i> All rights reserved.</p>
<a class="back-to-top scrollup" href="#"><i class="fa fa-angle-up"></i></a>
</div>
</div>

</footer>

</div>






</body>

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:39:35 GMT -->
</html>