package com.itbulls.learnit.onlinestore.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sign-out")
public class SignOutFruitShop extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static final String LOGGED_IN_USER_ATTR = "loggedInUser";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().invalidate();

        String baseUrl = request.getScheme()
                + "://"
                + request.getServerName()
                + ":"
                + request.getServerPort()
                + request.getServletContext().getContextPath();

        response.sendRedirect(baseUrl + "/home-page");
    }

}
