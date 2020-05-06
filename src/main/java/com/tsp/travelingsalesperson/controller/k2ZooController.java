package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class k2ZooController {

    @RequestMapping("/k2Zoo")
    public String k2Zoo(){
        return "k2Zoo";
    }

}
