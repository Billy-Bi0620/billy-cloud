package com.billy.auth.form;

import lombok.Data;

@Data
public class CheckForm {

    private String captchaType;

    private String pointJson;

    private String token;
}
