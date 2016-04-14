package com.injung.vo;

public class FriendVO {

   private long fri_snum;
   private long mem_snum;
   private String mem_id;
   private String mem_name;
   
   private String fri_level;
   
   private long fri_mem_snum;
   private String fri_mem_id;
   private String fri_mem_name;
   private String fri_mem_profile;
   private long following_count;
   private long follower_count;
   
   
    public long getFri_snum() {
        return fri_snum;
    }
    public void setFri_snum(long fri_snum) {
        this.fri_snum = fri_snum;
    }
    public long getMem_snum() {
        return mem_snum;
    }
    public void setMem_snum(long mem_snum) {
        this.mem_snum = mem_snum;
    }
    public long getFri_mem_snum() {
        return fri_mem_snum;
    }
    public void setFri_mem_snum(long fri_mem_snum) {
        this.fri_mem_snum = fri_mem_snum;
    }
    public String getFri_level() {
        return fri_level;
    }
    public void setFri_level(String fri_level) {
        this.fri_level = fri_level;
    }
    public String getFri_mem_id() {
        return fri_mem_id;
    }
    public void setFri_mem_id(String fri_mem_id) {
        this.fri_mem_id = fri_mem_id;
    }
    public String getFri_mem_name() {
        return fri_mem_name;
    }
    public void setFri_mem_name(String fri_mem_name) {
        this.fri_mem_name = fri_mem_name;
    }
    public String getFri_mem_profile() {
        return fri_mem_profile;
    }
    public void setFri_mem_profile(String fri_mem_profile) {
        this.fri_mem_profile = fri_mem_profile;
    }
    
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    public String getMem_name() {
        return mem_name;
    }
    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }
    @Override
    public String toString() {
        return "FriendVO [fri_snum=" + fri_snum + ", mem_snum=" + mem_snum + ", mem_id=" + mem_id + ", mem_name=" + mem_name + ", fri_level=" + fri_level + ", fri_mem_snum=" + fri_mem_snum + ", fri_mem_id=" + fri_mem_id + ", fri_mem_name=" + fri_mem_name + ", fri_mem_profile=" + fri_mem_profile + "]";
    }
    public long getFollower_count() {
        return follower_count;
    }
    public void setFollower_count(long follower_count) {
        this.follower_count = follower_count;
    }
    public long getFollowing_count() {
        return following_count;
    }
    public void setFollowing_count(long following_count) {
        this.following_count = following_count;
    }
   
    
     
}