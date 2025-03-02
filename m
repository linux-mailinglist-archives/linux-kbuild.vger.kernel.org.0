Return-Path: <linux-kbuild+bounces-5941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028AA4B394
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 17:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4851891B9C
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 16:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AE01EB187;
	Sun,  2 Mar 2025 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IR7sbD9D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEDD1E9B37;
	Sun,  2 Mar 2025 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740934547; cv=none; b=MKUxyltXjEtqLCFmav4AyPdCkhrbQe8Qps9TTNDnupAyUpsRS+34Qm3Ro/V8EfR9bBnvjGybKzUQvGDmr3VbLUtwbV67OCOc3jIPZwDR0UcxxD6mdcYbcr69D1rVvn258u600uCcXrIZF5sz3Pgu3k7RrxfXf1FSVLEe7fgaMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740934547; c=relaxed/simple;
	bh=Kl0inhhtEAKWdVtE/zCPaKAPdeGtThGTJyS6Kz/l8Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4GgA3SxOTe8FohyZmRuTlSND541PBiH/A6cp30TtPmph94Ejkf5+Z2gfNYqr4aUEO3GM0RTMiq1uARbbLCmtGGkUjEv6l+7381bsvoJ2O8nxCR+hj1G/JWLYGrRq3N2rb+dSZkm7pBElY/sYGmGEWcwnltG7ezOnWHBBL3veYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IR7sbD9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D7DC4CEE7;
	Sun,  2 Mar 2025 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740934546;
	bh=Kl0inhhtEAKWdVtE/zCPaKAPdeGtThGTJyS6Kz/l8Do=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IR7sbD9D5egv6m7XFSyET5KnqcwtWhGm1oDAx6LgC0wlcNGZF2JvfiKvm4OO2rvCr
	 8hrf3kJbhxSdVDoYxP1BvI3FiKZ+jsBACUshqmGrSFkaOmeY27ybdOnave5WrRX0dq
	 CFOxXfxsaPYD1YavM/0+Ju0nYYdyoOe74HUuCnERZRvBe+/oBHRVRRwvQ5V8XGtlJe
	 l6GgeefA0+ZVBIs3B2TJAqLvbhs7lkU7PuhN1HJGw8RiZoMA9cs6PuzrG/q+e310ws
	 oopyy4kHcIt67s4mkvkYpqRtCD63t4ZlBSca12ex9sEOSY54E5iKU7Hd9a9xfDQKU0
	 Njl6+ohEUc0cQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso38822821fa.1;
        Sun, 02 Mar 2025 08:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwlxjvvUMPLMhorA0xyDB2S4/YGqN/jbEh0px8U4LNusV1HoTjcCPe90n6a/18cvd2LmGVCm0MfoQ=@vger.kernel.org, AJvYcCXTWR81QDVjUdr5e+y7ezdMmatGp/o77bxKxCJeVVFJE4hePgsxX500mWM4Zltf5Jk5OmiMXVutDrnEqwUC@vger.kernel.org, AJvYcCXoigmYuE2ZY96wuoffxGZlU3W26Yu9R41uL05nPLBEPkTj070z76hTtzxmbBC09bF0sR7HleoNYOGrd4xv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G8V/VvwY4m18pZoZwD7oQzHkMtgElHUXtkhrSLpu6FAFeL5p
	srps6QktviWT09vFmU+PbEnO1m+rM6uMJPdmjV0cRyWjxE2g3Ak8YhdN4ALIquy8YEsO6qRCSzz
	HkEoCHXf3kt0eRlA4CzJwrkwlSjo=
X-Google-Smtp-Source: AGHT+IEUrIYv2C81q0rOFaATaJ4eplo7J+QccedNmN+bPBghMPugHldB8iC/IN5TxaxhdIrZG+xIlO/ATI79ji747KY=
X-Received: by 2002:a2e:9a8f:0:b0:30b:9813:afff with SMTP id
 38308e7fff4ca-30b9813b525mr26913941fa.31.1740934545569; Sun, 02 Mar 2025
 08:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 01:55:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHmbeYya5fPdktBtdJiXGWHeVRq00qRFMOhseKir=yvQ@mail.gmail.com>
X-Gm-Features: AQ5f1JowERnkbuGR3wCvYYHBkWAEZ-YeACq7gGskOLL0h2IzoFG8rFmOoj0IGaI
Message-ID: <CAK7LNASHmbeYya5fPdktBtdJiXGWHeVRq00qRFMOhseKir=yvQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: kconfig: Mention IS_REACHABLE as way for
 optional dependency
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 8:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Several drivers express optional Kconfig dependency with FOO || !FOO,
> but for many choices this is not suitable: lack of stubs for !FOO
> like in HWMON.  Describe the second, less favorable way of optional
> dependency with IS_REACHABLE by moving the code from "imply" chapter to
> "Optional dependencies".
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Applied to linux-kbuild. Thanks.

For consistency with the existing documentation,
I replaced two spaces between sentences.


> ---
>
> Changes in v3:
> 1. Significant rewrite to mark IS_REACHABLE as less favorable.
>
> Changes in v2:
> 1. Replace FOO->BAR
> 2. Instead of referencing earlier "imply", move the code here and add
>    more text (Masahiro)
> ---
>  Documentation/kbuild/kconfig-language.rst | 29 ++++++++++++++---------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 2619fdf56e68..c8c20a34525e 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -194,16 +194,6 @@ applicable everywhere (see syntax).
>    ability to hook into a secondary subsystem while allowing the user to
>    configure that subsystem out without also having to unset these driver=
s.
>
> -  Note: If the combination of FOO=3Dy and BAZ=3Dm causes a link error,
> -  you can guard the function call with IS_REACHABLE()::
> -
> -       foo_init()
> -       {
> -               if (IS_REACHABLE(CONFIG_BAZ))
> -                       baz_register(&foo);
> -               ...
> -       }
> -
>    Note: If the feature provided by BAZ is highly desirable for FOO,
>    FOO should imply not only BAZ, but also its dependency BAR::
>
> @@ -588,7 +578,9 @@ uses the slightly counterintuitive::
>         depends on BAR || !BAR
>
>  This means that there is either a dependency on BAR that disallows
> -the combination of FOO=3Dy with BAR=3Dm, or BAR is completely disabled.
> +the combination of FOO=3Dy with BAR=3Dm, or BAR is completely disabled. =
 The BAR
> +module must provide all the stubs for !BAR case.
> +
>  For a more formalized approach if there are multiple drivers that have
>  the same dependency, a helper symbol can be used, like::
>
> @@ -599,6 +591,21 @@ the same dependency, a helper symbol can be used, li=
ke::
>    config BAR_OPTIONAL
>         def_tristate BAR || !BAR
>
> +Much less favorable way to express optional dependency is IS_REACHABLE()=
 within
> +the module code, useful for example when the module BAR does not provide
> +!BAR stubs::
> +
> +       foo_init()
> +       {
> +               if (IS_REACHABLE(CONFIG_BAR))
> +                       bar_register(&foo);
> +               ...
> +       }
> +
> +IS_REACHABLE() is generally discouraged, because the code will be silent=
ly
> +discarded, when CONFIG_BAR=3Dm and this code is built-in.  This is not w=
hat users
> +usually expect when enabling BAR as module.
> +
>  Kconfig recursive dependency limitations
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

