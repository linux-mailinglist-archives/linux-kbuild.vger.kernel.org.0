Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB863233E25
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jul 2020 06:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgGaERO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jul 2020 00:17:14 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51186 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgGaERO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jul 2020 00:17:14 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06V4GsBH006071;
        Fri, 31 Jul 2020 13:16:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06V4GsBH006071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596169015;
        bh=R1IrfvP9cuBPNOuEO/yY0TGNkg04pM5nMVUeGi+yTK8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RG9cV5YUeDYircoip5N+K9h2SxEtE9Y8oHHWV/qPJECi1kRphgYBVi/n1pvuOe0oR
         oYoYQ3F7gj4MJRsKkg2AXyMyR1va8Y8MaP+DPmSl2IsVFr28ogcU9g9aiQ8YSCSt1a
         b9/nSn7IrH/U+ZPRVBxt9oc9ZBcst8EgyXLkEkDtMfPLG8v9JjfrBSHwT/Svv/aq3k
         dFQH+k3VVrHKnVLRQTZWoj0sljhsLSJ0KbbmJ9oB3VDPDe4YYeEsoKS3SmkfpUMqEu
         j1YODArqV5lUy0RJYf6/ZCaRIZ3yjGcLdV8sYWmyYOdPWjR5+eyCAIzZyZbqkOBK15
         zfhZSu8SjjDZQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id j23so8859995vsq.7;
        Thu, 30 Jul 2020 21:16:55 -0700 (PDT)
X-Gm-Message-State: AOAM533DFgbexf8imQEbPsJTwdUaYfJihmp92040FAnq6A9h8JSGyh8k
        A40+JfjBlOtYRRsA9Hx2m0JfFyKYfKrnTDnJyoI=
X-Google-Smtp-Source: ABdhPJz+g9DAv5sd7YqE3RvXYJ01euot2DXSjrp71DbvIbsn55drU8dWkBhosZUpWoJaGkCWqiazywDaYVxaITNEqEE=
X-Received: by 2002:a67:de09:: with SMTP id q9mr1889244vsk.179.1596169014216;
 Thu, 30 Jul 2020 21:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200729031537.37926-1-masahiroy@kernel.org> <202007291401.A50E25BB@keescook>
In-Reply-To: <202007291401.A50E25BB@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 31 Jul 2020 13:16:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRoqNfO+JAj9kKRgi3ee5mcdV99spy4t6jKG1RGC4KXA@mail.gmail.com>
Message-ID: <CAK7LNASRoqNfO+JAj9kKRgi3ee5mcdV99spy4t6jKG1RGC4KXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: move shared library build rules to scripts/gcc-plugins/Makefile
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 30, 2020 at 6:18 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jul 29, 2020 at 12:15:36PM +0900, Masahiro Yamada wrote:
> > The shared library build rules are currently implemented in
> > scripts/Makefile.host, but actually GCC-plugin is the only user of
> > them. Hence, they do not need to be treewide available.
>
> Are none of the VDSOs intending to use these rules?


Right.

GCC plugin .so files are compiled for the _host_ architecture.
vDSO .so files are compiled for the _target_ architecture.

They are built in completely different ways.



> > Move all the relevant build rules to scripts/gcc-plugins/Makefile.
> >
> > I also optimized the build steps so *.so is directly built from .c
> > because every upstream plugin is compiled from a single source file.
> >
> > I am still keeping the infrastructure to build a plugin from multiple
> > files because Kees suggested to do so in my previous attempt.
> > (https://lkml.org/lkml/2019/1/11/1107)
> >
> > If the plugin, foo.so, is compiled from two files foo.c and foo2.c,
> > then you can do like follows:
> >
> >   foo-objs := foo.o foo2.o
> >
> > Single-file plugins do not need the *-objs notation.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> But, yeah, sure!
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> Unrelated, but I do note that objtool maybe has the wrong indentation,
> path name reporting, and tool names (HOSTLD vs CC)?


Right.
Many people know it.


objtool opts out the Kbuild instructure.

I wrote a patch to make objtool join the Kbuild:
https://patchwork.kernel.org/patch/10839051/

The objtool maintainers refused to do this.






> ...
>   HOSTCC  scripts/asn1_compiler
>   HOSTCC  scripts/extract-cert
>   HOSTCC  scripts/genksyms/genksyms.o
>   YACC    scripts/genksyms/parse.tab.[ch]
>   LEX     scripts/genksyms/lex.lex.c
>   DESCEND  objtool
>   HOSTCXX scripts/gcc-plugins/cyc_complexity_plugin.so
>   HOSTCXX scripts/gcc-plugins/latent_entropy_plugin.so
>   HOSTCXX scripts/gcc-plugins/structleak_plugin.so
>   GENSEED scripts/gcc-plugins/randomize_layout_seed.h
>   HOSTCXX scripts/gcc-plugins/stackleak_plugin.so
>   HOSTCC  scripts/genksyms/parse.tab.o
>   HOSTCC  scripts/genksyms/lex.lex.o
>   HOSTCC   /home/kees/src/linux-build/plugins/tools/objtool/fixdep.o
>   HOSTLD  arch/x86/tools/relocs
>   HOSTLD   /home/kees/src/linux-build/plugins/tools/objtool/fixdep-in.o
>   LINK     /home/kees/src/linux-build/plugins/tools/objtool/fixdep
>   CC       /home/kees/src/linux-build/plugins/tools/objtool/exec-cmd.o
>   CC       /home/kees/src/linux-build/plugins/tools/objtool/help.o
>   CC       /home/kees/src/linux-build/plugins/tools/objtool/weak.o
> ...
>
> --
> Kees Cook



--
Best Regards
Masahiro Yamada
