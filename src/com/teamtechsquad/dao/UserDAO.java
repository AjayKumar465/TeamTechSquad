package com.teamtechsquad.dao;

import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.dto.UserInfoDTO;

public interface UserDAO {
 public int saveUser(RegisterUserFormDTO registerUserFormDTO) throws Exception;

UserInfoDTO getUserInfo(String email) throws Exception;

String getPassword(String email) throws Exception;

int checkUserByEmailOrMobile(String input) throws Exception;

int updateProfile(UserInfoDTO userInfo) throws Exception;

int updatePwdByEmail(String email, String pwd) throws Exception;
}
