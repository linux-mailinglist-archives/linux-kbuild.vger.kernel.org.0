Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE34C268FDF
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgINP0z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 11:26:55 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33206 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgINP0f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 11:26:35 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 08EFPip2002107;
        Tue, 15 Sep 2020 00:25:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 08EFPip2002107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600097145;
        bh=ixZ9xTZCIn1RovzCTxzSW0XvWigV/czMbfXB2IIGpJc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OM5aGdSWO2mPXpeddpHc8mjw5ZaYtDDPUvIfwmo8u9PU2sU+Oghh83/WyN4qRf7Ss
         r0L/XJ6Jj3Z0B131gxtCowXOohFZfUvCHCCK/aI4pKgDJkI4p9CnQSIHQPNR7X20gP
         OQzjJKmUM0ZXxIPJvtLavM80pSrqme0gHK1mUg46QioBVmhuu9Pxj49ZIHWQNgp6Ay
         oNlSH3eS/0oLZdNo9aK7+mKcJR15BDw0p4WkAbzR3zH4B3AGB2B5h/wyUIX+geUbmM
         IFnZatF2ykTe+QZ3cc8ZSdUDfhHqkeEUn6ZajzMTxNWu2Kd1QuVxodF97gT/U6LDln
         TbWhShRywAh2g==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id a9so123pjg.1;
        Mon, 14 Sep 2020 08:25:45 -0700 (PDT)
X-Gm-Message-State: AOAM531qW8EyGG3rdccK1SzCIfVBt5hIKkajqanm3YqArR7pvoW4NLoX
        8/b+6OsM+Q61WyUqhrbJweqhXkZgGitOqTHWXkU=
X-Google-Smtp-Source: ABdhPJx8TpHV0ZJdAO3buYbNCRXtOmIHApu+/jhEv+bBStXLRBX6yDCJfp9UWq4V/2iPmrSuIE8s3Xi+PGPkPFQWnec=
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr14590883pjb.153.1600097144248;
 Mon, 14 Sep 2020 08:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
In-Reply-To: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 15 Sep 2020 00:25:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
Message-ID: <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
Subject: Re: xconfig is broken again on Qt5
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 13, 2020 at 10:21 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> I hate to say it, but xconfig got broken again.
>
> After commit 68fd110b3e7e2 ("kconfig: qconf: remove redundant help in the info view")
> help description disappered completely from xconfig (both normal and split mode)
>
> I reverted this and next commit to get this back.
>
> I have a feeling that there were several bugs introduced to xconfig recently
> due to attempt to support both Qt4 and Qt5. Maybe we should only support one version?


xconfig was originally written for Qt3, and
got broken in many ways after being converted to Qt5.
(commit 8328447af88eaab1d thru b4ff1de3b8381a4)

That is my gut feeling.

So, xconfig carried broken code everywhere
for many years.

I think supporting both Qt4 and Qt5
is doable, but testing both versions is tedious.
I'd like to want to drop Qt4 support in the future but
not in this development cycle because there are still
some people using Qt4.


Recently I changed xconfig a lot because I noticed
various bugs, and also needed to simplify the code
for better maintainability.


Sorry for the pain, but we need to change the code
to make it stable and maintainable.

For the reported issue,
does this work for you?
https://patchwork.kernel.org/patch/11774055/


> I tried gconfig even thinking maybe nobody uses xconfig these days
> but gconfig seems to lack search function.

gconfig is not well maintained either.

I think it should be converted from gtk+2 to gtk+3
and I know various bugs that need fixing
(but I have not been able to find time to work on it...)



> Best regards,
>         Maxim Levitsky
>


-- 
Best Regards
Masahiro Yamada
