package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.AniReVO;

public interface AniReDAO {

  public List<AniReVO> list(Integer bno) throws Exception;

  public void create(AniReVO vo) throws Exception;

  public void update(AniReVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<AniReVO> listPage(Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}
