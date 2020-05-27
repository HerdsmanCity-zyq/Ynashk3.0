package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.FrameworkPafDocumentVO;
import com.samhk.ynashk.vo.FrameworkVersionPafVO;

import java.util.List;

public interface FrameworkPafDocumentDao {

    List<FrameworkPafDocumentVO> findDocByPafId(String pafId);

    FrameworkPafDocumentVO checkDocUnique(FrameworkPafDocumentVO vo);

    Integer insertNewDocItem(FrameworkPafDocumentVO vo);

    Integer updateDocItem(FrameworkPafDocumentVO vo);

    Integer deleteDocByPafId(String pafId);

    Integer deleteDocByPafIdAndDocName(FrameworkVersionPafVO vo);
}
