<%@page import="java.sql.Timestamp, java.text.*, java.util.*"%>
<%@ page
	import="com.fasterxml.jackson.databind.JsonNode, java.util.Iterator "%>
<%
	String titre = (request.getAttribute("titre")!=null) ? (String) request.getAttribute("titre") : "";
	JsonNode articles = (JsonNode) request.getAttribute("articles");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="irstheme">
	
	<meta 
		name="Description" 
		content = "	Le r�chauffement climatique est le r�chauffement � long terme de la temp�rature globale de la plan�te. 
		                    	Bien que cette tendance au r�chauffement se poursuive depuis longtemps, son rythme s'est consid�rablement acc�l�r� au cours des cent derni�res ann�es en raison de la combustion de combustibles fossiles. 
		                    	L'augmentation de la population humaine s'est accompagn�e d'une augmentation du volume de combustibles fossiles br�l�s. Les combustibles fossiles comprennent le charbon, le p�trole et le gaz naturel, et leur combustion provoque ce que l'on appelle l'effet de serre dans l'atmosph�re terrestre. "
	>
	<meta name="keywords" content="1021, rechauffement climatique, rechaffaument, climatique, causes, cons�quences, changement climatique, effet de serre">
	
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
        <header id="header" class="site-header header-style-1">

            <nav id="site-navigation" class="navigation navbar navbar-default">
                <div class="container-full">
                    <div class="navbar-header">
                        <button type="button" id="hamburger-menu" class="open-nav-btn open-btn" aria-label="open navigation" aria-controls="link-list" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><img src="/assets/images/logo.png" alt></a>
                    </div>
                    <div id="slide-nav" class="navbar-collapse collapse navigation-holder slide-content">
                        <button  type="button" id="close" class="close-btn close-navbar" aria-label="close navigation"><i class="ti-close"></i></button>
                        <ul id="link-list" class="nav navbar-nav menu nav-menu">
                            <li class="current-menu-item"><a href="/home">Home</a></li>
                            <li class="menu-item-has-children menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-14">
                                <a href="#">Pages</a>
                                <ul class="sub-menu">
                                    <li><a href="#">404</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">Cart</a></li>
                                    <li><a href="#">Checkout</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div><!-- end of nav-collapse -->

                    <div class="header-right">
                        <div class="header-search-form-wrapper">
                            <div class="search-area">
                                 <form>
                                    <div>
                                        <input type="text" class="form-control" placeholder="Search">
                                        <button type="submit"><i class="ti ti-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div><!-- end of container -->
            </nav>
        </header>
        <!-- end of header -->


        <!-- start of hero -->
        <section class="hero-slider hero-style-1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-inner slide-bg-image" data-background="/assets/images/gw/gw.jpg" data-text="<div><button>Women</button><h4>Nether then turned around out the elements Nuala haverle</h4><ul><li>5 Mins Read</li><li>24 Apr 2022</li></ul></div>">
                            <div class="container-full">
                                <div data-swiper-parallax="400" class="slide-title">
                                    <h1 style="color: white!important">Rechauffement climatique</h1>
                                    <h2>Changeons le monde </h2>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div> <!-- end slide-inner --> 
                    </div> <!-- end swiper-slide -->

                </div>
                <!-- end swiper-wrapper -->

            </div>
        </section>
        <!-- end of hero slider -->
        

        <!-- start trending-articles-section -->
		<section class="trending-articles-section section-padding">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="section-title">
                            <h1>Rechauffement climatique</h1>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col col-xs-12">
                    	<h4>
	                    	<p>
		                    		Le r�chauffement climatique est le r�chauffement � long terme de la temp�rature globale de la plan�te. 
		                    	Bien que cette tendance au r�chauffement se poursuive depuis longtemps, son rythme s'est consid�rablement acc�l�r� au cours des cent derni�res ann�es en raison de la combustion de combustibles fossiles. 
		                    	L'augmentation de la population humaine s'est accompagn�e d'une augmentation du volume de combustibles fossiles br�l�s. Les combustibles fossiles comprennent le charbon, le p�trole et le gaz naturel, et leur combustion provoque ce que l'on appelle "l'effet de serre" dans l'atmosph�re terrestre. 
							</p>
							<p>
								L'effet de serre se produit lorsque les rayons du soleil p�n�trent dans l'atmosph�re, mais que la chaleur r�fl�chie par la surface ne peut pas s'�chapper dans l'espace. 
								Les gaz produits par la combustion de combustibles fossiles emp�chent la chaleur de quitter l'atmosph�re. 
								Ces gaz � effet de serre sont le dioxyde de carbone, les chlorofluorocarbones, la vapeur d'eau, le m�thane et l'oxyde nitreux. 
								L'exc�s de chaleur dans l'atmosph�re a entra�n� une augmentation de la temp�rature moyenne de la plan�te, autrement dit un r�chauffement de la plan�te.
							</p>
							<p>
								Le r�chauffement de la plan�te a donn� naissance � un autre probl�me appel� changement climatique. 
								Ces expressions sont parfois utilis�es de mani�re interchangeable, mais elles sont diff�rentes. 
								Le changement climatique fait r�f�rence aux modifications des r�gimes climatiques et des saisons de croissance dans le monde. 
								Il fait �galement r�f�rence � l'�l�vation du niveau de la mer caus�e par l'expansion des mers plus chaudes et la fonte des calottes glaciaires et des glaciers. 
								Le r�chauffement de la plan�te est � l'origine du changement climatique, qui repr�sente une menace s�rieuse pour la vie sur terre sous la forme d'inondations g�n�ralis�es et de conditions m�t�orologiques extr�mes. 
								Les scientifiques continuent d'�tudier le r�chauffement plan�taire et son impact sur la Terre.
	         				</p>
         				</h4>
                    </div>
                </div>
            </div> <!-- end container -->
        </section>
        <!-- end trending-articles-section -->
        
        <!-- start trending-articles-section -->
        <section class="trending-articles-section section-padding">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="section-title">
                            <h2>Articles</h2>

                            <a href="#" class="theme-btn">
                                view more 
                                <svg xmlns="http://www.w3.org/2000/svg" width="33" height="13" viewBox="0 0 33 13">
                                    <g transform="translate(-1585 -1152)">
                                        <g data-name="Polygon 2" transform="translate(1618 1152) rotate(90)" fill="none">
                                            <path d="M6.5,0,13,11H0Z" stroke="none"/>
                                            <path d="M 6.5 1.965688705444336 L 1.75245189666748 10 L 11.24754810333252 10 L 6.5 1.965688705444336 M 6.5 9.5367431640625e-07 L 13 11 L 0 11 L 6.5 9.5367431640625e-07 Z" stroke="none" fill="#18171C"/>
                                        </g>
                                        <rect data-name="Rectangle 46" width="22" height="1" transform="translate(1585 1158)" fill="#18171C"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col col-xs-12">
                        <div class="trending-articles-grids clearfix">   	
	                    <%
							if (articles != null) {
								for (int row = 0; row < articles.size(); row++) {
						%>
                            <div class="grid">
                        
								<% 
									String formattedDate = articles.get(row).get("date_de_publication").asText();
									try{
										DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
										DateFormat outputFormat = new SimpleDateFormat("MMMM, dd yyyy");
										Date date = inputFormat.parse(articles.get(row).get("date_de_publication").asText().split("T")[0]);
										formattedDate = outputFormat.format(date);
									}catch(Exception e){}
								%>
                                <div class="entry-media">
                                    <img src="/<%= articles.get(row).get("thumbnail").asText() %>" alt>
                                    <button><%= articles.get(row).get("categorie").asText() %></button>
                                </div>
                                <div class="entry-details">
                                    <h3><a href="articles/<%= articles.get(row).get("url").asText() %>"><%= articles.get(row).get("titre").asText() %></a></h3>
                                    <ul>
                                        <li><a href="#">3 Mins Read</a></li>
                                        <li><a href="#"><%= formattedDate %></a></li>
                                    </ul>
                                </div>
                            </div>
                    	<% }} %>
                        </div>
                    </div>
                </div>
            </div> <!-- end container -->
        </section>
        <!-- end trending-articles-section -->
		

        <!-- start newsletter-section -->
        <section class="newsletter-section">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="newsletter-area">
                            <div class="newsletter-inner clearfix"> 
                                <div class="text">
                                    <h3>Email Newsletter</h3>
                                    <p>Enter your email and we'll keep you posted with news and updates!</p>
                                </div>
                                <form>
                                    <div class="input-1">
                                        <input type="email" class="form-control" placeholder="Email Address *" required="">
                                    </div>
                                    <div class="submit clearfix">
                                        <button type="submit">Subcribe</button>
                                    </div>
                                </form>
                            </div>                        
                        </div>
                    </div>
                </div>
            </div> <!-- end container-1310 -->
        </section>
        <!-- end newsletter-section -->

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
