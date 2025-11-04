package com.kh.spring.youtuber.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;

@Mapper
public interface YoutuberMapper {
	
	/**
	 * 랭킹 조회 (기존 코드)
	 * (이전 대화에서 수정한 최종본)
	 */
	@Select("""
			SELECT
			    C.CREATOR_NO AS youtuberNo,
			    C.CREATOR_NAME AS youtuberName,
			    C.SUBSCR_COUNT AS subscribe,
			    (SELECT COUNT(*) FROM TB_REVIEW R WHERE R.CREATOR_NO = C.CREATOR_NO) AS reviewCount,
			    (SELECT COUNT(*) FROM TB_BOOKMARK B WHERE B.CREATOR_NO = C.CREATOR_NO) AS bookmarkCount
			FROM
			    TB_CREATOR C
			WHERE
			    C.CREATOR_STATUS = 'N'
			ORDER BY
			    bookmarkCount DESC
			FETCH
			    FIRST 3 ROWS ONLY
			""")
	List<YoutuberDTO> youtuberSelectByRank();
	
	@Insert("""
			INSERT INTO TB_CREATOR (
			    CREATOR_NO, 
			    CREATOR_NAME, 
			    SUBSCR_COUNT, 
			    NATION_CODE
			) VALUES (
			    SEQ_CREATOR_NO.NEXTVAL, 
			    #{youtuberName}, 
			    #{subscribe}, 
			    #{nationCode}
			)
			""")
	int insertCreator(YoutuberDTO youtuber);
	
}
