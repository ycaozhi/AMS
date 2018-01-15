package com.huateng.report.imports.updater;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.huateng.commquery.result.MultiUpdateResultBean;
import com.huateng.commquery.result.UpdateResultBean;
import com.huateng.commquery.result.UpdateReturnBean;
import com.huateng.ebank.framework.operation.OPCaller;
import com.huateng.ebank.framework.operation.OperationContext;
import com.huateng.ebank.framework.web.commQuery.BaseUpdate;
import com.huateng.exception.AppException;
import com.huateng.report.imports.operation.DszhQueryUpdateOperation;

import resources.east.data.pub.AmsDszh;
import resources.east.data.pub.AmsDszhId;

public class DszhQueryUpdateAndSave extends BaseUpdate {

	private static final Logger logger = Logger.getLogger(DszhQueryUpdateAndSave.class);
	
	@Override
	public UpdateReturnBean saveOrUpdate(
			MultiUpdateResultBean multiUpdateResultBean,
			HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		// TODO Auto-generated method stub

			String nextUrl = "";

			UpdateReturnBean updateReturnBean = new UpdateReturnBean();
			UpdateResultBean updateResultBean = multiUpdateResultBean
					.getUpdateResultBeanByID("DszhQueryUpdate");


			List updateList = new ArrayList();
			List delList = new ArrayList();
			List insertList = new ArrayList();


			while (updateResultBean.hasNext()) {
				AmsDszh amsDszh=new AmsDszh();
				Map map = updateResultBean.next();
				mapToObject(amsDszh, map);
				switch (updateResultBean.getRecodeState()) {
				case UpdateResultBean.INSERT:
					insertList.add(amsDszh);
					break;				
				case UpdateResultBean.DELETE:
					delList.add(amsDszh);
					break;
				case UpdateResultBean.MODIFY:
					String ckrsfzjzl = amsDszh.getCkrsfzjzl();
					String ckrsfzjhm = amsDszh.getCkrsfzjhm();
					AmsDszhId Id = new AmsDszhId();
					Id.setCkrsfzjzl(ckrsfzjzl);
					Id.setCkrsfzjhm(ckrsfzjhm);
					
					amsDszh.setId(Id);
					
					System.out.println(Id.getCkrsfzjhm());
					System.out.println(Id.getCkrsfzjzl());
					
					updateList.add(amsDszh);
					
					
					break;
				default:
					break;
				}

			}
			OperationContext oc = new OperationContext();
			oc.setAttribute(DszhQueryUpdateOperation.IN_DEL, delList);
			oc.setAttribute(DszhQueryUpdateOperation.IN_INSERT, insertList);
			oc.setAttribute(DszhQueryUpdateOperation.IN_UPDATE, updateList);
			OPCaller.call("DszhQueryUpdateOperation", oc);
			return updateReturnBean;


	}

}