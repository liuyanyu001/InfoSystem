<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/tag/toolbar" prefix="toolbar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>通知列表</title>
		<%@include file="../common/commonHead.jsp"%>
		<script type="text/javascript" src="<%=basePathHeader%>/javascript/message/messageInfo.js"></script>
		<script type="text/javascript" src="<%=basePathHeader%>/javascript/common/dateFormat.js"></script>
		<script type="text/javascript" src="<%=basePathHeader%>/javascript/common/pagination.js"></script>
	</head>

	<body>
		<!-- top -->
		<div class="head">
			<jsp:include page="../common/top.jsp">
				<jsp:param value="person" name="flag" />
			</jsp:include>
		</div>
		<!-- left -->
		<div class="leftNav">
			<%@include file="../common/personLeft.jsp"%>
		</div>

		<div class="content">
			<div class="place">
				<span>位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">个人中心</a>
					</li>
					<li>
						<a href="#">通知</a>
					</li>

				</ul>
			</div>

			<div class="formbody">
				<div class="noticeTool" style="overflow: hidden; border-bottom: 1px solid #ccc; line-height: 32px; margin-bottom: 30px;">
					<dl>
						<dt style="float: left; padding-right: 12px;">
							<p>
								你有
								<b style="margin: 0 4px; color:red;" id="counts">0</b>条未读通知
							</p>
						</dt>
						<dd style="float: left">
							<c:choose>
								<c:when test="${sessionScope.userinfo.roleId eq 5}">
								</c:when>
								
								<c:otherwise>
									<a href="<%=basePathHeader %>/message/messageManagement/sendMessageByScope.htm?click=3"
										style="background-color: #60C1E7; color: #fff; border-color: #2B89BF;"
										class="huibtn_a click">发通知</a>
								</c:otherwise>
							</c:choose>
						</dd>
					</dl>

				</div>
				<div class="itab">
						<ul>
							<li>
								<a onclick="change(1);" id="tab_1" href="#tab1" class="selected">省级通知(<b id="tab1_num" class="numtip"></b>)
								</a>
							</li>
							<li>
								<a onclick="change(2);" id="tab_2" href="#tab2" class="">市级通知(<b id="tab2_num" class="numtip"></b>)
								</a>
							</li>
							<li>
								<a onclick="change(3);" id="tab_3" href="#tab3" class="">区县通知(<b id="tab3_num" class="numtip"></b>)
								</a>
							</li>
							<li>
								<a onclick="change(4);" id="tab_4" href="#tab4" class="">学校通知(<b id="tab4_num" class="numtip"></b>)
								</a>
							</li>
						</ul>
				</div>
				
				<table class="tablelist">
					<thead>
						<tr>
							<th>是否已读</th>
							<th>通知标题</th>
							<th>发件人</th>
							<th>发送时间</th>
							<th>通知类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="messageList">
					</tbody>
				</table>
				
				<!-- 分页 -->
				<input id="sizePerPage" type="hidden" value="10" name="sizePerPage" />
				<input id="pageIndex" value="1" type="hidden" name="pageIndex" />
				<div id="pagebar" class="pagin"></div>
				<!-- 分页 -->
				
				<input id="pageFlag" value="1" type="hidden" />
			</div>
		</div>
	</body>
</html>