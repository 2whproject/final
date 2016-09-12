package org.zerock.persistence;
import org.zerock.domain.MemberVO;


public interface MemberDAO {

  public void regist(MemberVO member) throws Exception;

  
}
