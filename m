Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E6B2FAEBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 03:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436634AbhASC0Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 21:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436622AbhASC0X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 21:26:23 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DD0C061573;
        Mon, 18 Jan 2021 18:25:42 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id f26so20600762qka.0;
        Mon, 18 Jan 2021 18:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E55I5FKKUKuiv66Efl4gLA2OEFloF8pG9PDwf/ZhoZc=;
        b=fzinBOo69GpBr1IuGH/DCmrqmH0ez0o5pJyqi9Q6qCUtodZ9riVRHED8TGLTomWJ7p
         9gTArO9ND5tfx6YehPx1XrnYJibRM+q1ahwQUHVJQjsE66S6kJWbkyqJ1jqDA0yh0cg0
         1wI4lN6cp8Ss0rol53vSiXSZZWU9SP4B/KQcimrIGCMsrATlhpsbdmP/0Vopm62QyslM
         r0RxjVhsWzHtwXY6di+W33Z2kbjEUn5aO8dk2/e9Owip3pNXFql+g98UYQxwutAkyTDA
         8TNYdzWM4UGyai5GKfLaFqUYdOOGPlUGABsrK5gxAPaCIljKYcJOrJVJi7NfoXw/aYt2
         Z7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E55I5FKKUKuiv66Efl4gLA2OEFloF8pG9PDwf/ZhoZc=;
        b=CU/OYKQ9wV75JQf2TcwE/1tyN1cl5VV5Pnvh+knGscfGWgOvdqisFd63ojLio6QQ7q
         5KTRiiWcHJaVQ6Wzy9G5pDgjbPGFWEKMMQfmPdW3czFZxdBl2poub9OdDNuWKQy9QIjn
         +FmOD9F8+rhKxfkCohWmjqLG5iCcYuG6ou92JAbNNjS9nONq0KBV+xY+ETplVqU++SSB
         5jvKSJy2/Rit6Gq9jfll9Koj10rGHrDzWmy2qcBsywOn30ayPteaUtnp+CsopKhYzOt4
         z0CMcQrJL3fcbuhcKhWXs3oku4HeQ0YwsGccpyCkEhWKBjqj4evxHuvDeLCCg4C4vsfO
         nlOA==
X-Gm-Message-State: AOAM532h1hdDa0JmsNNGnQwh4xFxL/nFd3/VUt/ociRZc2QKpcED7/V9
        s+IWAhHrvvCvGWDqjdXBb4M=
X-Google-Smtp-Source: ABdhPJy+UBl0fi2GAkaXRTjoCd6wz9zNVg+e7PhO4sge1OvfhF5WrWCXBkW+R9Kpoh3bOQaF0bgBFg==
X-Received: by 2002:a37:a516:: with SMTP id o22mr2426818qke.17.1611023141829;
        Mon, 18 Jan 2021 18:25:41 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id m64sm11930656qkb.90.2021.01.18.18.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 18:25:41 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210114050054.gfkllnr45pgvwcd7@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <106cc6ff-826e-5465-2c53-ef8365cae3cd@gmail.com>
Date:   Mon, 18 Jan 2021 20:25:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114050054.gfkllnr45pgvwcd7@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/13/21 11:00 PM, Viresh Kumar wrote:
> Frank/Rob.
> 
> On 08-01-21, 14:11, Viresh Kumar wrote:
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index 009f4045c8e4..f17bce85f65f 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -38,3 +38,26 @@ DTC_FLAGS_testcases += -@
>>  
>>  # suppress warnings about intentional errors
>>  DTC_FLAGS_testcases += -Wno-interrupts_property
>> +
>> +# Apply overlays statically with fdtoverlay
> 
> I will update this part to mention about the dtbs we are not using in the build
> as they will fail (as per Frank's comment).
> 
> Is there anything else you guys want me to change before I send the next version
> ?

I sent some changes in the form of a patch, in reply to your original patch.
If you can fold the changes into your patch, and look into the comments
that I put into the patch, that would be great.

-Frank

> 
>> +intermediate-overlay	:= overlay.dtb
>> +master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
>> +			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
>> +			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
>> +			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
>> +			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
>> +			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
>> +			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
>> +			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
>> +			   intermediate-overlay.dtb
>> +
>> +quiet_cmd_fdtoverlay = fdtoverlay $@
>> +      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
>> +
>> +$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
>> +	$(call if_changed,fdtoverlay)
>> +
>> +$(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
>> +	$(call if_changed,fdtoverlay)
>> +
>> +always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
> 

