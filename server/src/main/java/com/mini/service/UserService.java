package com.mini.service;

import com.mini.dto.UserLoginDTO;
import com.mini.entity.User;

public interface UserService {
    User wxLogin(UserLoginDTO userLoginDTO);

}
