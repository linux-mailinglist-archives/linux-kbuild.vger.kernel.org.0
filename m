Return-Path: <linux-kbuild+bounces-3178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D95D2EF
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 18:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBBAF1C21038
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 16:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91389194C8F;
	Fri, 23 Aug 2024 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf+WMIRu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6227C194C6E;
	Fri, 23 Aug 2024 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429586; cv=none; b=Ejc70EMbfX9OM291CzZ4MfusIMPnAKuVHIewWX/Ks+kH2EFvYCqubenuikew5i37XJcbhaBVf5sWHo4Z3kagaIoyv4/AvMJ7VdA81TgAr9xpG9oUtbikzBkkExZivKjg8xV6rvzb7yQo0Xh8eBBbih7elaOc+OnZ7NfVjEi6Q7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429586; c=relaxed/simple;
	bh=302mPfppIzV0eIiBLegANXAiB+NF/JryI6zwyAqPKeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOocNxTBYVq7Th/YAtRJdhTz5eRCGFBMJzNj+HqdfbCHQNi7g9oX7FhjYV4HwQgfXPJnjAAdd0TeM9sxnX/yLYfQ81g+dE+nWJvjoOAQx18yg3yfzSX36DMXhFF0B9Zo8AOqmXdX1d5H8fy6RNKdPCuEsBXLxLAKT4Q4H88plRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gf+WMIRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAE1C4AF4D;
	Fri, 23 Aug 2024 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724429586;
	bh=302mPfppIzV0eIiBLegANXAiB+NF/JryI6zwyAqPKeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gf+WMIRurTbcCUp5XG/SJqSuNJlC/5jTbjfrtjz9Bke6unn38fmcRN+YM+/H/43FY
	 lbsc3h6ZC8f35iYEa6UeUssIiTd08RvXwBi0MjdL4zAyp5kjx1JxZ/jC1iaIgqVRiC
	 ur7OZG2hFz/jXs+MMeV/l8lH7W26g2wD/QYWC2kZo7w7gmoo9/4AMNkWWYGV3JSqVU
	 VYLEbcUT4YrL0R0e4pLlZFcUYiVRRx3QTP0KTf1NhMoH/d4g/aTw9/BbDf/isvQzr/
	 EiLGa0gp/ERZgq1t2tqvHzgTKwOtnypPYBaPN7Is/mZCf7pHacg835+FQlJc3L0cNq
	 yW2ydpGu7UQUg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f2868710so14781871fa.1;
        Fri, 23 Aug 2024 09:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4dtKyYllwF4ECh/AEz/nv6RBn3AfXe5jdt7DnwHsEn3hZ7TU7zlRRcpANGS4oMEWM8k57w8l+L+s7cgrg@vger.kernel.org, AJvYcCUB3KLjEX7KA+dYVScl6b9AepdhGtS9gTERvm7GlwcE5mUovMIz6uz51CLguTk3r1chX1OjbeqFGB46PxM5@vger.kernel.org, AJvYcCUf5ApO14XWXf/zYprqgsSiv7+/6XpNea+Qm8e1BQf8AlMJmRu7Egu/Q2BAPNcYGDRHITolJaOKtKJqNeo=@vger.kernel.org, AJvYcCXG5fgHC3NepXiHhjK4wxKPDne+jMK8XXViuXobwQ5RBvYAsU7NZLjpitPl8h1Oj8FrBEkUXcIFIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMmPFwTvL7kwvsydF6wh5gWVCJ+NQXuntP22DbnOxFp4vfLNT
	TZHqHR+hDKfj9bY0mHCPjNvU1KPwVB60MZwSk5uF76qlH+hNt55xLc5JapAj1jXPmtET0UZR8HI
	NhGUSxOfjzeU8Hd87f+4lnvpI/vk=
X-Google-Smtp-Source: AGHT+IGLQePVn5RhKmrGdV43WiO6IyDdZ4P8M+JxvZmPPDeIiajBOGYYWmzAWjRdCByIm/YmPmOehjlJ0SdmJRob6wc=
X-Received: by 2002:a05:651c:1505:b0:2ef:2dfd:15dc with SMTP id
 38308e7fff4ca-2f4f48ef636mr23768021fa.9.1724429584330; Fri, 23 Aug 2024
 09:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com> <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Aug 2024 01:12:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
Message-ID: <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
Subject: Re: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
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
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
	Nick Desaulniers <nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Nick Desaulniers <nick.desaulniers@gmail.com>
>
> When building the Linux kernel on an aarch64 MacOS based host, if we don'=
t
> specify a value for ARCH when invoking make, we default to arm and thus
> multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.
>
> This is because subarch.include invokes `uname -m` which on MacOS hosts
> evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
>
> This allows us to build ARCH=3Darm64 natively on MacOS (as in ARCH need
> not be specified on an aarch64-based system).
>
> Utilize a negative lookahead regular expression to avoid matching arm64.


Does sed support "negative lookahead regular expression"?

>
> Add a separate expression to support for armv.* as per error reported by
> Nicolas Schier [1].
>
> [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/subarch.include | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/subarch.include b/scripts/subarch.include
> index 4bd327d0ae42..5d84ad8c0dee 100644
> --- a/scripts/subarch.include
> +++ b/scripts/subarch.include
> @@ -6,7 +6,8 @@
>
>  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>                                   -e s/sun4u/sparc64/ \
> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                 -e s/armv.*/arm/ \
> +                                 -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa11=
0/arm/ \


s/arm\(?:\(?!64\).*\)/arm/

In sed, this expression does not seem to match anything.

(or please give me some matching examples if I miss something)





Nocolas already provided correct code:

> [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t






>                                   -e s/s390x/s390/ \
>                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>                                   -e s/sh[234].*/sh/ -e s/aarch64.*/arm64=
/ \
>
> --
> Git-146)
>
>


--
Best Regards


Masahiro Yamada

