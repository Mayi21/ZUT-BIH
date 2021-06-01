package com.bih.service;

import com.bih.bean.showData;
import com.bih.mapper.DataMapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class ToDataShowService {
    public List<showData> getList(String name) throws IOException {
        DataMapper map = GetMapper.getDataMapper();
        List<showData> list = map.Getll2(name);
        return list;
    }
}
