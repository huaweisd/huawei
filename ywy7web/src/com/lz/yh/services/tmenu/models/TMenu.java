package com.lz.yh.services.tmenu.models;

public class TMenu {
	
	private String id;
	private String name;
	private String description;
	private String url;
	private Integer priority;
	private String parentId;
	private Integer level;
	private String imgUrl;
	private String config;

	public void setId(String id) {
		this.id = id;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public String getId() {
		return this.id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return this.description;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return this.url;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getImgUrl() {
		return this.imgUrl;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Override
	public int hashCode() {
		return this.getId().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof TMenu) {
			TMenu bean = (TMenu) obj;
			if (bean.getId().equals(this.getId())) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TMenu [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", description=");
		builder.append(description);
		builder.append(", url=");
		builder.append(url);
		builder.append(", priority=");
		builder.append(priority);
		builder.append(", parentId=");
		builder.append(parentId);
		builder.append(", level=");
		builder.append(level);
		builder.append(", imgUrl=");
		builder.append(imgUrl);
		builder.append(", config=");
		builder.append(config);
		builder.append("]");
		return builder.toString();
	}
	
}
