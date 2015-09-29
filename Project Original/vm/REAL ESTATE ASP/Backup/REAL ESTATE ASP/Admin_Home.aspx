<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="REAL_ESTATE_ASP.Admin_Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<body>
<title>Real Estate</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="home1.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home2.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_italic_400-Myriad_Pro_italic_600.font.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/jquery.faded.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<!-- START PAGE SOURCE -->
<header>
  <div class="container_16">
      <div class="logo">
          <h1>
              <a href="#"><strong>Cosco</strong> Real Estate</a></h1>
      </div>
    <nav>
      <ul>
          <li><a class="current" href="home.aspx">Home</a></li>
          <li><a href="sell.aspx">Selling</a></li>
          <li><a href="rent.aspx">Renting</a></li>
          <li><a href="new.aspx">NewProjects</a></li>
          <li><a href="aboutus.aspx" onclick="return confirm('Are You Sure ?');">LogOut</a></li>
      </ul>
    </nav>
      <div id="faded">
          <div class="rap">
              <a href="#">
              <img alt="" height="398" src="images/big-img1.jpg" width="571" /></a>
              <a href="#">
              <img alt="" height="398" src="images/big-img2.jpg" width="571" /></a>
              <a href="#">
              <img alt="" src="images/big-img3.jpg" width="571" /></a>
          </div>
          <ul class="pagination">
              <li><a href="#" rel="0">
                  <img alt="" src="images/f_thumb1.png" /> <span class="left">Villa<br />
                  2007 year<br />
                  5000 sq.ft </span><span class="right">Brick, glass<br />
                  3 beds<br />
                  2 baths </span></a></li>
              <li><a href="#" rel="1">
                  <img alt="" src="images/f_thumb2.png" /> <span class="left">Villa<br />
                  2009 year<br />
                  3500 sq.ft </span><span class="right">Brick, glass<br />
                  5 beds<br />
                  3 baths </span></a></li>
              <li><a href="#" rel="2">
                  <img alt="" src="images/f_thumb3.png" /> <span class="left">Villa<br />
                  2010 year<br />
                  4200 sq.ft </span><span class="right">Brick, glass<br />
                  4 beds<br />
                  3 baths </span></a></li>
          </ul>
          <img alt="" class="extra-banner" src="images/extra-banner.png" />
      </div>
</div>
</header>
<section id="content">
  <div class="container_16">
      <div class="clearfix">
      <section id="mainContent" class="grid_10">
               <article>
          <h2>
              Welcome To Cosco Real Estate</h2>
          <h4>
              Property comprised of land and the buildings on it as well as the natural 
              resources of the land including uncultivated flora and fauna, farmed crops and 
              livestock, water and minerals.Although media often refers to the &quot;real estate 
              market&quot; from the perspective of residential living, real estate can be grouped 
              into three broad categories based on its use: residential, commercial and 
              industrial. Examples of residential real estate include undeveloped land, 
              houses, condominiums and townhomes; examples of commercial real estate are 
              office buildings, warehouses and retail store buildings; and examples of 
              industrial real estate are factories, mines and farms.
          </h4>
          <a class="button" href="#">Read More</a> </article>
        <article class="last">
          <h2>
              New Remodeling Homes</h2>
          <h5>
          </h5>
          <ul class="img-list clearfix">
              <li><a href="#">
                  <img alt="" src="images/thumb1.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb2.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb3.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb4.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb5.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb6.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb7.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb8.jpg" /></a></li>
              <li><a href="#">
                  <img alt="" src="images/thumb9.jpg" /></a></li>
          </ul>
          <a class="button" href="#">Read More</a> </article>
      </section>
      <aside class="grid_6">
          <div class="prefix_1">
          <article>
              <div class="box">
                  <h2>
                      5 Keys to Real Estate Sales Success</h2>
                  <dl class="accordion">
                      <dt>
                          <img alt="" src="images/icon1.gif" /><a href="#">Prospecting</a></dt>
                      <dd>
                      </dd>
                      <dt>
                          <img alt="" src="images/icon2.gif" /><a href="#">Listing Appointments</a></dt>
                      <dd>
                      </dd>
                      <dt>
                          <img alt="" src="images/icon3.gif" /><a href="#">Open House</a></dt>
                      <dd>
                      </dd>
                      <dt>
                          <img alt="" src="images/icon4.gif" /><a href="#">Buyer&#39;s Appointment</a></dt>
                      <dd>
                      </dd>
                      <dt>
                          <img alt="" src="images/icon5.gif" /><a href="#">Thank You</a></dt>
                      <dd>
                          .</dd>
                  </dl>
              </div>
          </article>
         
          </div>
      </aside>
      </div>
</div>
</section>
<footer>
  <div class="footerlink">
    <p class="lf">Copyright &copy; 2015 <a href="#">coscorealestate.com</a> - All Rights Reserved</p>
    <p class="rf"><a href="#">free realestate site</a> by <a href="#">coscogroup</a></p>
    <div style="clear:both;"></div>
</footer>
<script type="text/javascript">
    $(function () {
        //accordion
        $(".accordion dt").toggle(function () {
            $(this).next().slideDown();
        }, function () {
            $(this).next().slideUp();
        });
    })
</script>
<script type="text/javascript">    Cufon.now(); </script>
<!-- END PAGE SOURCE -->
<div align="center">This website created to--<a href=''>coscorealestategroup.com</a></div></body>
</html>
