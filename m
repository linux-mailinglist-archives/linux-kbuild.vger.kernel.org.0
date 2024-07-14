Return-Path: <linux-kbuild+bounces-2507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55612930AB5
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 18:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC372815F8
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 16:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B042513B58A;
	Sun, 14 Jul 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEheAirS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496B13B294;
	Sun, 14 Jul 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720973205; cv=none; b=gJft1cHh5pTEvUs0YLh2S0gokXF9NplFd5yct+2F3VzNOvRCgkDcy51rw/t7UtZls4/wNu9AFU+heDQfnxpx9GVRwcgPzyNQ2E9uUy9h/W/hjcZUm6P+X62WXzkmhStPUQ0vqwNOTur2fuQdKjugV9awKpVecgK0EvD1zLnWfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720973205; c=relaxed/simple;
	bh=+jjEnFqgIAm/nLJa3G3sR5yN8iMPt3IP080beHHv68s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJl0ZTkL36/iSkN3sOSDXbHlVjPbXfKUpUBJYCw2n7pfx7H8CKbr8Yd+oN8kY/Cf9+pW22wRJ15wc/vwkJ3m7ct+n+dgPxPVYx16nVztmFYxQF5u+Q+NKK7QReMaNrsgPTBinRqRLz5oNx46yrMVHggFs5sAH7cVnEsyfe1GGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEheAirS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0659EC4AF0E;
	Sun, 14 Jul 2024 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720973205;
	bh=+jjEnFqgIAm/nLJa3G3sR5yN8iMPt3IP080beHHv68s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pEheAirSZv59K1lHfw7HOmAtUTOvzsFcNyaGX3cbSrjvqTXSAcWltHtvuzkZk98+v
	 sVctC48CLtHQuf3wMNY+9TnfrsqfOa/DPf+QKR+v9zosRsfWBViszxzAzKeeibX4H6
	 vIkZsT2/IbGplHdkE+CLYZ3suhmJbbSjbWoqPO5tfsri0RnDuj0Z2Q8VBkx9jNcCWN
	 jNyPGxJaetGzHptnovtCaKKQgxmnLM1/SGuVW9h8jZYV4sWi8ldPEz4839zy/2ZJlg
	 diI0PACmAW4MGiHTJpJmuD4GFka9d+0qRvMS7LPrpQwi/5kyc8e3RP3ch59U3IyK9O
	 HVbGlIxWCb7bQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so4047350e87.3;
        Sun, 14 Jul 2024 09:06:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxxv6TPIJOImz3VaQ7w03nB2amRuQ/HnrIyZbjHhH2tvbbj9gH3
	29HO3fTqoA8Dfwki6uOOQb3BZJTmG3MkA7Pf1xJeVf2r1LR9VQGnXkp1xJVGe9nYrFu6ECtqWcD
	1m04l2wmf+3b5GwBaQY6kiDblgYw=
X-Google-Smtp-Source: AGHT+IHy2WRl4bGfvM5gXIwRE+I8rysac+ubdYHf13aS+QB5bwVbfaDtc+CiyBxeeDrTIzKzHfx3WzsQfh93F5A5PUs=
X-Received: by 2002:a05:6512:3b1f:b0:520:36bb:a6e1 with SMTP id
 2adb3069b0e04-52eb99a2c80mr12734885e87.29.1720973203716; Sun, 14 Jul 2024
 09:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714105848.1844400-1-masahiroy@kernel.org>
In-Reply-To: <20240714105848.1844400-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 01:06:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_2fqeUN7e3GdsqmR1R4iqgwEZWLYRQexAs0DqdrKOtA@mail.gmail.com>
Message-ID: <CAK7LNAQ_2fqeUN7e3GdsqmR1R4iqgwEZWLYRQexAs0DqdrKOtA@mail.gmail.com>
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
To: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 7:58=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The condition 'select HAVE_ARCH_KASAN' is always true because


This is a typo.

I meant,
  The condition 'if HAVE_ARCH_KASAN' is always true because







> there is 'select HAVE_ARCH_KASAN' statement above.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm64/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c87d16b12e9b..d37cbfc3031e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -167,9 +167,9 @@ config ARM64
>         select HAVE_ARCH_JUMP_LABEL
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN
> -       select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> -       select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> -       select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> +       select HAVE_ARCH_KASAN_VMALLOC
> +       select HAVE_ARCH_KASAN_SW_TAGS
> +       select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
>         # Some instrumentation may be unsound, hence EXPERT
>         select HAVE_ARCH_KCSAN if EXPERT
>         select HAVE_ARCH_KFENCE
> --
> 2.43.0
>

--
Best Regards
Masahiro Yamada

