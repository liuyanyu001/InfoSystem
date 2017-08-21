$(function(){
	initEduModel();
	initAutoComplete();
	$("#pageSize").change(function(){
		showInfoList();
	});
});

/**
 * 初始化
 */
function initAutoComplete(){
	showInfoList1();
}




function showInfoList1() {
	$('#tab1List').html("");
	var pageSize = $("#pageSize").val();
	var pageIndex = $("#pageIndex").val();
	var teacherName = $("#teacherName1").val();
	var beginScore = $("#beginScore1").val();
	var endScore = $("#endScore1").val();
	var modelId = $("#modelId").val();
	if(modelId==null){
		modelId = 0;
	}
	$.ajax({
		url : pathHeader + "/furtheredu/certificate/searchScore.do",
		type:"POST",
		cache:"false",
		async:"true",
		dataType:"json",
		data:{
				pageSize:pageSize, 
				pageIndex:pageIndex,
				viewType:'BK',
				teacherName:teacherName,
				beginScore:beginScore,
				endScore:endScore,
				modelId:modelId
			},
		success:function(data){
			if(data.success) {
				var objList = data.rows;
				var gridHtml = "";
				for(var i=0;i<objList.length;i++){
					gridHtml += getTdEHtml1(objList[i]);
				}
				$('#tab1List').append(gridHtml);
				$('#totleCount').text(data.total);
				pagination(data, function(){showInfoList1(); });
			} else {
				$('#tab1List').html("<tr><td colspan='4'>无查询记录</td></tr>");
			}
		},
		error:function(){
			alert("查询错误");
		}
	});
}



function getTdEHtml1(obj) {
	var gridHtml = "<tr>";
	gridHtml += "<td>"+obj.modelName+"</td>";
	gridHtml += "<td>"+obj.teacherName+"</td>";
	gridHtml += "<td>&nbsp;</td>";
	gridHtml += "<td>"+obj.teacherScore+"学分</td>";
	gridHtml += "</tr>";
	return gridHtml;
}



function showInfoList2() {
	$('#tab2List').html("");
	var pageSize = $("#pageSize").val();
	var pageIndex = $("#pageIndex").val();
	var teacherName = $("#teacherName2").val();
	var beginScore = $("#beginScore2").val();
	var endScore = $("#endScore2").val();
	var beginYear = $("#beginYear").val();
	$.ajax({
		url : pathHeader + "/furtheredu/certificate/searchScore.do",
		type:"POST",
		cache:"false",
		async:"true",
		dataType:"json",
		data:{
				pageSize:pageSize, 
				pageIndex:pageIndex,
				teacherName:teacherName,
				beginScore:beginScore,
				endScore:endScore,
				beginYear:beginYear,
			},
		success:function(data){
			if(data.success) {
				var objList = data.rows;
				var gridHtml = "";
				for(var i=0;i<objList.length;i++){
					gridHtml += getTdEHtml2(objList[i]);
				}
				$('#tab2List').append(gridHtml);
				$('#totleCount').text(data.total);
				pagination(data, function(){showInfoList2(); });
			} else {
				$('#tab2List').html("<tr><td colspan='3'>无查询记录</td></tr>");
			}
		},
		error:function(){
			alert("查询错误");
		}
	});
}



function showInfoList3() {
	$('#tab3List').html("");
	var pageSize = $("#pageSize").val();
	var pageIndex = $("#pageIndex").val();
	var teacherName = $("#teacherName3").val();
	var beginScore = $("#beginScore3").val();
	var endScore = $("#endScore3").val();
	var beginYear = $("#beginYear2").val();
	var endYear = $("#endYear").val();
	$.ajax({
		url : pathHeader + "/furtheredu/certificate/searchScore.do",
		type:"POST",
		cache:"false",
		async:"true",
		dataType:"json",
		data:{
				pageSize:pageSize, 
				pageIndex:pageIndex,
				teacherName:teacherName,
				beginScore:beginScore,
				endScore:endScore,
				beginYear:beginYear,
				endYear:endYear
			},
		success:function(data){
			if(data.success) {
				var objList = data.rows;
				var gridHtml = "";
				for(var i=0;i<objList.length;i++){
					gridHtml += getTdEHtml2(objList[i]);
				}
				$('#tab3List').append(gridHtml);
				$('#totleCount').text(data.total);
				
				pagination(data, function(){showInfoList3(); });
			} else {
				$('#tab3List').html("<tr><td colspan='3'>无查询记录</td></tr>");
			}
		},
		error:function(){
			alert("查询错误");
		}
	});
}


function getTdEHtml2(obj) {
	var gridHtml = "<tr>";
	gridHtml += "<td>"+obj.teacherName+"</td>";
	gridHtml += "<td>&nbsp;</td>";
	gridHtml += "<td>"+obj.teacherScore+"学分</td>";
	gridHtml += "</tr>";
	return gridHtml;
}















function deleteNotrainInfo(id){
	if(!confirm('确定要删除选中的信息吗？'))
		return false;
	$.ajax( {
			type : "POST",
			url : pathHeader + "/furtheredu/certificate/deleteNotrain.do",
			data:{id: id},
			async : true,
			success : function(msg) {
				if (msg.success) {
					showInfoList();
					alert("删除成功！");
				} else {
					
				}
 			},
			error : function() {
			}
		});
}

function initEduModel(){
	var url = pathHeader + "/edupm/projectmanage/queryEduModelNoPage.do";
	$.ajax({
		url:url,
		type:"post",
		async:false,
		success:function(data){
				if(data.success){
					var rows = data.rows;
				var opts = "";
				for(var i = 0;i<rows.length;i++){
					var obj = rows[i];
					opts +="<option value='"+obj.id+"'>";
					opts += obj.name;
					opts+="</option>";
				}
				$("select[name='modelId']").html(opts);
				}
		},
		error:function(){
			alert("初始化继教信息模块失败！");
		}
		
	});
}

function edit(id) {
	var openUrl= pathHeader + "/furtheredu/certificate/mnotrainUpdPage.htm?click=7&id=" +id;
	showWindow(openUrl);
}

function showWindow(url) {
	window.location.href = url;
}