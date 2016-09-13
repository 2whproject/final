package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.QuickVO;
import org.zerock.domain.SearchCriteria;

public interface QuickDAO {
	public List<QuickVO> read () throws Exception;
}
