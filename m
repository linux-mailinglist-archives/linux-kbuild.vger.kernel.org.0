Return-Path: <linux-kbuild+bounces-3203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B295DF1F
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 18:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F1331F219B0
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 16:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7DF3A1CD;
	Sat, 24 Aug 2024 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/PRsv9n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158661EA80;
	Sat, 24 Aug 2024 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724518765; cv=none; b=kiRPJ0iXUodAdAhSf2jGlK14EHo6z+z7HsSyfOtQofYtmsANdIW0dK9GsoxbJo/LUdUvhu0EOYN2zUhBNyf57/qnD52g2wrveAphqiLUijkATSrRyppAYQQQi2bjZ/0D7nErw4PzWGrzo5a1M06UbD04mwdUavLvggPGA8+X9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724518765; c=relaxed/simple;
	bh=jwegCDTZVCjQdaGUg6fJJD3nD5S+19kGsP4tzr5MXLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJa9OkfBn5LJwmXVERwikVwEdYAdG3K+131/bYxrM+tW527xUorH9Tz2dm7YdnUrKcYc3LcF3yNTor0346niI9PFrKAH2JcmBWJm74x4D2SqirVmoSbRubL+6wB+A3s90Fs0OrbRY4beu74tN5q78o+dLUz5yxTncH9cHInMX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/PRsv9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F55C4AF09;
	Sat, 24 Aug 2024 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724518763;
	bh=jwegCDTZVCjQdaGUg6fJJD3nD5S+19kGsP4tzr5MXLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m/PRsv9nS0g+/jm1ufn3ixFeryfg9TWem1D2QmZRWFZcd4jMHiKAI44MMWNd7La4y
	 xQLq3Zc0ZOU0nfgTef1jRs4kbkQehlMCeLKBZ2zH2AZPL4wWhzgHjChcNg0aPwJEqm
	 /41Zxkv+aIgZXGT8J3hQ6T9/sQSA1eBl1t5peulUdRC5eRArk1plxn64Ejisn5vfEF
	 Wa6G789GQRZnYN//Ap8Oc9UmtXNokZYpXgbJ/r7XM2Bp0SbvCrv4YHE7wB8D4Y9NCn
	 /gBKM6xGTzCVm8BIer+oo1cBq3Z++0etKveuVv0hdOLGit2W8wG2jgfIiiVBNIIhrZ
	 /FkVGTP00D0zg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f401c20b56so26283591fa.0;
        Sat, 24 Aug 2024 09:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYl0AXEAXBAACIiVdjHbi8vOsFpwtGL3Meu0pu1ENXX021vdM7JtunFVrBz7oXtaVc6DZpFeXQPCKfs1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8fI1w+0tuUs6HJCubEy6/jHf65jANwW2pYdX+KwhHtW0xAxe
	wMn0A23fZqSlABdEjn7a3o6IXseD0qQWvFNUo+TRkgufXJPDbE55RiO0wBBtSI8jQQWPxxRSuuV
	gZk635LvuKu+bpexwx/9c/ne8EHk=
X-Google-Smtp-Source: AGHT+IEDaLkR5ToCrthU5GKtqg0fh2wrcBAuTEUsj1XtQmVbRHm96LfawKtwLb37GnUxRyYr7eMjZwu/qph+UojRNPU=
X-Received: by 2002:a05:6512:3e1a:b0:533:4322:d03e with SMTP id
 2adb3069b0e04-5334cbaf0c2mr3482836e87.25.1724518762122; Sat, 24 Aug 2024
 09:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org> <7186b180-6b1f-4b64-9bab-78068822024b@t-8ch.de>
In-Reply-To: <7186b180-6b1f-4b64-9bab-78068822024b@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 25 Aug 2024 01:58:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ46gagVdjYSYGCkFNfdHYnr-qCUfbDq-cUtHWvCGfmnA@mail.gmail.com>
Message-ID: <CAK7LNAQ46gagVdjYSYGCkFNfdHYnr-qCUfbDq-cUtHWvCGfmnA@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external modules
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 9:27=E2=80=AFPM Thomas Wei=C3=9Fschuh <thomas@t-8ch=
.de> wrote:
>
> Hi Masahiro,
>
> On 2024-07-27 16:42:03+0000, Masahiro Yamada wrote:
> > Exclude directories and files unnecessary for building external modules=
:
> >
> >  - include/config/  (except include/config/auto.conf)
> >  - scripts/atomic/
> >  - scripts/dtc/
> >  - scripts/kconfig/
> >  - scripts/mod/mk_elfconfig
> >  - scripts/package/
> >  - scripts/unifdef
> >  - .config
> >  - *.o
> >  - .*.cmd
> >
> > Avoid copying files twice for the following directories:
> >
> >  - include/generated/
> >  - arch/*/include/generated/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/package/install-extmod-build | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/ins=
tall-extmod-build
> > index 8cc9e13403ae..cc335945dfbc 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -9,15 +9,22 @@ is_enabled() {
> >       grep -q "^$1=3Dy" include/config/auto.conf
> >  }
> >
> > +find_in_scripts() {
> > +     find scripts \
> > +             \( -name atomic -o -name dtc -o -name kconfig -o -name pa=
ckage \) -prune -o \
> > +             ! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o =
-type l \) -print
> > +}
> > +
> >  mkdir -p "${destdir}"
> >
> >  (
> >       cd "${srctree}"
> >       echo Makefile
> >       find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
> > -     find include scripts -type f -o -type l
> > +     find "arch/${SRCARCH}" -name generated -prune -o -name include -t=
ype d -print
> >       find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
> > -     find "arch/${SRCARCH}" -name include -type d
> > +     find include \( -name config -o -name generated \) -prune -o \( -=
type f -o -type l \) -print
> > +     find_in_scripts
> >  ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
> >
> >  {
> > @@ -25,12 +32,15 @@ mkdir -p "${destdir}"
> >               echo tools/objtool/objtool
> >       fi
> >
> > -     find "arch/${SRCARCH}/include" Module.symvers include scripts -ty=
pe f
> > +     echo Module.symvers
> > +     echo "arch/${SRCARCH}/include/generated"
> > +     echo include/config/auto.conf
> > +     echo include/generated
> > +     find_in_scripts
>
> This now excludes include/config/kernel.release which is used to set
> KERNELRELEASE, which is commonly used by Makefiles.
> See Documentation/kbuild/modules.txt, other users also seem not unlikely.
>
> IMO this specific file should be added back.


Agree.

I fixed it up locally. Thanks for the report.




--=20
Best Regards
Masahiro Yamada

