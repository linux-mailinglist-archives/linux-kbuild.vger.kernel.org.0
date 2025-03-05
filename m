Return-Path: <linux-kbuild+bounces-5966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39DA4FEE2
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E761895139
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 12:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA452451C3;
	Wed,  5 Mar 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU/dDzrT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D98245038;
	Wed,  5 Mar 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178449; cv=none; b=UkLcB/t/XRvOuWvvr/+MGSRY3MdLmZpOqB50hQmJUTUGGp5ApgZoPjPMvYkkGfTRJvZ0cLag+8S6itgIydey6GLqx6S2T2YFVmG8WATUSDyJJ8OZSAjjT6gzjoda8kMXeWMAhVsomUM+MTK/mPq+Kj+BeU19TSm9WdRXsfhlVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178449; c=relaxed/simple;
	bh=qYXYZ5+C3bWKtUv+GMDQRy1mJAMki6MHE1s1+CzN1kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOfT+8eFOceniE55n3DGT34RdJyHxASwuH6c6Hwgvsu1zWExrV5dY0RD9AdKxs8FcYkqP7UWY73FRtTj7xVuBeWe4w7bcMk0zRHlG5cUm/dnBqPmaS7wttAyTszs1UjriSeZWBNWVALgLvQWnJYEFefpQKCixQ0O3fBzTz6XYk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU/dDzrT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3A1C4AF09;
	Wed,  5 Mar 2025 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741178449;
	bh=qYXYZ5+C3bWKtUv+GMDQRy1mJAMki6MHE1s1+CzN1kE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DU/dDzrTCPZy0mWbn61tZuYtpSggbgzwRK1KSMLHPD7Zi+LoqG1a/YnDh8+9ZgfVX
	 pCrzNWjclu0zWXUd1X3DmW2aG7rC9MNgOZKKg77G4k7/saYE/8tfEFg67M1Csph/Wk
	 nmWrv7rzvQq74RK3B/LrJVkIjBpvPuuOPKh5TMI+bnkUE+2+/AxKfeCIqbDUD4dxsF
	 TZwpa/12zhQdXDDjyqBiGEjwWg+8icUv+tWlgiw6GPWdM07x7AGzDKc1YT20lUUPXz
	 pJPNrMyx0rnnUf3xipECE28nhcrdtFDLIbp9AORZjXIPbs6paEJsJpchVtsuGriqS5
	 5ryh5FOcNFYKg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5495c63bdc0so4482010e87.1;
        Wed, 05 Mar 2025 04:40:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEHWMyR71EDcErqJIWU22dzc7SoCujYX3msMFniBOqdVXIR4X05YILixcHgxCtb4vU5eVTUok/fvDhWBo=@vger.kernel.org, AJvYcCXQrz3zBRGLd+MkqAfdJOYm7Td0u6x5GCprw4yo79VXklbpo2zhup2ZqjMpqFliox0q2yHcDJEDcnCQKrxJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2z2+Y7pc3ocU5COkmc/B86cpWMCgh/aBToBhgn6NE6N8jMpA
	GBFQyKzb3agiwCCJccqd2unxLe2SxFcxUhlT+SDJzvxbXN8+pAv9b7SzappvGLpopIWeho8DcWi
	/xEHBTTqh6DNrtLeTR7liyW5qCUE=
X-Google-Smtp-Source: AGHT+IHzYBJZlDCLDiJbAYfiaennarwwjhdCKf/5q+hLH3er5IRtsl3gW1laWVC/vL5WUTQUNO7L4DtOnyMte0JHF9g=
X-Received: by 2002:a05:6512:220a:b0:549:5f62:74ca with SMTP id
 2adb3069b0e04-5497d3838b9mr1063773e87.53.1741178447669; Wed, 05 Mar 2025
 04:40:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223011944.902904-1-inochiama@gmail.com>
In-Reply-To: <20250223011944.902904-1-inochiama@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Mar 2025 21:40:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATurBBTtm-6+iEoLiUtgD4iy9efbzGgp6HbuSiV-YF9mg@mail.gmail.com>
X-Gm-Features: AQ5f1JoEqAhZmYo9HCIzq3lQLEKVnh0WkqFF6iKFynH0Ee_ap4wazTmVER9anwo
Message-ID: <CAK7LNATurBBTtm-6+iEoLiUtgD4iy9efbzGgp6HbuSiV-YF9mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:20=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com=
> wrote:
>
> Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
> linux-headers package"), the linux-headers pacman package fails
> to build when "O=3D" is set. The build system complains:
>
> /mnt/chroot/linux/scripts/Makefile.build:41: mnt/chroots/linux-mainline/p=
acman/linux-upstream/pkg/linux-upstream-headers/usr//lib/modules/6.14.0-rc3=
-00350-g771dba31fffc/build/scripts/Makefile: No such file or directory
>
> This is because the "srcroot" variable is set to "." and the
> "build" variable is set to the absolute path. This makes the
> "src" variables point to wrong directory.
>
> Change the "build" variable to a relative path to "." to
> fix build.
>
> Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers pack=
age")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  scripts/package/install-extmod-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/install-extmod-build b/scripts/package/insta=
ll-extmod-build
> index 2966473b4660..c0357ba2ff72 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -63,7 +63,7 @@ if [ "${CC}" !=3D "${HOSTCC}" ]; then
>         # Clear VPATH and srcroot because the source files reside in the =
output
>         # directory.
>         # shellcheck disable=3DSC2016 # $(MAKE) and $(build) will be expa=
nded by Make
> -       "${MAKE}" run-command KBUILD_RUN_COMMAND=3D'+$(MAKE) HOSTCC=3D'"$=
{CC}"' VPATH=3D srcroot=3D. $(build)=3D'"${destdir}"/scripts
> +       "${MAKE}" run-command KBUILD_RUN_COMMAND=3D'+$(MAKE) HOSTCC=3D'"$=
{CC}"' VPATH=3D srcroot=3D. $(build)=3D'"$(realpath --relative-base=3D. ${d=
estdir})"/scripts


Looks good to me, but a nit.

This will introduce a new shellcheck warning:

  C2086 (info): Double quote to prevent globbing and word splitting.

Please keep the double-quotes around ${destdir}

"$(realpath --relative-base=3D. "${destdir}")"


>         rm -f "${destdir}/scripts/Kbuild"
>  fi
> --
> 2.48.1
>


--
Best Regards
Masahiro Yamada

