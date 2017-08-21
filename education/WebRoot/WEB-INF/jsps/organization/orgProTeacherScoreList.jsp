<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/commonHead.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查看教师评价</title>
	<script type="text/javascript" src="<%=basePathHeader%>/javascript/editor/kindeditor.js"></script>
	<script language="javascript" type="text/javascript" src="<%=basePathHeader%>/javascript/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		KE.show( {
			id : 'content7',
			cssPath : './index.css'
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function(e) {
			$(".select1").uedSelect( {
				width : 345
			});
			$(".select2").uedSelect( {
				width : 167
			});
			$(".select3").uedSelect( {
				width : 100
			});
		});
	</script>
	<script type="text/javascript" src="<%=basePathHeader%>/javascript/common/pagination.js"></script>
	<script type="text/javascript" src="<%=basePathHeader%>/javascript/common/dateFormat.js"></script>
	<script type="text/javascript" src="<%=basePathHeader%>/javascript/organization/orgProTeacherScore.js"></script>
</head>
<body>
	<!-- top -->
	<div class="head">
		<jsp:include page="../common/top.jsp">
			<jsp:param value="project" name="flag"/>
		</jsp:include>
	</div>
	<!-- left -->
	<div class="leftNav">
		<%@include file="../common/projectLeft.jsp"%>
	</div>
	<div class="content">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">查看教师评价</a>
				</li>
				<li>
					<a href="#">教师评价</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="tabson">
				<ul class="seachform">
					<li>
						<label>项目名称：</label>
						<input id="projectName" name="input" type="text" class="scinput" />
					</li>
					<li>
						<label>项目年度：</label>
					</li>
					<li>
						<select width="100px"  id="beginDate" name="select" class="select2 yearpicker"></select>
					</li>
					<li>
						--
					</li>
					<li>
						<select width="100px"  id="endDate" name="select" class="select2 yearpicker"></select>
					</li>
					<li>
						<input id="select" name="input2" type="button" class="dian3" value="查 询" />
					</li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th >项目名称</th>
            			<th >培训实施机构</th>
               			<th  >培训人数</th>
						<th  >非常满意</th>
						<th >满意</th>
						<th  >一般</th>
						<th  >不满意</th>
						<th >非常不满意</th>
					</tr>
				</thead>
				<tbody id="teacherScore_list">
				</tbody>
			</table>
			<!-- 分页 -->
			<input id="pageIndex" value="1" type="hidden" name="pageIndex" />
			<div id="pagebar" class="pagin"></div>
			<!-- 分页 -->
		</div>
	</div>
</body>
</html>