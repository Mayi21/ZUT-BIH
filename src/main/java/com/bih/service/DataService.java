package com.bih.service;

import com.bih.mapper.DataMapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class DataService{

    public List GetData(String name) throws IOException {
        DataMapper map = GetMapper.getDataMapper();
        return map.GetData(name);
    }
}
