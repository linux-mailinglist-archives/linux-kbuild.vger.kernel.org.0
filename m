Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F68CF8F40
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2019 13:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfKLMH1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Nov 2019 07:07:27 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27009 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfKLMH1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Nov 2019 07:07:27 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id xACC6vMN010836;
        Tue, 12 Nov 2019 21:06:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xACC6vMN010836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573560418;
        bh=Sgqs5/I3zJLWaBRJGnQJMZjSMC0UNfDF+eV/0rJAwU0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PvG8uwgP2kQTVuBQk2kzxi2TDqds7N52zFu4NUW55dePkn2U3DyJ3dnvwZP28NF9r
         6Fd+bid9vMKeORqvP6B/kyQh4ulOJKbukGUzqqkEzWvWj1hTgRYvp0x1ymem1MyP6W
         JC0npXimCoWWnF8/lEyOjtXtaGb0zP5FwJYoxgB+On9JAV0ClkTul7usUJPAAUHmDM
         J6wEOrS2AOPZLPxEIXcQ5rzLG3fdrsTSeLlyNXPA4+ce/8aLhLb7BNMOjcxgzOxItD
         a+Shc2VBRwvBsN77DaASxY/A+/XKKWOpbi3P13W7PeVMVD3K7pBdqc+PDuHcx33htI
         4NlsdRuSB/P1A==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id u99so4619719uau.5;
        Tue, 12 Nov 2019 04:06:57 -0800 (PST)
X-Gm-Message-State: APjAAAXVqpRFic+pHvzjUJh6K040QUy80Ge4lM0A3ZmyqLzXOyAuEiLP
        TLz9mgHBMuELKNvNssLqpUoy6NgOy0nUOmMLzCg=
X-Google-Smtp-Source: APXvYqxvFq5FgSgnUVNLyeoqfHZziPLTY9nkt64faSHe5hVF5nFrk880h1LTgcUSxKS6qI4PoU80uumy9ITmkIObu5k=
X-Received: by 2002:a9f:3e81:: with SMTP id x1mr3415007uai.121.1573560416440;
 Tue, 12 Nov 2019 04:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20191111011106.18427-1-linux@roeck-us.net> <20191110.173203.1243596361382467520.davem@davemloft.net>
 <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com> <591a9e5e-1347-8883-c080-38940fffd535@roeck-us.net>
In-Reply-To: <591a9e5e-1347-8883-c080-38940fffd535@roeck-us.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 12 Nov 2019 21:06:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASY209k5g61=+cbRgjNp8=1QGcP6c2RcCBad7NnfUhHHQ@mail.gmail.com>
Message-ID: <CAK7LNASY209k5g61=+cbRgjNp8=1QGcP6c2RcCBad7NnfUhHHQ@mail.gmail.com>
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     David Miller <davem@davemloft.net>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 11, 2019 at 11:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/10/19 5:47 PM, Masahiro Yamada wrote:
> > On Mon, Nov 11, 2019 at 10:32 AM David Miller <davem@davemloft.net> wrote:
> >>
> >> From: Guenter Roeck <linux@roeck-us.net>
> >> Date: Sun, 10 Nov 2019 17:11:06 -0800
> >>
> >>> sparc64:allmodconfig fails to build with the following error.
> >>>
> >>> unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> >>> arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> >>> make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> >>> make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> >>> make[2]: *** Waiting for unfinished jobs....
> >>>
> >>> The problem bisects to commit a3de7a72c517 ("kbuild: change
> >>> *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> >>> Duplicate the x86 specific defines from this commit to the sparc
> >>> vdso Makefile to fix the problem.
> >>>
> >>> Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> >>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> Cc: Marc Zyngier <maz@kernel.org>
> >>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>
> >> Acked-by: David S. Miller <davem@davemloft.net>
> >
> >
> > Yeah, I had submitted a fix a long time before.
> >
> > https://lore.kernel.org/patchwork/patch/1130469/
> >
> > I do not know why it was not picked up.
> >
>
> Why don't you just push it upstream yourself ?
>
> >
> > It is OK whether any patch is picked up
> > as long as the build error is fixed.
> >
> Same here.
>
> >
> > (I think  CFLAGS_REMOVE_vdso32/vdso-note.o
> > should be added too, though)
> >
> Hard to decide for someone not involved in vdso development.
> It wasn't added for x86, and it compiles without, so I rather
> left it alone.


After looking at the code closer,
I believe your code is more correct.

vdso-note is assembly instead of C.

arch/sparc/vdso/vdso-note.S
arch/sparc/vdso/vdso32/vdso-note.S



The -pg flag is added by the top Makefile,
only for C files.


CFLAGS_REMOVE_vdso-note.o = -pg
was unneeded in the first place.



BTW, I just thought this patch
was supposed to be applied by Dave
since it is touching a single file in arch/sparc/.

If Dave plans to pick up this, please feel free to add:

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


If I should apply this to kbuild tree, please let me know.



-- 
Best Regards
Masahiro Yamada
