package control.Member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Member.CarDTO;
import Model.Member.MemberDAO;


@WebServlet("/CarProductListPro.do")
public class CarProductList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CarDTO cdto = new CarDTO();
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<CarDTO> carAll ;
		
		carAll = mdao.getAllProduct();
		
		request.setAttribute("call", carAll);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=section.jsp");
		rd.forward(request, response);
	}

}
