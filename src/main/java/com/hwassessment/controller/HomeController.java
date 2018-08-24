package com.hwassessment.controller;

import com.hwassessment.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;

@Controller
public class HomeController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView newUser() {

        return new ModelAndView("welcome", "command", new UsersEntity());
    }

    @RequestMapping(value = "/registered", method = RequestMethod.POST)
    public ModelAndView addUser(@RequestParam("fName") String userFirst, @RequestParam("lName") String userLast,
                                @RequestParam("address1") String userAdd, @RequestParam("address2") String userAdd2,
                                @RequestParam("city") String userCity, @RequestParam("state") String userState,
                                @RequestParam("zip") String userZip) {

        String countryInit = "USA";
        String fullName = userFirst + " " + userLast;

        UsersEntity userInfo = new UsersEntity();

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();

        Transaction tx = session.beginTransaction();

        if (userFirst.length() < 2 || userLast.length() < 2) {
            String error = "First and Last name must be longer than 1 character.";

            return new ModelAndView("welcome", "error", error);
        }

        userInfo.setFirstName(userFirst);
        userInfo.setLastName(userLast);
        userInfo.setAddress1(userAdd);
        userInfo.setAddress2(userAdd2);
        userInfo.setCity(userCity);
        userInfo.setState(userState);
        userInfo.setZip(userZip);
        userInfo.setCountry(countryInit);


        java.util.Date dt = new java.util.Date();

        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String currentTime = sdf.format(dt);

        userInfo.setDate(Timestamp.valueOf(currentTime));

        session.save(userInfo);
        tx.commit();
        session.close();

        return new ModelAndView("confirm", "user", fullName);
    }

    @RequestMapping(value = "/admin")
    public ModelAndView listItems() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectItems = sessionFact.openSession();

        selectItems.beginTransaction();

        Criteria c = selectItems.createCriteria(UsersEntity.class);

        ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.addOrder(Order.desc("date")).list();


        return new ModelAndView("admin", "list", userList);
    }
}
