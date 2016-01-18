package com.lz.yh.system.enumeration;

public enum Price {
	
	SF("�շ�", 1),
	MF("���", 2),
	XM("����", 3);
	
	// ��Ա����
	private String name;
	private int index;
	
	// ���췽��
    private Price(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // ��ͨ����
    public static String getName(int index) {
        for (Price c : Price.values()) {
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
