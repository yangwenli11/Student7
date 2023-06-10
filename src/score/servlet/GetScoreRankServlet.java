package score.servlet;

import entity.Operator;
import impl.ScoreImpl;
import net.sf.json.JSONSerializer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class GetScoreRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 学生查询成绩排名信息
		HttpSession session = request.getSession();
		Operator log_operator = (Operator) session.getAttribute("log_operator");
		ScoreImpl scoreImpl = new ScoreImpl();
		List<Map<String,Object>> score = scoreImpl.getScoreRank(log_operator.getId().toString());


		response.getWriter()
				.write(JSONSerializer.toJSON(score).toString());
	}
}
