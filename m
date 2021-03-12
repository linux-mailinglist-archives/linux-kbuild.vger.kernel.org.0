Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536A0338669
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 08:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhCLHJk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 02:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhCLHJ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 02:09:27 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C578C061574;
        Thu, 11 Mar 2021 23:09:27 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id l132so23358396qke.7;
        Thu, 11 Mar 2021 23:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6HyVPzfJtnZPj+FiCGLisT9CcoQVNfECVYHQyi8QH9g=;
        b=d+AAS2QHDbfT8/U25ISrEO1ETDoQ/gW380T4r08dP44MRmjIrcjn+eAuz6/+QRFyXN
         TxsXr4x0oKN5nFPTWwdOHLOp5JIZd3lgAKMo1HYjWpXSYml1uFciD+o+eoUpzLpC0PrQ
         EAMDTU7vB0gSJzclhKz3DabHpVVucGMGS9hTOpa2szZk/zjaV/M0kZUCeJlEqrnhs3xX
         ofUdzHGWzjx4rEVCYFzDTfE0fQmGfzdXVy6YtawY7FCuqbj/u0iNob1Ol0P68/moYUF5
         8pL/s9qE7sKD8OtRPh78lFUva641ypivI/7092GBfjgxSZ5On1/tNwYSUrE/gLMAGRct
         u9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6HyVPzfJtnZPj+FiCGLisT9CcoQVNfECVYHQyi8QH9g=;
        b=jOpsOumGqbdhKHNtLb7SPVgyDy22SDJCp9zFjhJmA3u4310ZssWEx39cii+D/uBygp
         qtMKZE0RmpNGY6W4T9uBtHN3Hyd/DO8YzgHGjAeCLxPQML4AiS/pAdcjYowQdhfRGGWC
         h9wTIWucCvfnEAsrb/YdXx1Ec3lwjUGGugWZFFP04ZzcnCR9cbJyZQ87GB7RlTALSp8i
         pIXrka9wZxfNH4lUVD3Vmk8DBSFyF5NV5cGXAGnqVgNY13OHOXTLEGfx4SPV0L2DEuvv
         fDvQASRTz6Zn2Sh5PkxQaxxqYZeHaro2zrUFjIHaihyztXpv3rGjaQk+7YS0lG/P/0Hc
         W6Iw==
X-Gm-Message-State: AOAM531YY7kWtWKdGLt2olmbJycJ0Kl2gtidsoCG5hBIN/YgZHKik9m6
        WkXaix9EHKHsiOUlz+o2qQc=
X-Google-Smtp-Source: ABdhPJzvbFaG7qRauO5os9ZYCRzcyMyQ5PzNB3eJcNOGuCqkGuGQ18Hy65yvQz7wTjX97dOpKzK+WQ==
X-Received: by 2002:a05:620a:a8b:: with SMTP id v11mr10875808qkg.414.1615532966870;
        Thu, 11 Mar 2021 23:09:26 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id j2sm3613722qkk.96.2021.03.11.23.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 23:09:26 -0800 (PST)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
From:   Frank Rowand <frowand.list@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
Message-ID: <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
Date:   Fri, 12 Mar 2021 01:09:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/12/21 1:03 AM, Frank Rowand wrote:
> Hi Viresh,
> 
> On 3/11/21 10:47 PM, Viresh Kumar wrote:
>> On 10-03-21, 20:24, Masahiro Yamada wrote:
>>> Even without "-I dts",
>>>
>>>    inform = guess_input_format(arg, "dts");
>>>
>>> seems to fall back to "dts" anyway,
>>> but I guess you wanted to make this explicit, correct?
>>
>>
>>>> +# Required for of unit-test files as they can't be renamed to .dtso
>>>
>>> If you go with *.dtso, I think you will rename
>>> all *.dts under the drivers/ directory.
>>>
>>> What is blocking you from making this consistent?
>>
>> What about this patch instead ? This localizes the dts->dtbo hack to
>> unitest's Makefile at least.
> 
> It is late here, so I am not going to take the time to actually try what
> I am going to suggest.  I apologize in advance if I send you off on a
> wild goose chase.
> 
> Would it work to create a .dtso file for each of the unittest overlay .dts
> files, where the .dtso would simply #include the .dts file.  Then the corresponding
> .dtbo files could be added to the obj-$(CONFIG_OF_OVERLAY) list.

I suggested having the .dtso files include the .dts file because that is a relatively
small and easy change to test.  What would probably make more sense is the rename
the existing overlay .dts files to be .dtso files and then for each overlay .dtso
file create a new .dts file that #includes the corresponding .dtso file.  This is
more work and churn, but easier to document that the .dts files are a hack that is
needed so that the corresponding .dtb.S files will be generated.

If it works, I am fine with either approach.

-Frank

> 
> I would like to avoid having the unitest-data/Makefile have different rules to
> build objects because then the normal build rule is not being tested.
> 
> -Frank
> 
>>
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index a5d2d9254b2c..9f3426ec3fab 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -86,3 +86,7 @@ static_test_1-dtbs := static_base_1.dtb $(apply_static_overlay_1)
>>  static_test_2-dtbs := static_base_2.dtb $(apply_static_overlay_2)
>>  
>>  dtb-$(CONFIG_OF_OVERLAY) += static_test_1.dtb static_test_2.dtb
>> +
>> +# Required for of unittest files as they can't be renamed to .dtso
>> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>> +       $(call if_changed_dep,dtc)
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index bc045a54a34e..77a9be055e51 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -347,7 +347,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>>         $(call if_changed_dep,dtc)
>>  
>> -$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>> +$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
>>         $(call if_changed_dep,dtc)
>>  
>>  overlay-y := $(addprefix $(obj)/, $(overlay-y))
>> @@ -375,6 +375,9 @@ endef
>>  $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
>>         $(call if_changed_rule,dtc,yaml)
>>  
>> +$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
>> +       $(call if_changed_rule,dtc,yaml)
>> +
>>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>>  
>>  # Bzip2
>>
> 

