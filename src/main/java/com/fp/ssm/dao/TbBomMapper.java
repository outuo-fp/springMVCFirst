package com.fp.ssm.dao;

import com.fp.ssm.po.TbBom;
import com.fp.ssm.po.TbBomExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TbBomMapper {
    int countByExample(TbBomExample example);

    int deleteByExample(TbBomExample example);

    int deleteByPrimaryKey(Long bomId);

    int insert(TbBom record);

    int insertSelective(TbBom record);

    List<TbBom> selectByExampleWithBLOBs(TbBomExample example);

    List<TbBom> selectByExample(TbBomExample example);

    TbBom selectByPrimaryKey(Long bomId);

    int updateByExampleSelective(@Param("record") TbBom record, @Param("example") TbBomExample example);

    int updateByExampleWithBLOBs(@Param("record") TbBom record, @Param("example") TbBomExample example);

    int updateByExample(@Param("record") TbBom record, @Param("example") TbBomExample example);

    int updateByPrimaryKeySelective(TbBom record);

    int updateByPrimaryKeyWithBLOBs(TbBom record);

    int updateByPrimaryKey(TbBom record);
}