package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrickorTreatController {

    @RequestMapping("/trickorTreat")
    public String trickOrTreat(){
        return "trickorTreat";
    }
}
