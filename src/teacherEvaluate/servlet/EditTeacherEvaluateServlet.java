package teacherEvaluate.servlet;

import entity.Operator;
import entity.Teacher;
import entity.TeacherEvaluate;
import impl.TeacherEvaluateImpl;
import impl.TeacherImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditTeacherEvaluateServlet extends HttpServlet {

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
		HttpSession session = request.getSession();
		TeacherEvaluateImpl teacherEvaluateImpl = new TeacherEvaluateImpl();
		TeacherEvaluate evaluate = teacherEvaluateImpl.query("id",
				request.getParameter("id")).get(0);
		session.setAttribute("teacher_evaluate_me", evaluate);
		response.sendRedirect("pages/update_evaluate_teacher.jsp");

	}
}
