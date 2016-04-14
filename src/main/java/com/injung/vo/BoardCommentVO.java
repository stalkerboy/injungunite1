package com.injung.vo;

public class BoardCommentVO {

    private long com_snum;
    private String com_context;
    private String com_regdate;
    private long boa_snum;
    private long mem_snum;
        private String mem_id;
        private String mem_profile;
    
    private long com_par_snum;
    private String com_updatedate;
    
    public long getCom_snum() {
        return com_snum;
    }
    public void setCom_snum(long com_snum) {
        this.com_snum = com_snum;
    }
    public String getCom_context() {
        return com_context;
    }
    public void setCom_context(String com_context) {
        this.com_context = com_context;
    }
    public String getCom_regdate() {
        return com_regdate;
    }
    public void setCom_regdate(String com_regdate) {
        this.com_regdate = com_regdate;
    }
    public long getBoa_snum() {
        return boa_snum;
    }
    public void setBoa_snum(long boa_snum) {
        this.boa_snum = boa_snum;
    }
    public long getMem_snum() {
        return mem_snum;
    }
    public void setMem_snum(long mem_snum) {
        this.mem_snum = mem_snum;
    }
    public long getCom_par_snum() {
        return com_par_snum;
    }
    public void setCom_par_snum(long com_par_snum) {
        this.com_par_snum = com_par_snum;
    }
    public String getCom_updatedate() {
        return com_updatedate;
    }
    public void setCom_updatedate(String com_updatedate) {
        this.com_updatedate = com_updatedate;
    }
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    public String getMem_profile() {
        return mem_profile;
    }
    public void setMem_profile(String mem_profile) {
        this.mem_profile = mem_profile;
    }
    @Override
    public String toString() {
        return "BoardCommentVO [com_snum=" + com_snum + ", com_context=" + com_context + ", com_regdate=" + com_regdate + ", boa_snum=" + boa_snum + ", mem_snum=" + mem_snum + ", mem_id=" + mem_id + ", mem_profile=" + mem_profile + ", com_par_snum=" + com_par_snum + ", com_updatedate=" + com_updatedate + "]";
    }
    
    
}
