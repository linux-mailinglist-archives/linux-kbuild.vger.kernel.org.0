Return-Path: <linux-kbuild+bounces-324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A30680CA99
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 14:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9461F2110B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 13:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847F23D96C;
	Mon, 11 Dec 2023 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1mQlY11"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983E4C3
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 05:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702300448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGpqgCQoHA7gfzhcNnMoEqvxE+usWH3FO302tA/0S5M=;
	b=S1mQlY11L3iLlrMF8fA9hprQwfWRKNqyzZzN+OjfrR+aA9wDtW6T8WHF6OCPqU9EM8SZfO
	rrcdixy131yogesw/BIPa2KT6pKYF4HvpGwEB8EjqIEJTgsfxfArejGnTuNj0Rc+Lm2vs/
	Hr5bJUh2ZN4+gEYe3CssXBoybvmcD+o=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-kdDE405QN9mXysbWrrVFKg-1; Mon, 11 Dec 2023 08:14:07 -0500
X-MC-Unique: kdDE405QN9mXysbWrrVFKg-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5c1b986082dso2771365a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 05:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300446; x=1702905246;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGpqgCQoHA7gfzhcNnMoEqvxE+usWH3FO302tA/0S5M=;
        b=avwY4zIBkWryPGQGgP+gf9sghwMFvvUa8d7wG08ro9csECIAKI7NTwbI98U07ZwKP1
         FzTqQNjTJgVbb4nbayY3+fLyYmrTrC5t3uQmdQS1j9de5ow5yEH2iPGSmQoDbj7EtDs2
         uqfLEH2UpiIVkeXT9/lCp6TB+ZoeULsY4LrIIWaxrekkBHW6zmPnTNoliOEngI344xBl
         XDJPpXqOXD34XCpEQ/ydL84VcGNctPH8CVdGsO+qwpGtaZAA+jiX3mrwzi8xI8/qv97J
         ES9U30qCTD71ycshjRNIRsrFiXJ1chkdfnIW5U+jLYYQGVG5TbU8m4XJqOdm8aPuhJ+B
         +GdQ==
X-Gm-Message-State: AOJu0Yy7WGgeQHIiEBHACmYJyyuKGdGst+zaVtZaJF1+gxiyLS+8pIwY
	iXdIHRUJr4m65wIit10UfeDAKbmU6pJ7HPxye4wUqQnvo7yGo7l4o2rJGDt/oQgd4ZiLFzJUeuz
	VRmoJ9rHNZwIPl2c6hurFJ89Y
X-Received: by 2002:a05:6a20:da8b:b0:18f:cbdd:3244 with SMTP id iy11-20020a056a20da8b00b0018fcbdd3244mr5741500pzb.47.1702300446357;
        Mon, 11 Dec 2023 05:14:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYDcYxzezUOmmhjHqlN4rLUWgtQEen04kcE0D4OK/TFGjbw/Oh2gm3pI95zLhzVQRBecYWIQ==
X-Received: by 2002:a05:6a20:da8b:b0:18f:cbdd:3244 with SMTP id iy11-20020a056a20da8b00b0018fcbdd3244mr5741484pzb.47.1702300445976;
        Mon, 11 Dec 2023 05:14:05 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a802:3102:945e:6f76:fb73:6512])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b006ce3bf7acc7sm6177155pfh.113.2023.12.11.05.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:14:05 -0800 (PST)
From: lsoaresp@redhat.com
X-Google-Original-From: masahiroy@kernel.org
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Date: Mon, 11 Dec 2023 10:13:52 -0300
Message-ID: <ZXcLEKSBg9Bd1qEu@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
References: <20231208181802.88528-3-leobras@redhat.com> <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Leonardo Bras <masahiroy@kernel.org>

On Sun, Dec 10, 2023 at 04:13:54AM +0900, Masahiro Yamada wrote:
> On Sat, Dec 9, 2023 at 3:19 AM Leonardo Bras <leobras@redhat.com> wrote:
> >
> > When reviewing patches, it looks much nicer to have some changes shown
> > before others, which allow better understanding of the patch before the
> > the .c files reviewing.
> >
> > Introduce a default git.orderFile, in order to help developers getting the
> > best ordering easier.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> >
> > ---
> > Changes since RFCv4:
> > - Added scripts/* into "build system" section
> > - Added "git-specific" section with this script and .gitignore
> > - Thanks for this feedback Nicolas!
> >
> > Changes since RFCv3:
> > - Added "*types.h" matching so type headers appear before regular headers
> > - Removed line ends ($) in patterns: they previously provided a
> >   false-positive
> > - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
> >   in any subdirectory
> >
> > Changes since RFCv2:
> > - Fixed licence comment to from /**/ to #
> > - Fixed filename in how-to comment
> > - Fix build order: Kconfig -> Kbuild -> Makefile
> > - Add *.mk extension
> > - Add line-ends ($) to make sure and get the correct extensions
> > - Thanks Masahiro Yamada for above suggestions!
> > - 1 Ack, thanks Randy!
> >
> > Changes since RFCv1:
> > - Added Kconfig* (thanks Randy Dunlap!)
> > - Changed Kbuild to Kbuild* (improve matching)
> >
> >
> >  scripts/git.orderFile | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 scripts/git.orderFile
> >
> > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > new file mode 100644
> > index 0000000000000..31649ff53d22c
> > --- /dev/null
> > +++ b/scripts/git.orderFile
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# order file for git, to produce patches which are easier to review
> > +# by diffing the important stuff like header changes first.
> > +#
> > +# one-off usage:
> > +#   git diff -O scripts/git.orderFile ...
> > +#
> > +# add to git config:
> > +#   git config diff.orderFile scripts/git.orderFile
> > +#
> > +
> > +MAINTAINERS
> > +
> > +# Documentation
> > +Documentation/*
> > +*.rst
> > +
> > +# git-specific
> > +.gitignore
> > +scripts/git.orderFile
> 

Hello Masahiro, thanks for the feedback!

> 
> 
> I think scripts/git.orderFile should be part of
> "scripts/*" below.
> 
> 
> 
> 
> 
> 
> > +
> > +# build system
> > +*Kconfig*
> > +*Kbuild*
> > +*Makefile*
> 
> I do not like this because "foo-Makefile-bar"
> is not a Makefile, but would match "*Makefile*".

That makes sense.

> 
> 
> If you do not use wildcard at all, 'Makefile'
> will match to the root-dir and sub-directories.

I tried a quick test here changing an mm/*.c file and mm/Makefile, and the 
above will print the .c file changes first in any situation here, so it 
won't have the desired behavior.

But if we want to achieve the above we can do so with a slight change in 
the suggestion:

> 
> 
> Kconfig
> */Kconfig*
> Kbuild
> Makefile
*/Makefile
> *.mak
> *.mk
> scripts/*
> 
> 
> may satisfy your needs mostly.
> 

I have tried the following in the Kernel root:

$ find . |grep Makefile |grep -v Makefile$
./arch/arm/mach-s3c/Makefile.s3c64xx
./arch/mips/Makefile.postlink
./arch/powerpc/Makefile.postlink
./arch/um/Makefile-os-Linux
./arch/um/Makefile-skas
./arch/um/scripts/Makefile.rules
./arch/x86/Makefile_32.cpu
./arch/x86/Makefile.um
./arch/x86/Makefile.postlink
./arch/riscv/Makefile.postlink
./drivers/firmware/efi/libstub/Makefile.zboot
./drivers/usb/serial/Makefile-keyspan_pda_fw
[...]

$ find . |grep Kbuild |grep -v Kbuild$
./arch/mips/Kbuild.platforms
./scripts/Kbuild.include

Which leads to an honest question: 
Don't we want to show changes on those files before C files, for example?

If so, we need something like:

# build system
Kconfig*
*/Kconfig*
Kbuild*
*/Kbuild*
Makefile*
*/Makefile*
*.mak
*.mk
scripts/*

It would get rid of "foo-Makefile-bar" case but still match 
"Makefile-bar" case, which seems to be used around.

Is that ok?

Thanks!
Leo


