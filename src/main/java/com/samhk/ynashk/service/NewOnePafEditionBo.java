package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.PafVisioVersionVo;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Author youquan zhong
 * @Date 2019/12/29 10:41
 */
public interface NewOnePafEditionBo {


    List<FrameworkVersionPafVO> getAllFVPByProject();

    List<Map> test();

    /**
     * 获取所有的framework
     * @return
     */
    Map<Integer,List<FrameworkVersionPafVO>> getAllFramework();


    /**
     * 保存Paf_Visio_Version 的数据
     * @param
     */
    Object insertPafVisioVersion(PafVisioVersionVo vo) throws IOException;


    PafVisioVersionVo queryPafVisioVersionIsExist(Integer projectId,String pafId,String pafVisioVersion);

    FrameworkVersionPafVO findFVP(Integer projectId,String pafId, String frameworkId);

    Object uploadPafFile(PafVisioVersionVo vo);

    Object checkDownload(PafVisioVersionVo vo);

    String downloadFile(HttpServletResponse response, HttpServletRequest request, PafVisioVersionVo vo);

    String getLUDByIds(PafVisioVersionVo vo);

    String getLatestVisioVersion(Integer projectId,String pafId);

    Boolean deleteOnePAFEdition(Integer projectId,String pafId,String pafVisioVersion);


}
