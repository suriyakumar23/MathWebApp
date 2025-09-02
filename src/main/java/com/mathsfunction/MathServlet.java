package com.mathsfunction;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class MathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String n1Str = request.getParameter("num1");
        String n2Str = request.getParameter("num2");

        double num1 = 0, num2 = 0, result = 0;
        String error = "";

        try {
            num1 = Double.parseDouble(n1Str);
            num2 = Double.parseDouble(n2Str);

            switch (action) {
                case "Add": result = num1 + num2; break;
                case "Subtract": result = num1 - num2; break;
                case "Multiply": result = num1 * num2; break;
                case "Divide":
                    if (num2 == 0) error = "Divide by zero not allowed!";
                    else result = num1 / num2;
                    break;
            }
        } catch (Exception e) {
            error = "Invalid input! Please enter valid numbers.";
        }

        request.setAttribute("num1", n1Str);
        request.setAttribute("num2", n2Str);
        if (error.isEmpty())
            request.setAttribute("result", result);
        else
            request.setAttribute("error", error);

        RequestDispatcher rd = request.getRequestDispatcher("math.jsp");
        rd.forward(request, response);
    }
}
