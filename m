Return-Path: <linux-kbuild+bounces-4951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E979E15E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 09:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 144D41626EA
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB091D79BE;
	Tue,  3 Dec 2024 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qN2Ru9eE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514F1D7989;
	Tue,  3 Dec 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733214945; cv=none; b=sHaMv9NMMrEBqdk2ptDGQQVTGgaNi347ws48eNJ27aCT+sWfleWgjzAAMJj/sJhj2hP7P4jqvZmHF08lqnljbeBlwKzxBMcUxxiWhLAgRM4oZ24CI9BeDEGJYRk2PXGsAR4h3BX5JLii6DymVT2FWVO0CVPhliXp0MJ40v4jEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733214945; c=relaxed/simple;
	bh=t/s6+RptaQ2/EAd4is8JzSOuPRfpzQezj0/HRnq1RbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDVxpfo2ePXxhiZEKGpGNGQORsAhAcrFn3Ei36iowndR1PuDh5fGHBzsDBPlxcq6CChKi/Ns/GQ2/p7wJerX5cq8vUIzusZwTLL6sa608fuzgm7GOaql2/UVg11NWmAnbGW0rY+uWEZEq/wNgY9pmBW2QLdTLnay1qld1tGk5YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qN2Ru9eE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4578C4CECF;
	Tue,  3 Dec 2024 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733214944;
	bh=t/s6+RptaQ2/EAd4is8JzSOuPRfpzQezj0/HRnq1RbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qN2Ru9eEUmrb6wOC+QtBegAL6W3N25eHuDQvcm4wPYF8aK+4PhXUweF8e5UMeTM/X
	 h1EcS8rKw9BhUKg+HgxJW576JbNAkYdWEaHNDmuyL/3bzvKLJPT1qhcE2NRwTwRi+U
	 +Nd4aPSmy8QUpvAb3n8rmULzT/wQKDDonXUNrB9yyxkafkOqL0cxXm1K0ft3WFkH/M
	 jyPCRHEbT21XWXNl08C4/MIbxv++NvCFnFWlR0QBxAKs/NdRoz83XicirueLv4DPHa
	 wwfgGq8mu4s58RoxfRDW7kFu6H6Rixoe6xKYr9lntcJRuo2r8y+UyYIgT1iY2/4weN
	 uqTCGnY9iU/WA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffe28c12bdso47791721fa.1;
        Tue, 03 Dec 2024 00:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb79SeWXPv3CFegCS5IbH4BUKe3+s9k4sjmU/Uqmna79xjU3t6f8LQEiCjAuexwenFcqxtc7KHrMWp4og=@vger.kernel.org
X-Gm-Message-State: AOJu0YymPMjxRoZxjxg3eJkIcf+38f7OsOeWscjJDSlkEgBCZaOFlwZn
	oMJz1AvXFdhty9hxtz3qtjSY6hFGigvygVu6QxW0hiBy1pO24Y1m0dyIRIe+IbkQarBDSD/84DR
	rHinZ6A21waKz0w0rh0TeA8bKud0=
X-Google-Smtp-Source: AGHT+IE2WroKvxHEqwKcEheMFZ+Hly1IRO+7RAkqN8BvDNz/yj5RAt6vtj8HBui7JQvJL41EPYz/nQbZYYnkgyS5cLg=
X-Received: by 2002:a2e:a906:0:b0:2fb:4982:daea with SMTP id
 38308e7fff4ca-30009cb321fmr10338411fa.32.1733214943023; Tue, 03 Dec 2024
 00:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
In-Reply-To: <81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 3 Dec 2024 09:35:32 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
Message-ID: <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
Subject: Re: section mismatch error in aesgcm causing a build failure
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-crypto@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Dec 2024 at 21:27, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> I'm getting this in 6.13-rc1:
>
> /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> causes a section type conflict with aesgcm_tv
>  static const u8 __initconst ptext1[16];
>                              ^~~~~~
> /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: =E2=80=98aesgcm=
_tv=E2=80=99 was declared here
>  } const aesgcm_tv[] __initconst =3D {
>          ^~~~~~~~~
> make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/cr=
ypto/aesgcm.o] Error 1
> /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1 causes=
 a section type conflict with aesgcm_tv
>  static const u8 __initconst ptext1[16];
>                              ^~~~~~
> /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: =E2=80=98aesgcm=
_tv=E2=80=99 was declared here
>  } const aesgcm_tv[] __initconst =3D {
>          ^~~~~~~~~
> make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/cr=
ypto/aesgcm.o] Error 1
>
> I think it's way older than 6.13-rc1, but the inclusion of the sevguest
> driver in the merge window now means that something actually selects
> it.  I can fix it simply by adding a zero initialization to the file:
>
> -static const u8 __initconst ptext1[16];
> +static const u8 __initconst ptext1[16] =3D { 0 };
>
> Which I think means that by default the traditional zero initialization
> of a static variable is in the wrong section (and actually likely is
> wrong for all our __initX variables as well).
>
> In case it matters, this is with gcc-7
>

This also works

static const u8 __section(".init.rodata,\"a\",@progbits #") ptext1[16];

and so this suggests that without the @progbits annotations, the
compiler is placing ptext1 into a SHT_NOBITS section, causing a
conflict with the SHT_PROGBITS annotation of aesgcm_tv.

Given how unusual it is to have a static const variable without an
initializer, I don't think this suggests that there is a wider issue
with __initconst/__initdata.

We're about to bump the minimum GCC version to 8 for other reasons,
and I couldn't reproduce it with GCC 8.5.0. But the fix is
straight-forward and actually clarifies this rather odd occurrence, so
I think we should apply it nonetheless.

--=20
Ard.

