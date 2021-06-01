package com.bih.service;

import com.bih.bean.showData;
import com.bih.mapper.DataMapper;
import com.bih.utils.oldList;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class DiseaseService {
    public  List<showData> GetData(String str) throws IOException {
        DataMapper mapper = GetMapper.getDataMapper();
//        List<showData> list1 = mapper.GetAll();
//        for (int i =0;i<list1.size();i++){
//            String s = "<li><a>"+list1.get(i).getName()+":∏≈ ˆ"+"</a>-----<a href=\"/down?type=type"+list1.get(i).getTypename()+"&id="+list1.get(i).getId()+"\">œ¬‘ÿ</a></li>";
//            oldList.write(s);
//        }
        List<showData> list = mapper.GetDisease("%"+str+"%");
        return list;
    }
}
