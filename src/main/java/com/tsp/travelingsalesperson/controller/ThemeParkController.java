package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ThemeParkController {

    @RequestMapping("/themePark")
    public String shopping(){
        return "themepark";
    }
}
