package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.SeqNoVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("seqNoDao")
public interface SeqNoDao {

    /**
     * 查看编号的规则
     * @param newPaf
     * @return
     */
    List<SeqNoVo> selectOneSeqNo(String newPaf);

    SeqNoVo findByRemember(String remember);

    Integer updateSeqNo(SeqNoVo vo);
    /**
     * 生成編號
     *
     * @param remember 編號前缀
     * @return
     */
    SeqNoVo getNoSeq(String remember);
}
