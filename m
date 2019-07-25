Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357827532D
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbfGYPt6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 11:49:58 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57721 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfGYPt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:49:58 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6PFnrR6022128;
        Fri, 26 Jul 2019 00:49:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6PFnrR6022128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564069794;
        bh=1rEyTd5oqXxAGH3Gk6fAUuzRFhgVIwtH73KGZ2HINZ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RYNzH4ZUR32A0F+s3bhgEVfZZRkB0pyvVvGCP+CdbYYRbVyzwBUIUWRH+wmDvFrhi
         oRrgfHJN5MeyKDQ1YrwSdiVV4QPu+415TC9edDvYDjX6u4rCGOwjq3wc08ZZ92wDkZ
         Kcl171Y0cMUBpr2cuIHdF7dk1pFw/sbkAiU2hJxcw4XJX58s5Gq856Cs6D3d61J73h
         1n3OmK+wnSc57/YxVsyJ0a222tOOKuPI4T9ivtq5tnGwmDWEAGGlpeA+qbLyRNTZWl
         /zSJpBBq6fSeNEhimQ0mmN7JcLhNHpDdhdL1JYFFjVI7t/rGXMcy2pbjYEcaA/Xp8d
         IcWm1zp3flmOA==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id w186so1737510vkd.11;
        Thu, 25 Jul 2019 08:49:53 -0700 (PDT)
X-Gm-Message-State: APjAAAXTTD0WazMuUX6vjGiXHJCQBlWBc9jVTQT8xVCRw7bP8L2qPR8E
        RZKdO2UjlXo6yGe6IO2CPgRr8Iu5xCUzZSAO1zg=
X-Google-Smtp-Source: APXvYqyXCTnIUUkGiWCtubAzwsGs5WiFqs7/KQy0sq/c46kC8fnBIw4k7N3R/OoKeYgjR/Kv/vyYMyuutdTylE7nztE=
X-Received: by 2002:a1f:b0b:: with SMTP id 11mr34465306vkl.64.1564069792455;
 Thu, 25 Jul 2019 08:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
 <20190717061800.10018-8-yamada.masahiro@socionext.com> <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
 <CAK7LNARu--p-tiJA2RGM5_KSQPSeo6-pkp-4GRd2AwM_1dtD7Q@mail.gmail.com> <0ee802e1-5563-3615-d08f-c936d4e96ebc@siemens.com>
In-Reply-To: <0ee802e1-5563-3615-d08f-c936d4e96ebc@siemens.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 26 Jul 2019 00:49:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATAD8hJUE559+LUf=OQ1-doMUtx7-Dv+B6ao5BK2667xg@mail.gmail.com>
Message-ID: <CAK7LNATAD8hJUE559+LUf=OQ1-doMUtx7-Dv+B6ao5BK2667xg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 26, 2019 at 12:27 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 25.07.19 17:18, Masahiro Yamada wrote:
> > Hi Jan,
> >
> > On Thu, Jul 25, 2019 at 5:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>
> >>
> >> This affects also external modules builds: I have patterns here that do
> >>
> >> [Makefile]
> >> subdir-y := some-module
> >>
> >> [some-module/Makefile]
> >> obj-m := some-module.o
> >>
> >> and since this patch, the final some-module.ko is no longer built. Am I missing
> >> something in the kbuild makefiles, or is this a regression?
> >
> > Thanks for the report.
> > Interesting. I have never imagined that Makefiles were written like that.
> >
> > I just wrote a fix-up, but I have not determined to apply it.
> > https://patchwork.kernel.org/patch/11059033/
> >
> > It is easy to fixup your Makefile, though.
>
> Thanks for addressing this quickly! I'm happy to adjust our code [1]. Is the
> suggested pattern usable with recent stable kernels as well, say down to 4.4 at
> least?

Yes, should work for any kernel version.



> Jan
>
> [1] https://github.com/siemens/jailhouse/blob/master/Kbuild#L54

Maybe,

obj-m := driver/ hypervisor/ configs/ inmates/ tools/

   and

$(patsubst %/,$(obj)/%,$(obj-m)): $(GEN_CONFIG_MK)


Not tested at all.


-- 
Best Regards
Masahiro Yamada
