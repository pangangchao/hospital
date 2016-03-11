package com.web.common.base;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;


public abstract class IBaseAction<T> extends ActionSupport implements ModelDriven<T>,Preparable{


	private static final long serialVersionUID = 1L;

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public abstract  T getModel();
	
}
