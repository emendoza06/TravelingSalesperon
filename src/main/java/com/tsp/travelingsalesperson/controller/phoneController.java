package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class phoneController {

    @RequestMapping("/phone")
    public String phone(){
        return "phone";
    }
}
