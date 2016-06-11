package org.teamAT.vo;

public class PageVo {
	
	private int totalPages;
	private int currPage;
	private boolean leftMore;
	private boolean rightMore;
	private int linkBegin;
	private int linkEnd;
	
	public int getCurrPage() {
		return currPage;
	}
	public boolean isLeftMore() {
		return leftMore;
	}
	public boolean isRightMore() {
		return rightMore;
	}
	public int getLinkBegin() {
		return linkBegin;
	}
	public int getLinkEnd() {
		return linkEnd;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public void setLeftMore(boolean leftMore) {
		this.leftMore = leftMore;
	}
	public void setRightMore(boolean rightMore) {
		this.rightMore = rightMore;
	}
	public void setLinkBegin(int linkBegin) {
		this.linkBegin = linkBegin;
	}
	public void setLinkEnd(int linkEnd) {
		this.linkEnd = linkEnd;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	
}
