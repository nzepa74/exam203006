package com.spring.mvc.ttpl.controller;

import com.spring.mvc.helper.ResponseMessage;
import com.spring.mvc.ttpl.service.StudentDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by nzepa on 3/7/2020.
 */
@Controller
@RequestMapping("/cutoffMarks")
public class CutoffMarksController {
    @Autowired
    StudentDetailService studentDetailService;
    ResponseMessage responseMessage;

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.HEAD})
    public String index() {
        return "ttpl/cutoffMarks";
    }


    @ResponseBody
    @RequestMapping(value = "/getStudentList", method = RequestMethod.GET)
    public ResponseMessage getStudentDetail() throws Exception {
        responseMessage = studentDetailService.getStudentList();
        return responseMessage;
    }
}
