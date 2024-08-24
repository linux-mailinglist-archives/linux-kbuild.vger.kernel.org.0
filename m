Return-Path: <linux-kbuild+bounces-3205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B51AA95DFD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 21:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5E71C20F4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 19:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617747DA68;
	Sat, 24 Aug 2024 19:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="0dtm/Kvf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A92AF15
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Aug 2024 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724528130; cv=none; b=U2I6aOechTKLbXsC/KzCp9Xyqbh9oVsryqwt4Ku+obN4/rUE0k1thBT48Y+GxzZVPeBWr+msSWlSQYr/wEm+RYYYvqPTsgS0ys4zzl25nyD1OBtKXa7kHWU5FfC7hp+NneKlew/RVKp7veMcNtMYZ/D+6i8ZrevowelroJ21gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724528130; c=relaxed/simple;
	bh=bytNnuowzmtyhvFR4SOrAtgSwC0Npg1muBqZ82NtqaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWz/iBDCVopjRoEt4Qhv5kcyNJzdzePQ6hhcGdvxuR2XlJEGvqN0aJ0a5QzhCLVKKNO9ojVKp+bvAYa55HxP17N/RM3a3TxExIOHGznBLYr+Gw208vSNRMmoJqdgrcGeow9dh0ZsHJ+W/zHio3fSOvKQUzBbZy+ZvaJcEQvuvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=0dtm/Kvf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53345604960so3168701e87.3
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Aug 2024 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1724528125; x=1725132925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqUQEx0JW9sRldU4OvC73NB0gIVSnxsis8NsIR8izBY=;
        b=0dtm/KvfHtwatHw3jl6TB605gCEkbHbsYzf/jvwq+JSzQGaU7RPPQZE52HNRgfDhZe
         G4yMCeOLznZj/SGesCWeryjjD1rR2509TRguT3/kBfu9XP+aZzELBQC4DoI/jBnMMwZH
         9zcUK+J0gFLGCjkHYgj4RCubZzK+PcCOY78XQUz2ofv3LWSadb1VxrYYtuX7szUgfrwM
         wYtJphnH2mgXWjKFpJ95vAGnMbsmjoSBF1gG1n1aqwkTmnClymw2DeeimFHI76Xbr6ba
         T2XW1ntpk8s3rVBbyN5GwgXTQPt3txvo/UVScV8jHoKp+ys1UVKObU4mYBjWW2YV9vWm
         KmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724528125; x=1725132925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqUQEx0JW9sRldU4OvC73NB0gIVSnxsis8NsIR8izBY=;
        b=hi4PU/Tol5DteEkhVdtWuWBraIHgMXk0wYF5DMV6C1b19OT9uXD2WXGMBSTSI/7YoQ
         7Q9sXBF84BOpRaIiS9T0VGUvFTnPqyAaVt4vXZneDSWhk5CrqfER83bxOUwqjj5qPFzP
         Je+RoLc+USI+qgN6CSX95j9gUo7RndsLt6yxGfmNSL2jMoVzplSOqEd4pz5KCIjxja/N
         NQfOmOL/ChzF/jMtOG/djE3mynQuFxOzSVZs77QgT4KnWc9MGUcFWGbGWxQSoBK14n8v
         wj/I5XytMCQWFhD4/DDdYCOp2fkVepvOTk3FxKzwO7tZNhjwgRiRU724lb2aBMCloar8
         uNAA==
X-Forwarded-Encrypted: i=1; AJvYcCUb2siIq0Ng9oL2dkWkGKlxuRWV4puWrNEiEUQjbhMUMXXcq0ammdIYgyVwHuzJDf7aOw1b1kwiPvbdtRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys77sSJ6+huaHe64lYcce/neZ2alxRs06EN+dkojjJsBZgTym0
	qp4b0kAZL3B2BR5PQwNT7o5paWkUVEo3/z/cm62RbvYOFJMLKTQfvppTZNMQdExAuicrw4FQITH
	dapBlA/w501KQWHUELkqjHRD6RTyFSG56nN8VNQ==
X-Google-Smtp-Source: AGHT+IGPd8NNVY8iNQlItVputHqv0A9NBxIa2qpJxJ9QIyvsMaWXLridmTyEMYCVXko8QGT/5mpgBtUGbv8rSnzMtM4=
X-Received: by 2002:a05:6512:3195:b0:52e:9f17:841a with SMTP id
 2adb3069b0e04-534387558bdmr3980885e87.6.1724528124835; Sat, 24 Aug 2024
 12:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
 <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com> <CABj0suC1atc=iPX4uOL5FYkzYBRtZC1J3Lhruo7hejd-fe9Yuw@mail.gmail.com>
In-Reply-To: <CABj0suC1atc=iPX4uOL5FYkzYBRtZC1J3Lhruo7hejd-fe9Yuw@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sat, 24 Aug 2024 21:34:58 +0200
Message-ID: <CABj0suDu1XPi7mPdqQWm2J3=XbTMHKGbz85ixM=gMr5VRkU78g@mail.gmail.com>
Subject: Re: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com, 
	Nick Desaulniers <nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 12:14=E2=80=AFAM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Fri, Aug 23, 2024 at 6:13=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Nick Desaulniers <nick.desaulniers@gmail.com>
> > >
> > > When building the Linux kernel on an aarch64 MacOS based host, if we =
don't
> > > specify a value for ARCH when invoking make, we default to arm and th=
us
> > > multi_v7_defconfig rather than the expected arm64 and arm64's defconf=
ig.
> > >
> > > This is because subarch.include invokes `uname -m` which on MacOS hos=
ts
> > > evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
> > >
> > > This allows us to build ARCH=3Darm64 natively on MacOS (as in ARCH ne=
ed
> > > not be specified on an aarch64-based system).
> > >
> > > Utilize a negative lookahead regular expression to avoid matching arm=
64.
> >
> >
> > Does sed support "negative lookahead regular expression"?
>
> I think they removed support for PCRE. I've found this:
>
> commit 261c7f145d015d9acb79dc650d27e4a23b839c23
> Author: Assaf Gordon <assafgordon@gmail.com>
> Date:   Tue Aug 21 14:25:57 2018 -0600
>
>     maint: remove REG_PERL code
>
>     Perl-regexp syntax (PCRE) in GNU Sed is shelved indefinitely.
>     See https://bugs.gnu.org/22801 , https://bugs.gnu.org/22647 .
>     Remove all (unused) REG_PERL related code.
>
>     * sed/sed.c, sed/sed.h, sed/regexp.c, sed/compile.c: Remove REG_PERL =
code.
>
> git tag --contains 261c7f145d015d9acb79dc650d27e4a23b839c23
> v4.6
> v4.7
> v4.8
> v4.9
>
> And my sed version is (Debian):
>
> sed --version
> sed (GNU sed) 4.9
> Packaged by Debian
> Copyright (C) 2022 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.=
html>.
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> Written by Jay Fenlason, Tom Lord, Ken Pizzini,
> Paolo Bonzini, Jim Meyering, and Assaf Gordon.
>
> This sed program was built with SELinux support.
> SELinux is disabled on this system.
>
> GNU sed home page: <https://www.gnu.org/software/sed/>.
> General help using GNU software: <https://www.gnu.org/gethelp/>.
> E-mail bug reports to: <bug-sed@gnu.org>.
>
> sed version (Homebrew):
> sed --version
> sed (GNU sed) 4.9
> Copyright (C) 2022 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.=
html>.
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> Written by Jay Fenlason, Tom Lord, Ken Pizzini,
> Paolo Bonzini, Jim Meyering, and Assaf Gordon.
>
> This sed program was built without SELinux support.
>
> GNU sed home page: <https://www.gnu.org/software/sed/>.
> General help using GNU software: <https://www.gnu.org/gethelp/>.
> E-mail bug reports to: <bug-sed@gnu.org>.
>
> >
> > >
> > > Add a separate expression to support for armv.* as per error reported=
 by
> > > Nicolas Schier [1].
> > >
> > > [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
> > >
> > > Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/subarch.include | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/subarch.include b/scripts/subarch.include
> > > index 4bd327d0ae42..5d84ad8c0dee 100644
> > > --- a/scripts/subarch.include
> > > +++ b/scripts/subarch.include
> > > @@ -6,7 +6,8 @@
> > >
> > >  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ =
\
> > >                                   -e s/sun4u/sparc64/ \
> > > -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> > > +                                 -e s/armv.*/arm/ \
> > > +                                 -e s/arm\(?:\(?!64\).*\)/arm/ -e s/=
sa110/arm/ \
> >
> >
> > s/arm\(?:\(?!64\).*\)/arm/
> >
> > In sed, this expression does not seem to match anything.
>
> You are correct. I've removed the expression and saw no difference.
> See below with my test case:
> >
> > (or please give me some matching examples if I miss something)
>
> cat Makefile
> MACHINE ?=3D "aarch64"
> SUBARCH0 :=3D $(shell echo $(MACHINE) | sed \
>                                   -e s/arm.*/arm/ \
>                                   -e s/aarch64.*/arm64/)
>
> SUBARCH1 :=3D $(shell echo $(MACHINE) | sed \
>                                   -e s/armv.*/arm/ \
>                                   -e s/aarch64.*/arm64/)
>
> SUBARCH2 :=3D $(shell echo $(MACHINE) | sed \
>                                   -e /^arm64$/!s/arm.*/arm/ \
>                                   -e s/aarch64.*/arm64/)
>
> test:
>         @echo "MACHINE=3D$(MACHINE)"
>         @echo "SUBARCH0=3D$(SUBARCH0)"
>         @echo "SUBARCH1=3D$(SUBARCH1)"
>         @echo "SUBARCH2=3D$(SUBARCH2)"
>         @echo "---"
>
> SUBARCH0 represents the current upstream expressions for arm/arm64.
> SUBARCH1 is my proposal in case we need to cover only armv* for 32-bit
> arm (I think that is incomplete?) and SUBARCH2 is Nicolas' proposal
> (which I can't make it work in the test Makefile).

To make Nicolas's expression work in Makefile I just need to pass 2 $ like =
this:

diff -u Makefile.old Makefile
--- Makefile.old  2024-08-24 21:25:28.525267566 +0200
+++ Makefile    2024-08-24 21:28:32.640477991 +0200
@@ -8,7 +8,7 @@
                                  -e s/aarch64.*/arm64/)

 SUBARCH2 :=3D $(shell echo $(MACHINE) | sed \
-                                 -e /^arm64$/!s/arm.*/arm/ \
+                                 -e /^arm64$$/!s/arm.*/arm/ \
                                  -e s/aarch64.*/arm64/)

 test:

And all test cases passed. So, I will include this change for v2.

>
> Running the above Makefile, I get:
>
> make test MACHINE=3Darmv4 && make test MACHINE=3Darm7 && make test
> MACHINE=3Darmhf && make test MACHINE=3Daarch64 && make test MACHINE=3Darm=
64
> MACHINE=3Darmv4
> SUBARCH0=3Darm
> SUBARCH1=3Darm
> SUBARCH2=3Darmv4
> ---
> MACHINE=3Darm7
> SUBARCH0=3Darm
> SUBARCH1=3Darm7
> SUBARCH2=3Darm7
> ---
> MACHINE=3Darmhf
> SUBARCH0=3Darm
> SUBARCH1=3Darmhf
> SUBARCH2=3Darmhf
> ---
> MACHINE=3Daarch64
> SUBARCH0=3Darm64
> SUBARCH1=3Darm64
> SUBARCH2=3Darm64
> ---
> MACHINE=3Darm64
> SUBARCH0=3Darm
> SUBARCH1=3Darm64
> SUBARCH2=3Darm64
> ---
> >
> >
> >
> >
> >
> > Nocolas already provided correct code:
> >
> > > [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
>
> I think it is even more simple if we just make this change:
>
> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                 -e s/armv.*/arm/ \
>
> Does armv.* cover all arm32 machines? I see armhf, arm7, arm8 and
> armv*, is it correct?
>
> And thanks for checking!
>
> >
> >
> >
> >
> >
> >
> > >                                   -e s/s390x/s390/ \
> > >                                   -e s/ppc.*/powerpc/ -e s/mips.*/mip=
s/ \
> > >                                   -e s/sh[234].*/sh/ -e s/aarch64.*/a=
rm64/ \
> > >
> > > --
> > > Git-146)
> > >
> > >
> >
> >
> > --
> > Best Regards
> >
> >
> > Masahiro Yamada

