package com.injung.vo;

public class NoticeVO {

    private long no_snum;
    private String no_context;
    private String no_regdate;
    public long getNo_snum() {
        return no_snum;
    }
    public void setNo_snum(long no_snum) {
        this.no_snum = no_snum;
    }
    public String getNo_context() {
        return no_context;
    }
    public void setNo_context(String no_context) {
        this.no_context = no_context;
    }
    public String getNo_regdate() {
        return no_regdate;
    }
    public void setNo_regdate(String no_regdate) {
        this.no_regdate = no_regdate;
    }
    @Override
    public String toString() {
        return "NoticeVO [no_snum=" + no_snum + ", no_context=" + no_context + ", no_regdate=" + no_regdate + "]";
    }    
    
}
