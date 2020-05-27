package com.samhk.ynashk.service.impl.register_paf;

import com.samhk.ynashk.mapper.SearchPAFEditionListDao;
import com.samhk.ynashk.service.SearchPAFEditionListBo;
import com.samhk.ynashk.vo.SearchPAFEditionListVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("searchPAFEditionListImpl")
public class SearchPAFEditionListImpl implements SearchPAFEditionListBo {

    @Resource
    private SearchPAFEditionListDao searchPAFEditionDao;

    @Override
    public List<SearchPAFEditionListVo> searchPAFEditionList() {

        return searchPAFEditionDao.searchPAFEditionList();
    }
}
