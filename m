Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69AD2DFCC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 15:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgLUOYd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 09:24:33 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45843 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgLUOYd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 09:24:33 -0500
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BLENeiM009502;
        Mon, 21 Dec 2020 23:23:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BLENeiM009502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608560620;
        bh=1hRY++GCfLHpcZB+7KhM/wVvZL/yFccxiREnXS+ESIM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FBPd+h6Hgk48sIlUjqqs+s1+sX9C71WJ78Wx+zFrm29sKMNBDY78bqWsYFaDwg7eW
         11W8qZ4FG8H9vtqm95MI+Dc21jTx88dOmRRiLu+5Nc+s765Scq1i2JRqVQw7ETrrQh
         utx6teRvXlcT+26251WPXzZyoRXA0xRg81ldAXY55RmSOPLk1VQcMyQFzit6ia2HNF
         3H/W3fgJtgiiwfeJXyuW6RuXDgkMMC1g1124aewS3ywfEl8WEb/U5W0j/GOFV1f/iT
         6f1k3OeREU3TDqmVzcFi+RLnYCLELTpFNp3VB7ssnpY12Nly2Hv0FbKSspm0/GxF51
         BVKqrDWHWNhLA==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id s21so6507247pfu.13;
        Mon, 21 Dec 2020 06:23:40 -0800 (PST)
X-Gm-Message-State: AOAM530DJAyFfMEyy9zOV4fBTfLJLJs1GFikJdhN8PicCfcC2PpH40LB
        I1561WFrW18U4nhBMrAACRo14lc8m1YUx8Vk7F0=
X-Google-Smtp-Source: ABdhPJwH3sJkjhXcLjVUKaT5f0pHeEcFuFakTiIjXEF/m3XVDkT7YAaaIv/65ZFbXIV1M1qnIGv9AkVIGmuqGCzlcU0=
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr15496931pfl.80.1608560619529; Mon, 21
 Dec 2020 06:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20201212165431.150750-1-masahiroy@kernel.org> <20201212165431.150750-3-masahiroy@kernel.org>
 <20201212174828.GA17179@nautica>
In-Reply-To: <20201212174828.GA17179@nautica>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 23:23:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATOMnNDt5E8j1qkj=FELezZ551Amfz3i=eMiSUg0nygCg@mail.gmail.com>
Message-ID: <CAK7LNATOMnNDt5E8j1qkj=FELezZ551Amfz3i=eMiSUg0nygCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 13, 2020 at 2:48 AM Dominique Martinet
<asmadeus@codewreck.org> wrote:
>
> Masahiro Yamada wrote on Sun, Dec 13, 2020:
> > This script was written in awk in spite of the file extension '.sh'.
> > Rewrite it as a shell script.
>
> Wow! I wasn't expecting so much, would have sent some rework after the
> upcoming merge window.
> Thank you.
>
> Some comments below that you can probably ignore, this works for me.
>
>
> > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > index 0f8a2c0f9502..c214aeb3200d 100755
> > --- a/scripts/ld-version.sh
> > +++ b/scripts/ld-version.sh
> > @@ -1,11 +1,22 @@
> > -#!/usr/bin/awk -f
> > +#!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0
> > -# extract linker version number from stdin and turn into single number
> > -     {
> > -     gsub(".*\\)", "");
> > -     gsub(".*version ", "");
> > -     gsub("-.*", "");
> > -     split($1,a, ".");
> > -     print a[1]*10000 + a[2]*100 + a[3];
> > -     exit
> > -     }
> > +#
> > +# Usage: $ ./scripts/ld-version.sh ld
> > +#
> > +# Print the linker version of `ld' in a 5 or 6-digit form
> > +# such as `23501' for GNU ld 2.35.1 etc.
> > +
> > +first_line="$($* --version | head -n 1)"
>
> Just nitpicking: this ($*) would fail if the argument contains spaces,
> it's generally better to use "$@" or "$1" (with quotes)

This is just a copy-paste work based on scripts/lld-version.sh.

"$@" is better, I agree.




> Probably doesn't matter here as gcc/clang-version scripts have the same
> problem, so if someone had a problem with that they probably would have
> reported it there.

Talking about gcc/clang-version, "$1" is not acceptable because the first
word of the arguments may not be the compiler.

For example, when CC="ccache gcc" is passed in,
scripts/gcc-version.sh  ccache  gcc
must return the gcc version.




Difference between "$@" and "$*" matters only
when it is directly passed to some command.


masahiro@grover:~$ set  "a   b"  c  d
masahiro@grover:~$ ls  "$*"
ls: cannot access 'a   b c d': No such file or directory
masahiro@grover:~$ ls  "$@"
ls: cannot access 'a   b': No such file or directory
ls: cannot access 'c': No such file or directory
ls: cannot access 'd': No such file or directory


"$*" was expanded into a single string, 'a   b c d'.
It forgot which spaces were the part of the argument,
and which spaces were argument delimiters.

In contrast, "$@" was expanded into three arguments,
'a   b', 'c', and 'd'.
It correctly preserved the original arguments.



Let me continue some more experiments...


masahiro@grover:~$ set  "a   b"  c  d
masahiro@grover:~$ compiler="$*"
masahiro@grover:~$ ls "$compiler"
ls: cannot access 'a   b c d': No such file or directory
masahiro@grover:~$ ls $compiler
ls: cannot access 'a': No such file or directory
ls: cannot access 'b': No such file or directory
ls: cannot access 'c': No such file or directory
ls: cannot access 'd': No such file or directory



masahiro@grover:~$ set  "a   b"  c  d
masahiro@grover:~$ compiler="$@"
masahiro@grover:~$ ls "$compiler"
ls: cannot access 'a   b c d': No such file or directory
masahiro@grover:~$ ls $compiler
ls: cannot access 'a': No such file or directory
ls: cannot access 'b': No such file or directory
ls: cannot access 'c': No such file or directory
ls: cannot access 'd': No such file or directory


The result is the same.
So, whichever we use, after it is assigned to the variable "compiler",
it forgets the origin of the spaces.


If we really want to preserve the passed arguments,
we need to use "$@" directly in scripts/gcc-version.sh
like this:

MAJOR=$(echo __GNUC__ | "$@" -E -x c - | tail -n 1)

If we do this,

  scripts/gcc-version.sh  ccache gcc

will succeed, and

  scripts/gcc-version.sh  "ccache gcc"

will fail.




> > +
> > +if ! ( echo $first_line | grep -q "GNU ld"); then
> > +     echo 0
> > +     exit 1
> > +fi
> > +
> > +# Distributions may append an extra string like 2.35-15.fc33
> > +# Take the part that consists of numbers and dots.
> > +VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1/')
> > +MAJOR=$(echo $VERSION | cut -d . -f 1)
> > +MINOR=$(echo $VERSION | cut -d . -f 2)
> > +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> > +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
>
> There is a bug if there is no dot at all (e.g. if binutils ever releases
> a version 3 and call it version 3 and not 3.0, the script would print
> 30303 because cut when no delimiter is found always returns the whole
> string)
> This can be fixed by artificially appending a dot to VERSION:
> VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1./')
>
> I'm not sure it's worth worrying about either.

Ah, good catch.



--
Best Regards
Masahiro Yamada
