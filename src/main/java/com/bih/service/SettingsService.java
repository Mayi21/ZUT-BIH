package com.bih.service;

import com.bih.mapper.UserMapper;
import com.bih.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

@Service
public class SettingsService {

    private UserMapper mapper;
    public String upDateUserName(@Param("username") String username, @Param("gender") String gender , @Param("province") String province , @Param("city") String city, @Param("county") String county, @Param("birthday") String birthday, @Param("introduction") String introduction, @Param("email") String email) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String str = province+"-"+city+"-"+county;
        Boolean flag = mapper.upDateUserName(username,email,gender,str,birthday,introduction);
        if (flag){
            return "修改成功,重新登录后生效";
        }else {
            return "修改失败";
        }
    }
    public String upDatepassword(String opsw1 , String npsw1,String npsw2,String email) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        String opsw = mapper.findPasswordByEmail(email);
        if (!npsw1.equals(npsw2)){
            return "两次密码不一致";
        }else if (!opsw.equals(opsw1)){
            return "原密码错误,请重新输入";
        }else {
            mapper.upDatePassword(npsw1,email);
            return "密码修改成功";
        }
    }
    public void updateotherm(String opsw1 , String npsw1,String username) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.upDateOtherMessage(opsw1,npsw1,username);
    }
}
