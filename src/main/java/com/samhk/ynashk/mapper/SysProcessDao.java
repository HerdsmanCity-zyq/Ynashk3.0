package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.SysProcessVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sysProcessDao")
public interface SysProcessDao {
    public List<SysProcessVo> getAllProcess();

//    List<SysProcessVo> getProcessByArea(CheckRoleBo bo);
}
