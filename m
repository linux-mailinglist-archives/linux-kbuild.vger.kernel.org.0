Return-Path: <linux-kbuild+bounces-8244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6528FB14EBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C410165CC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A8218DF89;
	Tue, 29 Jul 2025 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBlMnCIW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1D79C0;
	Tue, 29 Jul 2025 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797006; cv=none; b=kbdY9kzKOfa6Z2O2hKC1//WRFlecZjHDIKkad8nQvDAtYytPbD1CkbYu+PEKZaiLDCkAeWka74PBjeZyIZ4MzGurvg+MJW5OZPOBCmyVRNayovJPtKzaaGIvKj9RK2PvVsdGZ2if28rwb142syhIqtfWPOx6by23XZg6w0yuJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797006; c=relaxed/simple;
	bh=iPhIiVg9TwoB9JPWKjtvQ8Onj5JAyRBB6ONeNCdp8T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0t5an4ajlFl18ZtuTXCbJwOohxITowhR6MlmHIQeMh800eMnUgnzbuLMJMR8ApdiJQj25BOwX9PlN5oNng4Z5lmjR8Vsl9I7V+XbD3JLywHoXhzKuULv76O4nLrQNAIFXtL8iZXlJp7x0jaK6AFm++ir8o578ystMmcS4bD4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBlMnCIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED1BC4AF09;
	Tue, 29 Jul 2025 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753797006;
	bh=iPhIiVg9TwoB9JPWKjtvQ8Onj5JAyRBB6ONeNCdp8T0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VBlMnCIWzG4oyZMsxFuXDul5/UlDkFlPEPxUv6u18BRWK1GH3fhkvR5jv+AdGihAA
	 KZyiIAErnkNbb1t4bDf45Z1QhSCyVf/rLlbJvPghyIpt84e2Xr7afrW3NaIcfbUxuD
	 mXb8IOXK6vptPHAaXjUvQl7vsnjQPqpxOhuTsvzOav25pzA4reCuyPzJm8FZ7E5Yr3
	 Lg3NMQN1CdxrwkPeauZyf9srMArUBqbZ+UD05uvYyAmCLGgQbkeNtKgnFqiQivzI5i
	 /gYl7mU7iajlN10w4ISwxcBPnKDytJUf9IhWHIZ4PNi5qNIAIIWV9LUtAz2bOiedRe
	 b3NOzSQC3ZGlw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32f1df5703aso45039071fa.3;
        Tue, 29 Jul 2025 06:50:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDvrfdQ1S7d/UtnzCJ6idE8ROTyZyswMR5L2ANHJc/S+MJZrvmNM5i49G4riwM/iIO0OIlkGDB@vger.kernel.org, AJvYcCVlMxI8v8dsEXkwbuSPF6jcfjpnmAriBLCat2Z3/fZ/BmfEJImJGTC30oAOZ/NplfAOhaMNI/h0wUDm+kY=@vger.kernel.org, AJvYcCXSpHWd+lTpVQwQWGvRtug4zw6PH1W228L8eiwAH58wQVRtHqqrIKvuPHHz9kCp1sCa8273YQauUQHOJ2bp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wtSp+irKjt+9BpCWWpoEhbwwoSSywgngWudNpzj/vbtqc3Pc
	bdxS2vyfZQmLhSil3ie+C7BSjfj69sbdGlZlCkQWldygLL+UGY1/cH+ldks5I5UGPHQzIfzRbfu
	YHmsD7mFuP02MRTMaFNaHmuTdlHshUy4=
X-Google-Smtp-Source: AGHT+IHjTXjlLubqpmiu3gm5ussQn49mEbKaEv9t5hEtggHscM2SjIL8pWTxka5L+Ekn5Hu6OgaSCp9uUWiv1iaFzDY=
X-Received: by 2002:a05:6512:acc:b0:55a:3335:b5fd with SMTP id
 2adb3069b0e04-55b5f429891mr3923787e87.18.1753797004777; Tue, 29 Jul 2025
 06:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-userprogs-clang-gnu-ld-v2-1-58464d681407@linutronix.de>
In-Reply-To: <20250728-userprogs-clang-gnu-ld-v2-1-58464d681407@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:49:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXk1xKrCXmdV1jEgtgxGxPvTRr8V=pWczKD++da3N+3g@mail.gmail.com>
X-Gm-Features: Ac12FXwn4YCixa6nQPNSdyepsEY-6I2sE5MwSNSasTN_EsyPsDUJnZulyfXkyec
Message-ID: <CAK7LNATXk1xKrCXmdV1jEgtgxGxPvTRr8V=pWczKD++da3N+3g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: userprogs: use correct linker when mixing
 clang and GNU ld
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 10:50=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The userprogs infrastructure does not expect clang being used with GNU ld
> and in that case uses /usr/bin/ld for linking, not the configured $(LD).
> This fallback is problematic as it will break when cross-compiling.
> Mixing clang and GNU ld is used for example when building for SPARC64,
> as ld.lld is not sufficient; see Documentation/kbuild/llvm.rst.
>
> Relax the check around --ld-path so it gets used for all linkers.
>
> Fixes: dfc1b168a8c4 ("kbuild: userprogs: use correct lld when linking thr=
ough clang")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to linux-kbuild.
Thanks.


> Changes in v2:
> - Use plain ifdef instead of ifneq
> - Rebase onto v6.16
> - Pick up review tag from Nathan
> - Link to v1: https://lore.kernel.org/r/20250724-userprogs-clang-gnu-ld-v=
1-1-3d3d071e53a7@linutronix.de
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 478f2004602da03c9039044e3288f24a13833cc7..7d24245d118c0e903119263b8=
71d2e5c2759f48a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  +=3D $(filter -m32 -m64 --target=
=3D%, $(KBUILD_CPPFLAGS) $(KBUILD
>  KBUILD_USERLDFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLA=
GS) $(KBUILD_CFLAGS))
>
>  # userspace programs are linked via the compiler, use the correct linker
> -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> +ifdef CONFIG_CC_IS_CLANG
>  KBUILD_USERLDFLAGS +=3D --ld-path=3D$(LD)
>  endif
>
>
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>


--=20
Best Regards
Masahiro Yamada

