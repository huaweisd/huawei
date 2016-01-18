package com.lz.yh.system.enumeration;

public enum GameType {
	
	YZXX("益智休闲", 1),
	JSBY("角色扮演", 2),
	YDPK("运动跑酷", 3),
	CLMN("策略模拟", 2),
	DZSJ("动作射击", 2),
	JJJS("竞技竞速", 2),
	MXCG("冒险闯关", 2),
	ZYQP("桌游棋牌", 2),
	KPYX("卡牌游戏", 2),
	XBJX("小编精选", 2);
	
	// 成员变量
	private String name;
	private int index;
	
	// 构造方法
    private GameType(String name, int index) {
        this.name = name;
        this.index = index;
    }
    
    // 普通方法
    public static String getName(int index) {
        for (GameType c : GameType.values()) {
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
