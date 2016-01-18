package com.lz.yh.system.enumeration;

public enum OSType {
	
	IOS("IOS", 1),
	Android("安卓", 2),
	WinPhone("WP", 3),
	HTML("HTML", 4);
	
	// 成员变量
	private String name;
	private int index;
	
	// 构造方法
    private OSType(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // 普通方法
    public static String getName(int index) {
        for (OSType c : OSType.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }
    
    // get set 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
    
}
