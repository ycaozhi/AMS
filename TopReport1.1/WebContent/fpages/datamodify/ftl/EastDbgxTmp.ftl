<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="������ϵ�����Ϲ�����ά��">
<@CommonQueryMacro.CommonQuery id="EAST_DBGX_TMP" init="true" submitMode="current" navigate="false">
<table align="left" width="1000px">
   
   <tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id="datatable1"  fieldStr="dbhth,bdbhth,cjrq,yxjgdm,jrxkzh,nbjgh,dblx,dbje,dbqsrq,dbdqrq,dbzt,jldbygh,errmsg,opr"  width="100%" hasFrame="true"/>
		</td>
	</tr>
      <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="������ϵ�����Ϲ�����ά��"
        			  fieldStr="dbhth,bdbhth,cjrq,yxjgdm,jrxkzh,nbjgh,dblx,dbje,dbqsrq,dbdqrq,dbzt,jldbygh" colNm=4/>
        			 </br>
      				<@CommonQueryMacro.Button id= "btSave"/>
      			</div>
     		 </@CommonQueryMacro.FloatWindow>
        			
  			</td>
  		</tr>
  		<tr style="display:none">
					<td colspan="2">
						<@CommonQueryMacro.Button id= "btMod"/>&nbsp;&nbsp;
					</td>
		</tr>
	
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	//��λһ����¼
	function locate(id) {
		var record = EAST_DBGX_TMP_dataset.find(["id"],[id]);
		if (record) {
			EAST_DBGX_TMP_dataset.setRecord(record); 
		}
	}
	//ˢ��
		function datatable1_opr_onRefresh(cell, value, record)
	  {
		if (record) {//�����ڼ�¼ʱ
			var id = record.getValue("id");
			if(null != id){
				cell.innerHTML="<center><a href=\"JavaScript:doModify('"+id+"')\">�޸�</a> ";
			} else {//�������ڼ�¼ʱ
		    cell.innerHTML="&nbsp;";
		    }
		} 
	}
	

//�޸�
	function doModify(id) {
		locate(id);
		subwindow_signWindow.show();
	}


      function btSave_postSubmit(button)
      {
			button.url="#";
        	//alert("����ɹ�");
        	subwindow_signWindow.hide();
        	EAST_DBGX_TMP_dataset.flushData(EAST_DBGX_TMP_dataset.pageIndex);
      }
      
  	
	function signWindow_floatWindow_beforeClose(subwindow){
		EAST_DBGX_TMP_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow){
		return signWindow_floatWindow_beforeClose(subwindow);
	}
  

</script>
</@CommonQueryMacro.page>