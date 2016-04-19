package com.injung.vo;

public class PageMaker {
  
  private long totalCount; // SQL의 결과로 나온 데이터의 전체 개수
  //계산을 통해 만들어지는 데이터
  private long startPage; 
  private long endPage;
  private boolean prev;
  private boolean next;
  
  private long displayPageNum = 10; //화면에 보여지는 페이지 번호의 숫자를 의미하는 변수
  // displayPageNum이 하단페이지에 10으로 나왔을 경우 10게의 페이지 번호가 출력되는 것을 알 수 있습니다.
  
  private Criteria cri;
  
  public void setCri(Criteria cri){
      this.cri = cri;
  }
  
  public void setTotalCount(long totalCount){
      this.totalCount = totalCount;
      
      calcData();
  }
  
  private void calcData(){
      
      endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum); //10 20 
     
      startPage = (endPage - displayPageNum) +1; //1 11
      
      int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
      
      if(endPage > tempEndPage){
          endPage = tempEndPage;
      }
      
      prev = startPage == 1? false : true;
      
      next = endPage * cri.getPerPageNum() >= totalCount? false : true;
  }

  public long getStartPage() {
      return startPage;
  }

  public void setStartPage(long startPage) {
      this.startPage = startPage;
  }

  public long getEndPage() {
      return endPage;
  }

  public void setEndPage(long endPage) {
      this.endPage = endPage;
  }

  public boolean isPrev() {
      return prev;
  }

  public void setPrev(boolean prev) {
      this.prev = prev;
  }

  public boolean isNext() {
      return next;
  }

  public void setNext(boolean next) {
      this.next = next;
  }

  public long getDisplayPageNum() {
      return displayPageNum;
  }

  public void setDisplayPageNum(long displayPageNum) {
      this.displayPageNum = displayPageNum;
  }

  public long getTotalCount() {
      return totalCount;
  }

  public Criteria getCri() {
      return cri;
  }
  
}
