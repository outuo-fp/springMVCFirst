package com.fp.ssm.dao;

import com.fp.ssm.po.TbProject;
import com.fp.ssm.po.TbProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TbProjectMapper {
    int countByExample(TbProjectExample example);

    int deleteByExample(TbProjectExample example);

    int deleteByPrimaryKey(Long proId);

    int insert(TbProject record);

    int insertSelective(TbProject record);

    List<TbProject> selectByExampleWithBLOBs(TbProjectExample example);

    List<TbProject> selectByExample(TbProjectExample example);

    TbProject selectByPrimaryKey(Long proId);

    int updateByExampleSelective(@Param("record") TbProject record, @Param("example") TbProjectExample example);

    int updateByExampleWithBLOBs(@Param("record") TbProject record, @Param("example") TbProjectExample example);

    int updateByExample(@Param("record") TbProject record, @Param("example") TbProjectExample example);

    int updateByPrimaryKeySelective(TbProject record);

    int updateByPrimaryKeyWithBLOBs(TbProject record);

    int updateByPrimaryKey(TbProject record);
}