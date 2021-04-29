Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7159036EBF6
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239161AbhD2OHB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 10:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbhD2OHA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 10:07:00 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99EAC06138B;
        Thu, 29 Apr 2021 07:06:13 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i4so41060986ybe.2;
        Thu, 29 Apr 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=cLdxcTNcrHMm88vNMbnQhEh8B6xhBdoL6bjYsKRPn+M=;
        b=tN52Et9otdRUvDo0Zwauf9gP8dzOCsv3ZUqxHkiacxkNvLvekceUZgfCD6/OrHJ1Ay
         WjohQWZebCmywOFs/KHaAMBQdKDTjZ4hjkSFAjUjjLCzMFBDn4xLHyzdcvCMDKWfzNqj
         0RE5VdhckrF8zqM0vdTZaBH+0G6uQb70eNL0CCXKlUP7YJkLGsbR/+3AmYL7Fr/jQpP6
         Si64xoFSJ49ZyHnRYE27V9UODvBy6atC7i1XELOzsh1dH7p9PEd8hXEFgp1FuOxNenMJ
         /OEgcRk+4imzi7jLYq3lLRY5b3WZAxJlic0faDAx6tkWPwx++62WYG3n/cldifo12pSX
         r+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
         :references:from:date:message-id:subject:to:cc;
        bh=cLdxcTNcrHMm88vNMbnQhEh8B6xhBdoL6bjYsKRPn+M=;
        b=Kr+zvZlmyCxgkXzOO4Eveyisxt7gJYJXSPmpeWGJe/JpOIVxPrWTqHzvw8UTtPHufa
         QQeRnGPgoONrD064L8UzHavI8BmFy6r1eHMYrKyb5RAs8v4C8SDDa/3S97GmkP95n2fI
         8ZR3Cz2TIzVHDhcKtbMiMSrU/DR2y4DiNoOyNufBfqPOlZRtT9BKl9Bh2uhVfEDWa4sz
         z/667qmWGIRZOJbUoR82eHHJkd5Mi/cBmlzXiq62XRAG1QiV71S2XBffh2b084Qe+F5U
         OlHvPAVTuiLvH3tpmmmhwC7+neLNUmR4Hb0VMmyCbW0TSK4hBgXX9QBzwea8lpA9heAS
         2ZVA==
X-Gm-Message-State: AOAM531QTaM0rMIPrEb18jqGYbyU9SJByGGYiUtX7FuXy406LecGqjjx
        2IlwVCcOF2F3zj++VRGwAkV1iSPFJ9uOE/fuSl4=
X-Google-Smtp-Source: ABdhPJxFa4LBdrlOsuAeSyQXloBMTyzgiyg/tzQxHyJPc0on+gpe3jlJY2fRjRcbNTCV3rvtReYagIw5BjwjQ8/brFM=
X-Received: by 2002:a5b:98d:: with SMTP id c13mr48453837ybq.463.1619705173088;
 Thu, 29 Apr 2021 07:06:13 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mceier+kernel@gmail.com
Sender: mceier@gmail.com
Received: by 2002:a05:7010:7651:b029:ab:612d:7d1d with HTTP; Thu, 29 Apr 2021
 07:06:12 -0700 (PDT)
In-Reply-To: <878s51e3jc.fsf@gmail.com>
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
From:   Mariusz Ceier <mceier+kernel@gmail.com>
Date:   Thu, 29 Apr 2021 14:06:12 +0000
X-Google-Sender-Auth: H8N9c0KcN-UhlKT59E9MAkIGKcg
Message-ID: <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Kajetan Puchalski <mrkajetanp@gmail.com>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 29/04/2021, Kajetan Puchalski <mrkajetanp@gmail.com> wrote:
>
> Mariusz Ceier <mceier+kernel@gmail.com> writes:
>
>> Rust compiler license doesn't require for people to give back to
>> the
>> community - corporation can create their own version of rust
>> compiler
>> adding some proprietary extensions, develop drivers with it and
>> even
>> if the drivers code will be GPL'd they won't be buildable by
>> anyone
>> but that corporation. The rust compiler license doesn't require
>> sharing changes when you modify it. The similar problem has flex
>> and
>> openssl required to build the kernel, but so far no one thought
>> about
>> abusing them afaik.
>
> Could you explain exactly what the issue you see there is?
> Surely if someone develops a proprietary compiler and then writes
> kernel
> drivers that use that compiler, nobody else will be able to build
> them.
> Because of that, none of the maintainers will be able to run or
> test
> the code and it'll never actually get merged into the kernel.
> Surely they'd effectively be sabotaging themselves.
>

Let's assume the hipothetical corporation wants to add some
proprietary stuff to the kernel and avoid sharing the code (sharing
the code is GPL requirement) - maybe they're producing proprietary
hardware e.g. risc-v processor with proprietary ISA extension. So
"none of the maintainers will be able to run or test the code and
it'll never actually get merged into the kernel." is exactly what it
wants.

To do this they could modify any non-GPL tool required to build the
kernel e.g. flex, rust or openssl so that for files with .proprietary
extension they would execute some code (like "patch this file") taken
from database of shell codes based just on .proprietary file name (so
that the contents of .proprietary files will be freely modifiable -
citing GPL: "The source code for a work means the preferred form of
the work for making modifications to it.").

These .proprietary files can be GPL'd since they don't contain any
useful information for outsiders - all of it could be in the shell
codes. The source code of the modified tool wouldn't have to be
shared, since their license doesn't require it.

I think such modified kernel source code would still be
GPL-compatible, but not benefit the kernel community. If the tool was
GPL-licensed, corporation would have to share it's source code - and I
assume also the database of shell codes, due to:

> You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, *to be licensed as a whole* at no charge to all third parties under the terms of this License.


The issue here is, non-GPL tools enable development and distribution
of GPL-compatible yet proprietary versions of the kernel, unless I'm
mistaken.

> --
> Kind regards,
> Kajetan
>
