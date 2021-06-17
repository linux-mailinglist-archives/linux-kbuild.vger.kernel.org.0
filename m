Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BACB3AAF8E
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 11:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhFQJUw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Jun 2021 05:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbhFQJU2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jun 2021 05:20:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF3BC061760
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jun 2021 02:18:20 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso5876915wmg.2
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jun 2021 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9BepfpuI4gTK3FDci2Lw1qhlFFFZ3rGxYCCkc+cXF5A=;
        b=rEJJW1nGT5ylLY1WRR4sbUmeZ+p69uWBzd918Tu6NWXyw8VSh+KQa6pYyJAWoYqaLQ
         SzDs7ugq8o7Y//fBT9oADwN+jcDPoRyabCUpBKHewMC+2S0XY++dYKEhC/EUtMecou+N
         jV5e/igrVRQ2jSRPsXRaS8Y2MAU/20IcwzZR7EGTuGshicwMsn4hYr18RP7cOeZgLJoE
         7zt7Awhz2L2OnsrCfo+uIBsAfgeX0mhS6hCbr/e8VfL6oURjdrApFJaLIsOOlHMpIuT4
         6KOtpNt1NwQWzzMRqiPE8/L6tP4x5/gf0J+y32KCqGHNmyGojBowXqx6hPaLukvnOqzh
         hD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9BepfpuI4gTK3FDci2Lw1qhlFFFZ3rGxYCCkc+cXF5A=;
        b=NdEvZJVPZ+XQfsg2mhtBWNENCxRztBPJAqGZhqNA2VO7L+fGh4dOoBbx1KuCkKpQa5
         0Udz/folD9lEQ02BMWMQeWeyrtCTo60UBSsUT4D7XKvHjGbu2ES2CmYI42eP6yNuAPHp
         Uq53QNckp4ZApeRct4GG+dWJNgqUW7sTlC2vRGYjfFcXNGclNODFujujYLUHw34IAFVT
         GxHrYTFCrY3WmLxiAt+SIt+zvShGr2cNgp2pGNrofQIfWdbWBNKJvLXdjJp/hanoQkzR
         J5fksZNCXx1gmlGgwcvYyW1dKGo8FAnv8HM2CUNyCsXcFPzAXznr56S8/vgPGvW/HJic
         jukg==
X-Gm-Message-State: AOAM533/wzJBWRy+xVeibCnxXpdR1g4v77nFxq0NR/u3gpiJHekXoC9h
        Q4+L5aFAmLBivv0xIFKTboilAg==
X-Google-Smtp-Source: ABdhPJxTg0xGDQpF89VezzMjDxw0WHX0T5a/cJf/rozDCBGUj8PS8Tt5YHO54OPysoA+ej/KVYtqrg==
X-Received: by 2002:a1c:5418:: with SMTP id i24mr3926482wmb.1.1623921497930;
        Thu, 17 Jun 2021 02:18:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:dde2:86fa:532c:18b9])
        by smtp.gmail.com with ESMTPSA id p13sm3711248wrt.89.2021.06.17.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 02:18:16 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:18:16 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: mkcompile_h: consider timestamp if
 KBUILD_BUILD_TIMESTAMP is set
Message-ID: <YMsTWAYSV1ZZFYvH@google.com>
References: <20210612141838.1073085-1-maennich@google.com>
 <CAK7LNAQkoqTG540EOER27G83z+DO5fkeHi-in-vRYkrbX-o0cg@mail.gmail.com>
 <CAK7LNAR=Fwzio6CQqDOYQJj9tYrf5a_-sYQ+Yr2=Qt5cYq8wOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAR=Fwzio6CQqDOYQJj9tYrf5a_-sYQ+Yr2=Qt5cYq8wOA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 17, 2021 at 10:43:19AM +0900, Masahiro Yamada wrote:
>On Thu, Jun 17, 2021 at 10:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Sat, Jun 12, 2021 at 11:18 PM Matthias Maennich <maennich@google.com> wrote:
>> >
>> > To avoid unnecessary recompilations, mkcompile_h does not regenerate
>> > compile.h if just the timestamp changed.
>> > Though, if KBUILD_BUILD_TIMESTAMP is set, an explicit timestamp for the
>> > build was requested, in which case we should not ignore it.
>> >
>> > If a user follows the documentation for reproducible builds [1] and
>> > defines KBUILD_BUILD_TIMESTAMP as the git commit timestamp, a clean
>> > build will have the correct timestamp. A subsequent cherry-pick (or
>> > amend) changes the commit timestamp and if an incremental build is done
>> > with a different KBUILD_BUILD_TIMESTAMP now, that new value is not taken
>> > into consideration. But it should for reproducibility.
>> >
>> > Hence, whenever KBUILD_BUILD_TIMESTAMP is explicitly set, do not ignore
>> > UTS_VERSION when making a decision about whether the regenerated version
>> > of compile.h should be moved into place.
>> >
>> > [1] https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html
>> >
>> > Cc: Masahiro Yamada <masahiroy@kernel.org>
>> > Cc: linux-kbuild@vger.kernel.org
>> > Signed-off-by: Matthias Maennich <maennich@google.com>
>> > ---
>>
>>
>> Applied to linux-kbuild. Thanks.

Thanks!

>>
>
>This may not be a big deal, but when KBUILD_BUILD_TIMESTAMP is unset,
>the timestamp is not updated.  It still has a user-specified string.

I think treating this like any other 'random' prior timestamp is ok.
So, I agree: not a big deal.

Cheers,
Matthias
>
>
>
>
>-- 
>Best Regards
>Masahiro Yamada
