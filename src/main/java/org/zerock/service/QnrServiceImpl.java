package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnrVO;
import org.zerock.persistence.QnaDAO;
import org.zerock.persistence.QnrDAO;

@Service
public class QnrServiceImpl implements QnrService {

  @Inject
  private QnrDAO qnrDAO;
  
  @Inject
  private QnaDAO qnaDAO;

  @Transactional
  @Override
  public void addReply(QnrVO vo) throws Exception {

    qnrDAO.create(vo);
    qnaDAO.updateReplyCnt(vo.getBno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {

    int bno = qnrDAO.getBno(rno);
    qnrDAO.delete(rno);
    qnaDAO.updateReplyCnt(bno, -1);
  }   



  @Override
  public List<QnrVO> listReply(Integer bno) throws Exception {

    return qnrDAO.list(bno);
  }

  @Override
  public void modifyReply(QnrVO vo) throws Exception {

    qnrDAO.update(vo);
  }



  @Override
  public List<QnrVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception {

    return qnrDAO.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return qnrDAO.count(bno);
  }

}
