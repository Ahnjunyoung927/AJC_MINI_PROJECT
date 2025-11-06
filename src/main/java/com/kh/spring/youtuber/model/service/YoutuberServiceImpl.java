package com.kh.spring.youtuber.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.dao.DataIntegrityViolationException; // 예외 처리를 위해 임포트
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.exception.InvalidArgumentsException; // throw할 예외 임포트
import com.kh.spring.util.PageInfo;
import com.kh.spring.util.Pagination;
import com.kh.spring.youtuber.model.dao.YoutuberMapper;
import com.kh.spring.youtuber.model.dto.YoutuberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그 사용을 위해 추가
@Service
@RequiredArgsConstructor
public class YoutuberServiceImpl implements YoutuberService {

    private final YoutuberMapper youtuberMapper;
    private final Pagination pagination;

    /**
     * 유튜버 전체 목록 조회 + 페이징 처리
     * @param page (현재 페이지)
     * @return Map (list, pi)
     */
    @Override
    public Map<String, Object> selectAllYoutubers(int currentPage) {
        
        int listCount = youtuberMapper.selectListCount();
        int pageLimit = 10;
        int boardLimit = 9;
        
        PageInfo pi = pagination.getPageInfo(listCount, currentPage, boardLimit, pageLimit);
        
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        List<YoutuberDTO> list = youtuberMapper.selectAllYoutubers(rowBounds);
        
        Map<String, Object> map = new HashMap<>();
        map.put("pi", pi);
        map.put("list", list);
        
        return map;
    }

    /**
     * 유튜버 상세 조회 
     * @param youtuberNo
     * @return YoutuberDTO
     */
    @Override
    public YoutuberDTO selectYoutuberByNo(Long youtuberNo) {
    	
    	YoutuberDTO youtuber = youtuberMapper.selectYoutuberByNo(youtuberNo);
    	
    	if(youtuber == null) {
    		throw new InvalidArgumentsException("해당 번호의 유튜버를 찾을 수 없습니다: " + youtuberNo);
    	}
 
        return youtuber;
    }
    
    /**
     * 유튜버 랭킹 목록 조회
     * @param 
     * @return  List<YoutuberDTO>
     */
    @Override
    public List<YoutuberDTO> selectYouberByRank() {
        return youtuberMapper.youtuberSelectByRank();
    }

    /**
     * 신규 유투버 등록
     * @param youtuberDTO
     * @return  0 또는 1
     */
    @Override
    @Transactional
    public int insertCreator(YoutuberDTO youtuber) {
        
        try {
            return youtuberMapper.insertCreator(youtuber);

        } catch (DataIntegrityViolationException e) {

            throw new InvalidArgumentsException("이름 중복 또는 필수값 누락");
        }
    }
}