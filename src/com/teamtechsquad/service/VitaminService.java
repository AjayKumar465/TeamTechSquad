package com.teamtechsquad.service;

import java.util.List;

import com.teamtechsquad.dto.DeficiencyCategoryDTO;
import com.teamtechsquad.dto.DeficiencyDTO;
import com.teamtechsquad.dto.VitaminDeficiencyDTO;

public interface VitaminService {
	
    public List<VitaminDeficiencyDTO> calculateVitaminDeficiency(List<String> deficiencyIds) throws Exception;
    
    List<DeficiencyDTO> getDeficiencies(int defCatId) throws Exception;

	List<DeficiencyCategoryDTO> getDeficiencyCategories() throws Exception;
}
