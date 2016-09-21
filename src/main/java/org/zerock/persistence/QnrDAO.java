package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnrVO;

public interface QnrDAO {

  public List<QnrVO> list(Integer bno) throws Exception;

  public void create(QnrVO vo) throws Exception;

  public void update(QnrVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<QnrVO> listPage(Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}
