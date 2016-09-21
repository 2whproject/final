package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnrVO;

public interface QnrService {

  public void addReply(QnrVO vo) throws Exception;

  public List<QnrVO> listReply(Integer bno) throws Exception;

  public void modifyReply(QnrVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<QnrVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
}
