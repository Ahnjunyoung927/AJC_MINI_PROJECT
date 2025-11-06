package com.kh.spring.youtuber.model.service;

import java.util.List;
import java.util.Map; 

import com.kh.spring.youtuber.model.dto.YoutuberDTO;

public interface YoutuberService {

    /**
     * 유튜버 전체 목록 조회 + 페이징 처리
     * @param page (현재 페이지)
     * @return Map (list, pi)
     */
    Map<String, Object> selectAllYoutubers(int page);

    /**
     * 유튜버 상세 조회 
     * @param youtuberNo
     * @return YoutuberDTO
     */
    YoutuberDTO selectYoutuberByNo(Long youtuberNo);

    /**
     * 유튜버 랭킹 목록 조회
     * @param 
     * @return  List<YoutuberDTO>
     */
    List<YoutuberDTO> selectYouberByRank();

    /**
     * 신규 유투버 등록
     * @param youtuberDTO
     * @return  0 또는 1
     */
    int insertCreator(YoutuberDTO youtuber);
    
    
    

}