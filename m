Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02ED8339BF5
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 06:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhCMFL2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 00:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhCMFL1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 00:11:27 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E19C061574;
        Fri, 12 Mar 2021 21:11:27 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id s7so26630563qkg.4;
        Fri, 12 Mar 2021 21:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wZDvZonDwPy1U4YWZTESPZXmAQ+hvO28vTIA+moCtZg=;
        b=fP96aCOgFqho+hwLGe7EzfETtsqfXAHWq6A6ZXrFnEQOCkhsKAGreD7a+bblQalspE
         Vr6INzC2StCOKfasv7VAuNjFOb5/SCdY302bD8aTgYTrPo2CZXjUrNbEgOCHo8gb3d7o
         DoF+5xlLFkg2VwZywvEpsjdqAyVMn6uAVJaiW55iQaU9KrTwlBeKfWACl9Kp4DP7JSAJ
         HOtW4dSSco+U3mAFLk2a7rDwEbm/P/L+nB/XNWinWW3AZVxr96D1GgQrs/JMjVz2ANKs
         YyMRESLu2Im07mOCFJCIWLwCzAHtTJcroT9zaz1IhxQwZsfGP6s1CORQmO5ZT2oFno78
         Q+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wZDvZonDwPy1U4YWZTESPZXmAQ+hvO28vTIA+moCtZg=;
        b=b8mZMAWbuW71tnb2be6hVBzoFMKvPpg0Xc/czEl2TC+5H9XewHUzIeM8uZVaXynRAQ
         Ow1l0PJF8ln16HX9Iq8U1aPp5UYlHfRUh5U0otPgBiCiK/99aXWtQsrhxhaq8LlHyKn7
         Ej+Lbl4hVZwlTZGKF135FzuJr5LnV2hRIVTLGI2ra1hQKyXYoav0vI5xHS7bdUaKtfzs
         vMYT4l0UP0Msoklp/g4kf6KWnWZx4NjqbJnh/L6PLK7pPirvWoo7ym/SdMG9j8Y4vjxI
         B0fufWi+9cBzlvFVn7V8CO7cLcKpSsedmhqCbEWXVDMDKM7+cNmvx2dMN8SL+iNDou4Q
         d/ZQ==
X-Gm-Message-State: AOAM532hpl0dtN41OYaYGg0bmuyITb2SP1GOzADhEwMnV8adT5d/B589
        H51O8Z83JyKXWtFo5DBhCVc=
X-Google-Smtp-Source: ABdhPJzTNLA7cWQLeyqcWgW3zEepT9gNvX2muoJxUBaRtFu/WPICfDxsNZIM+6vz76xVRvpBJ802Qg==
X-Received: by 2002:ae9:e40b:: with SMTP id q11mr16126276qkc.318.1615612286422;
        Fri, 12 Mar 2021 21:11:26 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id c5sm6129851qkg.105.2021.03.12.21.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 21:11:25 -0800 (PST)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
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
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
Date:   Fri, 12 Mar 2021 23:11:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312071325.zosmlttse4ym7sit@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/12/21 1:13 AM, Viresh Kumar wrote:
> On 12-03-21, 01:09, Frank Rowand wrote:
>> I suggested having the .dtso files include the .dts file because that is a relatively
>> small and easy change to test.  What would probably make more sense is the rename
>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
>> file create a new .dts file that #includes the corresponding .dtso file.  This is
>> more work and churn, but easier to document that the .dts files are a hack that is
>> needed so that the corresponding .dtb.S files will be generated.
> 
> What about creating links instead then ?
> 

I don't really like the idea of using links here.

Maybe it is best to make the changes needed to allow the unittest
overlays to be .dtso instead of .dts.

Off the top of my head:

  scripts/Makefile.lib:
     The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
     overlay data in section .dtb.init.rodata, with a label
     pointing to the beginning of the overlay __dtb_XXX_begin and
     a label pointing to the end of the overlay __dtb_XXX_end,
     for the overlay named XXX.  I _think_ that you could simply
     add a corresponding rule for %.dtbo.S using a new command
     cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
     __dtbo_XXX_begin and __dtbo_XXX_end).

  drivers/of/unittest.o:
     would need to have the #define of OVERLAY_INFO() changed to
     reflect the changed label names (use __dtbo_##overlayname##begin
     and __dtb_##overlay_name##_end).

  drivers/of/unittest-data/Makefile:
     In obj-$(CONFIG_OF_OVERLAY) change the *.dtb.o names to *.dtbo.o

     I'm not sure how the DTC_FLAGS_... += -@ differentiates between
     .dts / .dtb and .dtso / .dtbo  That is worth looking at.

-Frank
