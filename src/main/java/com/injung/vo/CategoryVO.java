package com.injung.vo;

public class CategoryVO {
	private long cat_snum;
	private String cat_name;
	private long boa_snum;
	public long getCat_snum() {
		return cat_snum;
	}
	public void setCat_snum(long cat_snum) {
		this.cat_snum = cat_snum;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public long getBoa_snum() {
		return boa_snum;
	}
	public void setBoa_snum(long boa_snum) {
		this.boa_snum = boa_snum;
	}
	@Override
	public String toString() {
		return "Category [cat_snum=" + cat_snum + ", cat_name=" + cat_name + ", boa_snum=" + boa_snum + "]";
	}
}
