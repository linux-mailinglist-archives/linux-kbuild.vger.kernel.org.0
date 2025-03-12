Return-Path: <linux-kbuild+bounces-6078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D0A5DC8B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 13:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5801899FB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10256241C89;
	Wed, 12 Mar 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNMvr/ac"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC60F23C8A5;
	Wed, 12 Mar 2025 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741782386; cv=none; b=OF5/EDO7C+oLSBQf+JENRsDjiOeqncLavDkIGh/H9y2G63mIZNO3RkpkpYYS9LmrjAG5EdKGSZIEcP7dTKoWYIxNJCRMNNL9DfNNg4RMGJJCoTPIiRZDqI/RZVTiA3XkIYu5fAPdRl1zss2xfKfvkWBfCcKMUiImNo0QiHOHbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741782386; c=relaxed/simple;
	bh=60bX5leRriG/PeHiLZJbUxrTQl+YufpehzKSr66mctg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMPYFy0GO0j6ZCv0cMeglqOX+C5ua8ovcm0V1z4fq0IGh7/Ssk+r4G0KqRQMrW+1Y5aJ5T2IYU0JEm4qcSOltCwrWakdUn0qtFvbEmSlB2+b/cUe5T1V5Bs7kkE+RAvohdhe7bZ/dGRmxHKyhci38NXokZKKETYvn7fysQD2w7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNMvr/ac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C3CC4CEEE;
	Wed, 12 Mar 2025 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741782385;
	bh=60bX5leRriG/PeHiLZJbUxrTQl+YufpehzKSr66mctg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KNMvr/acQGeA/HLm6Z+vWXcPJ1u8hwYgLNeYP7Gm1gXQLbn+hBMAof8LCTHLneBZz
	 S8sGj8uvuJbxUrsxqyZIVKIPWG863KyuV945bXCD2C3LxNYT4Qp8yThZxr118bTuTH
	 oJRvZqYgs0X+VvMMj9opBOqnkbprwMvk396VmAgX0y4qLjvINMowOcy4lCtrR9dyEF
	 Gba7nhypKj+1jcprxn0mbtYuD1YW+ZPJQnl+kFAmCVsZTWjSkK5wWGnIbJUv4BpKrw
	 oCFESDa85MjjvS8+oyBmXDmMDffmuKY4gkPOXfsrsU6BRTmFlRg9OhGGKXGX+gkHb0
	 WRdw365rHpT5A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54954fa61c8so6924469e87.1;
        Wed, 12 Mar 2025 05:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOF115/yZ4NgjkdrlBxabeli19E3t4wScF+kYAQF1i3ddegmeZcz+YuQ3Rqlkzoc57MJLDx9twby5xOKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnK7mCVN504vOGwbLSOfLxm+ex9fdH4NoOunHGsFdr2+3Aeeq
	dBNOtqbayqgFfnvq/ZnKktrQaOJB6P8888m5qaVA2pQCwD0qfIBjvmcxhZEt+83GVAyJTQAkoQO
	s9uIhixlyGUqinQRcvcDD7N/rSc0=
X-Google-Smtp-Source: AGHT+IEfcz8Z8RBun5aDzMJh/iWeeqlDwaeZQ8mtO44hMbOvcvI/StuAQz9lvME4/cxmWxEJLOgv9z1TSGm4eX6tssM=
X-Received: by 2002:a05:6512:1597:b0:545:1db5:f224 with SMTP id
 2adb3069b0e04-54990e2989dmr7039884e87.11.1741782383985; Wed, 12 Mar 2025
 05:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311190212.634123-1-masahiroy@kernel.org> <20250311192036.GC1958594@ax162>
In-Reply-To: <20250311192036.GC1958594@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Mar 2025 21:25:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwnW_uHZr2CPTKMb2ETm9WxOqTGvWN8GHxXuEAP=Po_Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jp4aTYYfbev7A0r71dgTS2TXIeKs0gpqiNVgyajTXPjL2SsfxA0Wky9G1Q
Message-ID: <CAK7LNATwnW_uHZr2CPTKMb2ETm9WxOqTGvWN8GHxXuEAP=Po_Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: fix versioning for -rc releases
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ben Hutchings <ben@decadent.org.uk>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 4:20=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Mar 12, 2025 at 04:01:33AM +0900, Masahiro Yamada wrote:
> > The version number with -rc should be considered older than the final
> > release.
> >
> > For example, 6.14-rc1 should be older than 6.14, but to handle this
> > correctly (just like Debian kernel), "-rc" must be replace with "~rc".
> >
> >   $ dpkg --compare-versions 6.14-rc1 lt 6.14
> >   $ echo $?
> >   1
> >   $ dpkg --compare-versions 6.14~rc1 lt 6.14
> >   $ echo $?
> >   0
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >
> >  scripts/package/mkdebian | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index 193e33bcb989..80ed96561993 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -167,7 +167,9 @@ version=3D$KERNELRELEASE
> >  if [ "${KDEB_PKGVERSION:+set}" ]; then
> >       packageversion=3D$KDEB_PKGVERSION
> >  else
> > -     packageversion=3D$(${srctree}/scripts/setlocalversion --no-local =
${srctree})-$($srctree/scripts/build-version)
> > +     upstream_version=3D$("${srctree}/scripts/setlocalversion" --no-lo=
cal "${srctree}" | sed 's/-\(rc[1-9]\)/~\1/')
>
> I don't think there has ever been an -rc10 but would it hurt to make it
> [1-9]+?


The current code should work with -rc10 as well.

$ echo 6.14-rc10 | sed 's/-\(rc[1-9]\)/~\1/'
6.14~rc10



--=20
Best Regards
Masahiro Yamada

