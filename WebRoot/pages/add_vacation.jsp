<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>regist page</title>
		<link href="../css/regist.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript"
			src="../js/My97DatePicker/WdatePicker.js">
</script>
		<script src="../js/jquery-1.8.3.min.js">

</script>
		<script src="../js/search.js">
</script>
	</head>

	<body>
		<center>
			<form action="/Student/AddVacationServlet" method="post">
				<c:if test="${sessionScope.message!=null}">
					<input type="hidden" value="${sessionScope.message}" id="message" />
				</c:if>
				<c:remove var="message" scope="session" />
				<input type="hidden" value="false" id="isApprov" />
				<div class="window" align="left">
					<div class="tit">
						学生请假
					</div>
					<div align="left">
						教 师：
						<select name="tec_id">
							<c:forEach items="${sessionScope.list_teacher}" var="teacher">
								<option value="${teacher.id}">
										${teacher.name}
								</option>
							</c:forEach>
						</select>
					</div>
					<input  name="isApprov" type="hidden" value="1"  />
					<div align="left">
						请假开始时间：
						<input type="text" name="start"  />
					</div>
					<div align="left">
						请假结束时间：
						<input type="text" name="end"  />
					</div>
					<div class="main">
						<br />
						<div align="right">
							<input type="submit" value="确定"
								style="width: 65px; height: 35px; line-height: 35px; overflow: hidden; text-align: center; float: left; margin-left: 270px;" />
						</div>
					</div>
				</div>
			</form>
		</center>
	</body>
</html>