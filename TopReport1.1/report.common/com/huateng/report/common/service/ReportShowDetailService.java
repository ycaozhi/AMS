package com.huateng.report.common.service;

import java.util.Iterator;
import java.util.List;

import resource.bean.report.BiWorkdateConf;
import resource.bean.report.SysTaskInfo;
import resource.bean.report.SysTaskLog;
import resource.report.dao.ROOTDAO;
import resource.report.dao.ROOTDAOUtils;

import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.util.ApplicationContextUtils;

public class ReportShowDetailService {

	protected ReportShowDetailService() {
	}

	/**
	 * get instance.
	 *
	 * @return
	 */
	public synchronized static ReportShowDetailService getInstance() {
		return (ReportShowDetailService) ApplicationContextUtils.getBean(ReportShowDetailService.class.getName());
	}

	/**
	 *
	 * author by 计翔 2012.9.5 通过旧主键key来获取taskinfo操作的对象的公共方法
	 *
	 * @throws CommonException
	 */
	// 从任务表中取出item
	public Iterator selectByKey(String id) throws CommonException {
		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		Iterator it = rootdao.queryByQL("from SysTaskInfo systask where systask.adtRcdPk='" + id + "'");
		return it;
	}

	// author by 计翔 2012.9.5 序列化对象写入taskinfo表
	public void addTosystaskinfo(SysTaskInfo systackinfo) throws CommonException {
		ROOTDAO rootDAO = ROOTDAOUtils.getROOTDAO();
		rootDAO.saveOrUpdate(systackinfo);
	}

	public SysTaskLog selectTaskLog(String id) throws CommonException {
		ROOTDAO rootDAO = ROOTDAOUtils.getROOTDAO();
		SysTaskLog sys = rootDAO.query(SysTaskLog.class, id);
		return sys;
	}

	public SysTaskInfo getSysTaskInfo(String type,String recId) throws CommonException{
		ROOTDAO rootDAO = ROOTDAOUtils.getROOTDAO();
		List list = rootDAO.queryByQL2List(" from SysTaskInfo model where model.intInsId='"+type+"' and model.adtRcdPk='"+recId+"'");
		if (list.size()==1) {
			return (SysTaskInfo) list.get(0);
		}
		return null;
	}
	public String[] getTaskToWorkDateConf(BiWorkdateConf conf){
		Object[] objs = conf.getWorkDateList().toArray();
		String[] newstrs = new String[objs.length];
		for (int i = 0; i < objs.length; i++) {
			newstrs[i]=objs[i].toString().trim();
		}
		return newstrs;
	}
}

