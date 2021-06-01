package com.bih.utils;

import com.bih.mapper.UserMapper;
import com.bih.service.GetMapper;
import com.bih.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;

import java.io.IOException;

public class JedisUtils {
    @Autowired
    private LoginService loginService;

    public static void setToken(String username, String token, int day) {
        try {
            UserMapper mapper = GetMapper.getUserMapper();
            String str= token+" where username="+username+"";
            mapper.setToken(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getToken(String username) {
        try {
            UserMapper mapper = GetMapper.getUserMapper();
            return mapper.finToken(username);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
