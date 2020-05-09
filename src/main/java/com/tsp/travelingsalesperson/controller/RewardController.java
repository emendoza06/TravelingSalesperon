package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RewardController {

    @RequestMapping("/reward")
    public String reward(){
        return "reward";
    }
}
