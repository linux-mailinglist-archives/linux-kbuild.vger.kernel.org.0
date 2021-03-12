Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3482338652
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 08:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhCLHDk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 02:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhCLHDJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 02:03:09 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980E3C061574;
        Thu, 11 Mar 2021 23:03:09 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id b130so23309172qkc.10;
        Thu, 11 Mar 2021 23:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=URe6yg6kZKD431nvA4XeETSKjleRjzEDE2gULQlZoTo=;
        b=rqpyFRdUgnW2jRm8/8cxjY89WbP8SBAiFaiEs80MxW0lRv6KHhhdJpvx0xOSOx+61R
         gg0YWxdiNv9Ujm7+q/ArCYV81dIpgty4xdKT7aaZeY3R1dvYc4xHJ527vPACtX+ozsrV
         o2Wap2ftbe1qdYFQriYN4e2MlD7y8L8ErfpnQ8RE5FlLiz6FOWi1kZXuFpX+yh3/2GFm
         2PrDOq+rQcchLsqIab2WimGogu8hdeffSOoN0nqUzjUV1fEA3UXtUQoj0bXCqwCjg7IK
         ssqg9nyTE1FFicQy6K0WmCqGTmhcGtPEC08RQL71liE4ctxz1IF2mxvQLD0PzG8I+lD6
         02KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=URe6yg6kZKD431nvA4XeETSKjleRjzEDE2gULQlZoTo=;
        b=jtWOlVpjz2KZKOoKNc8R1WcwSv/lefAGlNE+XZGSd6zen8BV8xcbzE9ssQbrO0NwMc
         uDYZ90uh4h5741bQi9HahfkMnDg8KjAT4ETDPyNKSMsQnuaXZl5fV3qKVefskm8XbjOs
         xjIffxMnCWgJoqtS9BGV1TWDcuuMPJUkasNfKTNrJTRtYfK80ZdqglS6tXjem9PEEiil
         umIneLHpyOiUjOHDsOXqOVkPM8RCG59tUWjveX0NidcK2ychva0RFKJ9FBkRp+9zGXwP
         8iw1vX5eWJMivLXk8sUBJszKBP+OvO/HpNI5u+WaTXyG7xpU7vWBvBgKJBHbUWNzWuGE
         pRJA==
X-Gm-Message-State: AOAM530b12U1Ji7kY/35R5BQqZzD3uYO7cPN/+ogWanI7gKJVNSdCSlG
        reF3LplbMQ6PvT34wVH4lHs=
X-Google-Smtp-Source: ABdhPJz8kD95zkSmLmRnEqLMCp8G27axXDbw6cUPGEj1pUwxhN99l9QJgoXfQtsL2qEKMQkFZl8Rzw==
X-Received: by 2002:a05:620a:444a:: with SMTP id w10mr11507536qkp.294.1615532588819;
        Thu, 11 Mar 2021 23:03:08 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id z6sm3371253qtv.69.2021.03.11.23.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 23:03:08 -0800 (PST)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
Date:   Fri, 12 Mar 2021 01:03:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312044712.srmqfuie7fae55pb@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On 3/11/21 10:47 PM, Viresh Kumar wrote:
> On 10-03-21, 20:24, Masahiro Yamada wrote:
>> Even without "-I dts",
>>
>>    inform = guess_input_format(arg, "dts");
>>
>> seems to fall back to "dts" anyway,
>> but I guess you wanted to make this explicit, correct?
> 
> 
>>> +# Required for of unit-test files as they can't be renamed to .dtso
>>
>> If you go with *.dtso, I think you will rename
>> all *.dts under the drivers/ directory.
>>
>> What is blocking you from making this consistent?
> 
> What about this patch instead ? This localizes the dts->dtbo hack to
> unitest's Makefile at least.

It is late here, so I am not going to take the time to actually try what
I am going to suggest.  I apologize in advance if I send you off on a
wild goose chase.

Would it work to create a .dtso file for each of the unittest overlay .dts
files, where the .dtso would simply #include the .dts file.  Then the corresponding
.dtbo files could be added to the obj-$(CONFIG_OF_OVERLAY) list.

I would like to avoid having the unitest-data/Makefile have different rules to
build objects because then the normal build rule is not being tested.

-Frank

> 
> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> index a5d2d9254b2c..9f3426ec3fab 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -86,3 +86,7 @@ static_test_1-dtbs := static_base_1.dtb $(apply_static_overlay_1)
>  static_test_2-dtbs := static_base_2.dtb $(apply_static_overlay_2)
>  
>  dtb-$(CONFIG_OF_OVERLAY) += static_test_1.dtb static_test_2.dtb
> +
> +# Required for of unittest files as they can't be renamed to .dtso
> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +       $(call if_changed_dep,dtc)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bc045a54a34e..77a9be055e51 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -347,7 +347,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>  
> -$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>  
>  overlay-y := $(addprefix $(obj)/, $(overlay-y))
> @@ -375,6 +375,9 @@ endef
>  $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
>         $(call if_changed_rule,dtc,yaml)
>  
> +$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
> +       $(call if_changed_rule,dtc,yaml)
> +
>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>  
>  # Bzip2
> 

