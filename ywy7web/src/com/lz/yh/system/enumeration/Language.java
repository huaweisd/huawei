package com.lz.yh.system.enumeration;

public enum Language {
	
	CH("中文", 1),
	EN("英文", 2),
	OTHER("其他", 3);
	
	// 成员变量
	private String name;
	private int index;
	
	// 构造方法
    private Language(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // 普通方法
    public static String getName(int index) {
        for (Language c : Language.values()) {
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
