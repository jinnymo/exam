package com.tenco.exam.services;

import com.tenco.exam.repository.interfaces.BoardRepository;
import com.tenco.exam.repository.model.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardServices {

    @Autowired
    BoardRepository boardRepository;

    @Transactional
    public List<Board> getAllBoards() {

        List<Board> boards = null;
        try {
            boards = boardRepository.findAll();
        }catch (DataAccessException e){
            e.printStackTrace();
        }

        return boards;
    }

    @Transactional
    public Board getBoardById(Integer id) {

        Board board = boardRepository.findById(id);
        return board;
    }

    @Transactional
    public void createBoard(Board board) {

        boardRepository.insert(board);
    }

    @Transactional
    public void updateBoard(Board board) {

        boardRepository.updateById(board);
    }

    @Transactional
    public void deleteBoard(Integer id) {
        boardRepository.deleteById(id);

    }

    @Transactional
    public List<Board> getBoardsWithPaging(int limit, int offset) {
        List<Board> boards = null;
        try {
            boards = boardRepository.findAllWithPaging(limit, offset);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return boards;
    }

    @Transactional
    public int getTotalBoardCount() {
        int count = 0;
        try {
            count = boardRepository.countAll();
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return count;
    }
}
