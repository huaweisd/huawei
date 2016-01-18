package com.lz.yh.system.enumeration;

public enum Language {
	
	CH("����", 1),
	EN("Ӣ��", 2),
	OTHER("����", 3);
	
	// ��Ա����
	private String name;
	private int index;
	
	// ���췽��
    private Language(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // ��ͨ����
    public static String getName(int index) {
        for (Language c : Language.values()) {
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
