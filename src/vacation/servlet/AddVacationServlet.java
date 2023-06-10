package vacation.servlet;

import entity.Operator;
import entity.TeacherEvaluate;
import entity.Vacation;
import impl.StudentImpl;
import impl.TeacherEvaluateImpl;
import impl.TeacherImpl;
import impl.VacationImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

public class AddVacationServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Vacation vacation = new Vacation();
		VacationImpl vacationImpl = new VacationImpl();
		TeacherImpl teacherImpl = new TeacherImpl();
		StudentImpl studentImpl = new StudentImpl();
		Operator log_operator = (Operator) session.getAttribute("log_operator");

		vacation.setIsApprov(request.getParameter("isApprov"));
		vacation.setStart(request.getParameter("start"));
		vacation.setEnd(request.getParameter("end"));
		vacation.setTeacher(teacherImpl.query("tec_id",
				request.getParameter("tec_id")).get(0));
//		vacation.setStudent(studentImpl.query("ope_id",
//				log_operator.getId().toString()).get(0));
		vacation.setStudent(studentImpl.query("ope_id",
				"8").get(0));
		int i = vacationImpl.add(vacation);
		if (i == 1) {
			request.getSession().setAttribute("message", "申请请假成功！");
		} else {
			request.getSession().setAttribute("message", "申请请假失败！");
		}
		response.sendRedirect("pages/add_vacation.jsp");
	}
}
