package com.teamtechsquad.dao;

import java.util.List;

import com.teamtechsquad.dto.DeficiencyCategoryDTO;
import com.teamtechsquad.dto.DeficiencyDTO;
import com.teamtechsquad.dto.VitaminDeficiencyDTO;

public interface VitaminDAO {
	public List<VitaminDeficiencyDTO> findDeficiencyPercentage(List<String> defeciencyIds) throws Exception;

	List<DeficiencyDTO> getDeficiencies(int defCatId) throws Exception;

	List<DeficiencyCategoryDTO> getDeficiencyCategories() throws Exception;
}
