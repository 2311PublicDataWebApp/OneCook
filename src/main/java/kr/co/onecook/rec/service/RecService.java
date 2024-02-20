package kr.co.onecook.rec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.onecook.rec.domain.RecVO;

@Service
public interface RecService {

	/**
	 * RECIPE_TBL 모든 요소 셀렉트 Service
	 * @return RCPS
	 */
	List<RecVO> selectAllRecipe();

}
