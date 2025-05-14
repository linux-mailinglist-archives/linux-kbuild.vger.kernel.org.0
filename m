Return-Path: <linux-kbuild+bounces-7097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A1AB6089
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 03:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A01327AC714
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 01:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121D11B4F08;
	Wed, 14 May 2025 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b="dWN0wZZ0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032828EC
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187268; cv=none; b=uH+pQLkAnuM1ZxVZxuG7vT5Izp5PRgeAzLSbWuAq+s/zOOz7GB8pveuBQ+E2NH3MM2hS3crSicP/z/01/Aeppw+uLQAZwggXV7iF9Ie+cgVWDfOpc9DifhEjMq5Lt8ZvDoHxN/Ws2l1yOugNqSFbBZvNBZpqISAq07s9dh9uEqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187268; c=relaxed/simple;
	bh=wj5wh9ID2lPhxAhS8aQurIWTy4JIFjei898rvS5iptM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=F4qSwGOOHH9NpEBEQ+j8jJBuKh26PtuR65Brpj6YPVlNhiCeWfRbNuqrqwJiwH+aqXlUCjdoC0374LoQ6tAixqifQTcGkrp/Hr1N0Mz9gue59oTKh7RnGCbMKHMw9xjxjOev4Trc22Cc5lPn+0QEhhaZ7OCrQzPRhn96qwo65lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech; spf=pass smtp.mailfrom=underview.tech; dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b=dWN0wZZ0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=underview.tech
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso54637565e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747187260; x=1747792060; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zDu+Eyb3fQ+Lm0BoSCJUEmgXi2uNrlxCFDLroTO47I=;
        b=dWN0wZZ09oEidWCzoZ9nYpfppEHJphWlXImvmawG2L6oE16JdLSX78/E1XOCrIPIlT
         tTC6BKd2AXvj/ppGqH6IVWgk0ppiWlyJyixMgCFOgyR94ypz8A8HxzQg/ThZFimrTbOS
         IRaLKCN1e937/O7o5J0C6zohdUFPO5hZgx7SP9YkgGjJS43qHF9PHKrvREIfONSvMHny
         nfV2Te/ZRmlzjbwe95ybQA9IDQMZn0ZhQUx8L/bEYXISI5FgdnTIUexHX6CTBEXJz7hT
         4LMJFF3gJsa713bk/pbgQkfJ6qbMAT1dW3FPg0Kd2tRoAxnxhadfFrUvODop8l0NCEh9
         LEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747187260; x=1747792060;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zDu+Eyb3fQ+Lm0BoSCJUEmgXi2uNrlxCFDLroTO47I=;
        b=I7pSSQ+dVEExjrDlQtAH4Rmk81rllcVAfppa1Hb8AWlcGDItfaMch969dHomqxSyUp
         BTLffwc7sgVzIlFPgRFlIT0CEqycZjDgz66pohCHDE11UxIZOBBj5eTt+AONDlqAptOR
         dgKc+ql3N+NTPggaWX4+MHb+cbv5eDYjZ6wO0f1wlGYseaSMedU6nCsypZlCj6zSlg4W
         zqQInPeQaVO5BCIhAzgYuN5/mLbJGkMLQ3Tj9tLDUJ1FJyAyqhexkYSnf6ldoOVEKWUe
         NqVej2afFyMM8EJMMl2hZ7T/rhdtiH5Bf+NjPI4aOTpJF8/FXzmYob3XXonk1jin8cJH
         nysA==
X-Gm-Message-State: AOJu0YzJyWF4LGMC1jgHGkIMdvQB4G4NyuA1LN0MrJWS0JOVrEQp0mUX
	2cvPRILyTnKsqzoBkKmUMJshWQeDs375mXo3hjtlHqTgsS2cagk3Hl4sFlWplKOgLtNSSqQstM5
	GJbncZ+WC43VsfLx6WzDwhJmS6XnGXlBbH2n0kI5nXJw7YFGNmWA=
X-Gm-Gg: ASbGncswyh6RWNQtMiI4BXWtWdv0cu8WWEM4lif5sZlPgAP5AgZeSqWNmifRdFfInRs
	ngOiTJ8QZF9fDadGKcxtTxo04t/6eLOMvw/uQOkisfYQlUqabDAYzVxeUjfNhcrXF9d/g5ODhGl
	TTfOBRgpnXJavgfZU5NUaPfBlFWvtmJuMVWlffJKuRUh4NQZTa2OCjygHHsMFXhtO4DMYsi6F2K
	g==
X-Google-Smtp-Source: AGHT+IF7RnWMGMaZDvCKKiBxQcI37VJxwQ++xZjD1slpsDZ0ad9x6GH6JtKkZtsC+HeyHWKGbHqkNBWajHT04iGx8QE=
X-Received: by 2002:a05:600c:6692:b0:43c:e7a7:aea0 with SMTP id
 5b1f17b1804b1-442f2168c36mr10172025e9.26.1747187260283; Tue, 13 May 2025
 18:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513040409.147881-1-vince@underview.tech> <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
In-Reply-To: <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Tue, 13 May 2025 21:47:29 -0400
X-Gm-Features: AX0GCFuifi53uGAQFBXnodud9nrBdgOxhznrC5IN_t5NQPWmLIByqpGgZxCpI9o
Message-ID: <CAPQx_gO-HqcAPES8TGwM=uUNF_OOkNSAi6C8Z5=5K4-ODb9OsQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry I should have given a better description. First kernel patch.

There appears to be a userspace program called fixdep.c.
That won't compile when you utilize the yocto project SDK
cross compilers. Problems are described in the original patch.

We have to run make modules_prepare as there's limits with the
Yocto project kernel-devsrc package that gets included in the SDK.

After SDK extraction, developers have to first prepare the SDK's
kernel source tree to be able to build any out of tree drivers with
the SDK's cross-compilers. This wasn't achievable without the
submitted patch.

Sorry for poor timing. I am going on vacation and can't respond
due to emails needing to be in plain text. Please don't ignore
future patches.

For instance if I run bellow commands

$ ./x86_64-0.1.0-underview.sh
Underview SDK installer version 0.1.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Enter target directory for SDK (default: .): extract-sdk
You are about to install the SDK to "/home/vince/extract-sdk". Proceed [Y/n=
]? Y
Extracting SDK.............................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...............................................done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to
source the environment setup script e.g.
 $ . /home/vince/extract-sdk/environment-setup-zen1-underview-linux

 $ source /home/vince/extract-sdk/environment-setup-zen1-underview-linux

$ cd /home/vince/extract-sdk
 $ ls sysroots/zen1-underview-linux/usr/lib/modules/6.6.9-amd-standard/buil=
d/
arch   certs   Documentation  fs       init      ipc     Kconfig  lib
     mm              net   samples  security
System.map-6.6.9-amd-standard  usr
block  crypto  drivers        include  io_uring  Kbuild  kernel
Makefile  Module.symvers  rust  scripts  sound     tools
           virt

 $ make -C sysroots/zen1-underview-linux/usr/lib/modules/6.6.9-amd-standard=
/build
modules_prepare
make: Entering directory
'/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/lib/modules/6.6.=
9-amd-standard/build'
  SYNC    include/config/auto.conf
  HOSTCC  scripts/basic/fixdep
scripts/basic/fixdep.c:92:10: fatal error: sys/types.h: No such file
or directory
   92 | #include <sys/types.h>
      |          ^~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
make[2]: *** [Makefile:633: scripts_basic] Error 2
make[1]: *** [/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/lib=
/modules/6.6.9-amd-standard/build/Makefile:798:
include/config/auto.conf] Error 2
make[1]: *** [include/config/auto.conf] Deleting file
'include/generated/rustc_cfg'
make[1]: *** [include/config/auto.conf] Deleting file
'include/generated/autoconf.h'
make: *** [Makefile:234: __sub-make] Error 2
make: Leaving directory
'/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/lib/modules/6.6.=
9-amd-standard/build'

Hopefully makes sense


On Tue, May 13, 2025 at 10:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, May 13, 2025 at 1:04=E2=80=AFPM Vincent Davis Jr <vince@underview=
.tech> wrote:
> >
> > When running
> >
> > make -C \
> > "${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
> > modules_prepare
>
> This is not the correct way to build an external module.
> Do not run modules_prepare.
>
>
>
>
> > Issue that are encountered include
> >
> > make -f ./Makefile syncconfig
> > make -f ./scripts/Makefile.build obj=3Dscripts/basic
> >    92 | #include <sys/types.h>
> >       |          ^~~~~~~~~~~~~
> > compilation terminated.
> >
> > ld: cannot find Scrt1.o: No such file or directory
> > ld: cannot find crti.o: No such file or directory
> > ld: cannot find crtbeginS.o: No such file or directory
> > ld: cannot find -lgcc: No such file or directory
> > ld: cannot find -lgcc_s: No such file or directory
> > ld: cannot find -lc: No such file or directory
> > ld: cannot find -lgcc: No such file or directory
> > ld: cannot find -lgcc_s: No such file or directory
> > ld: cannot find crtendS.o: No such file or directory
> > ld: cannot find crtn.o: No such file or directory
> >
> > Solved by setting KCFLAGS as the yocto project SDK
> > KCFLAGS is set to --sysroot=3D"${SDKTARGETSYSROOT}".
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 64c514f4bc19..bbe7b0503841 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc
> >  HOSTPKG_CONFIG =3D pkg-config
> >
> >  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototy=
pes \
> > -                        -O2 -fomit-frame-pointer -std=3Dgnu11
> > +                        -O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFLAG=
S)
>
>
> Sorry, I do not understand what you are trying to achieve.
>
> KCFLAGS is meant to specify compiler flags for the kernel-space,
> not userspace host programs.
>
>
>
>
> >  KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
> >  KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
> >
> > @@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAG=
S) $(HOSTCXXFLAGS) \
> >                        -I $(srctree)/scripts/include
> >  KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo =
\
> >                         -Zallow-features=3D $(HOSTRUSTFLAGS)
> > -KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> > +KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
> >  KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> >  KBUILD_PROCMACROLDFLAGS :=3D $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDF=
LAGS))
> >
> > --
> > 2.43.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada

