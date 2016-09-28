package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.ReplyVO_BSR;
import org.zerock.persistence.BoardDAO_BSR;
import org.zerock.persistence.ReplyDAO_BSR;

@Service
public class ReplyServiceImpl_BSR implements ReplyService_BSR {

  @Inject
  private ReplyDAO_BSR replyDAO;
  
  @Inject
  private BoardDAO_BSR boardDAO;

  @Transactional
  @Override
  public void addReply(ReplyVO_BSR vo) throws Exception {

    replyDAO.create(vo);
    boardDAO.updateReplyCnt(vo.getBno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {

    int bno = replyDAO.getBno(rno); 
    replyDAO.delete(rno);
    boardDAO.updateReplyCnt(bno, -1);
  }   



  @Override
  public List<ReplyVO_BSR> listReply(Integer bno) throws Exception {

    return replyDAO.list(bno);
  }

  @Override
  public void modifyReply(ReplyVO_BSR vo) throws Exception {

    replyDAO.update(vo);
  }



  @Override
  public List<ReplyVO_BSR> listReplyPage(Integer bno, Criteria_BSR cri) 
      throws Exception {

    return replyDAO.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return replyDAO.count(bno);
  }

}
