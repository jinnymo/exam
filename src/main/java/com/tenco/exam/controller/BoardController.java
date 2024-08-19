package com.tenco.exam.controller;

import com.tenco.exam.repository.model.Board;
import com.tenco.exam.services.BoardServices;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BoardController {

    @Autowired
    private final BoardServices boardServices;

//    @GetMapping("/board")
//    public String board(Model model) {
//
//        List<Board> boards = boardServices.getAllBoards();
//        model.addAttribute("boards", boards);
//        return "board";
//    }

    @GetMapping("/create")
    public String creat() {
        return "createBoard";
    }

    @PostMapping("/createProc")
    public String createProc(Board board) {
        boardServices.createBoard(board);

        return "redirect:/board";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        boardServices.deleteBoard(id);
        return "redirect:/board";
    }
    @GetMapping("/getById/{id}")
    public String getById(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("board", boardServices.getBoardById(id));
        return "updateBoard";
    }

    @PostMapping("/updateById")
    public String updateById( Board board) {
        boardServices.updateBoard(board);
        return "redirect:/board";
    }


    @GetMapping("/board")
    public String board(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int offset = (page - 1) * 10;
        List<Board> boards = boardServices.getBoardsWithPaging(10, offset);
        int totalCount = boardServices.getTotalBoardCount();
        int totalPages = (int) Math.ceil((double) totalCount / 10);

        model.addAttribute("boards", boards);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "board";
    }
}
