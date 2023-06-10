package vacation.servlet;

import entity.Operator;
import entity.Teacher;
import entity.Vacation;
import impl.TeacherImpl;
import impl.VacationImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditVacationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 准备更新老师的信息
		VacationImpl vacationImpl = new VacationImpl();
		Vacation vacation = vacationImpl.query("id",
				request.getParameter("id")).get(0);
		vacation.setIsApprov("0");
		vacationImpl.update(vacation);
		response.sendRedirect("pages/search_vacation.jsp");

	}
}
