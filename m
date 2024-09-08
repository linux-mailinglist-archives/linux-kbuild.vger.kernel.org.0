Return-Path: <linux-kbuild+bounces-3479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D719707F4
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 16:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBB3FB215D1
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9FC17085C;
	Sun,  8 Sep 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcHlyBuY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864C516FF37;
	Sun,  8 Sep 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725804362; cv=none; b=au6LsIJAP9/khXXpnS7bekc2yRBpz9nqd6hANDsRHcJVtLU6v9pH98v1xUqbB+CGrIkgMuUYvc0c7U3Ds9/kex7/EzAReqksWuJnjDIOytITHxajaLWnkSluf2XVQo4MHU9J7xKHA2AlcYyGETK+qjttzlsF5H3KimJSXQ5SAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725804362; c=relaxed/simple;
	bh=Ad4/7XPxi3RBCcpnHNdup/IntXAmdAiFzCqV31ZrC8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbUbZXCUUo5FZ/tCOxArufr3hxIGiqNx/8yS1mb75PIMG3yZfudatw41zHro3Gy8ixt/Hs+J0myaUGN7m49bsyH8F2DtmHHeIPqUpJHMSqzp857Ni/uuFeKj7HgBDeuE+SqkVDegfrgcThyC74BlwL5UNhzgbTZ2AMf/S3h3a/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcHlyBuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDA7C4CECF;
	Sun,  8 Sep 2024 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725804362;
	bh=Ad4/7XPxi3RBCcpnHNdup/IntXAmdAiFzCqV31ZrC8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AcHlyBuYBPCOQ7jIB2rntkKpQdPTJ/l7pcHdzNcGFkTWTjYHnFM6WJ5nTP0MW6Caa
	 Zt1ox1IDu3uaP3//4TeYKuDih3pmV8U8zAjj2LN9kHSvhu7Ky/HxAxH61fOdiEzhP6
	 sHgCRPF0qzcgHokT3S6LiNsJko5TbcQWTLxoVP+jp5ddJgH6gx/p4T4ZpzV0sAxAHC
	 1aj4cTK1GRUM95sVNf+RtsMbnQv9lHcE3eQPkpEXfh1bppFpjnQhY3S5iMKvAe0fAU
	 88/sCANnEpsaLV1/cQgcuGTU1kEml3J60TeVpU2uRsvi2qwExQvCPXOQIU7UQ4+1ea
	 4fGxipFZjEfDA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so16773401fa.1;
        Sun, 08 Sep 2024 07:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/u4p9eE5uMCnho9N3tqGVPYazH2MDmSOFFKZBo5+wLDhwbbNdigLhzRYkEPH/yVN7+Z5uKyVC7ij947Q=@vger.kernel.org, AJvYcCV7Qazy1+cDsYyjZyIVUyzC1hmlEp9v2ScODv962i7QwB3nn0EJtU69FGsYLmYOqxxS+BcISs956flhegga@vger.kernel.org, AJvYcCVVEDAARc0smmBZw6Fd0xneKTKrVlXkIsBJIUdz1bcpBtyAYvugKTFzmm1x9HdgXZts+0+XT3LMMLaXhCTx@vger.kernel.org, AJvYcCX1HYWJ/XMD9tzg73aEbX7jTwLQYLK8pVJX0z0uEycSvHKpZNMpKh6GKW0X6YKJgQlRYvJDiETt8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVSDWGb12isV5PQeOReP9asxG+KODmDtmkSahfqzxfXehbPt0d
	9ewk9lRdoN3s+5Bfq3ltyQMIcWoinVhYfLgpolCTyverKfLs/unfA5K2Jm/bGTGW4Z6C0jWS+Ci
	57PvXqQ1L8KeqRrGb9PaGQV4WJjY=
X-Google-Smtp-Source: AGHT+IEekyXzzy8xWmAgDNhgqelhya4e5VFx9Ykjsgx5+vTZUqkhDQk7X/hDch9ahgJlF6RSlE5QnOyvMXW2LHKx9EA=
X-Received: by 2002:a05:6512:138f:b0:536:53f0:2f8e with SMTP id
 2adb3069b0e04-536587fcc5fmr4978005e87.37.1725804360702; Sun, 08 Sep 2024
 07:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-1-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-1-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 23:05:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdvtkSgTGip=Q5gmx5x8X_EYarjkEum+HMtFC83sSnXg@mail.gmail.com>
Message-ID: <CAK7LNASdvtkSgTGip=Q5gmx5x8X_EYarjkEum+HMtFC83sSnXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] scripts: subarch.include: fix SUBARCH on macOS hosts
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
	Nick Desaulniers <nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Nick Desaulniers <nick.desaulniers@gmail.com>
>
> When building the Linux kernel on an aarch64 macOS based host, if we don'=
t
> specify a value for ARCH when invoking make, we default to arm and thus
> multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.
>
> This is because subarch.include invokes `uname -m` which on MacOS hosts
> evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
>
> This allows us to build ARCH=3Darm64 natively on macOS (as in ARCH need
> not be specified on an aarch64-based system).
>
> Avoid matching arm64 by excluding it from the arm.* sed expression.
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---


Applied to linux-kbuild with
Suggested-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks.



>  scripts/subarch.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/subarch.include b/scripts/subarch.include
> index 4bd327d0ae42..c4592d59d69b 100644
> --- a/scripts/subarch.include
> +++ b/scripts/subarch.include
> @@ -6,7 +6,7 @@
>
>  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>                                   -e s/sun4u/sparc64/ \
> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                 -e /^arm64$$/!s/arm.*/arm/ -e s/sa110/a=
rm/ \
>                                   -e s/s390x/s390/ \
>                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>                                   -e s/sh[234].*/sh/ -e s/aarch64.*/arm64=
/ \
>
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada

