<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>search page</title>
		<link href="../css/search.css" rel="stylesheet" type="text/css" />
		<script src="../js/jquery-1.8.3.min.js" type="text/javascript">
</script>
		<script src="../js/search_score_rank.js" type="text/javascript">
</script>
		<script src="../js/search.js" type="text/javascript">
</script>
	</head>
	<body>
		<center>
			<div class="window">
				<div class="searchbox tit">
					查询各科成绩排名：
					<select id="search_type">
						<option value="stu_all">
							查找全部
						</option>
					</select>
<%--					<input id="value" type="text" style="height: 20px;" />--%>
					<input id="search_score" type="button" value="查询" />
				</div>
			</div>
		</center>
		<center id="center">
			<table id="table" width="740" border="1px" cellspacing="0"
				cellpadding="5" bordercolor="#999999">
				<tr align="center">
					<td width="60">
						编号
					</td>
					<td width="60">
						科目
					</td>
					<td width="80">
						分数
					</td>
					<td width="80">
						排名
					</td>
				</tr>
			</table>
		</center>
	<script type="application/javascript">

	</script>
	</body>
</html>