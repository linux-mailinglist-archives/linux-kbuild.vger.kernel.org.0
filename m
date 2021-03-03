Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AFA32C1F8
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387615AbhCCTcC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:32:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377230AbhCCRps (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 12:45:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93FEE64EE6;
        Wed,  3 Mar 2021 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614793506;
        bh=zELkp4DNAyIEUoFE4261Eb7wL5eM9wd3KWyAjMTI7Fk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pq1cz/L2XCYD5sM/udKF6bFLhojr3pj13Z3dPvZZPmAgWj1LxbwPHz65/cietlKcI
         wvIAAs5pjg7LTLXlgJahe/QN184yR/sico+FXt/MvaUvEESNKrNKAEJEaj00i5H3Ct
         RaklB+Fbl2F4XLlHhal4n0+XrZBTNyp4ANHJT4cHNeYxWT2gQZHZHprD9pVxcr6xDj
         wh6v7vi/uW99PjtGRg6QKdUjgPz9sk3RSJs3QVJ0cd2QVkDT2uTewUuA5mRCLwm+7x
         oJfhsU6stOqpnzcU8tT1jfXbR8h7hD8l7cpYt1dS0y9IGhpBdSC2N8Vd3IL8h2dy5b
         pc8/I53jBAPyw==
Date:   Wed, 3 Mar 2021 10:45:01 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
Message-ID: <20210303174501.x7dwsgdzhrbqubz5@archlinux-ax161>
References: <20210302221211.1620858-1-bero@lindev.ch>
 <20210303040237.tvwo34j322tzqnwz@archlinux-ax161>
 <CAK7LNAQ8zvEv50HgD4HOzjMBYB7UAHggTsQ7OwoGgktXSDjzYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ8zvEv50HgD4HOzjMBYB7UAHggTsQ7OwoGgktXSDjzYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 03, 2021 at 08:38:06PM +0900, Masahiro Yamada wrote:
> On Wed, Mar 3, 2021 at 1:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Bernhard,
> >
> > I have added the ClangBuiltLinux mailing list, kbuild mailing list, and
> > Masahiro and Nick to CC. Maybe ld-version.sh and cc-version.sh should be
> > added to a MAINTAINERS entry to make sure we get CC'd (I can send one
> > along tomorrow).
> >
> > On Tue, Mar 02, 2021 at 11:12:11PM +0100, Bernhard Rosenkränzer wrote:
> > > If LLD was built with -DLLD_VENDOR="xyz", ld.lld --version output
> > > will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> > > LLD identifier isn't guaranteed to be $2 either.
> >
> > TIL about LLD_VENDOR...
> >
> > > Adjust the version checker to handle such versions of lld.
> > >
> > > Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
> > > ---
> > >  scripts/ld-version.sh | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > > index a463273509b5..4c042a306e22 100755
> > > --- a/scripts/ld-version.sh
> > > +++ b/scripts/ld-version.sh
> > > @@ -49,6 +49,18 @@ elif [ "$1" = LLD ]; then
> > >       min_version=$lld_min_version
> > >       name=LLD
> > >       disp_name=LLD
> > > +elif echo "$@" |grep -q ' LLD '; then
> > > +     # if LLD was built with -DLLD_VENDOR="xyz", it ld.lld --version
> > > +     # says "xyz LLD [...]". Since LLD_VENDOR may contain spaces, we
> > > +     # don't know the exact position of "LLD" and the version info
> > > +     # at this point
> > > +     while [ "$1" != "LLD" ]; do
> > > +             shift
> > > +     done
> > > +     version=$2
> > > +     min_version=$lld_min_version
> > > +     name=LLD
> > > +     disp_name=LLD
> > >  else
> > >       echo "$orig_args: unknown linker" >&2
> > >       exit 1
> > > --
> > > 2.30.1
> > >
> >
> > I am not sure what a better fix would be of the top of my head but
> > wouldn't it be better to avoid the duplication? This diff below works
> > for me with or without LLD_VENDOR defined.
> >
> > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > index a463273509b5..84f9fc741f09 100755
> > --- a/scripts/ld-version.sh
> > +++ b/scripts/ld-version.sh
> > @@ -44,7 +44,10 @@ if [ "$1" = GNU -a "$2" = ld ]; then
> >  elif [ "$1" = GNU -a "$2" = gold ]; then
> >         echo "gold linker is not supported as it is not capable of linking the kernel proper." >&2
> >         exit 1
> > -elif [ "$1" = LLD ]; then
> > +elif echo "$*" | grep -q LLD; then
> > +       while [ "$1" != "LLD" ]; do
> > +               shift
> > +       done
> >         version=$2
> >         min_version=$lld_min_version
> >         name=LLD
> 
> 
> 
> You do not need to use grep.
> How about this?
> 
> 
> 
> 
>         ...
> else
>         while [ $# -gt 1 -a "$1" != "LLD" ]; do
>                shift
>         done
> 
>         if [ "$1" = LLD ]; then
>                 version=$2
>                 min_version=$lld_min_version
>                 name=LLD
>                 disp_name=LLD
>         else
>                 echo "$orig_args: unknown linker" >&2
>                 exit 1
>         fi
> fi
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

Yes, that as the following diff works for me.

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a463273509b5..30debf78aa09 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -44,14 +44,20 @@ if [ "$1" = GNU -a "$2" = ld ]; then
 elif [ "$1" = GNU -a "$2" = gold ]; then
 	echo "gold linker is not supported as it is not capable of linking the kernel proper." >&2
 	exit 1
-elif [ "$1" = LLD ]; then
-	version=$2
-	min_version=$lld_min_version
-	name=LLD
-	disp_name=LLD
 else
-	echo "$orig_args: unknown linker" >&2
-	exit 1
+	while [ $# -gt 1 -a "$1" != "LLD" ]; do
+		shift
+	done
+
+	if [ "$1" = LLD ]; then
+		version=$2
+		min_version=$lld_min_version
+		name=LLD
+		disp_name=LLD
+	else
+		echo "$orig_args: unknown linker" >&2
+		exit 1
+	fi
 fi
 
 # Some distributions append a package release number, as in 2.34-4.fc32
