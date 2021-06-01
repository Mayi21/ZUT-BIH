package com.bih.test;

import com.bih.mapper.DataMapper;
import com.bih.mapper.UserMapper;
import com.bih.service.GetMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;


public class MyBatisTest {

    private DataMapper mapper;

//@Before
//    public void brfore() throws IOException {
//    InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
//    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
//    SqlSession sqlSession = sqlSessionFactory.openSession(true);
//    mapper= sqlSession.getMapper(UserMapper.class);
//}
@Test
    public void testSelect() throws IOException {
     mapper = GetMapper.getDataMapper();
//    System.out.println(mapper.GetData("a2").get(0).getTitle());
}
}
