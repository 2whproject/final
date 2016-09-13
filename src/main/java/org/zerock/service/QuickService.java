package org.zerock.service;

import java.util.List;

import org.zerock.domain.QuickVO;
import org.zerock.domain.SearchCriteria;

public interface QuickService {
	public List<QuickVO> read () throws Exception;
}
