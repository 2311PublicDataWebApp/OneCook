package kr.co.onecook.cs.service;

import org.springframework.stereotype.Service;

import kr.co.onecook.cs.domain.CsVO;

@Service
public interface CsService {
	/**
	 * 1:1문의 등록
	 * @param cs
	 * @return
	 */
	int insertFaq(CsVO cs);

	
}
