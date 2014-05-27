package com.wrox;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yzhai on 5/23/2014.
 */

@WebServlet(
        name = "loginServlet",
        urlPatterns = "/login"
)
public class LoginServlet extends HttpServlet {

    private static final Map<String, String> userDatabase = new HashMap<>();

    static {
        userDatabase.put("Nicholas", "password");
        userDatabase.put("Sarah", "drowssap");
        userDatabase.put("Mike", "wordpass");
        userDatabase.put("John", "green");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Check if user has logged out
        if (req.getParameter("logout") != null)
        {
            session.invalidate();
            resp.sendRedirect("login");
            return;
        }
        // or user has logged in yet, attribute "username" == null
        else if (session.getAttribute("username") != null)
        {
            resp.sendRedirect("tickets");
            return;
        }

        // either logged out or not logged in as a user
        req.setAttribute("loginFailed", false);
        req.getRequestDispatcher("/WEB-INF/jsp/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // if username already exists in session, user already logged in, redirect.
        if (session.getAttribute("username") != null)
        {
            resp.sendRedirect("tickets");
        }

        String userName = req.getParameter("username");
        String passWord = req.getParameter("password");

        if (userName == null || passWord == null ||
                !LoginServlet.userDatabase.containsKey(userName) ||
                !passWord.equals(LoginServlet.userDatabase.get(userName)))
        {
            req.setAttribute("loginFailed", true);
            req.getRequestDispatcher("/WEB-INF/jsp/view/login.jsp").forward(req, resp);
        }
        else
        {
            // @TODO: no need to change attribute "loginFailed" to false??
            // session.setAttribute("loginFailed", false);
            session.setAttribute("username", userName);

            // To prevent session fixation attacks.
            req.changeSessionId();
            resp.sendRedirect("tickets");
        }
    }
}
