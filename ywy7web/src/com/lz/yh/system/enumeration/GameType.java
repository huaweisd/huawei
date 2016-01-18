package com.lz.yh.system.enumeration;

public enum GameType {
	
	YZXX("��������", 1),
	JSBY("��ɫ����", 2),
	YDPK("�˶��ܿ�", 3),
	CLMN("����ģ��", 2),
	DZSJ("�������", 2),
	JJJS("��������", 2),
	MXCG("ð�մ���", 2),
	ZYQP("��������", 2),
	KPYX("������Ϸ", 2),
	XBJX("С�ྫѡ", 2);
	
	// ��Ա����
	private String name;
	private int index;
	
	// ���췽��
    private GameType(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // ��ͨ����
    public static String getName(int index) {
        for (GameType c : GameType.values()) {
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
