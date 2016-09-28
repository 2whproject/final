package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.ReplyVO_BSR;

public interface ReplyService_BSR {

  public void addReply(ReplyVO_BSR vo) throws Exception;

  public List<ReplyVO_BSR> listReply(Integer bno) throws Exception;

  public void modifyReply(ReplyVO_BSR vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<ReplyVO_BSR> listReplyPage(Integer bno, Criteria_BSR cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
}
