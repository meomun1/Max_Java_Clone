<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@ taglib prefix="shop" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Active Orders</title>
    <link rel="stylesheet" href="css/order_page/order-page.css">
    <shop:indexcss />
</head>
<body>

    <section id="home" class="welcome-hero">
        <!-- top-area Start -->
        <div class="top-area">
          <div class="header-area">
            <!-- Start Navigation -->
            <nav
              class="navbar navbar-default bootsnav navbar-sticky navbar-scrollspy"
              data-minus-value-desktop="70"
              data-minus-value-mobile="55"
              data-speed="1000"
            >
              <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                  <button
                    type="button"
                    class="navbar-toggle"
                    data-toggle="collapse"
                    data-target="#navbar-menu"
                  >
                    <i class="fa fa-bars"></i>
                  </button>
                  <a class="navbar-brand" href="">Max Luong<span></span></a>
                </div>
                <!--/.navbar-header-->
                <!-- End Header Navigation -->
    
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div
                  class="collapse navbar-collapse menu-ui-design"
                  id="navbar-menu"
                >
                  <ul
                    class="nav navbar-nav navbar-right"
                    data-in="fadeInDown"
                    data-out="fadeOutUp"
                  >
                    <li class="scroll active"><a href="#home">home</a></li>
                    <li class="scroll"><a href="#service">service</a></li>
                    <!-- <li class="scroll">
                      <a href="#featured-cars">featured product</a>
                    </li> -->
                    <li class="scroll"><a href="#new-cars">new product</a></li>
                    <li class="scroll"><a href="#contact">contact</a></li>
    
                    <c:if test="${loggedInUser != null}">
                      <li>
                        <a
                          style="font-size: 20px"
                          >Welcome
                          <c:if test="${loggedInUser != null}"
                            >${sessionScope.loggedInUser.getLastName()}</c:if
                          >
                        </a>
                      </li>
    
                      <li><a href="/online-store.web-1.0/sign-out">sign out</a></li>
                    </c:if>
                    
                    <c:if test="${loggedInUser == null}">
                      <li><a href="/online-store.web-1.0/sign-up">sign up</a></li>
                      <li><a href="/online-store.web-1.0/sign-in">sign in</a></li>
                    </c:if>
                  </ul>
                  <!--/.nav -->
                </div>
                <!-- /.navbar-collapse -->
              </div>
              <!--/.container-->
            </nav>
            <!--/nav-->
            <!-- End Navigation -->
          </div>
          <!--/.header-area-->
          <div class="clearfix"></div>
        </div>
        <!-- /.top-area-->
        <!-- top-area End -->
    
    
    </section>

    <section id="featured-cars" class="featured-cars">

        <h1>Active Orders</h1>
            <table>
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>User Email</th>
                        <th>Order Status</th>
                        <th>Action Button</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${purchases != null}">
                      <c:forEach items="${purchases}" var="purchase">
                              <tr>
                                <td>${purchase.getId()}</td>
                                <td>${purchase.getCustomer().getEmail()}</td>
                                <td>${purchase.getPurchaseStatus().getStatusName()}</td>
                                <td><form action="/online-store.web-1.0/management-fulfilment" method="post">
                                  <input type="hidden" name="purchaseId" value="${purchase.getId()}">
                                  <button type="submit">Mark Fulfilment Stage as Completed</button>
                              </form></td>
                              </tr>
                      </c:forEach>
                    </c:if>

                    <c:if test="${purchases == null}">
                        <tr>
                            <td colspan="4">No active orders</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
         </section>
    
    <shop:footer />

    <shop:indexjs />


    <script src="/js/order.js"></script>
</body>
</html>
