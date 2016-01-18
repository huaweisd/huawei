package com.lz.yh.system.enumeration;

public enum IndexType {
	
	
	
	T_INDEX("1,2", "0"),
	T_INDEX1("3", "1"),
	T_INDEX2("4", "2"),
	T_INDEX3("5", "3"),
	T_INDEX4("6", "4"),
	T_INDEX5("7", "5"),
	T_INDEX6("8", "6"),
	T_INDEX7("4,5", "7"),
	T_INDEX9("1", "8"),
	T_INDEX10("2,3", "9"),
	T_INDEX11("7,8,9,11", "10"),
	T_INDEX12("3,4,5", "11"),
	T_INDEX13("3,4", "12");
	private String name;
	private String index;
	
    private IndexType(String name, String index) {
        this.name = name;
        this.index = index;
    }
    
    public static String getName(String index) {
        for (IndexType c : IndexType.values()) {
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
