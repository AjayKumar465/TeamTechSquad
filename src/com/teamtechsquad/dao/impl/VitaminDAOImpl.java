package com.teamtechsquad.dao.impl;

import static com.teamtechsquad.util.DbUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static com.teamtechsquad.util.DbUtil.*;
import com.teamtechsquad.dao.VitaminDAO;
import com.teamtechsquad.dto.DeficiencyCategoryDTO;
import com.teamtechsquad.dto.DeficiencyDTO;
import com.teamtechsquad.dto.VitaminDeficiencyDTO;

public class VitaminDAOImpl implements VitaminDAO {
 	private Connection conn;

	@Override
	public List<VitaminDeficiencyDTO> findDeficiencyPercentage(List<String> defeciencyIds) throws Exception {
		PreparedStatement ps = null;
		List<VitaminDeficiencyDTO> vitaminDeficiencies = null;
		ResultSet rs = null;
		conn = getConnection();
		try {
			ps = conn.prepareStatement(getDefeciencyCountQuery(defeciencyIds));
			rs = ps.executeQuery();
			vitaminDeficiencies = new ArrayList<>();
			while (rs.next()) {
				VitaminDeficiencyDTO vitaminDeficiency = new VitaminDeficiencyDTO();
				vitaminDeficiency.setDeficiencyCount(rs.getInt(1));
				vitaminDeficiency.setVitaminId(rs.getInt(2));
				vitaminDeficiency.setVitaminName(rs.getString(3));
				vitaminDeficiency.setVitminChemicalName(rs.getString(4));
				vitaminDeficiency.setDeficiencyPercentage(calculateDeficiencyPercentage(
						vitaminDeficiency.getDeficiencyCount(), vitaminDeficiency.getVitaminId()));
				vitaminDeficiencies.add(vitaminDeficiency);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn);
		}
		return vitaminDeficiencies;
	}

	public String getDefeciencyCountQuery(List<String> defeciencyIds) {
		return "select distinct count(DEFICIENCY_ID ) ,VITAMIN_ID,  VITAMIN.NAME,VITAMIN.CHEMICAL_NAME from "
				+ "VITAMIN_DEFICIENCY  left outer join VITAMIN  "
				+ "  on VITAMIN_DEFICIENCY.VITAMIN_ID= VITAMIN .id where DEFICIENCY_ID in ("
				+ String.join(",", defeciencyIds) + ") group by VITAMIN_ID ";
	}

	public String getPercentageQuery(int deficiencyCount, int vitaminId) {
		return "select (" + String.valueOf(deficiencyCount)
				+ "*100/count(*)) from VITAMIN_DEFICIENCY  where VITAMIN_ID = " + String.valueOf(vitaminId);
	}

	public double calculateDeficiencyPercentage(int deficiencyCount, int vitaminId) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = getConnection();
		double defPercentage = 0.0d;
		try {
			ps = conn.prepareStatement(getPercentageQuery(deficiencyCount, vitaminId));
			rs = ps.executeQuery();
			while (rs.next()) {
				defPercentage = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn);
		}
		return defPercentage;
	}

	@Override
	public List<DeficiencyCategoryDTO> getDeficiencyCategories() throws Exception {
		List<DeficiencyCategoryDTO> deficiencyCategories = null;
		final String QUERY = "SELECT ID,CATEGORY FROM DEFICIENCY_CATEGORY";
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = getConnection();
		try {
			ps = conn.prepareStatement(QUERY);
			rs = ps.executeQuery();
			deficiencyCategories = new ArrayList<>();
			while (rs.next()) {
				DeficiencyCategoryDTO deficiencyCategoryDTO = new DeficiencyCategoryDTO(rs.getInt(1), rs.getString(2));
				deficiencyCategoryDTO.setDeficiencies(getDeficiencies(deficiencyCategoryDTO.getDefCatId()));
				deficiencyCategories.add(deficiencyCategoryDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn);
		}
		return deficiencyCategories;
	}

	@Override
	public List<DeficiencyDTO> getDeficiencies(int defCatId) throws Exception {
		List<DeficiencyDTO> deficiencies = null;
		final String QUERY = "SELECT DEFICIENCY.ID,DEFICIENCY.DEFICIENCY FROM DEFICIENCY WHERE DEFICIENCY.DEFICIENCY_CATEGORY_ID  = "+defCatId;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = getConnection();
		try {
			ps = conn.prepareStatement(QUERY);
			rs = ps.executeQuery();
			deficiencies = new ArrayList<>();
			while (rs.next()) {
				DeficiencyDTO deficiencyDTO = new DeficiencyDTO(rs.getInt(1), rs.getString(2));
				deficiencies.add(deficiencyDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn);
		}
		return deficiencies;
	}
}
