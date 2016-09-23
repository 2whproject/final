package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BookVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BookDAO;

@Service
public class BookServiceImpl implements BookService {

  @Inject
  private BookDAO dao;

  
  @Transactional
  @Override
  public void regist(BookVO board) throws Exception {
  
    dao.create(board);

  }


  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public BookVO read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }
  
  @Transactional
  @Override
  public void modify(BookVO board) throws Exception {
    dao.update(board);
    
  }
  
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.delete(bno);
  } 

  @Override
  public List<BookVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<BookVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<BookVO> listSearchCriteria(SearchCriteria cri) throws Exception {

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
public List<BookVO> newList() throws Exception {
	return dao.newList();
}   

}
