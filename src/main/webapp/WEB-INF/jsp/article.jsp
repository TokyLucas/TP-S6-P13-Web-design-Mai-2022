<%@page import="java.sql.Timestamp, java.text.*, java.util.*"%>
<%@ page
	import="com.fasterxml.jackson.databind.JsonNode, java.util.Iterator "%>
<%
	String titre = (request.getAttribute("titre")!=null) ? (String) request.getAttribute("titre") : "";
	String heading = (request.getAttribute("heading")!=null) ? (String) request.getAttribute("heading") : "";
	JsonNode articles = (JsonNode) request.getAttribute("article");
	JsonNode previews = (JsonNode) request.getAttribute("previews");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="irstheme">

    <title> AAnglo - <%= titre %></title>
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
                        <a class="navbar-brand" href="/home"><img src="/assets/images/logo.png" alt></a>
                    </div>
                    <div id="slide-nav" class="navbar-collapse collapse navigation-holder slide-content">
                        <button  type="button" id="close" class="close-btn close-navbar" aria-label="close navigation"><i class="ti-close"></i></button>
                        <ul id="link-list" class="nav navbar-nav menu nav-menu">
                            <li><a href="/home">Home</a></li>
                            <li class="menu-item-has-children menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-14">
                                <a href="#">Pages</a>
                                <ul class="sub-menu">
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
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


        <!-- start page-title-s2 -->
        <section class="page-title-s2">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="inner">
                            <h1><%= heading %></h1>
                        </div>
                    </div>
                </div>
            </div> <!-- end container-1310 -->
        </section>
        <!-- end page-title-s2 -->



        <!-- start blog-single-section -->
        <section class="blog-single-section section-padding">
            <div class="container-1310">
                <div class="row">
                    <div class="col col-lg-8">
                        <div class="blog-content">
                        	<%
						        if (articles != null) {
									for (int row = 0; row < articles.size(); row++) {
							%>
                            <div class="post format-standard-image">
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
                                    <h2><%= articles.get(row).get("titre").asText() %></h2>
                                    <div class="entry-meta">
                                        <ul>
                                            <li><a href="#">5 Mins Read</a></li>
                                            <li><a href="#"><%= formattedDate %></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <p>
                                	<%= articles.get(row).get("contenus").asText() %>
                                </p>
                                <blockquote>
									Global warming is not just the greatest environmental challenge facing our planet - it is one of our greatest challenges of any kind.
									<span>-Barack Obama</span>
                                </blockquote>
                            </div>
                            <% } } %>

                            <div class="share">
                                <i class="ti-sharethis"></i>
                                <ul>
                                    <li><a href="#">Facebook</a></li>
                                    <li><a href="#">Twitter</a></li>
                                    <li><a href="#">Pinterest</a></li>
                                    <li><a href="#">Instagram</a></li>
                                </ul>
                            </div>

                            <div class="author-box">
                                <div class="author-avatar">
                                    <a href="#" target="_blank"><img src="/assets/images/blog-details/author.jpg" alt></a>
                                </div>
                                <div class="author-content">
                                    <a href="#" class="author-name">Author: Hondo bond</a>
                                    <p>Parturient accumsan ipiscing euismod dipiscing risusc nsequat pulvinar etiam. Porta pulvinar in sociosqu iaculis sociosqu est Ullamcorper libero vulputate lacus dolor aliquet</p>
                                    <div class="socials">
                                        <ul class="social-link">
                                            <li><a href="#"><i class="ti-facebook"></i></a></li>
                                            <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                            <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                            <li><a href="#"><i class="ti-instagram"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div> <!-- end author-box -->


                            <div class="comments-area">
                                <div class="comments-section">
                                    <h3 class="comments-title">3 Comments</h3>
                                    <ol class="comments">
                                        <li class="comment even thread-even depth-1" id="comment-1">
                                            <div id="div-comment-1">
                                                <div class="comment-theme">
                                                    <div class="comment-image"><img src="/assets/images/blog-details/comments-author/img-1.jpg" alt></div>
                                                </div>
                                                <div class="comment-main-area">
                                                    <div class="comment-wrapper">
                                                        <div class="comments-meta">
                                                            <h4>Milder <span class="comments-date">Apr 25, 2022 at 3.00PM</span></h4>
                                                        </div>
                                                        <div class="comment-area">
                                                            <p>Embarrassing hidden in the middle of text all the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                            <div class="comments-reply">
                                                                <a  class="comment-reply-link" href="#"><span>Reply</span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="children">
                                                <li class="comment">
                                                    <div>
                                                        <div class="comment-theme">
                                                            <div class="comment-image"><img src="/assets/images/blog-details/comments-author/img-2.jpg" alt></div>
                                                        </div>
                                                        <div class="comment-main-area">
                                                            <div class="comment-wrapper">
                                                                <div class="comments-meta">
                                                                    <h4>Neolan <span class="comments-date">Apr 25, 2022 at 3.00PM</span></h4>
                                                                </div>
                                                                <div class="comment-area">
                                                                    <p>Embarrassing hidden in the middle of text all the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                                                                    <div class="comments-reply">
                                                                        <a  class="comment-reply-link" href="#"><span>Reply</span></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ol>
                                </div> <!-- end comments-section -->

                                <div class="comment-respond">
                                    <h3 class="comment-reply-title">Leave your thought</h3>
                                    <form method="post" id="commentform" class="comment-form">
                                        <div class="form-textarea">
                                            <textarea id="comment" placeholder="Write Your Comments..."></textarea>
                                        </div>
                                        <div class="form-inputs">
                                            <input placeholder="Website" type="url">
                                            <input placeholder="Name" type="text">
                                            <input placeholder="Email" type="email">
                                        </div>
                                        <div class="form-submit">
                                            <input id="submit" value="Post Comment" type="submit">
                                        </div>
                                    </form>
                                </div>
                            </div> <!-- end comments-area -->
                        </div>                        

                    </div>
                    <div class="col col-lg-4">
                        <div class="blog-sidebar-s2">
                            <div class="widget search-widget">
                                <h3>Search</h3>
                                <form>
                                    <div>
                                        <input type="text" class="form-control" placeholder="Search Post..">
                                        <button type="submit"><i class="ti-search"></i></button>
                                    </div>
                                </form>
                            </div>
                            <div class="widget recent-post-widget">
                                <h3>Recent post</h3>
                                <div class="posts">
		                        	<%
								        if (previews != null) {
											for (int row = 0; row < previews.size(); row++) {
									%>
                                    <div class="post">
                                    	
		                            	<% 
											String formattedDate = previews.get(row).get("date_de_publication").asText();
											try{
												DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
												DateFormat outputFormat = new SimpleDateFormat("MMMM, dd yyyy");
												Date date = inputFormat.parse(previews.get(row).get("date_de_publication").asText().split("T")[0]);
												formattedDate = outputFormat.format(date);
											}catch(Exception e){}
										%>
                                        <div class="img-holder">
                                            <img src="/<%= previews.get(row).get("thumbnail").asText() %>" alt>
                                        </div>
                                        <div class="details">
                                            <span class="date"><%= formattedDate %></span>
                                            <h4><a href="/articles/<%= previews.get(row).get("url").asText() %>"><%= previews.get(row).get("titre").asText() %></a></h4>
                                        </div>
                                    </div>
                                    <% } } %>
                                </div>
                            </div>
                            <div class="widget add-widget">
                                <h3>Advertise</h3>
                                <div>
                                    <div class="img-holder">
                                        <img src="/assets/images/gw/ad.jpg" alt>
                                    </div>
                                    <div class="details">
                                        <h4>Slightly domed and divided by arches into stiff sections</h4>
                                        <a href="#" class="theme-btn-s3">See more</a>
                                    </div>      
                                </div>
                            </div> 
                            <div class="widget tag-widget">
                                <h3>Tags</h3>
                                <ul>
                                    <li><a href="#">Personal</a></li>
                                    <li><a href="#">Travel agency</a></li>
                                    <li><a href="#">Posts</a></li>
                                    <li><a href="#">Life style</a></li>
                                    <li><a href="#">Beauty</a></li>
                                    <li><a href="#">Fashion</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- end container -->
        </section>
        <!-- end blog-single-section -->


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
