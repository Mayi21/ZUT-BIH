package com.bih.service;

import com.bih.bean.show_ecg;
import com.bih.mapper.DataMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author HomieJ
 */
@Service
public class EcgService {


    public List<show_ecg> GetEcg(String id_orderby , String city) throws IOException {
        System.out.println(id_orderby+city+"!");
        DataMapper mapper = GetMapper.getDataMapper();
        List<show_ecg> show_ecgs = new ArrayList<>();
        switch (id_orderby){
            case "typea" :show_ecgs = mapper.GetEcga(city);
            case "typeb" :show_ecgs = mapper.GetEcgb(city);
            case "typec" :show_ecgs = mapper.GetEcgc(city);
            case "typed" :show_ecgs = mapper.GetEcgd(city);
            case "typee" :show_ecgs = mapper.GetEcge(city);
            case "typef" :show_ecgs = mapper.GetEcgf(city);
            case "typeg" :show_ecgs = mapper.GetEcgg(city);
        }
        System.out.println(show_ecgs);
        return show_ecgs;
    }
}
