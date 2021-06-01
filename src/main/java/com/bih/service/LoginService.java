package com.bih.service;

import com.bih.bean.user;
import com.bih.mapper.UserMapper;
import com.bih.test.MyBatisTest;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service
public class LoginService {

   public String Login(String email) throws IOException {
       InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
       SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
       SqlSession sqlSession = sqlSessionFactory.openSession(true);
       UserMapper mapper = sqlSession.getMapper(UserMapper.class);
       String psw = mapper.findPasswordByEmail(email);
        return psw;
}
    public String getUsername(String email) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String psw = mapper.findUsernameByEmail(email);
        return psw;
    }
    public user getUser(String email) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
       return mapper.getUser(email);
    }
}
