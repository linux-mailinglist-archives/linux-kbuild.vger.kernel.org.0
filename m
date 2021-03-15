Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A49333A941
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 02:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhCOBQZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Mar 2021 21:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhCOBQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Mar 2021 21:16:07 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61B0C061574;
        Sun, 14 Mar 2021 18:16:06 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id l13so8104302qtu.9;
        Sun, 14 Mar 2021 18:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RU9zp1OK5lNmTShARYjSfYShvq3eN+Mhv0L6u7qgYss=;
        b=N3gvBQxs34zTy6X8FzZE8UW3snkui47uze9Lcok5y/mfnoDQIIXkVexQ++w2Qky2K4
         XpHJkuYhOjF9f2dRIQNIaL+qQN4AWl0k/rHB21ihb4VTL4d0uF7+mSbJc67yacbw4Fg/
         5B9I9aXtZc9EcrOeeoYbLfWNErVE0W+aDXoNXR1mS5p4qXKxd7oJDgMp3cVStwCWYm+Q
         vj2VNdD1dOK/0jGRVjAhswTICY54KluxzWqeo/iOq29ilm/Oh7yIodXrUOraBxlsZO9E
         IkbQrffnxK2pIyDNqMGcK1mEA1TGkqgCLKZRjr9wcetwPe6amBB7p3k0dw8j2upG5rBV
         Olqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RU9zp1OK5lNmTShARYjSfYShvq3eN+Mhv0L6u7qgYss=;
        b=e2QMpp3aVPxw/xPgnwDmmrZcEwps5b1UZ+XbrF0p1ogiLYgcBrCr0kkLQJSrBo1yeJ
         GyqUKZfV866xxyB7HX6CzmQQ8xpwxVEXAaf6yIa/OC5s+rbJ855LTqTO8Hsztud/cMEy
         vIQ2wguOVkDtod4Gcm7lH/XcEHlg3ELteLrpNe7x1ddHsMr4zkhBsbLCM9EQnfZSLLI/
         Pr2THfe1Wi9v1MAuxk7Ceaczj5qk7xPPCqcY57N4+kbfJ/9/CPTkzc1bOhsZVDNUigj8
         lvKsXOMoMyOcbdyX/kBx0XpiPQotp75Tt4Mfu8k39NQmTV1ScdYwMVEI9aDqcuj6sV+k
         qYOA==
X-Gm-Message-State: AOAM532RrJWAOgGFPG2ePW4tV2t8f3LWLWJ13v3oSGR6haaO14qfLGgY
        PIuVi3PXUKlyrFJsLFETyK0=
X-Google-Smtp-Source: ABdhPJyN+SMRJZdC1aelCEmHlpi7NbzKtbf2sWjCD3KR04TJ21xEWnJeT1230OzVn54CSDGYzC32yA==
X-Received: by 2002:ac8:44aa:: with SMTP id a10mr21954167qto.146.1615770965937;
        Sun, 14 Mar 2021 18:16:05 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id a2sm10010914qtj.76.2021.03.14.18.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 18:16:05 -0700 (PDT)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
From:   Frank Rowand <frowand.list@gmail.com>
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
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
Message-ID: <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
Date:   Sun, 14 Mar 2021 20:16:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi VIresh,

On 3/12/21 11:11 PM, Frank Rowand wrote:
> On 3/12/21 1:13 AM, Viresh Kumar wrote:
>> On 12-03-21, 01:09, Frank Rowand wrote:
>>> I suggested having the .dtso files include the .dts file because that is a relatively
>>> small and easy change to test.  What would probably make more sense is the rename
>>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
>>> file create a new .dts file that #includes the corresponding .dtso file.  This is
>>> more work and churn, but easier to document that the .dts files are a hack that is
>>> needed so that the corresponding .dtb.S files will be generated.
>>
>> What about creating links instead then ?
>>
> 
> I don't really like the idea of using links here.
> 
> Maybe it is best to make the changes needed to allow the unittest
> overlays to be .dtso instead of .dts.
> 
> Off the top of my head:
> 
>   scripts/Makefile.lib:
>      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
>      overlay data in section .dtb.init.rodata, with a label
>      pointing to the beginning of the overlay __dtb_XXX_begin and
>      a label pointing to the end of the overlay __dtb_XXX_end,
>      for the overlay named XXX.  I _think_ that you could simply
>      add a corresponding rule for %.dtbo.S using a new command
>      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
>      __dtbo_XXX_begin and __dtbo_XXX_end).

If you do the above, please put it in drivers/of/unittest-data/Makefile
instead of scripts/Makefile.lib because it is unittest.c specific and
not meant to be anywhere else in the kernel.

-Frank

> 
>   drivers/of/unittest.o:
>      would need to have the #define of OVERLAY_INFO() changed to
>      reflect the changed label names (use __dtbo_##overlayname##begin
>      and __dtb_##overlay_name##_end).
> 
>   drivers/of/unittest-data/Makefile:
>      In obj-$(CONFIG_OF_OVERLAY) change the *.dtb.o names to *.dtbo.o
> 
>      I'm not sure how the DTC_FLAGS_... += -@ differentiates between
>      .dts / .dtb and .dtso / .dtbo  That is worth looking at.
> 
> -Frank
> 

