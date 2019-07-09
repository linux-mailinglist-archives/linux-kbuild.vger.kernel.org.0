Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABAC76361D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 14:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfGIMpF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 08:45:05 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39141 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfGIMpF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 08:45:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id r21so4319467otq.6;
        Tue, 09 Jul 2019 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3SJLHa0QaBvqcRDd1S8n2545S3PIjUttJK3XHvIBbo=;
        b=ic+zZAw5K6Z6i7Oi13yfgZLjrjq6LcGLwok89yIdKI7HDYc4+8sLXHMKOvBFY5maPk
         vUnu2ypikMaOc90aaoJ4FT/w/txjLLd5WqJsdy/L7T836cSOwTSw2I/kb3CFGYaTuqZX
         MJUho9mgD9yJFkkYEmkeMAJsXQmpJ2a2pHujxWhRHZtHtiGIZ6juRt6bCOzNvT+iRbUu
         zAtHRRqwSzFE2lw5UMXRSI2c41j9msO2o+O58gKI3LZK3p5aasw9/q+JUdjDrBWTSEcP
         N2hbfRTp71cf8JOz4Ls6eiyquNh/b4SFYbqSsnQa7YoloExOitXGk02vFzVDobip6v/o
         4Hjw==
X-Gm-Message-State: APjAAAU13CGEUi53ctnp+qogKJZMJMEbfsCTyLPQIe+zXzHNtIBADkza
        XE0vBcKInKKwLttM9zCkcgbbI5CVkgEK4oQ5sT0=
X-Google-Smtp-Source: APXvYqzSvNdQu/tZ7D58EU1NScOy26xYDrz419I/q9nngx9aEe3FyCQAPS3FRZZhwJ1tIrqKV7xxD7EnjwL3hdRbPv4=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr1717391otc.250.1562676304654;
 Tue, 09 Jul 2019 05:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
 <CAMuHMdUH46_yvYc840uvMoOOqXuU3mDOjaT65vZ=6WKGq7-Kqg@mail.gmail.com> <CAK7LNASuEQqb7w8qD9ZKx-LKp0+CqvybEqFtYxVk5d0YJt-Nfg@mail.gmail.com>
In-Reply-To: <CAK7LNASuEQqb7w8qD9ZKx-LKp0+CqvybEqFtYxVk5d0YJt-Nfg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 14:44:53 +0200
Message-ID: <CAMuHMdVmmgW24vStkicXfA3hokcPYWo_r5bW=WFRs4zdP3SQyQ@mail.gmail.com>
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

On Tue, Jul 9, 2019 at 2:22 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Tue, Jul 9, 2019 at 5:31 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Apr 7, 2019 at 12:45 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > After cross-compiling the kernel, "make mrproper" should be executed
> > > with the proper ARCH= option. Otherwise, stale objects will remain
> > > under arch/$(SRCARCH)/.
> > >
> > > One bad scenario is like this:
> > >
> > >   $ make ARCH=arm defconfig all   # cross-compile the kernel for arm
> > >   $ make mrproper                 # mrproper for host-arch (i.e. x86)
> > >   $ make ARCH=arm O=build_dir defconfig all
> > >
> > > If you miss ARCH= for mrproper and cross-compile the kernel with O=
> > > and ARCH= options, Kbuild will happily start to build, but may fail
> > > due to stale objects in the srctree.
> > >
> > > If $(srctree)/arch/$(SRCARCH)/include/generated/ exists, let's stop
> > > the out-of-tree build. To detect this, mrproper should clean only
> > > arch/$(SRCARCH)/include/generated/.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > >  Makefile | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 10643c3..17945ce 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1091,7 +1091,9 @@ PHONY += prepare archprepare prepare1 prepare3
> > >  prepare3: include/config/kernel.release
> > >  ifneq ($(srctree),.)
> > >         @$(kecho) '  Using $(srctree) as source for kernel'
> > > -       $(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
> > > +       $(Q)if [ -f $(srctree)/.config -o \
> > > +                -d $(srctree)/include/config -o \
> > > +                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> > >                 echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
> > >                 echo >&2 "  in the '$(srctree)' directory.";\
> >
> > This took me a bit to find out what was wrong...
> >
> > Usually I don't run "make mrproper", as it removes files I may want to
> > keep (e.g. tags).  Hence I ran "git ls-files -o | grep m68k | xargs rm"
> > (I usually build in separate output directories), confirmed with "git
> > ls-files -o" there were no remaining build artefacts, and was surprised
> > to discover I still got the error message above?!?
> >
> > Apparently arch/m68k/include/generated was still present, but as "git
> > ls-files -o" only shows files, not directories, it was not listed.
> > Perhaps the directory checks above can be changed to directory exists
> > _and_ is not empty?
>
> No.
>
> Since you did not run mrproper,
> Kbuild _correctly_ showed error.
> This is the expected and correct behavior. :)
>
> The upstream kernel is not a place
> to be customized for your workflow. Sorry.
>
>
> Every developer has a set of handy custom commands.
>
> Since you are already running a long command,
> why don't you add one more line, and put in ~/.bash_aliases or somewhere?
>
> my_mrproper()
> {
>     git ls-files -o | grep m68k | xargs rm
>     rm -rf arch/m68k/include/generated
> }

Please note this was not part of my standard workflow, so I don't have a
script for it.  I just happened to had done a quick test build in my
kernel source tree repository before, and had forgotten about that.

So IMHO this is more of a usability issue: it is difficult to find out
what is wrong, and how to solve it, as "git ls-files -o" doesn't give a
clue.  And running "make mrproper" doesn't help.

Perhaps the message should be changed to

    $(srctree) is not clean, please run 'make ARCH=$(SRCARCH) mrproper'"

instead?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
