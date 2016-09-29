package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AniVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.AniDAO;

@Service
public class AniServiceImpl implements AniService {

  @Inject
  private AniDAO dao;

  
  @Transactional
  @Override
  public void regist(AniVO Ani) throws Exception {
  
    dao.create(Ani);
    
  }
  
  //
//  @Override
//  public void regist(AniVO Ani) throws Exception {
//    dao.create(Ani);
//  }

//  @Override
//  public AniVO read(Integer bno) throws Exception {
//    return dao.read(bno);
//  }


  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public AniVO read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }

  
//  @Override
//  public void modify(AniVO Ani) throws Exception {
//    dao.update(Ani);
//  }
  
  @Transactional
  @Override
  public void modify(AniVO Ani) throws Exception {
    dao.update(Ani);
    
    Integer bno = Ani.getBno();
    
    dao.deleteAttach(bno);
    
  }
  

//  @Override
//  public void remove(Integer bno) throws Exception {
//    dao.delete(bno);
//  }
  
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.deleteAttach(bno);
    dao.delete(bno);
  } 

  @Override
  public List<AniVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<AniVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<AniVO> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }
  

  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return dao.getAttach(bno);
  }

@Override
public List<String> newList() throws Exception {
	  return dao.listNew();
}   

}
