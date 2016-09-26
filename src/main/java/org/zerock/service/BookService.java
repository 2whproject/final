package org.zerock.service;

import java.util.List;

import org.zerock.domain.BookVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BookService {

  public void regist(BookVO Book) throws Exception;

  public BookVO read(Integer bno) throws Exception;

  public List<BookVO> newList() throws Exception;

  public void modify(BookVO Book) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<BookVO> listAll() throws Exception;

  public List<BookVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<BookVO> listSearchCriteria(SearchCriteria cri) throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
