package com.bih.bean;

public class fileSize {
    private String size;
    private String name;
    private String loc;

    public fileSize(String size,String name,String loc){
        this.size=size;
        this.name = name;
        this.loc = loc;
    }
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

}
