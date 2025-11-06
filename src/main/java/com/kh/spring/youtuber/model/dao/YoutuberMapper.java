package com.kh.spring.youtuber.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;

@Mapper
public interface YoutuberMapper {

    @Select("SELECT COUNT(*) FROM TB_CREATOR WHERE CREATOR_STATUS = 'N'")
    int selectListCount();


    @Select("SELECT CREATOR_NO AS youtuberNo, CREATOR_NAME AS youtuberName, SUBSCR_COUNT AS subscribe " +
            "FROM TB_CREATOR " +
            "WHERE CREATOR_STATUS = 'N' " +
            "ORDER BY CREATOR_NO DESC")
    List<YoutuberDTO> selectAllYoutubers(RowBounds rowBounds);


    @Select("SELECT " +
            "    C.CREATOR_NO AS youtuberNo, " +
            "    C.CREATOR_NAME AS youtuberName, " +
            "    C.SUBSCR_COUNT AS subscribe, " +
            "    C.CREATOR_STATUS AS status, " +
            "    C.NATION_CODE AS nationCode, " +
            "    N.NATION_NAME AS nationName " +
            "FROM TB_CREATOR C " +
            "LEFT JOIN TB_NATION N ON (C.NATION_CODE = N.NATION_CODE) " +
            "WHERE C.CREATOR_NO = #{youtuberNo}")
    YoutuberDTO selectYoutuberByNo(int youtuberNo);

    
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