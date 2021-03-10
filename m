Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A919333C77
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 13:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhCJMSO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 07:18:14 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29588 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhCJMSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 07:18:05 -0500
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 12ACHoxE028941;
        Wed, 10 Mar 2021 21:17:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 12ACHoxE028941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615378671;
        bh=1uzRseWND95yPdttTTlSI8iqUuJQXLvWlCES5n3lIEg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nOeVSNqCgj4eBjEMeoHSVzmDuQU8atwOWT9cDz77R9xN5Ur7R3Z187TXIKlVZBztO
         88gyr1O1T8gN+S28Da9S1tUnAwHcTGOQ3iu85VtFuXjlZMGo2o2TnK7hfjxtcxAFlj
         DCOX9OE4UUe4hJHrS9BCAc1oMpucTKFGZjohYRxQ8HzF0L4paN+vuWB9JIMHAIK98Y
         pwoAo+U4XX8LygvBIfsLA3RNefAdbLovOpKqaVqkg7xl+5nk7nKZrLQj5Ghrzx+GHD
         aWWk+UPhVrrNcv8PU/PhvbgPqOvFkXV1r20pADVU+4PsD7yefBuFJhgrjk1Vs2FYLZ
         KtCmOfrdC3O2g==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso4879765pjb.4;
        Wed, 10 Mar 2021 04:17:50 -0800 (PST)
X-Gm-Message-State: AOAM533YaQrFzrwfEPc49s75AqOLnwRMygO62v078ZTgZCbDTiARKi/n
        CaIEteZQ9A14X6gun/zLKTjyovqnSH0NJ4XNEVk=
X-Google-Smtp-Source: ABdhPJzMkPmMW8O6bOX4zaHgWdNSG8cKICJI0tzuj1hM2k3Mtbcp/sgpCGkWKw+dV8k+oZ6SJssAesWQdjYkIzq3Fk0=
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr2134520pjb.87.1615378669828;
 Wed, 10 Mar 2021 04:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20210309162545.637647-1-masahiroy@kernel.org> <87f93105-926a-d81b-3226-c5147870d62a@kernel.org>
In-Reply-To: <87f93105-926a-d81b-3226-c5147870d62a@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 21:17:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV4umAMEEc2YAhrgnOJSDvXEUkyNSsmN-AyotZNATedw@mail.gmail.com>
Message-ID: <CAK7LNARV4umAMEEc2YAhrgnOJSDvXEUkyNSsmN-AyotZNATedw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dummy-tools: adjust to scripts/cc-version.sh
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 1:54 PM Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 09. 03. 21, 17:25, Masahiro Yamada wrote:
> > Commit aec6c60a01d3 ("kbuild: check the minimum compiler version in
> > Kconfig") changed how the script detects the compiler version.
> >
> > Get 'make CROSS_COMPILE=scripts/dummy-tools/' back working again.
> >
> > Fixes: aec6c60a01d3 ("kbuild: check the minimum compiler version in Kconfig")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Perhaps, Jiri may have already noticed this issue, and have a similar patch.
> > I just checked ML, but I did not find a patch to fix this.
>
> No, as I was making it work on 5.11 :).
>
> BTW there is one remaining issue I came across:
> config PAHOLE_HAS_SPLIT_BTF
>          def_bool $(success, test `$(PAHOLE) --version | sed -E
> 's/v([0-9]+)\.([0-9]+)/\1\2/'` -ge "119")


I think I said this somewhere, but
PAHOLE_HAS_SPLIT_BTF should be deleted.
Checking the pahole version in Kconfig is wrong, I believe.



>
> and in Makefile we see:
> PAHOLE          = pahole
>
> and not something like:
> PAHOLE          = $(CROSS_COMPILE)pahole

I do not think $(CROSS_COMPILE)pahole
makes sense.


As far as I test, pahole works
for fereing architecture objects too.
The DWARF format is identical
across architectures.



For example, for the following code:

$ cat test.c
struct sample {
     char a[2];
     long l;
     int i;
     void *p;
     short s;
} sample;


$ gcc -g -c -o test.o test.c; pahole test.o
$ arm-linux-gnueabihf-gcc -g -c -o test.o test.c; pahole test.o
$ aarch64-linux-gnu-gcc -g -c -o test.o test.c; pahole test.o

All worked for me.






> Any idea how to fix this?
>
> >   scripts/dummy-tools/gcc | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> > index 7b10332b23ba..39e65fee59bd 100755
> > --- a/scripts/dummy-tools/gcc
> > +++ b/scripts/dummy-tools/gcc
> > @@ -57,9 +57,9 @@ if arg_contain --version "$@"; then
> >   fi
> >
> >   if arg_contain -E "$@"; then
> > -     # For scripts/gcc-version.sh; This emulates GCC 20.0.0
> > +     # For scripts/cc-version.sh; This emulates GCC 20.0.0
> >       if arg_contain - "$@"; then
> > -             sed 's/^__GNUC__$/20/; s/^__GNUC_MINOR__$/0/; s/^__GNUC_PATCHLEVEL__$/0/'
> > +             sed -n '/^GCC/{s/__GNUC__/20/; s/__GNUC_MINOR__/0/; s/__GNUC_PATCHLEVEL__/0/; p;}'
> >               exit 0
> >       else
> >               echo "no input files" >&2
> >
>
>
> --
> js
> suse labs



--
Best Regards
Masahiro Yamada
