package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.MovieDAO;

@Service
public class MovieServiceImpl implements MovieService{

  @Inject
  private MovieDAO dao;
  
@Transactional
@Override
public void regist(MovieVO board) throws Exception {
	dao.create(board);
 
}

@Transactional(isolation=Isolation.READ_COMMITTED)
@Override
public MovieVO read(Integer bno) throws Exception {
	dao.updateViewCnt(bno);
    return dao.read(bno);
}

@Transactional
@Override
public void modify(MovieVO board) throws Exception {
	 	dao.update(board);
	    
	    Integer bno = board.getBno();
	    
	    dao.deleteAttach(bno);
	
}

@Transactional
@Override
public void remove(Integer bno) throws Exception {
  dao.deleteAttach(bno);
  dao.delete(bno);
} 

@Override
public List<MovieVO> listAll(String title_link) throws Exception {
	return dao.listAll(title_link);
}

@Override
public List<MovieVO> listCriteria(Criteria cri) throws Exception {
	return dao.listCriteria(cri);
}

@Override
public int listCountCriteria(Criteria cri) throws Exception {
	return dao.countPaging(cri);
}

@Override
public List<MovieVO> listSearchCriteria(SearchCriteria cri) throws Exception {
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
	return dao.newList();
}

}
