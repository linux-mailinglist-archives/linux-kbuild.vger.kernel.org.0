Return-Path: <linux-kbuild+bounces-7731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296EAEB1FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 11:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D0D33B707D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 09:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE75293B4F;
	Fri, 27 Jun 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cluPxEQ2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62F293B44;
	Fri, 27 Jun 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015097; cv=none; b=hgW9IZfEPQy+jzZ5Jd1F+jF1BrNfg8gyvizwuQvm7LEEjFgt091IujVo9cU20N86LJQAXE9Ts1koipaAcdyJ7ufrMino7CD/mO/yJLdCe1AghdWh3LyDsTLTJx6p6fWLv4AHJ9d0q2V8+HGzeBuhpEiBGNYhD/dokWq2UrPGPGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015097; c=relaxed/simple;
	bh=yURdhbEwnnJumfHvPTjAkd6H7BvKAAun9yVi+i2aN8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFB3xJERPSjJZbiRkKbn0O3PVNjXcX7mErsJuHq6nzoBSN42ieYWF/joh7PD7jUPu+HCJGAtJiD3YZ6LtEbf3FIhiaMBi7Sx3Ip6iGTdmGHW3ZhQnFaFQywtV8whLisGc/+XU4DheHmeaG8B9Bqcr6BrsoMny/eBDb9Fzryx1YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cluPxEQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC81C4CEEB;
	Fri, 27 Jun 2025 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751015097;
	bh=yURdhbEwnnJumfHvPTjAkd6H7BvKAAun9yVi+i2aN8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cluPxEQ2/Yw+lsaExWQSqim8gpaPow1MuzmH6AJPjA6FYxLuqysrYot+32JDncobl
	 oRO+xLlxLqHtZfrpee0p2DEjeZOAEtTLveW4sMHVn9km8Veeu8h1JBo7WTsJizO8O5
	 XtaR8ANNpH18kayVwYm4qKjXo0l++K34oakdNEZJNRVffeCuditeRs2YUFlut+QRUg
	 feNsquTpuXRv82ePwbI6/KPObvz7O09jtagsltOnaY2G47TgUPjATvnx10rfXMMLP0
	 nqWQJxiYTDr2WzLm74YsyXLf59wtGxrK4K6fYkkSKcQ6QRibNY37kgjtOgcC6iAuve
	 6AEmdfBqvv7Ww==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5535652f42cso2203101e87.2;
        Fri, 27 Jun 2025 02:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0H/e4FyrdoYc+MIRxtTrBwKWWzKUdP2x3mfpRe7Z+w39boLXkzddgpvTAowEs81evSroi43Z1iNp3k61K@vger.kernel.org, AJvYcCVg1PlV7bdUVCcKLmLqcdW5w5PBqrxiuzQwFkmy8VKXLLw8VWOXnxMoLmrXXM8C4Poaop/O0/LQxGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcVuow9H8v1GFQyuSRk7zhNIBEyztQziE4348ok0BTO/EN7TI
	UJfz13CfUXXBmIp5DZXi+jQ0WMLXKM2/3UdbCSMFtCev/YJ2QLaMKURTsDQninI/yzxoIwd/WyV
	1JWwWlN8Pt0t64VQ0i+jthEwOuTehyX8=
X-Google-Smtp-Source: AGHT+IGWLtzS7qhakWBsIJmXdocEsS4KtnbetBMcTYRSWbAXF/NDfP4A6g/gxgSSz3n8B6djS8GoEVU9YUJHB1nVLJw=
X-Received: by 2002:a05:6512:ea5:b0:553:a469:3fed with SMTP id
 2adb3069b0e04-5550b7e7b6fmr802342e87.11.1751015095791; Fri, 27 Jun 2025
 02:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627030612.3887582-1-rdunlap@infradead.org>
In-Reply-To: <20250627030612.3887582-1-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Jun 2025 18:04:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmi687t4YhCTaVXKr6EKCrNo_zNxzzfVEvDPUs0EGMew@mail.gmail.com>
X-Gm-Features: Ac12FXxO8KMj-DIflB5rQ2UimD06Fs03oI0CCUSQcPokBTFrC6-Lh3hwhtt6SKQ
Message-ID: <CAK7LNARmi687t4YhCTaVXKr6EKCrNo_zNxzzfVEvDPUs0EGMew@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild/kconfig: add alldefconfig to the all*configs
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 12:06=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Add "alldefconfig" to the explanation of the KCONFIG_ALLCONFIG
> environment variable usage so that all targets that use KCONFIG_ALLCONFIG
> are listed.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: linux-kbuild@vger.kernel.org
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/kconfig.rst |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- lnx-616-rc3.orig/Documentation/kbuild/kconfig.rst
> +++ lnx-616-rc3/Documentation/kbuild/kconfig.rst
> @@ -67,12 +67,12 @@ Environment variables for ``*config``:
>      with its value when saving the configuration, instead of using the
>      default, ``CONFIG_``.
>
> -Environment variables for ``{allyes/allmod/allno/rand}config``:
> +Environment variables for ``{allyes/allmod/allno/alldef/rand}config``:
>
>  ``KCONFIG_ALLCONFIG``
> -    The allyesconfig/allmodconfig/allnoconfig/randconfig variants can al=
so
> -    use the environment variable KCONFIG_ALLCONFIG as a flag or a filena=
me
> -    that contains config symbols that the user requires to be set to a
> +    The allyesconfig/allmodconfig/alldefconfig/allnoconfig/randconfig va=
riants
> +    can also use the environment variable KCONFIG_ALLCONFIG as a flag or=
 a
> +    filename that contains config symbols that the user requires to be s=
et to a
>      specific value.  If KCONFIG_ALLCONFIG is used without a filename whe=
re
>      KCONFIG_ALLCONFIG =3D=3D "" or KCONFIG_ALLCONFIG =3D=3D "1", ``make =
*config``
>      checks for a file named "all{yes/mod/no/def/random}.config"



--=20
Best Regards
Masahiro Yamada

