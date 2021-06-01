package com.bih.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RecordMapper {
    @Select("SELECT dataloc from record where typea LIKE #{id}")
    public List<String> GetPatha( @Param("id") String id);
    @Select("SELECT dataloc from record where typeb LIKE #{id}")
    public List<String> GetPathb( @Param("id") String id);
    @Select("SELECT dataloc from record where typec LIKE #{id}")
    public List<String> GetPathc( @Param("id") String id);
    @Select("SELECT dataloc from record where typed LIKE #{id}")
    public List<String> GetPathd( @Param("id") String id);
    @Select("SELECT dataloc from record where typee LIKE #{id}")
    public List<String> GetPathe( @Param("id") String id);
    @Select("SELECT dataloc from record where typef LIKE #{id}")
    public List<String> GetPathf( @Param("id") String id);
    @Select("SELECT dataloc from record where typeg LIKE #{id}")
    public List<String> GetPathg( @Param("id") String id);

}
