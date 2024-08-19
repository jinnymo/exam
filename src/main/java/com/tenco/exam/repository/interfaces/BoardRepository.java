package com.tenco.exam.repository.interfaces;

import com.tenco.exam.repository.model.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardRepository {

    public List<Board> findAll();
    public Board findById(Integer id);
    public void insert(Board board);
    public void updateById(Board board);
    public void deleteById(Integer id);

    public List<Board> findAllWithPaging(@Param("limit") int limit, @Param("offset") int offset);
    public int countAll();
}
