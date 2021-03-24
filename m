Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF4C3472B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 08:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhCXHei (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 03:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbhCXHeb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 03:34:31 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA01EC061763;
        Wed, 24 Mar 2021 00:34:30 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id v70so17126416qkb.8;
        Wed, 24 Mar 2021 00:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p5P4udWW+VDM/0kbE4t5YT11Mz2syk96dwaG63qHDJw=;
        b=i3f0eBjKAs2xhVBESUNLOQacw033oqlm0auPI/DrzDAA62cgowWrPJM9O9m/99rFnw
         QgCby7wL2Uh9Ij3LH5z8yBoqo/ot8IfD9L/TVX5H+EqjGG/AGBcYTYEJHo5QH6u4Sir/
         ktlfDsGJt9VC8pcoSxxDZ7Im5h5TOzzumiHiS6IsCWybVN2HgqoV7riPHk3UCuSRXoLg
         z35cr9ldvkh6+RNdyKDh/gJGO7N0FVkuWrWloVKrHS6bQHZvqexCbeFwNrU5CaVsvlj6
         jGE86TpbrpTIjreQwThDcDN/PzoV0g3qVRxA40dG73xepvJ/eWbvHJ+zU+eyrv7RJVyF
         BE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p5P4udWW+VDM/0kbE4t5YT11Mz2syk96dwaG63qHDJw=;
        b=pcb0bCQ4QrzFvh8acKsx7lvYK/3sgEaB6Jv3NZPKHnIE3/SMz5dx1YSLGaQATepeYo
         J5RLkl7kdiWYP6SUC6Ba468bvPdN+SqLOMt3mEZ+yTZOcVf3HJ/r9/KcWwJunQWUIMoq
         5gcJoDK9ee75e48SHE1qizwkaM82s5sd1gg4e1oX9Mxt9xL55+x6eJlTIknsbqg75ign
         pJlmia750c+OutsOY4v+dOzhDtMQsY8nqEPZKhN/Twr5z0jk2qX0dSEZG9pfqafcKELB
         hQzLlH9YAI8pi88aTMkaSLB+CA5MvcC5wkGRVcQTorBS3Ps1Mfh0EbARHVLqHjJL/Z2X
         MbGg==
X-Gm-Message-State: AOAM533X0zKZI+LqQfYS8lrotKSgb2iS6XjD37up9qJt9oiQjDd68IzE
        dmvF+ngyN6toSWPE12Jj3e5I0Jb4Q1Y=
X-Google-Smtp-Source: ABdhPJzCgM6u4q+Z6jw8wkgYlV/POO796k630hUBz8AWykNdl5nT7b/6CrZAd6NCrscqC/PAclU9+g==
X-Received: by 2002:a37:a811:: with SMTP id r17mr1833948qke.268.1616571269598;
        Wed, 24 Mar 2021 00:34:29 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id 17sm903756qty.27.2021.03.24.00.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 00:34:29 -0700 (PDT)
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
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
 <98697a33-a07d-6c5f-3f21-97a92ac68d3e@gmail.com>
 <20210316054236.2blnleucwr4eidfi@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <077b75aa-6ebc-d76d-d76a-3206e7898c8c@gmail.com>
Date:   Wed, 24 Mar 2021 02:34:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316054236.2blnleucwr4eidfi@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/16/21 12:42 AM, Viresh Kumar wrote:
> On 16-03-21, 00:36, Frank Rowand wrote:
>> I should have looked at patch 3/5 more carefully instead of counting on
>> Masahiro to check it out and simply build testing.
>>
>> Patch 3/5 does not seem correct.  I'll look over all the makefile related
>> changes that have been accepted (if any) and patch 3/5 later today (Tuesday).
> 
> What is already merged by Rob is what everyone reviewed and it wasn't
> related to this .dtso/.dtbo discussion we are having. I will resend a
> new patchset with the stuff left for merging (which will involve the
> thing we are discussing here), so we can get a clear picture of it.
> 

Instead of doing what I suggested in my 16-03-21, 00:36 email (only
partly quoted above), I have made most of the changes to unittest.c
and drivers/of/unitest/unittest-data/Makefile to allow the unittest
.dts files to be .dtso source files and .dtbo FDT files, and tested.
One final step remaining in my work is to actually rename the *.dts
files to *.dtso.

I hope to finish this later today (Wednesday) after getting some
sleep.

-Frank
