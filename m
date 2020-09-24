Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE42277582
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Sep 2020 17:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgIXPeo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Sep 2020 11:34:44 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32790 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbgIXPeo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Sep 2020 11:34:44 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 08OFYQLJ017212;
        Fri, 25 Sep 2020 00:34:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 08OFYQLJ017212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600961667;
        bh=8++tngXIYpSoFvOERHcAK2tucrHOFQ6aDKwQ9XkyMIY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IgcGkJxs6Jc3Q2xAmuE/XdLre5F5tY4Q990eUCze91ZcIrtuALUv+v0IVChKJFgV5
         5Q0jdf5lEaGnN0YzLKqSjTkXisAjI45q5TJpbx4r+ZFK061Jo1hl45ywvIUnOS+dc2
         L7bfvj5AgVy4hYAzZhDc7e9plPqT2yPJfMbt6RTlbN6Gza0I4IIhgciv7kEZK7kHPn
         +ySFS5RLnU4aGzAP+LCXqqvH8YBPSd9zPaYbSNeRxZ+3jqhywOzZJ+3NOZWu5G32Yo
         zkLdQ/ZANS5LZiDkAhLPyKY5RDlfuWmBvLGm4EeDjw3Wb8Z4sD7OI970PGKEW9ibhl
         cykRl/++BWuVQ==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id m15so1856833pls.8;
        Thu, 24 Sep 2020 08:34:27 -0700 (PDT)
X-Gm-Message-State: AOAM533hjJEPiGEf5nhWIbBvnW6B6aytGj4aYwxJmk0Z6fZ6u0xWizN+
        v0CFl1ACxarJcTbTCpgbd9M+aik4EeNQD6PbBes=
X-Google-Smtp-Source: ABdhPJweqgFrBZfOuGz2apTHkL9ybv71G+elcg8t+sB7qXNkjDjJXCwevQ4WrMjsrEgXlLXmJ8CwxU1fONonFFlbNlo=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr4365101pjb.198.1600961666135;
 Thu, 24 Sep 2020 08:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200922204323.GA244571@roeck-us.net>
In-Reply-To: <20200922204323.GA244571@roeck-us.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 25 Sep 2020 00:33:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATzjBC0SquV5iJhBO+aoPqeyYAikxiu5qZmEDm6k9ZdJQ@mail.gmail.com>
Message-ID: <CAK7LNATzjBC0SquV5iJhBO+aoPqeyYAikxiu5qZmEDm6k9ZdJQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: skip ppc compiler stub *.long_branch.*
 / *.plt_branch.*
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 23, 2020 at 5:43 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Sep 23, 2020 at 02:48:56AM +0900, Masahiro Yamada wrote:
> > PowerPC allmodconfig often fails to build as follows:
> >
> >     LD      .tmp_vmlinux.kallsyms1
> >     KSYM    .tmp_vmlinux.kallsyms1.o
> >     LD      .tmp_vmlinux.kallsyms2
> >     KSYM    .tmp_vmlinux.kallsyms2.o
> >     LD      .tmp_vmlinux.kallsyms3
> >     KSYM    .tmp_vmlinux.kallsyms3.o
> >     LD      vmlinux
> >     SORTTAB vmlinux
> >     SYSMAP  System.map
> >   Inconsistent kallsyms data
> >   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> >   make[2]: *** [../Makefile:1162: vmlinux] Error 1
> >
> > Setting KALLSYMS_EXTRA_PASS=1 does not help.
> >
> > This is caused by the compiler inserting stubs such as *.long_branch.*
> > and *.plt_branch.*
> >
> >   $ powerpc-linux-nm -n .tmp_vmlinux.kallsyms2
> >    [ snip ]
> >   c00000000210c000 T __init_begin
> >   c00000000210c000 T _sinittext
> >   c00000000210c010 t 00000075.plt_branch.da9:19
> >   c00000000210c020 t 00000075.plt_branch.1677:5
> >   c00000000210c030 t 00000075.long_branch.memmove
> >   c00000000210c034 t 00000075.plt_branch.9e0:5
> >   c00000000210c044 t 00000075.plt_branch.free_initrd_mem
> >     ...
> >
> > Actually, the problem mentioned in scripts/link-vmlinux.sh comments;
> > "In theory it's possible this results in even more stubs, but unlikely"
> > is happening here, and ends up with another kallsyms step required.
> >
> > scripts/kallsyms.c already ignores various compiler stubs. Let's do
> > similar to make kallsysms for PowerPC always succeed in 2 steps.
> >
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks,
> Guenter
>
> > ---
> >
> >  scripts/kallsyms.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 0096cd965332..306b9b38150f 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -120,17 +120,25 @@ static bool is_ignored_symbol(const char *name, char type)
> >               NULL
> >       };
> >
> > +     static const char * const ignored_matches[] = {
> > +             ".long_branch.",        /* ppc stub */
> > +             ".plt_branch.",         /* ppc stub */
> > +             NULL
> > +     };
> > +
> >       const char * const *p;
> >
> > -     /* Exclude symbols which vary between passes. */
> > +     /* ignore symbol names that exactly match to a particular string. */
> >       for (p = ignored_symbols; *p; p++)
> >               if (!strcmp(name, *p))
> >                       return true;
> >
> > +     /* ignore symbol names that start with a particular string. */
> >       for (p = ignored_prefixes; *p; p++)
> >               if (!strncmp(name, *p, strlen(*p)))
> >                       return true;
> >
> > +     /* ignore symbol names that end with a particular string. */
> >       for (p = ignored_suffixes; *p; p++) {
> >               int l = strlen(name) - strlen(*p);
> >
> > @@ -138,6 +146,12 @@ static bool is_ignored_symbol(const char *name, char type)
> >                       return true;
> >       }
> >
> > +     /* ignore symbol names that contain a particular string. */
> > +     for (p = ignored_matches; *p; p++) {
> > +             if (strstr(name, *p))
> > +                     return true;
> > +     }
> > +
> >       if (type == 'U' || type == 'u')
> >               return true;
> >       /* exclude debugging symbols */
> > --
> > 2.25.1
> >

Applied to linux-kbuild/fixes.



-- 
Best Regards
Masahiro Yamada
