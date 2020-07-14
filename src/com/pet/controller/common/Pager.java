package com.pet.controller.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

//페이징 처리 공식을 캡슐화 하자!!(재사용을 위해)
@Component
public class Pager {
	private List list;
	private int currentPage=1;// 현재 페이지 
	private int totalRecord;//총 레코드 수 
	private int pageSize=10;//페이지당 보여질 레코드 수 
	private int totalPage;//총 페이지 수 
	private int blockSize=10;//블럭당 보여질 페이지 수
	private int firstPage;//블럭당 시작 페이지 
	private int lastPage;//블럭당 마지막 페이지 
	private int curPos;//페이지당 시작 인덱스 (list 내의...)
	private int num; // 페이지당 시작 번호..(총 레코드수 -마이너스)
	
	public void init(List list, HttpServletRequest request) {
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalRecord = list.size();
		totalPage = (int)Math.ceil((float)totalRecord/pageSize);
		firstPage= currentPage-((currentPage-1)%blockSize);
		lastPage = firstPage + (blockSize-1);
		curPos = (currentPage-1)*pageSize;
		num = totalRecord -curPos;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getCurPos() {
		return curPos;
	}

	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}















