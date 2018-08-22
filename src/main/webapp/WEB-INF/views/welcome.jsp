<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri ="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Registration Form</title>

    <style>
        .error {
            color: red; font-weight: bold;
        }
    </style>
</head>
<body>
<header>
    <h2>
        Registration Form
        <br>
        <em>United States Residents ONLY!</em>
    </h2>
</header>
<br>
<form name="userReg" method="POST" action="/registered" onsubmit="return validateForm()">

    <input type="text" name="fName" placeholder="First Name" required>
    <input type="text" name="lName" placeholder="Last Name" required><br>
    <input type="text" name="address1" placeholder="Address" required><br>
    <input type="text" name="address2" placeholder="Address 2"><br>
    <input type="text" name="city" placeholder="City" required>
    <input type="text" name="state" placeholder="State"><br>
    <input type="text" name="zip" placeholder="Zip"><br>
    <input type="text" name="country" placeholder="United States" disabled><br>

    <br>
    <input class="btn" type="submit" value="Register"/>
</form>

<h5 style="color: darkred">${error}</h5>

<script>
    function validateForm() {
        var stateInit = document.forms["userReg"]["state"].value;
        var zipCode = document.forms["userReg"]["zip"].value;

        var postalCodeRegex = /^\d{5}$|^\d{5}-\d{4}$/;

        if (!postalCodeRegex.test(zipCode)) {
            alert("Please enter a valid zip code of 5 or 9 numbers long. For example: 12345 or 12345-6789");
            return false;
        }

        var states = ["AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE", "FL","GA","GU","HI","IA",
                        "ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT",
                        "NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI",
                        "SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"];
        for(var i=0;i< states.length;i++) {
            if(stateInit.toUpperCase() === states[i]) {
                return true;
            }
        }
        //If input state initials do not match, user will be alerted
        alert("Please enter valid State initials.");
        return false;

    }
    </script>


</body>
</html>
