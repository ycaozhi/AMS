<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="非居民账户查询修改">
<@CommonQueryMacro.CommonQuery id="FjmzhQueryUpdate" init="true" submitMode="all" navigate="false">
	<table align="left">
		<tr valign="top">
			<td valign="top">
				<@CommonQueryMacro.Group id ="group1" label="非居民账户查询修改" fieldStr="accountnumber,closedaccount,duediligenceind,selfcertification,accountbalance,accountholdertype,openingfiname,payment,ind_name,ind_gender,ind_address,ind_phoneno,ind_idtype,ind_idnumber,ind_rescountrycode,ind_tin,ind_explanation,ind_nationality,ind_birthinfo,org_name,org_address,org_phoneno,org_rescountrycode,org_tin,org_explanation,con_name,con_ctrlgpersontype,con_nationality,con_address,con_rescountrycode,con_tin,con_explanation,con_birthinfo" colNm=6/>
			</td>
		</tr>
		<tr>
  		   	<td valign="CENTER">
				<left><@CommonQueryMacro.Button id= "btBack"/></left>&nbsp;
				<left><@CommonQueryMacro.Button id= "btSave"/></left>
  			</td>
		</tr> 
	</table>
</@CommonQueryMacro.CommonQuery>


<script language="javascript">
     function btSave_postSubmit(button){
	     fieldReadOnlyStatus(true);      
	     FjmzhQueryUpdate_dataset.flushData(FjmzhQueryUpdate_dataset.pageIndex);
	     
	  }
	  function btSave_onClickCheck(button) {
	  	closeWin();
	  	return true;
	  }
	  
	 function btBack_onClickCheck()
	 {
		closeWin();
	 }
	
</script>
</@CommonQueryMacro.page>
