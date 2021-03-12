Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83A2339497
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 18:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbhCLRW5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 12:22:57 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37860 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbhCLRWj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 12:22:39 -0500
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 12CHM2UH021031;
        Sat, 13 Mar 2021 02:22:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 12CHM2UH021031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615569722;
        bh=llFwKeinnlXA5iQvaDCjMbod5YLYpTNOQlW9RZzbgQs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ir3LtooCCvXK9WWZNiaNrfm890qL8LKguxSdssnDLhOGNVCbcfsnoAga0Ud28EMUE
         oa5LBE6aNZjHImCakg6GGyrMpMGXzCKjBt3EFlqN233BIO7BkXlK+0uWvm7KcCnnSq
         AqT9LuRJ3E2Wk/XXzrGtuJsUX1DM3S7j67neCXiRJBJ6Aimn0ajEfdgCqhYSWUweBZ
         ldRCzNkZr05HxXTtcOtppd8zDymrIS6DZBg0+H58N+GmEd6hQZkAxm1yAkr/5N7txC
         mDwTToQEcgiUra18oeLU1svh70LKK9jICe46iwFoPuHIN0Vgdpavwf65CqhhRQyHJT
         l+fKHSI8CTBMQ==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id e26so2298829pfd.9;
        Fri, 12 Mar 2021 09:22:02 -0800 (PST)
X-Gm-Message-State: AOAM531pXhJ66X6+4hjbhqp+hFNTSOx9O/rm3yET12zTVLqGzfuubYKt
        I1mAVPq4zz0L4G62tKqKlT8+nN67/HrCCzwXHMI=
X-Google-Smtp-Source: ABdhPJxMUx0d25Z5dKenYyb4+sWCjWz8bX3LhYVC8n9fP4V6P7rtZYPxDmtZoG/5+uoETsUnBma0InR6vaMqZA4Y1Mw=
X-Received: by 2002:a65:428b:: with SMTP id j11mr12771256pgp.47.1615569721575;
 Fri, 12 Mar 2021 09:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-2-masahiroy@kernel.org>
 <20210304001141.7lejurony2poqkid@archlinux-ax161>
In-Reply-To: <20210304001141.7lejurony2poqkid@archlinux-ax161>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Mar 2021 02:21:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8K=QuU9oFeUcCaem7sbDOE34SgoDaJ49Gqy-7k_c3vA@mail.gmail.com>
Message-ID: <CAK7LNAQ8K=QuU9oFeUcCaem7sbDOE34SgoDaJ49Gqy-7k_c3vA@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: collect minimum tool versions into scripts/tool-version.sh
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 9:11 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Mar 04, 2021 at 03:33:31AM +0900, Masahiro Yamada wrote:
> > The kernel build uses various tools, many of which are provided by the
> > same software suite, for example, LLVM and Binutils.
> >
> > When we raise the minimal version of Clang/LLVM, we need to update
> > clang_min_version in scripts/cc-version.sh and also lld_min_version in
> > scripts/ld-version.sh.
> >
> > In fact, Kbuild can handle CC=clang and LD=ld.lld independently, and we
> > could manage their minimal version separately, but it does not make
> > much sense.
> >
> > Make scripts/tool-version.sh a central place of minimum tool versions
> > so that we do not need to touch multiple files.
> >
> > This script prints the minimal version of the given tool.
> >
> >   $ scripts/tool-version.sh gcc
> >   4.9.0
> >   $ scripts/tool-version.sh llvm
> >   10.0.1
> >   $ scripts/tool-version.sh binutils
> >   2.23.0
> >   $ scripts/tool-version.sh foo
> >   foo: unknown tool
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Two comments below.
>
> > ---
> >
> >  scripts/cc-version.sh   | 20 +++++---------------
> >  scripts/ld-version.sh   | 11 ++++-------
> >  scripts/tool-version.sh | 27 +++++++++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 22 deletions(-)
> >  create mode 100755 scripts/tool-version.sh
> >
> > diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> > index 3f2ee885b116..4772f1ef9cac 100755
> > --- a/scripts/cc-version.sh
> > +++ b/scripts/cc-version.sh
> > @@ -6,18 +6,6 @@
> >
> >  set -e
> >
> > -# When you raise the minimum compiler version, please update
> > -# Documentation/process/changes.rst as well.
> > -gcc_min_version=4.9.0
> > -clang_min_version=10.0.1
> > -icc_min_version=16.0.3 # temporary
> > -
> > -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> > -# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> > -if [ "$SRCARCH" = arm64 ]; then
> > -     gcc_min_version=5.1.0
> > -fi
> > -
> >  # Print the compiler name and some version components.
> >  get_compiler_info()
> >  {
> > @@ -48,18 +36,20 @@ set -- $(get_compiler_info "$@")
> >
> >  name=$1
> >
> > +tool_version=$(dirname $0)/tool-version.sh
>
> I realize these scripts are currently called by their full path but is
> it worth making this '$(dirname "$(readlink -f "$0")")' here and in
> ld-version.sh just in case that does not happen?
>
> >  case "$name" in
> >  GCC)
> >       version=$2.$3.$4
> > -     min_version=$gcc_min_version
> > +     min_version=$($tool_version gcc)
> >       ;;
> >  Clang)
> >       version=$2.$3.$4
> > -     min_version=$clang_min_version
> > +     min_version=$($tool_version llvm)
> >       ;;
> >  ICC)
> >       version=$(($2 / 100)).$(($2 % 100)).$3
> > -     min_version=$icc_min_version
> > +     min_version=$($tool_version icc)
> >       ;;
> >  *)
> >       echo "$orig_args: unknown compiler" >&2
> > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > index a463273509b5..e824f7675693 100755
> > --- a/scripts/ld-version.sh
> > +++ b/scripts/ld-version.sh
> > @@ -6,11 +6,6 @@
> >
> >  set -e
> >
> > -# When you raise the minimum linker version, please update
> > -# Documentation/process/changes.rst as well.
> > -bfd_min_version=2.23.0
> > -lld_min_version=10.0.1
> > -
> >  # Convert the version string x.y.z to a canonical 5 or 6-digit form.
> >  get_canonical_version()
> >  {
> > @@ -35,10 +30,12 @@ set -- $("$@" --version)
> >  IFS=' '
> >  set -- $1
> >
> > +tool_version=$(dirname $0)/tool-version.sh
> > +
> >  if [ "$1" = GNU -a "$2" = ld ]; then
> >       shift $(($# - 1))
> >       version=$1
> > -     min_version=$bfd_min_version
> > +     min_version=$($tool_version binutils)
> >       name=BFD
> >       disp_name="GNU ld"
> >  elif [ "$1" = GNU -a "$2" = gold ]; then
> > @@ -46,7 +43,7 @@ elif [ "$1" = GNU -a "$2" = gold ]; then
> >       exit 1
> >  elif [ "$1" = LLD ]; then
> >       version=$2
> > -     min_version=$lld_min_version
> > +     min_version=$($tool_version llvm)
> >       name=LLD
> >       disp_name=LLD
> >  else
> > diff --git a/scripts/tool-version.sh b/scripts/tool-version.sh
> > new file mode 100755
> > index 000000000000..b4aa27e2c3d3
> > --- /dev/null
> > +++ b/scripts/tool-version.sh
> > @@ -0,0 +1,27 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Print the minimum supported version of the given tool.
> > +
> > +set -e
> > +
> > +# When you raise the minimum version, please update
> > +# Documentation/process/changes.rst as well.
> > +gcc_min_version=4.9.0
> > +llvm_min_version=10.0.1
> > +icc_min_version=16.0.3 # temporary
> > +binutils_min_version=2.23.0
> > +
> > +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> > +# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> > +if [ "$SRCARCH" = arm64 ]; then
> > +     gcc_min_version=5.1.0
> > +fi
> > +
> > +eval min_version="\$${1}_min_version"
> > +if [ -z "$min_version" ]; then
> > +     echo "$1: unknown tool" >&2
> > +     exit 1
> > +fi
> > +
> > +echo "$min_version"
> > --
> > 2.27.0
> >
>
> Would scripts/tool-version.sh be easier to read and interpret using a
> case statement?
>
> #!/bin/sh
> # SPDX-License-Identifier: GPL-2.0-only
> #
> # Print the minimum supported version of the given tool.
> # When you raise the minimum version, please update
> # Documentation/process/changes.rst as well.
>
> case "$1" in
> binutils)
>     echo "2.23.0"
>     ;;
> gcc)
>     # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>     # https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>     if [ "$SRCARCH" = arm64 ]; then
>         echo "5.1.0"
>     else
>         echo "4.9.0"
>     fi
>     ;;
> icc)
>     # temporary
>     echo "16.0.3"
>     ;;
> llvm)
>     echo "10.0.1"
>     ;;
> *)
>     echo "$1: unknown tool" >&2
>     exit 1
>     ;;
> esac
>


After some more thoughts, I think
your suggestion is better.


My patch is fragile in case the user sets
an environment variable "foo_min_version".



-- 
Best Regards
Masahiro Yamada
