package com.lz.yh.system.enumeration;

public enum OrderType {
	
	CREATETIME_DESC("CREATE_TIME desc", "CREATE_TIME"),
	CLICKCOUNT_DESC("CLICK_COUNT desc", "CLICK_COUNT"),
	TINDEX("T_INDEX", "T_INDEX"),
	PRIORITY("PRIORITY", "PRIORITY"),
	PROD_TEST_TIME("PROD_TEST_TIME desc", "PROD_TEST_TIME"),
	OPEN_TIME("OPEN_TIME desc", "OPEN_TIME"),
	START_TIME("START_TIME desc", "START_TIME"),
	TP_START_TIME("tp.START_TIME desc", "TP_START_TIME"),
	S_COUNT("S_COUNT desc", "S_COUNT"),
	GET_TIME("GET_TIME desc", "GET_TIME"),
	TPO_OPEN_TIME("tpo.OPEN_TIME desc", "TPO_OPEN_TIME"),
	PRIORITY_CREATE_TIME("PRIORITY,CREATE_TIME DESC", "PRIORITY_CREATE_TIME");
	
	private String name;
	private String index;
	
    private OrderType(String name, String index) {
        this.name = name;
        this.index = index;
    }
    
    public static String getName(String index) {
        for (OrderType c : OrderType.values()) {
            if (c.getIndex().equals(index)) {
                return c.name;
            }
        }
        return null;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }
    
}
