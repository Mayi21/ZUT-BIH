package com.bih.mapper;

import com.bih.bean.data;
import com.bih.bean.showData;
import com.bih.bean.show_ecg;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DataMapper {

    @Select("SELECT * FROM disease where name = #{name}")
    public List<showData> GetData(String name);

    @Select("select * from  disease where name like #{name}")
    public List<showData> GetDisease(String name );
    @Select("select * from  disease where typename='g'")
    public List<showData> GetAll();

    @Select("select * from  disease where typename=#{str}")
    public List<showData> Getll2(String str);
//    @Select("select * from  disease where typename='b'")
//    public List<showData> GetB();
//    @Select("select * from  disease where typename='c'")
//    public List<showData> GetC();
//    @Select("select * from  disease where typename='d'")
//    public List<showData> GetD();
//    @Select("select * from  disease where typename='e'")
//    public List<showData> GetE();
//    @Select("select * from  disease where typename='f'")
//    public List<showData> GetF();
//    @Select("select * from  disease where typename='g'")
//    public List<showData> GetG();
    @Select("select taskid ,datamit from record where typea like #{city}")
    public List<show_ecg> GetEcga( String city);
    @Select("select taskid ,datamit from record where typeb like #{city}")
    public List<show_ecg> GetEcgb( String city);
    @Select("select taskid ,datamit from record where typec like #{city}")
    public List<show_ecg> GetEcgc( String city);
    @Select("select taskid ,datamit from record where typed like #{city}")
    public List<show_ecg> GetEcgd( String city);
    @Select("select taskid ,datamit from record where typee like #{city}")
    public List<show_ecg> GetEcge( String city);
    @Select("select taskid ,datamit from record where typef like #{city}")
    public List<show_ecg> GetEcgf( String city);
    @Select("select taskid ,datamit from record where typeg like #{city}")
    public List<show_ecg> GetEcgg( String city);
}
