package com.zjgsu.controller;

import com.zjgsu.dao.CkDao;
import com.zjgsu.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CkController {
    @Autowired
    private CkDao ckDao;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String ckHome(Model model){
        model.addAttribute("msg", "欢迎访问CkEditor！");
        return "home";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String CkSave(Model model, Article article){
        ckDao.save(article);
        model.addAttribute("content", article);
        return "show";
    }
}
