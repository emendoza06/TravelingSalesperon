package com.tsp.travelingsalesperson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkspaceController {

    @RequestMapping("/workspace")
    public String k2Zoo(){
        return "workspace";
    }
}
