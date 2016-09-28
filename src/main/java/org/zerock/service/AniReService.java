package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.AniReVO;

public interface AniReService {

  public void addReply(AniReVO vo) throws Exception;

  public List<AniReVO> listReply(Integer bno) throws Exception;

  public void modifyReply(AniReVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<AniReVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
}
