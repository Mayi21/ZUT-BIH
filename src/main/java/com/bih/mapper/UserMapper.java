package com.bih.mapper;

import com.bih.bean.user;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

public interface UserMapper {

    @Select("select * from user where bih_id=#{id}")
    public user findById(int id);
    @Update("UPDATE user SET username =#{username},sex= #{gender},city=#{str},introduction=#{introduction},birthday=#{birthday} where mailaddr = #{email}")
    public Boolean upDateUserName(@Param("username") String username,@Param("email") String email,@Param("gender") String gender,@Param("str") String str,@Param("birthday") String birthday,@Param("introduction") String introduction);
    @Update("UPDATE user SET password =#{password} where mailaddr = #{email}")
    public Boolean upDatePassword(@Param("password") String password,@Param("email") String email);
    @Select("select password from user where mailaddr=#{email}")
    public String findByUserName(@Param("email") String email);
    @Select("select password from user where mailaddr=#{email}")
    public String findPasswordByEmail(@Param("email") String email);
    @Select("select username from user where mailaddr=#{email}")
    public String findUsernameByEmail(@Param("email") String email);
    @Insert("insert into user (username,password,mailaddr,sex,city,introduction,birthday) values  (#{username},#{password},#{email},null,null,null,null)")
    public void InsertUser(@Param("username") String username, @Param("password") String password,@Param("email") String email);
    @Select("select token from user where username=#{username}")
    public String finToken(String username);
    @Update("UPDATE user SET token =#{str}")
    public void setToken(String str);
    @Update("UPDATE user SET sex =#{sex},city = #{city} where username = #{username}")
    public void upDateOtherMessage(@Param("city") String city,@Param("sex") String sex,@Param("username") String username);
    @Select("select * from user where mailaddr=#{email}")
    public user getUser(String email);
}
