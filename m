Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F23863587
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 14:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfGIMW0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 08:22:26 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:61707 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIMW0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 08:22:26 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x69CMKZC012244;
        Tue, 9 Jul 2019 21:22:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x69CMKZC012244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562674941;
        bh=s/dMvs8eRlfbHNunWA9MxkzWSv0qolGiWLffGStjx7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CYNSEga2nPu7THXvvpTuVPXOOJoOMk05l1RBRFckfq2v/3iHSyzgRsxYoAjxbQh7B
         2FcnSK3sjQ+VcRTNka7Ym14BuAyIEz3BFxEnHJOumUwFD2AyW/nzSVi7TktzBdY1Tf
         uGXIP78m59Dfp8DjT+DVWy75kw8QAbDsPXqM4RkkrqY1VCnWL0V9TsAOQs28Vg73k8
         sjUFkwq/wfDyXemd2KIv85jtFAi3nHPjV8REFuoRxikAyjWJU21r0cTefEXyG9u8Z/
         t2KhrTCsyZ11a2GEuTbf8thuPBrsdzeQTEdzxDBKrc7vrO7/hXxXp93ZJEntirJRLX
         seexPIfAVjzbA==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id o19so6307709uap.13;
        Tue, 09 Jul 2019 05:22:21 -0700 (PDT)
X-Gm-Message-State: APjAAAWDgqT9HP5UzWqtlY5NN2B/XTPsB+vkBL2j6eJY36mK8tXcxwe9
        xlctIr3+dkqNSgyx7vXaeG46iZDt6swILHpOKXM=
X-Google-Smtp-Source: APXvYqwzOwXe4sIRylbKVb28bYAtmrOPXWkHFX1As+qU0ivcxqCVk9Sz0a5C15GRIF17CJFW4MC7xgvYUxVf10f9jto=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr12782778ual.109.1562674940309;
 Tue, 09 Jul 2019 05:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com> <CAMuHMdUH46_yvYc840uvMoOOqXuU3mDOjaT65vZ=6WKGq7-Kqg@mail.gmail.com>
In-Reply-To: <CAMuHMdUH46_yvYc840uvMoOOqXuU3mDOjaT65vZ=6WKGq7-Kqg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 9 Jul 2019 21:21:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASuEQqb7w8qD9ZKx-LKp0+CqvybEqFtYxVk5d0YJt-Nfg@mail.gmail.com>
Message-ID: <CAK7LNASuEQqb7w8qD9ZKx-LKp0+CqvybEqFtYxVk5d0YJt-Nfg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check arch/$(SRCARCH)/include/generated before
 out-of-tree build
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Geert,

On Tue, Jul 9, 2019 at 5:31 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Sun, Apr 7, 2019 at 12:45 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > After cross-compiling the kernel, "make mrproper" should be executed
> > with the proper ARCH= option. Otherwise, stale objects will remain
> > under arch/$(SRCARCH)/.
> >
> > One bad scenario is like this:
> >
> >   $ make ARCH=arm defconfig all   # cross-compile the kernel for arm
> >   $ make mrproper                 # mrproper for host-arch (i.e. x86)
> >   $ make ARCH=arm O=build_dir defconfig all
> >
> > If you miss ARCH= for mrproper and cross-compile the kernel with O=
> > and ARCH= options, Kbuild will happily start to build, but may fail
> > due to stale objects in the srctree.
> >
> > If $(srctree)/arch/$(SRCARCH)/include/generated/ exists, let's stop
> > the out-of-tree build. To detect this, mrproper should clean only
> > arch/$(SRCARCH)/include/generated/.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 10643c3..17945ce 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1091,7 +1091,9 @@ PHONY += prepare archprepare prepare1 prepare3
> >  prepare3: include/config/kernel.release
> >  ifneq ($(srctree),.)
> >         @$(kecho) '  Using $(srctree) as source for kernel'
> > -       $(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
> > +       $(Q)if [ -f $(srctree)/.config -o \
> > +                -d $(srctree)/include/config -o \
> > +                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> >                 echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
> >                 echo >&2 "  in the '$(srctree)' directory.";\
>
> This took me a bit to find out what was wrong...
>
> Usually I don't run "make mrproper", as it removes files I may want to
> keep (e.g. tags).  Hence I ran "git ls-files -o | grep m68k | xargs rm"
> (I usually build in separate output directories), confirmed with "git
> ls-files -o" there were no remaining build artefacts, and was surprised
> to discover I still got the error message above?!?
>
> Apparently arch/m68k/include/generated was still present, but as "git
> ls-files -o" only shows files, not directories, it was not listed.
> Perhaps the directory checks above can be changed to directory exists
> _and_ is not empty?

No.

Since you did not run mrproper,
Kbuild _correctly_ showed error.
This is the expected and correct behavior. :)

The upstream kernel is not a place
to be customized for your workflow. Sorry.


Every developer has a set of handy custom commands.

Since you are already running a long command,
why don't you add one more line, and put in ~/.bash_aliases or somewhere?

my_mrproper()
{
    git ls-files -o | grep m68k | xargs rm
    rm -rf arch/m68k/include/generated
}


-- 
Best Regards
Masahiro Yamada
