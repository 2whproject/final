package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria_BSR;
import org.zerock.domain.ReplyVO_BSR;


public interface ReplyDAO_BSR {

  public List<ReplyVO_BSR> list(Integer bno) throws Exception;

  public void create(ReplyVO_BSR vo) throws Exception;

  public void update(ReplyVO_BSR vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<ReplyVO_BSR> listPage(Integer bno, Criteria_BSR cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}
