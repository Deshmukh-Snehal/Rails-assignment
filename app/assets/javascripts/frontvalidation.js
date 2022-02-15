//Sport Valiation
$(function() {
        $("#sportValidate").validate({
            rules: {
                "sport[sport_name]": {
                    required: true
                },
                "sport[sport_equipments]": {
                    required: true
                }
            }
        })
    })
    //Player Valiation
$(function() {
        $("#playerValidate").validate({
            rules: {
                "playerdetail[name]": {
                    required: true
                },
                "playerdetail[email]": {
                    required: true,
                    email: true
                },
                "playerdetail[state]": {
                    required: true
                },
                "playerdetail[country]": {
                    required: true
                },
                "playerdetail[mobile_no]": {
                    required: true,
                    digits: true
                }
            }
        })
    })
    //Achievement Validation
$(function() {
    $("#achievementValidate").validate({
        rules: {
            "achievement[awards]": {
                required: true
            },
            "achievement[medals]": {
                required: true
            }
        }
    })
})