package com.injung.vo;

// 이 클래스는 검색기준, 분류기준에 해당한다.
// Criteria는 객체의 내부에 page와 perPageNum 속성을 보관하도록 하고, 라인 33, 39를<getter>를 이용해서 XML Mapper 에서 사용하는 getter을 제공한다.
// 특이한 점은 페이지 번호는 1페이지로 지정하고, 리스트당 데이터의 수는 10으로 지정해서 강제로 부여.
public class Criteria {
    
    private long page; //현재 조회하는 페이지의 번호
    private long perPageNum; // 한 페이지당 출력하는 데이터의 개수
    private long snum;
    private String id;

    public Criteria() {
        this.page = 1;
        this.perPageNum = 20;
    }
    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getSnum() {
        return snum;
    }

    public void setSnum(long auth) {
        this.snum = auth;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {        
        if (page <= 0){
            this.page = 1;
            return;
        }        
        this.page = page;    
    }

    public long getPerPageNum() {
        return this.perPageNum;
    }

    public void setPerPageNum(long perPageNum) {        
        if ( perPageNum <= 0 || perPageNum > 100){
            this.perPageNum = 10;
            return;
        }
        
        this.perPageNum = perPageNum;
    }
    
    // limit 구문에서 시작 위치를 지정할 때 사용합니다. 예를 들어 10개씩 출력하는 경우 3페이지의 데이터는 limit 20, 10과 같은 형태가 되어야 한다.
    // 계산 공식 : 시작데이터 번호  = (페이지 번호 -1)*페이지 당 보여지는 개수
    public long getPageStart(){
        
        return (this.page -1) * perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", snum=" + snum + ", id=" + id + "]";
    }
}
