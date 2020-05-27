package com.samhk.ynashk.service.impl.management.develop_management;

import com.samhk.ynashk.mapper.FrameworkVersionPafDao;
import com.samhk.ynashk.service.SearchFrameworkPafBo;
import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service("SearchFramworkPafImpl")
public class SearchFramworkPafImpl implements SearchFrameworkPafBo {

    @Resource
    private FrameworkVersionPafDao frameworkVersionPafDao;


    @Override
    public List<FrameworkVersionPafVO> getAllFRAPaf() {

        return frameworkVersionPafDao.getAllFRAPaf();
    }
}
