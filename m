Return-Path: <linux-kbuild+bounces-3170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E395CC93
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 14:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2EB286192
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 12:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE233185B6C;
	Fri, 23 Aug 2024 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKy1MTmQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7095185B66;
	Fri, 23 Aug 2024 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416965; cv=none; b=TW3s0pyITXg1PxvZTInGmnM2krGT054hp36+GaWpahj6tvtMyQRYl51b+imlf/BPYA5B+WgjMM8RJ9M8nk2IuEwIxkL4nI30O2M0S0VMmyYk8xgyl1JF+iMZFEYf5kZa8kliNzRMkCjfKe80aUjy2fIDV4ylNqp6eYLRDrgBpYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416965; c=relaxed/simple;
	bh=X3belG1C68W33hIkdPGzW5OOjxb1TvXlrSXn4m+cZd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg1tmxUQH019p6olfRxkkqGBi8vHtsZhc9UMIRJBaYrd38EMerFRGlzlwTc9KgKB7gSzkwqPC2HQ0W8LxV8/bWPV8U6u3Lvy55mGvRSk77tb4jq7a9yEjS0Kt8+b22cJMO/+UX3sC6iuPsU0YIwLGa8KHbNvf7FHa7LvA1Csh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKy1MTmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5B9C32786;
	Fri, 23 Aug 2024 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724416965;
	bh=X3belG1C68W33hIkdPGzW5OOjxb1TvXlrSXn4m+cZd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QKy1MTmQKRZNV5rhvmmwLc/IH1Tvt727f3gUGcvu7IK2mkPfCunkK6BIzUllq9w8P
	 y7jBgBELJG5WRgdXw3VUYusQyhCn6PdmZIwuzHSBPu1d/vsp2a2MczWrRZQTPqTSHn
	 g8iAHhc2SlCZxEjvM/kHJg/Uec4ktYZN0z5MorfawkfyGpIP97sNglXEbrP3zUJALO
	 rbGcDPm3nufftcGb+m0H0Z41HN9IyYUAoGO1m5bVvNY5j5ZamvA0lYQjavgL6e63U0
	 JZOiJ5UvZ6QfqRoq9HDytQw9Y03PQq0fF4QgZxu+OXMOtHc35QjtsLhuXLZ3MCl7MY
	 zXmLG0VsxphLA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334c4d6829so2521528e87.2;
        Fri, 23 Aug 2024 05:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjV/kRYhYLFkSifm0cubfFuJmaIexIiiXjAxGLpmk9eIT5kXClnfQe1uEodQBIg1PRJGrqSwuvHGhpuEk=@vger.kernel.org, AJvYcCV65jhiboJm+7Fcv2ZnkHCX5gAn20/q2kakqIBVaVBWGPwVUkSQ/kKHqIL8Uw2IIU8MffB+7ilPP/v86r9q@vger.kernel.org
X-Gm-Message-State: AOJu0YzVM3sNRxKQYSSgz12KvJfEmuncCHw52mhaeQNDG6S10qaZCr7L
	0tU5bG+9wVIdamqQ7jbHoTKKfOHiw5DI2Q1Gbg29dJQ3D7GJ2kjyLgPlMc/xW6o6Sq4VR3hmaRQ
	HXSfwuSogaup1EFyKIIhkaytkIOc=
X-Google-Smtp-Source: AGHT+IFeCt4ZQKCqJ/gbZeCLpzWQW4K6TaqHsjgipHjgs9Au4P2AYz4XZhBhOuL8zizD8/eCPsb9TBs6Epp+DxVmhzc=
X-Received: by 2002:a05:6512:159d:b0:530:c1fb:5192 with SMTP id
 2adb3069b0e04-534387799acmr1323353e87.16.1724416964187; Fri, 23 Aug 2024
 05:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817151147.156479-1-jose.fernandez@linux.dev>
 <CAK7LNAQMMTRX94dJVWiaB5iVFQcVwCUXGQFEHQN_S0ZWjQTZKw@mail.gmail.com> <c7jdqfgb2cavfvu2obojgbccq56cevd5ojaiptp3riz5sxebhh@k4bk3vv6f3jv>
In-Reply-To: <c7jdqfgb2cavfvu2obojgbccq56cevd5ojaiptp3riz5sxebhh@k4bk3vv6f3jv>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 21:42:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASckKS3b-kOSFuVqPfu5Qx7DEX6HU7dqrivCzT-rGh8WQ@mail.gmail.com>
Message-ID: <CAK7LNASckKS3b-kOSFuVqPfu5Qx7DEX6HU7dqrivCzT-rGh8WQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:29=E2=80=AFPM Jose Fernandez
<jose.fernandez@linux.dev> wrote:
>
> On 24/08/18 09:35PM, Masahiro Yamada wrote:
> > On Sun, Aug 18, 2024 at 12:12=E2=80=AFAM Jose Fernandez
> > <jose.fernandez@linux.dev> wrote:
> > >
> > > Add a new debug package to the PKGBUILD for the pacman-pkg target. Th=
e
> > > debug package includes the non-stripped vmlinux file, providing acces=
s
> > > to debug symbols needed for kernel debugging and profiling. The vmlin=
ux
> > > file will be installed to /usr/src/debug/${pkgbase}. The debug packag=
e
> > > will be built by default and can be excluded by overriding PACMAN_EXT=
RAPACKAGES.
> > >
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > > ---
> > > v1->v2:
> > > - Use the new PACMAN_EXTRAPACKAGES [1] variable to allow users to dis=
able the
> > > debug package if desired, instead of always including it.
> > >
> > > [1] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X=
/T/
> > >
> > >  scripts/package/PKGBUILD | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > index fbd7eb10a52c..d40d282353de 100644
> > > --- a/scripts/package/PKGBUILD
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -5,7 +5,7 @@
> > >  pkgbase=3D${PACMAN_PKGBASE:-linux-upstream}
> > >  pkgname=3D("${pkgbase}")
> > >
> > > -_extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers}
> > > +_extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers debug}
> > >  for pkg in $_extrapackages; do
> > >         pkgname+=3D("${pkgbase}-${pkg}")
> > >  done
> > > @@ -106,6 +106,15 @@ _package-api-headers() {
> > >         ${MAKE} headers_install INSTALL_HDR_PATH=3D"${pkgdir}/usr"
> > >  }
> > >
> > > +_package-debug(){
> > > +       pkgdesc=3D"Non-stripped vmlinux file for the ${pkgdesc} kerne=
l"
> > > +       depends=3D(${pkgbase}-headers)
> >
> >
> > Why is this dependency necessary?
> >
> Hi Masahiro,
> My thinking was that you may need System.map in combination with vmlinux =
for
> debugging with tools like crash. I don't have a strong opinions on this, =
so I'm
> I can remove it if you or others think it's not necessary.


It is better to not add unnecessary code.




--=20
Best Regards
Masahiro Yamada

