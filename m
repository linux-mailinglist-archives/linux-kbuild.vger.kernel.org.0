Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6628263662
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 15:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfGINFh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 09:05:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35087 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGINFh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 09:05:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id j19so1357838otq.2;
        Tue, 09 Jul 2019 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yDkyo3+Dccscyvat5dQl/nWwc7njks1SU13Nt8uYXo0=;
        b=o8XaIEF49l6zxZrsaDNS0SGe3todgaxAot82Gk0hQZPuV1NN593rmkTU2D70G/EML/
         1iKdYQ++3V2dQbxGTS3i/c9Evwcn/pomxfqzTeGohcIvN5ioEnNA7ZHuJh1IjJJAUgtE
         ikQCprLTBfRVEdxuEwPLOcbma6gdfYXADzMgd94LVo9i8Qc6c8XmnARY2E59rtmuUD7r
         lgrbOrmRKPEGnlHq4ELtKZ4QmYTdmUoGr/DGQxNnoAJoZK8ZwWjW/6XvpH+DugCOQ5+j
         a83tH79oQWxHzW0gHbqV8cf/01HwwJRRB2pqpw2dnITPNjx0stmQUM0KF/040d7QXw3U
         KRbg==
X-Gm-Message-State: APjAAAXRaZ5Nnakrohi8OeEjxQzEQPewvgvLOz2nnyfwMxyFXAiQI9TY
        igvEXULOGzsPVAhijktCHmZTkySPA2/U3VBq9LU=
X-Google-Smtp-Source: APXvYqyP+O1IKeQS6X70Kvdb/lw+/tB1Nqscmj4QYnEGi/QzjPO6yk3rZPwXvI0VCPvpsiH7TFqgYOfpRyk0aFz32Cg=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr1789780otc.250.1562677536141;
 Tue, 09 Jul 2019 06:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
 <CAMuHMdUH46_yvYc840uvMoOOqXuU3mDOjaT65vZ=6WKGq7-Kqg@mail.gmail.com>
 <CAK7LNASuEQqb7w8qD9ZKx-LKp0+CqvybEqFtYxVk5d0YJt-Nfg@mail.gmail.com>
 <CAMuHMdVmmgW24vStkicXfA3hokcPYWo_r5bW=WFRs4zdP3SQyQ@mail.gmail.com> <CAK7LNATxCkEZKWknO40k-sArbwxzOjdyQdehSmdCNYjLBb7MQA@mail.gmail.com>
In-Reply-To: <CAK7LNATxCkEZKWknO40k-sArbwxzOjdyQdehSmdCNYjLBb7MQA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 15:05:25 +0200
Message-ID: <CAMuHMdU7OY=FwWke6LqKtsMssN1ACJe15ODOp+tdkcZWoFaovw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check arch/$(SRCARCH)/include/generated before
 out-of-tree build
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Tue, Jul 9, 2019 at 2:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Tue, Jul 9, 2019 at 9:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 9, 2019 at 2:22 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > On Tue, Jul 9, 2019 at 5:31 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Sun, Apr 7, 2019 at 12:45 PM Masahiro Yamada
> > > > <yamada.masahiro@socionext.com> wrote:
> > > > > After cross-compiling the kernel, "make mrproper" should be executed
> > > > > with the proper ARCH= option. Otherwise, stale objects will remain
> > > > > under arch/$(SRCARCH)/.
> > > > >
> > > > > One bad scenario is like this:
> > > > >
> > > > >   $ make ARCH=arm defconfig all   # cross-compile the kernel for arm
> > > > >   $ make mrproper                 # mrproper for host-arch (i.e. x86)
> > > > >   $ make ARCH=arm O=build_dir defconfig all
> > > > >
> > > > > If you miss ARCH= for mrproper and cross-compile the kernel with O=
> > > > > and ARCH= options, Kbuild will happily start to build, but may fail
> > > > > due to stale objects in the srctree.
> > > > >
> > > > > If $(srctree)/arch/$(SRCARCH)/include/generated/ exists, let's stop
> > > > > the out-of-tree build. To detect this, mrproper should clean only
> > > > > arch/$(SRCARCH)/include/generated/.
> > > > >
> > > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > > ---
> > > > >
> > > > >  Makefile | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Makefile b/Makefile
> > > > > index 10643c3..17945ce 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -1091,7 +1091,9 @@ PHONY += prepare archprepare prepare1 prepare3
> > > > >  prepare3: include/config/kernel.release
> > > > >  ifneq ($(srctree),.)
> > > > >         @$(kecho) '  Using $(srctree) as source for kernel'
> > > > > -       $(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
> > > > > +       $(Q)if [ -f $(srctree)/.config -o \
> > > > > +                -d $(srctree)/include/config -o \
> > > > > +                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> > > > >                 echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
> > > > >                 echo >&2 "  in the '$(srctree)' directory.";\
> > > >
> > > > This took me a bit to find out what was wrong...
> > > >
> > > > Usually I don't run "make mrproper", as it removes files I may want to
> > > > keep (e.g. tags).  Hence I ran "git ls-files -o | grep m68k | xargs rm"
> > > > (I usually build in separate output directories), confirmed with "git
> > > > ls-files -o" there were no remaining build artefacts, and was surprised
> > > > to discover I still got the error message above?!?
> > > >
> > > > Apparently arch/m68k/include/generated was still present, but as "git
> > > > ls-files -o" only shows files, not directories, it was not listed.
> > > > Perhaps the directory checks above can be changed to directory exists
> > > > _and_ is not empty?
> > >
> > > No.
> > >
> > > Since you did not run mrproper,
> > > Kbuild _correctly_ showed error.
> > > This is the expected and correct behavior. :)
> > >
> > > The upstream kernel is not a place
> > > to be customized for your workflow. Sorry.
> > >
> > >
> > > Every developer has a set of handy custom commands.
> > >
> > > Since you are already running a long command,
> > > why don't you add one more line, and put in ~/.bash_aliases or somewhere?
> > >
> > > my_mrproper()
> > > {
> > >     git ls-files -o | grep m68k | xargs rm
> > >     rm -rf arch/m68k/include/generated
> > > }
> >
> > Please note this was not part of my standard workflow, so I don't have a
> > script for it.  I just happened to had done a quick test build in my
> > kernel source tree repository before, and had forgotten about that.
> >
> > So IMHO this is more of a usability issue: it is difficult to find out
> > what is wrong, and how to solve it, as "git ls-files -o" doesn't give a
> > clue.  And running "make mrproper" doesn't help.
> >
> > Perhaps the message should be changed to
> >
> >     $(srctree) is not clean, please run 'make ARCH=$(SRCARCH) mrproper'"
>
> Fair enough, but 'make ARCH=$(ARCH) mrproper' please.

OK.

> Will you send a patch?

Sure, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
