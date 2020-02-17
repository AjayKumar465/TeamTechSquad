package com.teamtechsquad.dto;

import java.io.Serializable;

public class VitaminDeficiencyDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7768253491518600094L;

	
	private int deficiencyCount;
	
	private int vitaminId;
	
	private String vitaminName;
	
	private String vitminChemicalName;
	
	private double deficiencyPercentage;

	public int getDeficiencyCount() {
		return deficiencyCount;
	}

	public void setDeficiencyCount(int deficiencyCount) {
		this.deficiencyCount = deficiencyCount;
	}

	public int getVitaminId() {
		return vitaminId;
	}

	public void setVitaminId(int vitaminId) {
		this.vitaminId = vitaminId;
	}

	public String getVitaminName() {
		return vitaminName;
	}

	public void setVitaminName(String vitaminName) {
		this.vitaminName = vitaminName;
	}

	public String getVitminChemicalName() {
		return vitminChemicalName;
	}

	public void setVitminChemicalName(String vitminChemicalName) {
		this.vitminChemicalName = vitminChemicalName;
	}

	public double getDeficiencyPercentage() {
		return deficiencyPercentage;
	}

	public void setDeficiencyPercentage(double deficiencyPercentage) {
		this.deficiencyPercentage = deficiencyPercentage;
	}
	

}
