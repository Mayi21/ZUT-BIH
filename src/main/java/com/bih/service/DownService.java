package com.bih.service;

import com.bih.mapper.RecordMapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class DownService {
    public List<String> getPath(String type , String id) throws IOException {
        RecordMapper mapper = GetMapper.getRecordMapper();

        switch (type){
            case "typea":
                return mapper.GetPatha("%,"+id+",%");
            case "typeb":
                return mapper.GetPathb("%,"+id+",%");
            case "typec":
                return mapper.GetPathc("%,"+id+",%");
            case "typed":
                return mapper.GetPathd("%,"+id+",%");
            case "typee":
               return mapper.GetPathe("%,"+id+",%");
            case "typef":
                return mapper.GetPathf("%,"+id+",%");
            case "typeg":
                return mapper.GetPathg("%,"+id+",%");
        }
        return null;
    }
}
