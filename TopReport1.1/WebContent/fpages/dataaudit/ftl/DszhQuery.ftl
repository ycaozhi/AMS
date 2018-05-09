<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/fpages/regonization/ftl/DszhQueryUpdate.ftl" as DszhQueryUpdate>

<@CommonQueryMacro.page title="个人结算账户">

<@CommonQueryMacro.CommonQuery id="DszhQuery" init="true" submitMode="all" navigate="false">
<table width="1349px">
	<tr>
		<td>
			<@CommonQueryMacro.Interface id="interface" label="个人结算账户" btnNm="查询" colNm=8/>
			
		</td>
	</tr>
	
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id="datatable1" paginationbar="btAdd,-,btMod,-,btDel,-,btFeedback,-,btLoad"  fieldStr="select[40],xxlx,ckrxm,ckrsfzjzl,ckrsfzjhm,jrjgbm,zh,zhzl,zhzt,jlrq,ismodify,report_status"  width="100%" hasFrame="true" height="300" readonly="true"/>
		</td>
	</tr>
	<tr>
		<td>
			
		</td>
	</tr>
</table>
<iframe id="filedownloadfrm"  style="display: none;"></iframe>
<span id="button-tools" style="padding-left:10px"><@CommonQueryMacro.Button id= "btSave"/>&nbsp;<span id="message" >请先按数据日期查询,再导出报文</span></span>
</@CommonQueryMacro.CommonQuery>

<script language="javascript">
/*
window.onload=function(){
	DszhQuery_interface_dataset.setValue("jlrq", "2017-09-28");
}
*/

window.onload=function(){
	currentDate="2018-04-01";
    DszhQuery_interface_dataset.setValue("jlrq", currentDate);
}
$('#DszhQuery_interface_dataset_btnSubmit').after($('#button-tools'));
 function btSave_postSubmit(button) {
	  	alert("导出成功");
	  	
	  } 

function btLoad_onClickCheck(button){
        var jlrq = DszhQuery_dataset.getValue("jlrq");
		document.getElementById("filedownloadfrm").src ="${contextPath}/btLoad?jlrq="+jlrq;
		return false;
  	}


function btDel_onClickCheck(button) {
	var rec = DszhQuery_dataset.firstUnit;
	var f = false;
	while(rec) {
		if (rec.getValue('select')) {
			f = true;
			//break;
		}
		rec = rec.nextUnit;
	}
	if(!f) {
		alert('请选择记录');
		return false;
	}
}


function btMod_onClickCheck(button) {

	var rec = DszhQuery_dataset.firstUnit;
	
	var f = false;
	var zh = null;
	while(rec) {
		if (rec.getValue('select')) {
			zh = rec.getValue("zh");
			f = true;
			break;
		}
		rec = rec.nextUnit;
	}
	if(!f) {
		alert('请选择记录');
		return false;
	}
	showUpdate(zh);
	flushCurrentPage();
}



//function btMod_onClick(){
//	var ckrsfzjzl = DszhQuery_dataset.getValue("ckrsfzjzl");
//	var ckrsfzjhm = DszhQuery_dataset.getValue("ckrsfzjhm");
//	var zh = DszhQuery_dataset.getValue("zh");
//	showUpdate(zh);
	
//}

function btAdd_onClick(){
	//DszhQuery_dataset.insertRecord();
	
	//var paramMap = new Map();
	//loadPageWindows("DszhAdd","个人结算新增","/fpages/regonization/ftl/DszhAdd.ftl",paramMap,"winZone");
}

function showUpdate(zh){
	showWin("个人结算账户修改","${contextPath}/fpages/regonization/ftl/DszhQueryUpdate.ftl?zh="+zh,null,flushCurrentPage(),window);
	
}

function btFeedback_onClick(){
	showFeedback();
}

//反馈文件处理页面
function showFeedback(){
	showWin("反馈文件处理","${contextPath}/fpages/dataaudit/ftl/DszhFeedback.ftl");
	//popWin.showWin("1000","800","标题","${contextPath}/fpages/dataaudit/ftl/DszhFeedback.ftl");
}

function btDel_onClickCheck(button) {
		return confirm("确认删除记录？");
}
	
function btDel_postSubmit(button) {
		
		button.url="#";
		//刷新当前页
		flushCurrentPage();
}
//刷新当前页
function flushCurrentPage() {
	DszhQuery_dataset.flushData(DszhQuery_dataset.pageIndex);
}

</script>
</@CommonQueryMacro.page>
