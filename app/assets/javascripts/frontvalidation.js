//Sport Valiadation
$(function() {
    $("#sportValidate").validate({
        rules: {
            "sport[sport_name]": {
                required: true
            },
            "sport[sport_equipments]": {
                required: true
            }
        },
        messages: {
            'sport[sport_name]': {
                required: 'Please enter sport name'
            },
            'sport[sport_equipments]': {
                required: 'Please enter equipments'
            },
            'sport[success_message]': {
                required: 'Please enter success message'
            },
            'sport[failed_message]': {
                required: 'Please enter failure message'
            }
        },
    })
})

//Player Validation
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