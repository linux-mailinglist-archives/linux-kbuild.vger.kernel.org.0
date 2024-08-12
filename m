Return-Path: <linux-kbuild+bounces-2954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF494F107
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 17:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE431F218D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 15:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFBF184546;
	Mon, 12 Aug 2024 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltWsE1OX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94BB1836E2;
	Mon, 12 Aug 2024 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474707; cv=none; b=uvJpJC9fEvzblyTQJ6UVufJZc+RTbCjAZyNBldOsggcSTNCpzniAlSNNDVqwLdpfEH7FIy4PHV/Lua0ycoBpypUaVCznhdMB29LCn9yxIdSuHNLHqcGWDZP8ph2KvHx3OWG4fgyF2QcGUkSi93Cn2DFjouFu64MV2dITmOAzNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474707; c=relaxed/simple;
	bh=J/SKkwbqqCIp0YH6F0xFAaMllpq7ysx1Q+6O8d4LV3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4t99qUnioLMwYAur6Q4EjVuG/0PO7FPK5u/jL04wy5o79biKQzbVDalQCLkwLUYpwQBiJUH/THVwy2zIWDpM2tXOLaK+ym/tuQXBzJT+9uo9L7qPZlCBLUmEYG6eZlHcWgCGOPsnFcbravl1b9G1rxzKYmrerYe9Hv24p4zY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltWsE1OX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so8066423a12.0;
        Mon, 12 Aug 2024 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723474704; x=1724079504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ur0ADrPuCQVVBSJKRbdnfcSka+CcsO8Z1qyAiYIcm3M=;
        b=ltWsE1OXNqBJVM3L8LkeOYgWZsR9do3aQjldDJRnMZiz1N7M2fl93yTzWdVM7GIrnC
         Uad0dbAoYeCSNaqfhtaZRFybWix15bZ/plN4Q59Ivn5aF/UyEyNLbRRBZHV7i3DkrsOm
         vg1dzyvsrMjpwVlKrLibff5CWSH/EVUts9lWMpqJfMV9eiF3ipzS5KqsxiHd9UZzCnGO
         qf8hJb7t88/FazTR/2i7VJ4fvLA9RmxjszCxy0qlCE+1sunldECaeLiGhmGQwUFdovsu
         zrxX2LHO5ZvA0KrvXwoG0Ot3x48iXXWi9oULw6adThrkXIPZXnKH/WQKriNSb5zpQ0VD
         CIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723474704; x=1724079504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur0ADrPuCQVVBSJKRbdnfcSka+CcsO8Z1qyAiYIcm3M=;
        b=EzditTzUEPzsalcGvnTdGdrU9juDn7HcZueI5Tydssk7ihPr6f1b6Or2tT38K34VF1
         6tyvO5/NqiDeT/pWYRZDJH4Wic/UdSW+uJ9LDrgfa1OuTxNBW+MBwsHS1TH9gtIl88yP
         wxEs4DDF2Eiy9DWHpPKo/mrPeQPs1F5nur2HNiLXDOMGGD7mJmLk7JJWLiEtVUCqB77T
         ZacTwZHAj4GmKZBwKoWFGUHpgrP7715DUWdXPE0paQHnewfDVoi2Lry8E2yeEqk3zlUm
         zyj4o/CJKFp76ahP04vIC7G01MKGgcDWIJIhP55OhtV0UZTY88Z4a9gMPYZjd0zg+glU
         4Whg==
X-Forwarded-Encrypted: i=1; AJvYcCULtgEWRHwl1NjcLzQP7gNr4TktabL2cJHBj9K6IFvR61Y2wGRd/BQMeCEiuGO9Jw/Unb2YiDo93nWpczEf1Xt9/WKFIRC8UfgjuS8tgQ2bwqyFMcElnYrvjEeSDsj7/AgXFh35bMMEzrXngBXooHUkEJ0THLn0QTu8c5SZEC4AZhacwuNIoHLg
X-Gm-Message-State: AOJu0Yx0+LfE0mCyjVT5ChX6jUmSvuskmOXZtTmtaHeC4XOqd0yNV3e8
	1FzumjM9zrY8P44ThLtWGLrf9oJjXwxJw8FQJq98b6U12R8XSl+TY8iAMQ==
X-Google-Smtp-Source: AGHT+IFwSb8mQ/alDFgxZCwkDyWEL42yIoafvATNdaXq7p/cs/IwmDazhaaCVG97iMOfKA8tVcoR+Q==
X-Received: by 2002:a17:907:984:b0:a80:c0ed:2145 with SMTP id a640c23a62f3a-a80edb93d4emr44533066b.2.1723474703579;
        Mon, 12 Aug 2024 07:58:23 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1cce7bsm240025866b.106.2024.08.12.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 07:58:23 -0700 (PDT)
Date: Mon, 12 Aug 2024 16:58:21 +0200
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
Message-ID: <ZrojDUbr1EvlARXK@toolbox>
References: <20240809160853.1269466-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809160853.1269466-1-masahiroy@kernel.org>

On Sat, Aug 10, 2024 at 01:07:20AM +0900, Masahiro Yamada wrote:
> Commit 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no
> longer in env") included <linux/limits.h>, which invoked another
> (wrong) patch that tried to address a build error on macOS.
> 
> According to the specification [1], the correct header to use PATH_MAX
> is <limits.h>.
> 
> The minimal fix would be to replace <linux/limits.h> with <limits.h>.
I can change that in a v2.

> 
> However, the following commits seem questionable to me:
> 
>  - 3bd85c6c97b2 ("tty: vt: conmakehash: Don't mention the full path of the input in output")
>  - 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no longer in env")
> 
> These commits made too many efforts to cope with a comment header in
> drivers/tty/vt/consolemap_deftbl.c:
> 
>   /*
>    * Do not edit this file; it was automatically generated by
>    *
>    * conmakehash drivers/tty/vt/cp437.uni > [this file]
>    *
>    */

This is the output you get when keeping the build artifacts within the
linux source tree.
However if you keep the artifacts outside the source tree
(make O=/somepath ...) the output looks like this:

    /*
     * Do not edit this file; it was automatically generated by
     *
     * conmakehash /path-to-kernel-source-tree/drivers/tty/vt/cp437.uni > [this file]
     *
     */

i.e. it does keep a reference to where in your filesystem the kernel
source did reside when building which is against the goal of having a
reproducable build.

> 
> With this commit, the header part of the generate C file will be
> simplified as follows:
> 
>   /*
>    * Automatically generated file; Do not edit.
>    */

This is not what I observed, for me with this proposed commit the
comment becomes with or without the 'O=somepath':

    /*
     * Do not edit this file; it was automatically generated by
     *
     * conmakehash cp437.uni > [this file]
     *
     */

i.e. it strips the directory path of the chartable source file used.

Regards
Max

> 
> BTW, another series of excessive efforts for a comment header can be
> seen in the following:
> 
>  - 5ef6dc08cfde ("lib/build_OID_registry: don't mention the full path of the script in output")
>  - 2fe29fe94563 ("lib/build_OID_registry: avoid non-destructive substitution for Perl < 5.13.2 compat")
> 
> [1]: https://pubs.opengroup.org/onlinepubs/009695399/basedefs/limits.h.html
> 
> Fixes: 6e20753da6bc ("tty: vt: conmakehash: cope with abs_srctree no longer in env")
> Reported-by: Daniel Gomez <da.gomez@samsung.com>
> Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/tty/vt/conmakehash.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/vt/conmakehash.c b/drivers/tty/vt/conmakehash.c
> index 82d9db68b2ce..a931fcde7ad9 100644
> --- a/drivers/tty/vt/conmakehash.c
> +++ b/drivers/tty/vt/conmakehash.c
> @@ -11,8 +11,6 @@
>   * Copyright (C) 1995-1997 H. Peter Anvin
>   */
>  
> -#include <libgen.h>
> -#include <linux/limits.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <sysexits.h>
> @@ -79,7 +77,6 @@ int main(int argc, char *argv[])
>  {
>    FILE *ctbl;
>    const char *tblname;
> -  char base_tblname[PATH_MAX];
>    char buffer[65536];
>    int fontlen;
>    int i, nuni, nent;
> @@ -245,20 +242,15 @@ int main(int argc, char *argv[])
>    for ( i = 0 ; i < fontlen ; i++ )
>      nuni += unicount[i];
>  
> -  strncpy(base_tblname, tblname, PATH_MAX);
> -  base_tblname[PATH_MAX - 1] = 0;
>    printf("\
>  /*\n\
> - * Do not edit this file; it was automatically generated by\n\
> - *\n\
> - * conmakehash %s > [this file]\n\
> - *\n\
> + * Automatically generated file; Do not edit.\n\
>   */\n\
>  \n\
>  #include <linux/types.h>\n\
>  \n\
>  u8 dfont_unicount[%d] = \n\
> -{\n\t", basename(base_tblname), fontlen);
> +{\n\t", fontlen);
>  
>    for ( i = 0 ; i < fontlen ; i++ )
>      {
> -- 
> 2.43.0
> 

