package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class k2MoonController {

    @RequestMapping("/k2Moon")
    public String k2Moon(){
        return "k2Moon";
    }

}
