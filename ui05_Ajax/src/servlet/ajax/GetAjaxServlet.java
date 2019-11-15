package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetAjaxServlet")
public class GetAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String userId = request.getParameter("id"); //이 값을 브라우저로 응답.
		
		try {
			Thread.sleep(5000);
		}catch (InterruptedException e) {

		}
		out.print(userId); // 이 때 브라우저로 응답이 진행된다..
	}

}
