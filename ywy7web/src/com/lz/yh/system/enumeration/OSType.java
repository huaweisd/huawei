package com.lz.yh.system.enumeration;

public enum OSType {
	
	IOS("IOS", 1),
	Android("��׿", 2),
	WinPhone("WP", 3),
	HTML("HTML", 4);
	
	// ��Ա����
	private String name;
	private int index;
	
	// ���췽��
    private OSType(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // ��ͨ����
    public static String getName(int index) {
        for (OSType c : OSType.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }
    
    // get set ����
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
