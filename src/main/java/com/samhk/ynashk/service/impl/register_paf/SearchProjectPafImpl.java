package com.samhk.ynashk.service.impl.register_paf;

import com.samhk.ynashk.mapper.FrameworkProjectPafDao;
import com.samhk.ynashk.mapper.ProjectPafDao;
import com.samhk.ynashk.service.SearchProjectPafBo;
import com.samhk.ynashk.vo.FrameworkProjectPafVo;
import com.samhk.ynashk.vo.ProjectPafVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service("SearchProjectPafImpl")
public class SearchProjectPafImpl implements SearchProjectPafBo {

    @Resource
    private FrameworkProjectPafDao frameworkProjectPafDao;


    @Override
    public List<FrameworkProjectPafVo> getAllProjectPaf() {
        return frameworkProjectPafDao.getAllProjectPaf();
    }
}
