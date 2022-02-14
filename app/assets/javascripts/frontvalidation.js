$(function() {
    var $form = $("#playerValidate");
    if ($form.length) {
        $form.validate({
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
    }
})


// jQuery.validator.setDefaults({
//     debug: true,
//     success: "valid"
// });
// $("#form1").validate({
//     rules: {
//         fname: {
//             required: true,
//             minlength: 4
//         },
//         lname: {
//             required: true,
//             minlength: 4
//         },
//         email: {
//             required: true,
//             email: true
//         },
//         age: {
//             required: true,
//             digits: true,
//             range: [18, 100]
//         },
//         password: {
//             required: true,
//             minlength: 6,
//             maxlength: 8
//         },
//         url: {
//             required: true,
//             url: true
//         },
//         mob_no: {
//             required: true,
//             digits: true
//         }
//     }
// });