Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7781144EC
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 17:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfLEQfq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Dec 2019 11:35:46 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51166 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEQfq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 11:35:46 -0500
X-Greylist: delayed 643 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 11:35:44 EST
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xB5GZbeR012511;
        Fri, 6 Dec 2019 01:35:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xB5GZbeR012511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575563738;
        bh=7RCDcjbdBnI4J3nN6AHAC7zNOa70/0tQQctWWWxqHVE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K+sX0gQSEDOv3hlCLCk0H490Uvi9xOJY2FhfZG8BT0piTlz41BGs/PWe6T54gg1r8
         x8EVzSNI+ok9ftZzNrDwsMvigJ9GH64I/KR/GAJF8snCe2tB6MP5cCKVR5aC4+q82V
         HLCnk8/5rRarKRkIcxmlHpwFIgn6QqXVcigo9GvWGhu1LDhe8x9nRX/Mjbj1qGqzD1
         hVaR1yNRw4Ai5rSLjgVgEFynr35E+5CARAAJUUGmUpqFq/J8fXTTOHOxK6axa/UZeU
         jMD3TNrxrY08qbwstY+5e6uYXY+yhSsNVT/a9uHMrt2nsFOIE+yi/LfOO0PWijgU0F
         u5S5vRI4KMDqw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id y13so2803880vsd.9;
        Thu, 05 Dec 2019 08:35:37 -0800 (PST)
X-Gm-Message-State: APjAAAVGOHSE33IgCktsjriPNL4ZaSFELXDblP2ynUyMRLHy3sffAaD3
        +X42fzXdNbmTrj0/B7pomrE+V16Hu4dIhwD4D2M=
X-Google-Smtp-Source: APXvYqzfKqOvSJIEPElm1pWyU91oSt+UAToUSwzfhcnUqdq07YjSNh+po5u8xZMLJOi0lM/11guvf1dzZCIubdiGkoI=
X-Received: by 2002:a05:6102:757:: with SMTP id v23mr6280994vsg.215.1575563736733;
 Thu, 05 Dec 2019 08:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20191204225446.202981-1-dima@golovin.in> <CAKwvOdm-bhuJMRRN3tyNdb88+_TFd4m3b-7gX0-91VG4djzp+Q@mail.gmail.com>
 <23883331575506134@vla1-3991b5027d7d.qloud-c.yandex.net>
In-Reply-To: <23883331575506134@vla1-3991b5027d7d.qloud-c.yandex.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Dec 2019 01:35:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATA=OsFVY7D9T_5qCv=2MKc5o4wto8HCd=2qScDAyRrgg@mail.gmail.com>
Message-ID: <CAK7LNATA=OsFVY7D9T_5qCv=2MKc5o4wto8HCd=2qScDAyRrgg@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: kbuild: allow readelf executable to be specified
To:     Dmitry Golovin <dima@golovin.in>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Ross Burton <ross.burton@intel.com>,
        Chao Fan <fanc.fnst@cn.fujitsu.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "fenghua.yu@intel.com" <fenghua.yu@intel.com>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 5, 2019 at 9:41 AM Dmitry Golovin <dima@golovin.in> wrote:
>
> 05.12.2019, 01:18, "'Nick Desaulniers' via Clang Built Linux" <clang-built-linux@googlegroups.com>:
> >
> > Grepping the kernel sources for `READELF`, it looks like
> > arch/ia64/Makefile makes the same mistake. Would you mind fixing both
> > cases in the same patch (v2)? I'm also curious about it's use in
> > arch/ia64/scripts/unwcheck.py, and scripts/faddr2line. +ia64
> > maintainers and list.
> >
> > I think if you simply remove the assignment on line 17 of
> > arch/ia64/Makefile you should be fine.
>
> Perhaps something should be done to NM on line 16 of this file as well. Also
> found similar invocation of `objcopy` in arch/riscv/kernel/vdso/Makefile.
> I think IA64 and RISC-V changes should be made as separate commits.
>
> -- Dmitry

I am fine with either way.
I can take this patch, and also a one for IA64.

You can send a patch for arch/riscv/kernel/vdso/Makefile
to the riscv maintainer since it has no patch dependency.


-- 
Best Regards
Masahiro Yamada
