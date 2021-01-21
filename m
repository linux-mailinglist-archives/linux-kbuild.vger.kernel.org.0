Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D142FE170
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 06:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbhAUFSv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 00:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbhAUFBB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 00:01:01 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36125C061757;
        Wed, 20 Jan 2021 21:00:20 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d15so720730qtw.12;
        Wed, 20 Jan 2021 21:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OgcU6Vo2JESkISHfmFMW6Btb8cYekxf929MSFIsRpr0=;
        b=XIZ7JBHMD/GaAtG0PAm5XpneYmPFKYXdZLVh7yN+pGV5YFLRa7+xuL5dnI55gaFGlo
         dmSS2TEK8nV+gu4eKbG5uhdHx88N1yh9wXJy2vU2wJ1d1PYN5UYxHHHs128r/NT4Fs2n
         5PpzzoMWbU5K1g68Xf1u0ZTDzA6GXicd+CpteQFZSTxp61MtDrlBfhmvomy56gxyLYpL
         0pUlL2NUSxzRohys+4qpdKV8jwd7qFc5tRGpC180rmyLr46WtOXvWLlgASll9zX6oUto
         Xz4iv33prB7opWKOCslj6dn+vKW7vW7Sekzmwti/Q3T4oT0rZsJPyVD/pkprsQFFZ8iY
         eDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OgcU6Vo2JESkISHfmFMW6Btb8cYekxf929MSFIsRpr0=;
        b=KTKw4FGgSgw7g4QMYPc1fD0DlRe2w17Lrx6Ic274JMJHjD+2taA90oWJ78xYpbsf4s
         wvj3wPp9kKQubAthP2Cys38ifziwgIfmAX/srN4Xsy6dWTY2D3DRhRDE0mJVV2dIywwl
         BTh1thYMb1FnCHwrwG3vjyPT90sL5fUIXgSTeVp/iF8OrR96KxQX7iuATdi9J+zjWqB/
         +jDp0Ky2NBtjhZ/fIBp6UVVinHZYVkytXD7cYY2oR2jIw4ISx+c3vPjq2Bzm7FcNJnp/
         z4K5RDvwccBhPChKKHRz4nrLoBkAtebwsSjltiwXn2b9lcoVeI5E8UwfGLmvNgVDmLcR
         dQtA==
X-Gm-Message-State: AOAM533hDqTzefBqWxbC/pm2taODFfL3u6yjW0mFygC1M1jf68LcIuXp
        quey1K6RsasONDdh5S9vtXQ=
X-Google-Smtp-Source: ABdhPJzjlSJO9KthfDIZl7vPp5sks1xfacnUYjRy60Ur7aLMh9WdvYIKfZRJUvzxFmtCgxU41EJ8iw==
X-Received: by 2002:ac8:6d0a:: with SMTP id o10mr11883346qtt.113.1611205219347;
        Wed, 20 Jan 2021 21:00:19 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id z132sm2833849qka.131.2021.01.20.21.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 21:00:18 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
 <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
 <20210120050606.b2m4jssh73wexybx@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <95cfc497-3d12-fd46-6e42-2a77612236ea@gmail.com>
Date:   Wed, 20 Jan 2021 23:00:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120050606.b2m4jssh73wexybx@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


+David

so I don't have to repeat this in another thread

On 1/19/21 11:06 PM, Viresh Kumar wrote:
> On 19-01-21, 09:44, Frank Rowand wrote:
>> No.  overlay_base.dts is intentionally compiled into a base FDT, not
>> an overlay.  Unittest intentionally unflattens this FDT in early boot,
>> in association with unflattening the system FDT.  One key intent
>> behind this is to use the same memory allocation method that is
>> used for the system FDT.
>>
>> Do not try to convert overlay_base.dts into an overlay.
> 
> Okay, but why does it have /plugin/; specified in it then ?

OK, so I sortof lied about overlay_base.dts not being an overlay.  It is
a Frankenstein monster or a Schrodinger's dts/dtb.  It is not a normal
object.  Nobody who is not looking at how it is abused inside unittest.c
should be trying to touch it or understand it.

unittest.c first unflattens overlay_base.dtb during early boot.  Then later
it does some phandle resolution using the overlay metadata from overlay_base.
Then it removes the overlay metadata from the in kernel devicetree data
structure.  It is a hack, it is ugly, but it enables some overlay unit
tests.

Quit trying to change overlay_base.dts.

In my suggested changes to the base patch I put overlay_base.dtb in the
list of overlays for fdtoverlay to apply (apply_static_overlay in the
Makefile) because overlay_base.dts is compiled as an overlay into
overlay_base.dtb and it can be applied on top of the base tree
testcases.dtb.  This gives a little bit more testcase data for
fdtoverlay from an existing dtb.

If you keep trying to change overlay_base.dts I will just tell you
to remove overlay_base.dtb from apply_static_overlay, and then the
test coverage will become smaller.  I do not see that as a good change.

If you want more extensive testing of fdtoverlay, then create your
own specific test cases from scratch and submit patches for them
to the kernel or to the dtc compiler project.

> 
> And shouldn't we create two separate dtb-s now, static_test.dtb and
> static_overlay_test.dtb ? As fdtoverlay will not be able to merge it with
> testcase.dtb anyway.
> 
> Or maybe we can create another file static_overlay.dts (like testcases.dts)
> which can include both testcases.dts and overlay_base.dts, and then we can
> create static_test.dtb out of it ? That won't impact the runtime tests at all.
> 

Stop trying to use all of the unittest .dts test data files.  It is convenient
that so many of them can be used in their current form.  That is goodness
and nice leveraging.  Just ignore the .dts test data files that are not
easily consumed by fdtoverlay.

The email threads around the various versions of this patch series show how
normal devicetree knowledgeable people look at the contents of some of the
.dts test data files and think that they are incorrect.  That is because
the way that unittest uses them is not normal.  Trying to modify one or two
of the many unittest .dts test data files so that they are usable by both
the static fdtoverlay and the run time unittest is not worth it.

-Frank
