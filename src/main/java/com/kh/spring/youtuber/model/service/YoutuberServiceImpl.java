package com.kh.spring.youtuber.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.youtuber.model.dao.YoutuberMapper;
import com.kh.spring.youtuber.model.dto.YoutuberDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor 
public class YoutuberServiceImpl implements YoutuberService {
	
	private final YoutuberMapper youtuberMapper;

	/**
	 * 랭킹 조회
	 */
	@Override
	public List<YoutuberDTO> youtuberSelectByRank() {
		return youtuberMapper.youtuberSelectByRank();
	}

	/**
	 * 신규 유튜버 등록 
	 */
	@Override
	@Transactional 
	public int insertCreator(YoutuberDTO youtuber) {
		return youtuberMapper.insertCreator(youtuber);
	}
	
}
