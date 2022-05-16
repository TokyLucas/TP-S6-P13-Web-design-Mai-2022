<%@page import="java.sql.Timestamp, java.text.*, java.util.*, com.etu1021.globalwarming.admin.Admin"%>
<%@ page
	import="com.fasterxml.jackson.databind.JsonNode, java.util.Iterator "%>
<%
	String titre = (request.getAttribute("titre")!=null) ? (String) request.getAttribute("titre") : "";
	JsonNode categorie = (JsonNode) request.getAttribute("categorie");
	Admin admin = (Admin) session.getAttribute("admin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="irstheme">

    <title> AAnglo - Rechauffement climatique </title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">

    <link href="/assets/css/themify-icons.css" rel="stylesheet">
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/owl.carousel.css" rel="stylesheet">
    <link href="/assets/css/owl.theme.css" rel="stylesheet">
    <link href="/assets/css/slick.css" rel="stylesheet">
    <link href="/assets/css/slick-theme.css" rel="stylesheet">
    <link href="/assets/css/swiper.min.css" rel="stylesheet">
    <link href="/assets/css/owl.transitions.css" rel="stylesheet">
    <link href="/assets/css/jquery.fancybox.css" rel="stylesheet">
    <link href="/assets/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- start page-wrapper -->
    <div class="page-wrapper">

        <!-- start preloader -->
        <div class="preloader">
            <div class="lds-roller">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- end preloader -->

        <!-- Start header -->
        <%@include file="inc/header.jsp" %>
        <!-- end of header -->

        
                <!-- start checkout-section -->
        <section class="checkout-section section-padding">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="woocommerce">
<!--                             <div class="woocommerce-info">Returning customer? <a href="#" class="showlogin">Click here to login</a></div> -->
<!--                             <form method="post" class="login" > -->
<!--                                 <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing &amp; Shipping section.</p> -->

<!--                                 <p class="form-row form-row-first"> -->
<!--                                     <label for="username">Username or email <span class="required">*</span></label> -->
<!--                                     <input type="text" class="input-text" name="username" id="username" /> -->
<!--                                 </p> -->
<!--                                 <p class="form-row form-row-last"> -->
<!--                                     <label for="password">Password <span class="required">*</span></label> -->
<!--                                     <input class="input-text" type="password" name="password" id="password" /> -->
<!--                                 </p> -->
<!--                                 <div class="clear"></div> -->

<!--                                 <p class="form-row"> -->
<!--                                     <input type="hidden" id="_wpnonce" name="_wpnonce" value="94dfaf2ac1" /> -->
<!--                                     <input type="hidden" name="_wp_http_referer" value="/wp/?page_id=6" /> -->
<!--                                     <input type="submit" class="button" name="login" value="Login" /> -->
<!--                                     <input type="hidden" name="redirect" value="#" /> -->
<!--                                     <label for="rememberme" class="inline"> -->
<!--                                         <input name="rememberme" type="checkbox" id="rememberme" value="forever" /> Remember me </label> -->
<!--                                 </p> -->
<!--                                 <p class="lost_password"> -->
<!--                                     <a href="#">Lost your password?</a> -->
<!--                                 </p> -->

<!--                                 <div class="clear"></div> -->

<!--                             </form> -->

                            <div class="woocommerce-info">Se connecter en tant qu' administrateur.</div>

							<% if(admin != null) { %>
                            	<div class="woocommerce-info">Connection en cours: <%= admin.getEmail() %></div>
                            	<a href="/admin/logout">Se deconnecter</a>
                            <% } %>

                            <form name="creer" method="post" class="checkout woocommerce-checkout" action="/admin/auth" >

                                <div class="col2-set" id="customer_details">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">

                                            <h3>Se connecter.</h3>
                                            <div class="clear"></div>

                                            <p class="form-row form-row form-row-wide" id="Email">
                                                <label for="billing_company" class="">Email</label>
                                                <input type="email" class="input-text " name="Email" id="Email" placeholder="" autocomplete="organization" value="" />
                                            </p>
                                            
											<p class="form-row form-row form-row-wide" id="mdp">
                                                <label for="billing_company" class="">Mot de passe</label>
                                                <input type="password" class="input-text " name="mdp" id="mdp" placeholder="" autocomplete="organization" value="" />
                                            </p>
                                            
                                            <p class="form-row form-row form-row-wide" id="billing_company_field">
                                                <input type="submit" class="woocommerce-info  input-text" name="billing_company" id="submit" value="Cr&eacute;er" />
                                            </p>
                                            
                                        </div>
                                    </div>



                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>


		<hr />

        <!-- start footer-section -->     
        
        <%@ include file="inc/footer.jsp" %>
        <!-- end footer-section -->
    </div>
    <!-- end of page-wrapper -->



    <!-- All JavaScript files
    ================================================== -->
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>

    <!-- Plugins for this template -->
    <script src="/assets/js/jquery-plugin-collection.js"></script>
    <script src="/assets/js/navigation.js"></script>

    <!-- Custom script for this template -->
    <script src="/assets/js/script.js"></script>
</body>
</html>
