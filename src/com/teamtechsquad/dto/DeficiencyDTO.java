package com.teamtechsquad.dto;

import java.io.Serializable;

public class DeficiencyDTO  implements Serializable{

	private static final long serialVersionUID = -4596959793984042038L;
	
	private int defId;
	
	private String deficiencyName;
	
	public DeficiencyDTO() {
	}
	
	public DeficiencyDTO(int defId,String deficiencyName) {
		this.defId = defId;
		this.deficiencyName = deficiencyName;
	}

	public int getDefId() {
		return defId;
	}

	public void setDefId(int defId) {
		this.defId = defId;
	}

	public String getDeficiencyName() {
		return deficiencyName;
	}

	public void setDeficiencyName(String deficiencyName) {
		this.deficiencyName = deficiencyName;
	}
	
}
