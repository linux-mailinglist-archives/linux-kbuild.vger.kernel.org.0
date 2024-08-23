Return-Path: <linux-kbuild+bounces-3175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F495CDE8
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 15:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8444C2875CC
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 13:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02D4187FEA;
	Fri, 23 Aug 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B52D5KWb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A617E01F;
	Fri, 23 Aug 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724419863; cv=none; b=nck20fACqrt5Dc7v+8G2UQ3HU/fh5mDmiXFGhSGLyz2+6a2quM+Ll1MrIuRLJJjduygrC5dWVGvGvhsBmUrSqEQIqAOudegGwp6IorACHl2IcQ/gineZjNuBYDQtpfrwwmqHjMJE6ySKa+HdWIJRCDYIOWmmOF0l/Cyid00C9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724419863; c=relaxed/simple;
	bh=uWBy1QXUy4iSiVTL09UZnq8++MioabbaOMC8Ky3CKY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGZ2uDBgpfHqqJMIKAZOJaOVDgUk3INWvpTHc5VQe8DXgfjxwAcRxOR1FBHxbbzSoqHkEwu3kvMlL8qA3SSHaboaGksvk70GeTBEybbQsVsXOb8HOwRVUeLRWPrrDVQEu6+7H/9LkasQrNuTMMaa9pMrA9L/AMzInL+JJlCwPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B52D5KWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4825CC32786;
	Fri, 23 Aug 2024 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724419863;
	bh=uWBy1QXUy4iSiVTL09UZnq8++MioabbaOMC8Ky3CKY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B52D5KWb8VQA473MR6SkTQG23rYJLzvRAGAKj/0OLNcjgqVP5H+OMXqMZVduZLzTz
	 DGUTrm7P2GlmlLAZPA9XTPKZ4+vsQRcBD0A1VJa/PW6mDBtbCuIn0RK/pH5TfoJTOb
	 Um82C70SbzYsqG/A7/CX6zkz3ZghB0TUIbijiu4EhXZBhlxMWAhwgSEEi3EKHuNkiS
	 HXKHoGTRp3kBZnpM/kJMZfMoJaM4UfenyEYmmEudDSWO0XLSyqRvOWlB5FGMxc3ORy
	 Zb7J//jRhdpLXWFC3p926/80PFEF5dNHmYidsloiCbHWU1BKdLidaH8vPy1p2UPVYV
	 7d7D5b9xl72zg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso2516278e87.0;
        Fri, 23 Aug 2024 06:31:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOhZK1+Dxa1HvrnMGX3RTWtGME/GDcme00FI5AUxQsTBsjOfhR
	mzZN7Se/v435/j/Jud7nRf4SM7DaO0699y9WtXZ1bBAVlZzhHvPcROFz9kTk+mtxocIBkgOgaGB
	lkZEvempDgVGHY1rhtn2LgNkrfTE=
X-Google-Smtp-Source: AGHT+IHiqkn3rVsHKa1Gn4nut2WgU+hPTrhqC7o8iCR4PsJgl7fr6Rzh5I9fu4AGZeGH0n7mND0YJ9S/fRR6SmZLafM=
X-Received: by 2002:a05:6512:118d:b0:533:3268:b959 with SMTP id
 2adb3069b0e04-534387c1770mr1552178e87.53.1724419861958; Fri, 23 Aug 2024
 06:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816141844.1217356-1-masahiroy@kernel.org> <20240816141844.1217356-2-masahiroy@kernel.org>
In-Reply-To: <20240816141844.1217356-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 22:30:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASoPTc+=BkqLKzt-JazgNYuM-b4Fk54yj3n10zJ8hXTYw@mail.gmail.com>
Message-ID: <CAK7LNASoPTc+=BkqLKzt-JazgNYuM-b4Fk54yj3n10zJ8hXTYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: pacman-pkg: do not override objtree
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Christian Heusel <christian@heusel.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 11:18=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> objtree is defined and exported by the top-level Makefile. I prefer
> not to override it.
>
> There is no need to pass the absolute pass of objtree. PKGBUILD can
> detect it by itself.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.package | 3 +--
>  scripts/package/PKGBUILD | 4 +++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 4a80584ec771..2c261a0d42b0 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -147,8 +147,7 @@ snap-pkg:
>  PHONY +=3D pacman-pkg
>  pacman-pkg:
>         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> -       +objtree=3D"$(realpath $(objtree))" \
> -               BUILDDIR=3D"$(realpath $(objtree))/pacman" \
> +       BUILDDIR=3D"$(realpath $(objtree))/pacman" \


I restored the '+' prefix
when I applied this.






>                 CARCH=3D"$(UTS_MACHINE)" \
>                 KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
>                 KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-versi=
on)" \
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index e2d9c2601ca9..839cd5e634d2 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -40,7 +40,9 @@ _prologue() {
>         # MAKEFLAGS from makepkg.conf override the ones inherited from kb=
uild.
>         # Bypass this override with a custom variable.
>         export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> -       cd "${objtree}"
> +
> +       # Kbuild works in the output directory, where this PKGBUILD is lo=
cated.
> +       cd "$(dirname "${BASH_SOURCE[0]}")"
>  }
>
>  build() {
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

