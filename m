Return-Path: <linux-kbuild+bounces-2956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67B94F238
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 17:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651EE283A1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 15:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D22187343;
	Mon, 12 Aug 2024 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ied3QKyZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB4186E5A;
	Mon, 12 Aug 2024 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478301; cv=none; b=EATnUb3nSaJxSBtqzqwGF8p0GmPNeQhPqtaEU0pfilgapyL44s3wSih5NM6zwW0U6Qza++PqJkrlkXC6vHgyIn+DyrAGHWJt7oARQ1LqqC2/MgAul3uBwEkPj8t6qcP0zbkYB2NGc4aUhdU2pMrOEIC+rRdIKSsVRmGoBVZRiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478301; c=relaxed/simple;
	bh=gUCjJDEJFDyz+livsnJi5Irrop+hF08mCdxZsNWwFtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgbZG3UFHDuhUjhTy+q7RiLWSrS7XIKqWH1n2b671fKxLHeVf9f9QYMILGNje8NqaX+OFW1uHKs1acAoVYEZyyRdaQJWh1gLcKnzTfXGTHw1q3ETl4ARc0uk8A7bStC8OUEYbylyUlGWIdzfWHMkFzq1Yen72vIX+7h9tC719Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ied3QKyZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-426526d30aaso31405965e9.0;
        Mon, 12 Aug 2024 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723478298; x=1724083098; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8dH5c6euhGkhzqUhg15r5whJ9sGjRiQsrYOxQFbfwQ=;
        b=ied3QKyZM/19vrnbo9GyXdVZMtA9h85orpTCmas8UX0gIhAHUFejH8hrz2M0jlhwYi
         Eif5iYWpJ6MIiNZkW9kUovwCl+4q4vHdiGItuvdB473o+KcUKtenOsTl7/al7R8AQSlI
         tNJxaSD47RALw/Op++NV/VcxRMnYFqJ+3B6qH8MF7q0jnUp6sje1LnBzClpvXf0uF5fC
         u5Fvj+EQN6t/MA8MeMkmDJqB7jJen8lEinRSajKzasqkb7HA6E+b0RpIUOGpnjeI3djV
         BPmPhCngr51N0lq2QdiPP50GluQgRJEaBef9+0N+qgq4Siq81X0z3u0vKdwHteROe0Or
         rNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723478298; x=1724083098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8dH5c6euhGkhzqUhg15r5whJ9sGjRiQsrYOxQFbfwQ=;
        b=AvFVxEDV5PZbjsY38apJKTfXXhSV8DXfIcLSqNse6rOWA6ga+09Syg+NAJzLNP24tD
         gMet1auforSmwkbAcc/8NmHSHHSd8dI67mwkiIslMDqvBfSYd9sLRlkA23swIfm2pPH5
         3qR2LLLYZsy83yzJZj7EDsvCbeRy2zBvE8QXZ9IljtCwZdmAQm6wY7JG0V6mQBdH+ipX
         FULBI1jfk4WxRmw1Zo7JjsDAJxHewFxXaXkdX2ooWfGq5POkPvpmC0lAggkOHAePuRN+
         caPoKht9r54d01MQBqMOypKB4dw3Q6Wy4+OzKDzJaObzE07lHM5eF0HYpn2maNwoiFM9
         +XmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyUwxUsXx8bcqJryC3X9Bk05hp6rfu2HojZ+vcXUInw7EKwn5HuZZ8Mc7jI2w6m95yCoJwVc3LCG1OeKZ3@vger.kernel.org, AJvYcCXJOkVwfp3THihft6WUu/g6J1W/qAx5seJIWJTeCULCAQh2kXwffvYJKT4A9yXwRJA76+OCzlph1v1HI6/H@vger.kernel.org, AJvYcCXyPw218zhm+FB9W2ceAFfTZCB7iQ2bRhHt7I9DWZcgrJSX8AAifYlqv7c0ojJ32N1J0ynkkzhaI7hCvP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGFDbI+JuZYAHFsivWEoXMvilr93bcYrbJCsIf0oAHAZJ1dOA
	We++JsGz0H5DMbjL9RMKKZD9DEWnNqQTn5mU3gyANSDYxFsf9uk4+nzTyw==
X-Google-Smtp-Source: AGHT+IGmluI+NxRw/DB+Gk5D4DxrNk5HnM/7KxqWahp2ny7w9p8D/538swlQYaWEONiqdjzFcvYnVA==
X-Received: by 2002:a05:600c:4f0d:b0:426:5cdf:2674 with SMTP id 5b1f17b1804b1-429d47f5c0dmr7033835e9.4.1723478297538;
        Mon, 12 Aug 2024 08:58:17 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750ec0bsm106880045e9.15.2024.08.12.08.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 08:58:17 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:58:15 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kbuild@vger.kernel.org,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] tty: vt: conmakehash: remove non-portable code printing
 comment header
Message-ID: <ZroxFwCTr8oOO-tf@toolbox>
References: <20240809160853.1269466-1-masahiroy@kernel.org>
 <ZrojDUbr1EvlARXK@toolbox>
 <CAK7LNARCRQ_K=4vAQxgQiq_w8ss5+uhGnY1L7nre=H3eWeq6zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARCRQ_K=4vAQxgQiq_w8ss5+uhGnY1L7nre=H3eWeq6zA@mail.gmail.com>

On Tue, Aug 13, 2024 at 12:44:40AM +0900, Masahiro Yamada wrote:
> On Mon, Aug 12, 2024 at 11:58 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > On Sat, Aug 10, 2024 at 01:07:20AM +0900, Masahiro Yamada wrote:
> > > Commit 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no
> > > longer in env") included <linux/limits.h>, which invoked another
> > > (wrong) patch that tried to address a build error on macOS.
> > >
> > > According to the specification [1], the correct header to use PATH_MAX
> > > is <limits.h>.
> > >
> > > The minimal fix would be to replace <linux/limits.h> with <limits.h>.
> > I can change that in a v2.
> 
> 
> You cannot.
> 
> Your buggy commit already landed in Linus' tree:
> 
> https://github.com/torvalds/linux/commit/6e20753da6bc651e02378a0cdb78f16c42098c88
> 
> 
> 
> 
> 
> > >
> > > However, the following commits seem questionable to me:
> > >
> > >  - 3bd85c6c97b2 ("tty: vt: conmakehash: Don't mention the full path of the input in output")
> > >  - 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no longer in env")
> > >
> > > These commits made too many efforts to cope with a comment header in
> > > drivers/tty/vt/consolemap_deftbl.c:
> > >
> > >   /*
> > >    * Do not edit this file; it was automatically generated by
> > >    *
> > >    * conmakehash drivers/tty/vt/cp437.uni > [this file]
> > >    *
> > >    */
> >
> > This is the output you get when keeping the build artifacts within the
> > linux source tree.
> > However if you keep the artifacts outside the source tree
> > (make O=/somepath ...) the output looks like this:
> >
> >     /*
> >      * Do not edit this file; it was automatically generated by
> >      *
> >      * conmakehash /path-to-kernel-source-tree/drivers/tty/vt/cp437.uni > [this file]
> >      *
> >      */
> >
> > i.e. it does keep a reference to where in your filesystem the kernel
> > source did reside when building which is against the goal of having a
> > reproducable build.
> 
> 
> 
> You do not need to educate me.
> 
> It is well described in commit 3bd85c6c97b2d232638594bf828de62083fe3389
> and I know how it works.

Sorry about that. I read your new commit as a comment to mine.
Thanks for fixing the bug I added.

Regards
Max

> 
> 
> 
> > >
> > > With this commit, the header part of the generate C file will be
> > > simplified as follows:
> > >
> > >   /*
> > >    * Automatically generated file; Do not edit.
> > >    */
> >
> > This is not what I observed, for me with this proposed commit the
> > comment becomes with or without the 'O=somepath':
> >
> >     /*
> >      * Do not edit this file; it was automatically generated by
> >      *
> >      * conmakehash cp437.uni > [this file]
> >      *
> >      */
> >
> > i.e. it strips the directory path of the chartable source file used.
> 
> 
> 
> See my patch closely.
> 
> I deleted the line "* conmakehash %s > [this file]\n\"
> 
> 
> 
> 
> 
> 
> 
> 
> 
> > Regards
> > Max
> >
> > >
> > > BTW, another series of excessive efforts for a comment header can be
> > > seen in the following:
> > >
> > >  - 5ef6dc08cfde ("lib/build_OID_registry: don't mention the full path of the script in output")
> > >  - 2fe29fe94563 ("lib/build_OID_registry: avoid non-destructive substitution for Perl < 5.13.2 compat")
> > >
> > > [1]: https://pubs.opengroup.org/onlinepubs/009695399/basedefs/limits.h.html
> > >
> > > Fixes: 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no longer in env")
> > > Reported-by: Daniel Gomez <da.gomez@samsung.com>
> > > Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com/
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  drivers/tty/vt/conmakehash.c | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/tty/vt/conmakehash.c b/drivers/tty/vt/conmakehash.c
> > > index 82d9db68b2ce..a931fcde7ad9 100644
> > > --- a/drivers/tty/vt/conmakehash.c
> > > +++ b/drivers/tty/vt/conmakehash.c
> > > @@ -11,8 +11,6 @@
> > >   * Copyright (C) 1995-1997 H. Peter Anvin
> > >   */
> > >
> > > -#include <libgen.h>
> > > -#include <linux/limits.h>
> > >  #include <stdio.h>
> > >  #include <stdlib.h>
> > >  #include <sysexits.h>
> > > @@ -79,7 +77,6 @@ int main(int argc, char *argv[])
> > >  {
> > >    FILE *ctbl;
> > >    const char *tblname;
> > > -  char base_tblname[PATH_MAX];
> > >    char buffer[65536];
> > >    int fontlen;
> > >    int i, nuni, nent;
> > > @@ -245,20 +242,15 @@ int main(int argc, char *argv[])
> > >    for ( i = 0 ; i < fontlen ; i++ )
> > >      nuni += unicount[i];
> > >
> > > -  strncpy(base_tblname, tblname, PATH_MAX);
> > > -  base_tblname[PATH_MAX - 1] = 0;
> > >    printf("\
> > >  /*\n\
> > > - * Do not edit this file; it was automatically generated by\n\
> > > - *\n\
> > > - * conmakehash %s > [this file]\n\
> > > - *\n\
> > > + * Automatically generated file; Do not edit.\n\
> > >   */\n\
> > >  \n\
> > >  #include <linux/types.h>\n\
> > >  \n\
> > >  u8 dfont_unicount[%d] = \n\
> > > -{\n\t", basename(base_tblname), fontlen);
> > > +{\n\t", fontlen);
> > >
> > >    for ( i = 0 ; i < fontlen ; i++ )
> > >      {
> > > --
> > > 2.43.0
> > >
> 
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada

