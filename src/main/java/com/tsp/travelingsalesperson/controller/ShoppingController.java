package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShoppingController {

    @RequestMapping("/shopping")
    public String shopping(){
        return "shopping";
    }
}
