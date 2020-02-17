package com.teamtechsquad.service.impl;

import java.util.List;

import com.teamtechsquad.dao.VitaminDAO;
import com.teamtechsquad.dao.impl.VitaminDAOImpl;
import com.teamtechsquad.dto.DeficiencyCategoryDTO;
import com.teamtechsquad.dto.DeficiencyDTO;
import com.teamtechsquad.dto.VitaminDeficiencyDTO;
import com.teamtechsquad.service.VitaminService;

public class VitaminServiceImpl implements VitaminService {
	
	private VitaminDAO vitaminDAO;

	public VitaminServiceImpl() {
		vitaminDAO = new VitaminDAOImpl();
	}

	@Override
	public List<VitaminDeficiencyDTO> calculateVitaminDeficiency(List<String> deficiencyIds) throws Exception {
		return vitaminDAO.findDeficiencyPercentage(deficiencyIds);
	}

	@Override
	public List<DeficiencyDTO> getDeficiencies(int defCatId) throws Exception {
		return vitaminDAO.getDeficiencies(defCatId);
	}

	@Override
	public List<DeficiencyCategoryDTO> getDeficiencyCategories() throws Exception {
		return vitaminDAO.getDeficiencyCategories();
	}

}
