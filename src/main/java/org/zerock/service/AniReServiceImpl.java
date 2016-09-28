package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AniReVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.AniDAO;
import org.zerock.persistence.AniReDAO;

@Service
public class AniReServiceImpl implements AniReService {

  @Inject
  private AniReDAO anireDAO;
  
  @Inject
  private AniDAO aniDAO;

  @Transactional
  @Override
  public void addReply(AniReVO vo) throws Exception {

	anireDAO.create(vo);
	aniDAO.updateReplyCnt(vo.getBno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {

    int bno = anireDAO.getBno(rno); 
    anireDAO.delete(rno);
    aniDAO.updateReplyCnt(bno, -1);
  }   



  @Override
  public List<AniReVO> listReply(Integer bno) throws Exception {

    return anireDAO.list(bno);
  }

  @Override
  public void modifyReply(AniReVO vo) throws Exception {

	anireDAO.update(vo);
  }



  @Override
  public List<AniReVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception {

    return anireDAO.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return anireDAO.count(bno);
  }

}
