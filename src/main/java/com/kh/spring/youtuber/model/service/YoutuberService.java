package com.kh.spring.youtuber.model.service;

import java.util.List;
import com.kh.spring.youtuber.model.dto.YoutuberDTO; 

public interface YoutuberService {
	
    /**
     * 유튜버 랭킹 목록 조회
     * @return YoutuberDTO가 담긴 List
     */
    List<YoutuberDTO> youtuberSelectByRank();
    
    /**
     * [NEW] 신규 유튜버 등록
     * @param youtuber (등록할 유튜버 정보)
     * @return (성공: 1, 실패: 0)
     */
    int insertCreator(YoutuberDTO youtuber);

}
