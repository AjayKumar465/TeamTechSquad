package com.teamtechsquad.service;

import com.teamtechsquad.dto.LoginDTO;
import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.dto.UserInfoDTO;

public interface UserService {
public int registerUser(RegisterUserFormDTO createUserDTO) throws Exception;

UserInfoDTO getUserInfoByEmail(String email) throws Exception;

Boolean authenticateUser(LoginDTO loginDTO) throws Exception;

int checkUserByEmailOrMobile(String input) throws Exception;

int updateProfile(UserInfoDTO userInfo) throws Exception;

int forgotPwd(String email) throws Exception;

Boolean isValidPwd(String pwd, String email) throws Exception;

Boolean isNewAndOldPwdSame(String newPwd, String oldPwd);

int changePassword(String email, String pwd) throws Exception;
}
