package com.teamtechsquad.dto;

import java.io.Serializable;
import java.util.List;

public class DeficiencyCategoryDTO implements Serializable {

	private static final long serialVersionUID = -459695979398404038L;

	private int defCatId;

	private String deficiencyCatName;

	private List<DeficiencyDTO> deficiencies;

	public DeficiencyCategoryDTO() {
	}

	public DeficiencyCategoryDTO(int defCatId, String deficiencyCatName) {
		this.defCatId = defCatId;
		this.deficiencyCatName = deficiencyCatName;
	}

	public int getDefCatId() {
		return defCatId;
	}

	public void setDefCatId(int defCatId) {
		this.defCatId = defCatId;
	}

	public String getDeficiencyCatName() {
		return deficiencyCatName;
	}

	public void setDeficiencyCatName(String deficiencyCatName) {
		this.deficiencyCatName = deficiencyCatName;
	}

	public List<DeficiencyDTO> getDeficiencies() {
		return deficiencies;
	}

	public void setDeficiencies(List<DeficiencyDTO> deficiencies) {
		this.deficiencies = deficiencies;
	}

}
