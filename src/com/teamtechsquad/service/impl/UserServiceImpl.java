package com.teamtechsquad.service.impl;

import com.teamtechsquad.dao.UserDAO;
import com.teamtechsquad.dao.impl.UserDAOImpl;
import com.teamtechsquad.dto.LoginDTO;
import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.dto.UserInfoDTO;
import com.teamtechsquad.email.helper.EmailHelper;
import com.teamtechsquad.email.helper.EmailTemplate;
import com.teamtechsquad.service.UserService;
import com.teamtechsquad.util.AppUtil;

import static com.teamtechsquad.util.AppUtil.generateHash;

import java.util.Date;
import java.util.HashMap;;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;

	public UserServiceImpl() {
		userDAO = new UserDAOImpl();
	}

	@Override
	public int registerUser(RegisterUserFormDTO registerUserFormDTO) throws Exception {
		registerUserFormDTO.setPassword(generateHash(registerUserFormDTO.getPassword()));
		return userDAO.saveUser(registerUserFormDTO);
	}

	@Override
	public UserInfoDTO getUserInfoByEmail(String email) throws Exception {
		return userDAO.getUserInfo(email);
	}

	@Override
	public Boolean authenticateUser(LoginDTO loginDTO) throws Exception {
		return isValidPwd(loginDTO.getPassWord(), loginDTO.getUserName());
	}

	@Override
	public int checkUserByEmailOrMobile(String input) throws Exception {
		return userDAO.checkUserByEmailOrMobile(input);
	}

	@Override
	public int updateProfile(UserInfoDTO userInfo) throws Exception {
		return userDAO.updateProfile(userInfo);
	}
	
	@Override
	public int forgotPwd(String email) throws Exception{
		String pwd = AppUtil.generatePwd(8);
		String hashPwd = AppUtil.generateHash(pwd);
		if(userDAO.updatePwdByEmail(email, hashPwd)>0){
			HashMap<String,String> replacements = new HashMap<>();
			UserInfoDTO userInfo = getUserInfoByEmail(email);
			replacements.put("user", userInfo.getFirstName() +" "+userInfo.getLastName() == null ?"":userInfo.getLastName());
			replacements.put("today", new Date().toString());
			replacements.put("password", pwd);
			EmailTemplate emailTemplate = new EmailTemplate("resources/forgotpwdemailtemplate.html");
			String body = emailTemplate.getTemplate(replacements);
			EmailHelper.sendEmail(email, "Forgot password", body);
			return 1;
		}
		return 0;
	}
	
	@Override
	public int changePassword(String email,String pwd) throws Exception{
		String hashPwd = AppUtil.generateHash(pwd);
		return userDAO.updatePwdByEmail(email, hashPwd);
	}
	
	@Override
	public Boolean isValidPwd(String pwd,String email) throws Exception{
		String persitedPasswordHash = userDAO.getPassword(email);
		if (persitedPasswordHash == null)
			return null;
		String passwordHash = AppUtil.generateHash(pwd);
		return persitedPasswordHash.equals(passwordHash);
	}
	
	@Override
	public Boolean isNewAndOldPwdSame(String newPwd,String oldPwd){
		newPwd = AppUtil.generateHash(newPwd);
		oldPwd =AppUtil.generateHash(oldPwd);
		return newPwd.equals(oldPwd);
	}
	
	
}
