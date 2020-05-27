package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.ProjectVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface FrameworkVersionPafDao {

    List<FrameworkVersionPafVO> getAllFRAPaf();

    FrameworkVersionPafVO findFRAPafBypafId(FrameworkVersionPafVO frameworkVersionPafVO);

    int checkDataUnique(FrameworkVersionPafVO frameworkVersionPafVO);

    Integer updateFRAversion(FrameworkVersionPafVO frameworkVersionPafVO);

    Integer insertnewFRAPAFItem(FrameworkVersionPafVO vo);

    List<String> getPafNO(SeqNoVo vo);



    /**
     * 获取key为projectid，value为这个项目的framworkpaf
     * @return
     */
    List<ProjectVo> getAllFramework();


    /**
     * 根据 projectId 、pafId 和 frameworkId 查询 framework_version_paf
     * @param projectId
     * @param pafId
     * @param frameworkId
     * @return
     */
    FrameworkVersionPafVO findFVP(@Param("projectId") Integer projectId,@Param("pafId") String pafId, @Param("frameworkId") String frameworkId);
}
