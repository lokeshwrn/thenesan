// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require tinymce

function error_shake(elem, active_class, time){
    classie.add2( elem, active_class );
    setTimeout( function() { classie.remove2( elem, active_class ) }, time );
}

// ajax submit for form
function ajax_submit(data, url, validate, fields){
    $.ajax({
        type: "POST",
        url: url,
        data: {
            "data": data,
            "fields" : fields,
            "validate" : validate,
        },
        dataType: "html",
        success: function (data) {
            console.log(data);
        }
    });
}

// get all the input field values inside a form
function get_vals(obj){
    var list = [];
    obj.find('input[type!=hidden]').each(function(){
        var x=$(this).attr("id");
        list.push(x)
    });
    return list;
}

// reset input field values
function reset_form_values(form){
    $(form).find("input").each(function(){
        $(this).val("");
    });
    $(form).find("textarea").each(function(){
        $(this).val("");
    });
}

// ajax submit and validate for form data table form
$('form[class="common_form"] button').click(function(e){
    var form = $(this).closest('#validate_form');
    var validate = $(form).find('#validate').val().split(" ");
    e.preventDefault();
    var flag = true;
    $(form).find('input').each(function(){
        var val = $(this).attr('id');
        var ary = validate;
        if(($.inArray(val, ary))>=0){
            if($(this).val() == ''){
                var self = $(this), activatedClass = 'validate-err btn-error';
                error_shake(self, activatedClass, 4000);
                flag=false;
                window.location=window.location.pathname+"#"+$(form).closest('#form').attr('class');
            }
        }
    });

    if (flag) {
        ajax_submit($(form).serializeArray(), "/submit_enquiry", validate, get_vals($(form)));
        reset_form_values(form);
        var main_div = $(form).closest('.main-form');
        $(main_div).find('#form').hide(1000);
        $(main_div).find('.another-form').show(1000);
    }
});

// submit another form div show and hide
$('.another-form button').click(function(){
    var main_div = $(this).closest('.main-form');
    $(main_div).find('#form').show(1000);
    $(main_div).find('.another-form').hide(1000);

});

// toggle password field type in login form
$('.show_password').click(function(){
    $(this).toggleClass('login_active');

    var yes = $("#password_login").attr('type');
    if(yes == 'password')
    {
        $('.label_password').text('Hide');
        $("#password_login").attr('type','text');
    }
    else
    {
        $('.label_password').text('Show');
        $("#password_login").attr('type','password');
    }
});

//login form ajax submit
$('.login_block button[name="commit"]').click(function(e){
    e.preventDefault();
    $(this).html('Please Wait...').attr("disabled", true).css("cursor","wait");
    var user_name=$('.login_block input[id="user_name_login"]').val();
    var password=$('.login_block input[id="password_login"]').val();
    var rem_me="";
    $.ajax({
        type: "POST",
        url: "/check-login",
        data: {
            "login": {
                "user_name": user_name,
                "password": password,
                "remember_me":rem_me
            }
        },
        dataType: "json",
        success: function (data) {
            if (data.status!=true) {
                $('.ajax_message').show();
                $('.login_block button[name="commit"]').html('LogIn').attr("disabled", false).css("cursor","pointer");
            }
            else{
                window.location='/';
            }
        }
    });
});
