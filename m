Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC832FBB88
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 16:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391333AbhASPpA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 10:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389575AbhASPow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 10:44:52 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C87DC061573;
        Tue, 19 Jan 2021 07:44:12 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id v126so22177852qkd.11;
        Tue, 19 Jan 2021 07:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LpYod6/yIeHu0blY8X3TaII+yGQK9blo73/oSXeWqc0=;
        b=XidkRvDUr8AzD1SbQb5YrM207F8xmWX03kCIKOmE6BWpfFPlqFN3LFQakzpmu+FPd4
         z0EwSreX1aAZVgu7uVLmO/dy+1fqcpCupn83rp0V0SYotnBSPj3HkIL5LjZGZgu2w5zZ
         OLLyUlRtJZyWwp12kBax6Jvmkvphr27q6qzGah5Ufh1kXhXcYASo8hg2Hcn4rt1eYovd
         6OMymwgVkvNxeUQz6gVTco8ND2laBBnsKAC9Kaf2vG+vcrXKIVMvf5XIAgyq7FpU5FX0
         1qS01oTaYe1T8/0GoZ3+O/IEkaKxkU5mLmc3sFL9WR5DIxeD0Kd/ThpHW11k4iK7UaX/
         7Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LpYod6/yIeHu0blY8X3TaII+yGQK9blo73/oSXeWqc0=;
        b=mnGi3yk0B79818lUiuoMHzLW52pig6hKt3aeiykezd2NDxbaLF4vCKZnCuTEgyXXlC
         LqJscl6UzvTsRMGaPy6k/NfthWUD7E6E6NEGje/Lm6rnyJpNB6Ju6gm6xxisBFmJ3tfp
         YzZsS5ZToYytLYCdvRUP7Asjv/TmFE5lMjxH4XPqqk6CZCs+9Nb0YE0wdaH9644ZWpe6
         jXybSbfeZj8dtzl1dgvOVZrqacbbwNwyF8rTDYFAI7h0cAQzy6IbkbgsbCSpJq/08ubp
         EtyQn4SulsbQX23poYg+jpDYQdLK49tgyrL0PvQTeFCvwd+hbTljNkdfJ+c0zZauxkxA
         lisQ==
X-Gm-Message-State: AOAM530xPKQ9+Wvzd2p9DOmbeLmGODC1YdWiiiHVLswaPE1wvbW8I/bK
        dBiBN+KFQd7LIJOJd6KpP3g=
X-Google-Smtp-Source: ABdhPJyVLM2KcEzfMhxUZNQNVAA0NejB+xsMo11skQKbPBXDERoGmdRLU1yjk/3ToS+VYZK/b0d5Qw==
X-Received: by 2002:a37:a5ca:: with SMTP id o193mr4916359qke.394.1611071051311;
        Tue, 19 Jan 2021 07:44:11 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id 190sm13325277qkf.61.2021.01.19.07.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 07:44:10 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
Date:   Tue, 19 Jan 2021 09:44:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119080546.dzec3jatsz2662qs@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/19/21 2:05 AM, Viresh Kumar wrote:
> On 18-01-21, 20:21, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> These changes apply on top of the patches in:
>>
>>   [PATCH] of: unittest: Statically apply overlays using fdtoverlay
>>   Message-Id: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
>>
>> There are still some issues to be cleaned up, so not ready for acceptance.
> 
> Are you talking about the missing __overlay__ thing ? (more below)

No.  I am referencing my comments below (I'll copy them up here):

   I have not used the construct "always-$(CONFIG_OF_OVERLAY)" before, and
   have not looked into the proper usage of it.

   [Tested using my own fdtoverlay instead of the one supplied by your patches
   that added fdtoverlay and fdtdump to the kernel tree.]

   I have not run this through checkpatch, or my checks for build warnings.
   I have not run unittests on my target with these patches applied.

I will have to get the updated patch, test it more fully, and fill in a gap
in my knowledge (use of "always-$(CONFIG_xxx)".


> 
>> I have not used the construct "always-$(CONFIG_OF_OVERLAY)" before, and
>> have not looked into the proper usage of it.
> 
> I wasn't sure either, maybe Masahiro can suggest the best fit.
> 
>> I tested this using a hand build libfdt and fdtoverlay from the dtc-compiler
>> upstream project.  For my testing I added LD_LIBRARY_PATH to the body of
>> "cmd_fdtoverlay" to reference my hand built libfdt.  The kernel build
>> system will have to instead use a libfdt that is built in the kernel
>> tree.
> 
> I tested it with this patchset:
> 
> https://lore.kernel.org/lkml/cover.1610431620.git.viresh.kumar@linaro.org/
> 
>> I have not run this through checkpatch, or my checks for build warnings.
>> I have not run unittests on my target with these patches applied.
>>
>> ---
>>  drivers/of/unittest-data/Makefile | 67 ++++++++++++++++++++++---------
>>  1 file changed, 48 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index f17bce85f65f..28614a123d1e 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -39,25 +39,54 @@ DTC_FLAGS_testcases += -@
>>  # suppress warnings about intentional errors
>>  DTC_FLAGS_testcases += -Wno-interrupts_property
>>  
>> -# Apply overlays statically with fdtoverlay
>> -intermediate-overlay	:= overlay.dtb
>> -master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
>> -			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
>> -			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
>> -			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
>> -			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
>> -			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
>> -			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
>> -			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
>> -			   intermediate-overlay.dtb
>> -
>> -quiet_cmd_fdtoverlay = fdtoverlay $@
>> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
>> -
>> -$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
>> -	$(call if_changed,fdtoverlay)
>> +# Apply overlays statically with fdtoverlay.  This is a build time test that
>> +# the overlays can be applied successfully by fdtoverlay.  This does not
>> +# guarantee that the overlays can be applied successfully at run time by
>> +# unittest, but it provides a bit of build time test coverage for those
>> +# who do not execute unittest.
>> +#
>> +# The overlays are applied on top of testcases.dtb to create static_test.dtb
>> +# If fdtoverlay detects an error than the kernel build will fail.
>> +# static_test.dtb is not consumed by unittest.
>> +#
>> +# Some unittest overlays deliberately contain errors that unittest checks for.
>> +# These overlays will cause fdtoverlay to fail, and are thus not included
>> +# in the static test:
>> +#			overlay.dtb \
>> +#			overlay_bad_add_dup_node.dtb \
>> +#			overlay_bad_add_dup_prop.dtb \
>> +#			overlay_bad_phandle.dtb \
>> +#			overlay_bad_symbol.dtb \
>> +
>> +apply_static_overlay := overlay_base.dtb \
> 
> This won't work because of the issues I mentioned earlier. This file
> doesn't have __overlay__. One way to fix that is to do this:
> 
> diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dts
> index 99ab9d12d00b..59172c4c9e5a 100644
> --- a/drivers/of/unittest-data/overlay_base.dts
> +++ b/drivers/of/unittest-data/overlay_base.dts
> @@ -11,8 +11,7 @@
>   * dtc will create nodes "/__symbols__" and "/__local_fixups__".
>   */
> 
> -/ {
> -       testcase-data-2 {
> +       &overlay_base {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> 
> @@ -89,5 +88,3 @@ retail_1: vending@50000 {
>                 };
> 
>         };
> -};
> -

No.  overlay_base.dts is intentionally compiled into a base FDT, not
an overlay.  Unittest intentionally unflattens this FDT in early boot,
in association with unflattening the system FDT.  One key intent
behind this is to use the same memory allocation method that is
used for the system FDT.

Do not try to convert overlay_base.dts into an overlay.


> diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
> index a85b5e1c381a..539dc7d9eddc 100644
> --- a/drivers/of/unittest-data/testcases.dts
> +++ b/drivers/of/unittest-data/testcases.dts
> @@ -11,6 +11,11 @@ node-remove {
>                         };
>                 };
>         };
> +
> +       overlay_base: testcase-data-2 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +       };
> 
>> -always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
>> +always-$(CONFIG_OF_OVERLAY) += static_test.dtb
> 
> This is how static_test.dtb looks now with fdtdump
> 

< snip >

-Frank
