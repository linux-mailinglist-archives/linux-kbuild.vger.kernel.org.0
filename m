Return-Path: <linux-kbuild+bounces-2955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289EC94F1F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 17:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BEB11C220FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 15:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D303A184538;
	Mon, 12 Aug 2024 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+2CBB42"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68264206B;
	Mon, 12 Aug 2024 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723477519; cv=none; b=qKbgxFuNnaftN+Dph8z5ZVVo09T/uvFgcR3sW43dVVMvJYpL8yjg9LIp+j0RsGGRy7ED5enVbgJ7edlmiu/HrxD/GX4oWZHsuCaKTGtmkWuNlOmQvZjo6Bhlvh8VWIRpG3p1hymsx3qm33NScTRdr0aj9wsqvkLklJFje6Ngj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723477519; c=relaxed/simple;
	bh=mHXSpB58S7YsT8Af1/oElcL3Sn0KgMqQ4gINqCVFzdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWfiMg/5JJhtm/FVV/X5vXVHGc48rHZQEQGjj7v/0Vjf3Yc9LpPb6HwF89oSkugJPf4kkffRFfM0jG8D6psByos/owAJz2MllDfybh/L7j/V7qT/7dXoFuWtTBbpBxvT15Ro9vy3I9x9kiS4efKIasCCgpeuPnEFvivmHm7xwHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+2CBB42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB70C4AF09;
	Mon, 12 Aug 2024 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723477519;
	bh=mHXSpB58S7YsT8Af1/oElcL3Sn0KgMqQ4gINqCVFzdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E+2CBB420IyblYc4yo239mIGHuMclN+JNVz2yJqpZnJmx9124lb5JoiFomBRqPraY
	 pVlPaw+r0gvP7XhEf2Gx90vI2WrsZHZTC65RyvZwoiQZky32puBhoQIbN2/nYj28H3
	 t7HaD73BPRzYAKWq/UhwXxwNbHv0iIzdBs5wYA/dG3b+m1r6CpnjEy33vESgehNSRN
	 eqyjEwxPucqpsJbM8dABQ/dALk1pOa08ksuQY3pXifQ8bfcPYANogMIhkkqVvWJBFg
	 UHZsYpP5ULlndBogV3lmswKOWbLxWWmrchcOzR4BDQn1JdMK1odVS1MWr9LyHIAzPD
	 Di2u531e4naMw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef1c12ae23so45573301fa.0;
        Mon, 12 Aug 2024 08:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwVPBkJU5TbDp8Dzt+3PjU67k60AJ6vBNJFP11hElG4aHbUsqMH11fSXQObC/tK4vkkP465ZogMAt+zmlxqZO7t0zGyvRMZuOQd2IQc4vqKYzvxfDGjf9qc1kbR8oU8RRZVTyw97IAEw8ECtO/fwYsmflz7sQlWEmvGFZpDX9Ju06UV18PwwVH
X-Gm-Message-State: AOJu0YzDft8jjM4ugIpT5gzP7kJEQv16Apm0hVmi/Z1enkVoU7olw8mp
	LRuqwX1RJRJV/X0oIlkxwfZCgT5j3LgdBSfuG/wwRv+jMvKKXVgK0FmgIVtMDiePzBYUs1/dnGB
	8Rpcdqu1CH/uNRxwKwl6uTzg0Oqc=
X-Google-Smtp-Source: AGHT+IG225W60IBtU9xXkPjS62TyaokLc9Jyban5wHsbHnQitINpZxcCKLuWLgwV1BBLwxUTokIHMRQCfwDS6pBD4z4=
X-Received: by 2002:a2e:9655:0:b0:2ee:4c66:6828 with SMTP id
 38308e7fff4ca-2f2b7156f5amr3661901fa.24.1723477517805; Mon, 12 Aug 2024
 08:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809160853.1269466-1-masahiroy@kernel.org> <ZrojDUbr1EvlARXK@toolbox>
In-Reply-To: <ZrojDUbr1EvlARXK@toolbox>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 Aug 2024 00:44:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCRQ_K=4vAQxgQiq_w8ss5+uhGnY1L7nre=H3eWeq6zA@mail.gmail.com>
Message-ID: <CAK7LNARCRQ_K=4vAQxgQiq_w8ss5+uhGnY1L7nre=H3eWeq6zA@mail.gmail.com>
Subject: Re: [PATCH] tty: vt: conmakehash: remove non-portable code printing
 comment header
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Daniel Gomez <da.gomez@samsung.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 11:58=E2=80=AFPM Max Krummenacher <max.oss.09@gmail=
.com> wrote:
>
> On Sat, Aug 10, 2024 at 01:07:20AM +0900, Masahiro Yamada wrote:
> > Commit 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no
> > longer in env") included <linux/limits.h>, which invoked another
> > (wrong) patch that tried to address a build error on macOS.
> >
> > According to the specification [1], the correct header to use PATH_MAX
> > is <limits.h>.
> >
> > The minimal fix would be to replace <linux/limits.h> with <limits.h>.
> I can change that in a v2.


You cannot.

Your buggy commit already landed in Linus' tree:

https://github.com/torvalds/linux/commit/6e20753da6bc651e02378a0cdb78f16c42=
098c88





> >
> > However, the following commits seem questionable to me:
> >
> >  - 3bd85c6c97b2 ("tty: vt: conmakehash: Don't mention the full path of =
the input in output")
> >  - 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no longer=
 in env")
> >
> > These commits made too many efforts to cope with a comment header in
> > drivers/tty/vt/consolemap_deftbl.c:
> >
> >   /*
> >    * Do not edit this file; it was automatically generated by
> >    *
> >    * conmakehash drivers/tty/vt/cp437.uni > [this file]
> >    *
> >    */
>
> This is the output you get when keeping the build artifacts within the
> linux source tree.
> However if you keep the artifacts outside the source tree
> (make O=3D/somepath ...) the output looks like this:
>
>     /*
>      * Do not edit this file; it was automatically generated by
>      *
>      * conmakehash /path-to-kernel-source-tree/drivers/tty/vt/cp437.uni >=
 [this file]
>      *
>      */
>
> i.e. it does keep a reference to where in your filesystem the kernel
> source did reside when building which is against the goal of having a
> reproducable build.



You do not need to educate me.

It is well described in commit 3bd85c6c97b2d232638594bf828de62083fe3389
and I know how it works.



> >
> > With this commit, the header part of the generate C file will be
> > simplified as follows:
> >
> >   /*
> >    * Automatically generated file; Do not edit.
> >    */
>
> This is not what I observed, for me with this proposed commit the
> comment becomes with or without the 'O=3Dsomepath':
>
>     /*
>      * Do not edit this file; it was automatically generated by
>      *
>      * conmakehash cp437.uni > [this file]
>      *
>      */
>
> i.e. it strips the directory path of the chartable source file used.



See my patch closely.

I deleted the line "* conmakehash %s > [this file]\n\"









> Regards
> Max
>
> >
> > BTW, another series of excessive efforts for a comment header can be
> > seen in the following:
> >
> >  - 5ef6dc08cfde ("lib/build_OID_registry: don't mention the full path o=
f the script in output")
> >  - 2fe29fe94563 ("lib/build_OID_registry: avoid non-destructive substit=
ution for Perl < 5.13.2 compat")
> >
> > [1]: https://pubs.opengroup.org/onlinepubs/009695399/basedefs/limits.h.=
html
> >
> > Fixes: 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no lo=
nger in env")
> > Reported-by: Daniel Gomez <da.gomez@samsung.com>
> > Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-11-=
4cd1ded85694@samsung.com/
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/tty/vt/conmakehash.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/tty/vt/conmakehash.c b/drivers/tty/vt/conmakehash.=
c
> > index 82d9db68b2ce..a931fcde7ad9 100644
> > --- a/drivers/tty/vt/conmakehash.c
> > +++ b/drivers/tty/vt/conmakehash.c
> > @@ -11,8 +11,6 @@
> >   * Copyright (C) 1995-1997 H. Peter Anvin
> >   */
> >
> > -#include <libgen.h>
> > -#include <linux/limits.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> >  #include <sysexits.h>
> > @@ -79,7 +77,6 @@ int main(int argc, char *argv[])
> >  {
> >    FILE *ctbl;
> >    const char *tblname;
> > -  char base_tblname[PATH_MAX];
> >    char buffer[65536];
> >    int fontlen;
> >    int i, nuni, nent;
> > @@ -245,20 +242,15 @@ int main(int argc, char *argv[])
> >    for ( i =3D 0 ; i < fontlen ; i++ )
> >      nuni +=3D unicount[i];
> >
> > -  strncpy(base_tblname, tblname, PATH_MAX);
> > -  base_tblname[PATH_MAX - 1] =3D 0;
> >    printf("\
> >  /*\n\
> > - * Do not edit this file; it was automatically generated by\n\
> > - *\n\
> > - * conmakehash %s > [this file]\n\
> > - *\n\
> > + * Automatically generated file; Do not edit.\n\
> >   */\n\
> >  \n\
> >  #include <linux/types.h>\n\
> >  \n\
> >  u8 dfont_unicount[%d] =3D \n\
> > -{\n\t", basename(base_tblname), fontlen);
> > +{\n\t", fontlen);
> >
> >    for ( i =3D 0 ; i < fontlen ; i++ )
> >      {
> > --
> > 2.43.0
> >



--
Best Regards

Masahiro Yamada

