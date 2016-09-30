package org.zerock.service;

import java.util.List;

import org.zerock.domain.AniVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface AniService {

  public void regist(AniVO Ani) throws Exception;

  public AniVO read(Integer bno) throws Exception;

  public void modify(AniVO Ani) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<AniVO> listAll() throws Exception;

  public List<AniVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<AniVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;

  public List<String> newList()throws Exception;

  

}
