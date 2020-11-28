Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB02D2C7091
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 19:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgK1SB1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 13:01:27 -0500
Received: from condef-03.nifty.com ([202.248.20.68]:64201 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731434AbgK1R7A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:59:00 -0500
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-03.nifty.com with ESMTP id 0AS8xqdU021620;
        Sat, 28 Nov 2020 17:59:52 +0900
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0AS8xLoe018866;
        Sat, 28 Nov 2020 17:59:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0AS8xLoe018866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606553962;
        bh=or6FxwVXVxFfpEj0Luv2tuaXUJ8opms2IiV1/HsXt4Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E1q4cXva+bpjcpXaGWr/OYFuWMwx3Muw4MmMlRE6Fnee1RkJfpqv+S2ZL1FF3q40P
         bEZmbZSFm7QzTk2n3d0q+pmwUz7dOBQK5emi5mbTHyBHgq/qhSOU7nM619QbJQRJD2
         08o51c0wnBZvihLjs/Pd796uuingNQOsW2iVC3nznz1XPvzpGr+M89i56LMOW+hbAV
         SX16teJuWJ5PO0zA1ueyeox1WPoSLSf8npEAbrEvDtGf1hF06FiQkars0VpObLo3jK
         dn6iyLf17BaI7wpUA/aqOrKNf5YF00ODPtFBzX611fbuLwQEMz56TXwP7WRq1IB/gI
         xDyp4DAcUju7g==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id l1so3797343pld.5;
        Sat, 28 Nov 2020 00:59:22 -0800 (PST)
X-Gm-Message-State: AOAM532PurvpjODr1FI84ooeO98AMyGqyX8/StNgJAyYaw2maXXqyxGP
        iuVlsCl56YqieXamhDFwiBxH43vtZQTAHV7mYew=
X-Google-Smtp-Source: ABdhPJxbnwIMJTDwx2bWyNRpOBFKGe9eQNQzIODbAeFQBj+lYRE8I6BoP3iqkFQ0IWRo1eGmws1ENWXYSf53uKM0knI=
X-Received: by 2002:a17:902:868b:b029:da:3f2f:6c4d with SMTP id
 g11-20020a170902868bb02900da3f2f6c4dmr9979556plo.47.1606553961310; Sat, 28
 Nov 2020 00:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20201123045403.63402-1-masahiroy@kernel.org> <20201123045403.63402-7-masahiroy@kernel.org>
 <5c40293a-a24a-2c85-e7ef-a08a8c732d19@infradead.org>
In-Reply-To: <5c40293a-a24a-2c85-e7ef-a08a8c732d19@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Nov 2020 17:58:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZKsfyj9K_QxLoHZkSpfHvUHwgm5pwq=DJUnMCdczjPw@mail.gmail.com>
Message-ID: <CAK7LNASZKsfyj9K_QxLoHZkSpfHvUHwgm5pwq=DJUnMCdczjPw@mail.gmail.com>
Subject: Re: [PATCH 7/7] kbuild: doc: document subdir-y syntax
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 3:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/22/20 8:54 PM, Masahiro Yamada wrote:
> > There is no explanation about subdir-y.
> >
> > Let's document it.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> > index 159e470f2616..6332b9ca7942 100644
> > --- a/Documentation/kbuild/makefiles.rst
> > +++ b/Documentation/kbuild/makefiles.rst
> > @@ -319,6 +319,20 @@ more details, with real examples.
> >       that directory specifies obj-y, those objects will be left orphan.
> >       It is very likely a bug of the Makefile or of dependencies in Kconfig.
> >
> > +     Kbuild also supports dedicated syntax, subdir-y and subdir-m, for
> > +     descending into subdirectories. It is a good fit when you know they
> > +     do not contain kernel-space objects at all. A typical usage is to let
> > +     Kbuild descend into subdirectories to build tools.
> > +
> > +     Examples::
> > +
> > +             subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
> > +             subdir-$(CONFIG_MODVERSIONS) += genksyms
> > +             subdir-$(CONFIG_SECURITY_SELINUX) += selinux
> > +
> > +     Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
> > +     syntax is always used for directories.
> > +
>
> Just curious:  Is a trailing slash allowed here?  say for consistency?


If you use a trailing slash for the subdir-y syntax,
it will still work.


Only the problem I see is that the build log will look clumsy
due to the double slashes "//".





For example, if you change scripts/Makefile as follows:


diff --git a/scripts/Makefile b/scripts/Makefile
index b5418ec587fb..554534449877 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -32,9 +32,9 @@ hostprogs += unifdef
 # The module linker script is preprocessed on demand
 targets += module.lds

-subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
-subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins/
+subdir-$(CONFIG_MODVERSIONS) += genksyms/
+subdir-$(CONFIG_SECURITY_SELINUX) += selinux/

 # Let clean descend into subdirs
 subdir-        += basic dtc gdb kconfig mod




The build log will look like follows:


masahiro@grover:~/workspace/linux$ make allmodconfig; make scripts
#
# configuration written to .config
#
  SYNC    include/config/auto.conf
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTCXX scripts/gcc-plugins//latent_entropy_plugin.so
  GENSEED scripts/gcc-plugins//randomize_layout_seed.h
  HOSTCXX scripts/gcc-plugins//randomize_layout_plugin.so
  HOSTCXX scripts/gcc-plugins//stackleak_plugin.so
  HOSTCC  scripts/genksyms//genksyms.o
  YACC    scripts/genksyms//parse.tab.[ch]
  HOSTCC  scripts/genksyms//parse.tab.o
  LEX     scripts/genksyms//lex.lex.c
  HOSTCC  scripts/genksyms//lex.lex.o
  HOSTLD  scripts/genksyms//genksyms
  HOSTCC  scripts/selinux//genheaders/genheaders
  HOSTCC  scripts/selinux//mdp/mdp
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/extract-cert
  HOSTCC  scripts/bin2c
  HOSTCC  scripts/recordmcount
  HOSTCC  scripts/sign-file
  HOSTCC  scripts/insert-sys-cert




I can fix Kbuild to avoid "//", but I do not want to support two ways.

So, I'd recommend not to add the trailing slash to subdir-y.





For the others, thank you for pointing out my typos.




>
> >       It is good practice to use a `CONFIG_` variable when assigning directory
> >       names. This allows kbuild to totally skip the directory if the
> >       corresponding `CONFIG_` option is neither 'y' nor 'm'.
> >
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> thanks.
>
> --
> ~Randy



--
Best Regards
Masahiro Yamada
