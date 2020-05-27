package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.ProcessPrivilegeVo;
import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.SysProcessVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("systemFlowDao")
public interface SystemFlowDao {

     List<ProcessPrivilegeVo> getprivilege(String code);

    public void delProcess(String code);

    public void updateProcess(SysProcessVo vo);

    public String byMenuCode(String code);

    public List<MenuVo> getFunction();

    public List<MenuVo> getAllFunctionPrivilege(SysProcessVo vo);

    public List<SysProcessVo> checkProcess(String code);

    public void insertProcess(SysProcessVo vo);

    public void delPrivilege(String proCode);

    public void insertPrivilege(ProcessPrivilegeVo privilegeVo);

    public String byCode(String code);

    public List<String> getSeq_No(SeqNoVo vo);
    /**
     * 方法描述: 系统-检视流程
     * @return
     * @author junheng li
     */
    public List<SysProcessVo> getAllSysProcess(SysProcessVo sysProcessVo);
}
