package com.fp.ssm.dao;

import com.fp.ssm.po.TbTask;
import com.fp.ssm.po.TbTaskExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TbTaskMapper {
    int countByExample(TbTaskExample example);

    int deleteByExample(TbTaskExample example);

    int deleteByPrimaryKey(Long taskId);

    int insert(TbTask record);

    int insertSelective(TbTask record);

    List<TbTask> selectByExampleWithBLOBs(TbTaskExample example);

    List<TbTask> selectByExample(TbTaskExample example);

    TbTask selectByPrimaryKey(Long taskId);

    int updateByExampleSelective(@Param("record") TbTask record, @Param("example") TbTaskExample example);

    int updateByExampleWithBLOBs(@Param("record") TbTask record, @Param("example") TbTaskExample example);

    int updateByExample(@Param("record") TbTask record, @Param("example") TbTaskExample example);

    int updateByPrimaryKeySelective(TbTask record);

    int updateByPrimaryKeyWithBLOBs(TbTask record);

    int updateByPrimaryKey(TbTask record);
}