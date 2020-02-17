package com.teamtechsquad.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.teamtechsquad.dao.UserDAO;
import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.dto.UserInfoDTO;

import static com.teamtechsquad.util.DbUtil.*;

public class UserDAOImpl implements UserDAO {

	private static final String INSERT_USER = "INSERT INTO USERS(FIRST_NAME,LAST_NAME,EMAIL,MOBILE,PASSWORD,ACTIVE) VALUES(?,?,?,?,?,?)";
	private static final String GET_USER_INFO_BY_EMAIL = "SELECT USER_ID,FIRST_NAME,LAST_NAME,EMAIL,MOBILE,ACTIVE FROM USERS WHERE EMAIL = ?";
	private static final String GET_PASSWORD_BY_EMAIL = "SELECT PASSWORD FROM USERS WHERE EMAIL = ?";
	private static final String UPDATE_PROFILE = "UPDATE USERS SET  EMAIL = ?, FIRST_NAME =?,LAST_NAME =?, MOBILE =? WHERE USER_ID  = ?";
	private static final String CHECK_USER_EMAIL_OR_MOBILE = "SELECT COUNT(*) FROM USERS WHERE (EMAIL = ?) OR (MOBILE = ?);";
	private static final String UPDATE_PWD_BY_EMAIL = "UPDATE USERS SET  password =?   WHERE EMAIL  = ?";
	private Connection conn;

	@Override
	public int saveUser(RegisterUserFormDTO registerUserForm) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(INSERT_USER);
			ps.setString(1, registerUserForm.getFirstName());
			ps.setString(2, registerUserForm.getLastName());
			ps.setString(3, registerUserForm.getEmail());
			ps.setString(4, registerUserForm.getMobile());
			ps.setString(5, registerUserForm.getPassword());
			ps.setBoolean(6, true);
			int isUpdated = ps.executeUpdate();
			return isUpdated;
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public String getPassword(String email) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(GET_PASSWORD_BY_EMAIL);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			String password = null;
			while (rs.next())
				password = rs.getString(1);
			return password;
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public UserInfoDTO getUserInfo(String email) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(GET_USER_INFO_BY_EMAIL);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			UserInfoDTO userInfo = null;
			while (rs.next()) {
				userInfo = new UserInfoDTO();
				userInfo.setUserId(rs.getInt(1));
				userInfo.setFirstName(rs.getString(2));
				userInfo.setLastName(rs.getString(3));
				userInfo.setEmail(rs.getString(4));
				userInfo.setMobile(rs.getString(5));
				userInfo.setActive(rs.getBoolean(6));
			}
			return userInfo;
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public int updateProfile(UserInfoDTO userInfo) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(UPDATE_PROFILE);
			ps.setString(1, userInfo.getEmail());
			ps.setString(2, userInfo.getFirstName());
			ps.setString(3, userInfo.getLastName());
			ps.setString(4, userInfo.getMobile());
			ps.setInt(5, userInfo.getUserId());
			return ps.executeUpdate();
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}

	@Override
	public int checkUserByEmailOrMobile(String input) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(CHECK_USER_EMAIL_OR_MOBILE);
			ps.setString(1, input);
			ps.setString(2, input);
			ResultSet rs = ps.executeQuery();
			int isUserExist = 0;
			while (rs.next())
				isUserExist = rs.getInt(1);
			return isUserExist;
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}
	
	
	@Override
	public int updatePwdByEmail(String email,String pwd) throws Exception {
		try {
			PreparedStatement ps = null;
			conn = getConnection();
			ps = conn.prepareStatement(UPDATE_PWD_BY_EMAIL);
			ps.setString(1, pwd);
			ps.setString(2, email);
			return ps.executeUpdate();
		} catch (SQLException se) {
			throw new Exception("Exception related to " + se.toString());
		} finally {
			closeConnection(conn);
		}
	}
}
