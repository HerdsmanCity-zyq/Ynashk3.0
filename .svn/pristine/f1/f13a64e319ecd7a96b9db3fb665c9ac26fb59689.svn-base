package com.samhk.ynashk;

import com.samhk.ynashk.mapper.PafAttachmentDao;
import com.samhk.ynashk.mapper.VersionsDao;
import com.samhk.ynashk.vo.PafAttachmentVo;
import com.samhk.ynashk.vo.VersionsVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.File;
import java.util.Iterator;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class YnashkApplicationTests {

    @Resource
    private VersionsDao versionsDao;

    @Test
    public void contextLoads() {
    }

    @Test
    public void teste(){
        List<VersionsVo> versionsVos = versionsDao.findByFrameworkId("FR00001");

    }

    @Test
    public void delFile(){
        File file = new File("D:\\eSAM_File\\paf\\doc\\PI00053\\20190613\\596.docx");
        if (file.exists()){
            boolean a= file.delete();
            System.out.println(a);
        }
    }

    @Resource
    private PafAttachmentDao pafAttachmentDao;
    @Test
    public void testIterator(){
        List<PafAttachmentVo>  attachmentVos = pafAttachmentDao.findAllByCompositeKeys("FR00001", "PI00052", 2);
        Iterator<PafAttachmentVo> iterator = attachmentVos.iterator();

        while(iterator.hasNext()){
        }
    }

}
