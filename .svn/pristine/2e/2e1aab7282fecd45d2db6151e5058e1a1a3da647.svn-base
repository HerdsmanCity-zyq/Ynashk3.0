package com.samhk.ynashk.service.impl.paf_code;

import com.samhk.ynashk.mapper.PafAssignDao;
import com.samhk.ynashk.service.SearchPafAssignBo;
import com.samhk.ynashk.vo.FilterVo;
import com.samhk.ynashk.vo.PafAssignVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

@Slf4j
@Service("SearchPafAssignImpl")
public class SearchPafAssignImpl implements  SearchPafAssignBo {

    @Resource
    private PafAssignDao pafAssignDao;


    @Override
    public List<PafAssignVo> selectAllPafAssign() {
        List<PafAssignVo> list = pafAssignDao.selectAllPafAssign();

        if(list.size() > 0){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mma",Locale.ENGLISH);
            for (PafAssignVo psv :list){
                psv.setAssignTimeStr(sdf.format(psv.getAssignTime()));
            }
            return list;
        }
        return null;
    }

    @Override
    public String selectFilterDateByUrlAndCru(String url, String cru) {
        return null;
    }

    @Override
    public String saveFilter(FilterVo filter) {
        return null;
    }
}
