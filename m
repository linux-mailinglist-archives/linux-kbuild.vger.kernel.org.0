Return-Path: <linux-kbuild+bounces-3042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926B9548DB
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 14:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E5D1F21893
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 12:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4765D19FA91;
	Fri, 16 Aug 2024 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQa5pTak"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630317C9B0;
	Fri, 16 Aug 2024 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811819; cv=none; b=iLKHKmA021jxH6OFtjqAqaRzFR5Hyjz+sUmmWzjfxDsuAnlk4Ja6tbWlOYZqHLrSo7rhQuXaJPyCECCF2wK2O6H8OAB6H6e1acfbm11+PFF+ls4w/yVvGTbPuibxBBckY7Kl44pEUhmIxpPUJ79ITDT495e9AR3LfxXSqa4wFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811819; c=relaxed/simple;
	bh=zBagcxbMa5+yvrzOOq552TNcqVadUlv9lYDaeZmbv7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdZiN51K2aPi7FiA6zzJJgm3ZLyGwOEc9CNBHpqLF46vApcXxs6lnsht9hdVWF5pcbLdD3zlc6dcElIRmMxvLW7RapasRl5GgSe63kYUTgZBCGaIX0NkkcGjVSLn5knMSY8fZZCHZz/zek7J6fmEGRnsfr17jWnWLYSxwoEkAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQa5pTak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22EEC4AF0D;
	Fri, 16 Aug 2024 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723811818;
	bh=zBagcxbMa5+yvrzOOq552TNcqVadUlv9lYDaeZmbv7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dQa5pTakZSnGHRa4mHcVgxG8Vjw7FpWIrVuHynY7S6sNtkBmTbu1wutT+iiEiiOT5
	 SP+w0tH6Tc+KNcMJbcmdX45kmcApsxGSSwesV0+BShQJYW7q3NZzWYEhQ+PwsKKI0W
	 aPuZI4I7BQu/I4Mtapdeez7qHIrqQiApBkZQSVHhMQlCMzz/NPi6/HQZ2lykHhcG2i
	 PpxkXSwnT0wfJ7Mj7woQHrW2Rf/D8Eeu+9UfNHeywKLS4RANfSd8qt/J9lpa+iFrPT
	 rfSbAwSuGf+xDq589/Wwu8fvwGIxNW7v3OtnpLej7lWHolrPf80qkYKLOZFmLH7kg8
	 /QPQE61HBpapw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f0277daa5so2602299e87.0;
        Fri, 16 Aug 2024 05:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXStWyAK8r1Vn990OLYBDDgXvU34lmPwbB3lwOYBu/VjxK4fhco9r8AQ7MaQE+dofw7Zx9cOFaoyTjCk0OjCCEQtt/rHGu8KSLDJ+iZI5V8cqcmNEFT6xfzzjLoGohOk3cBBD8ChnWWIj/Hs605BR82Qw2XVD6lHrTUrcJXpFOqwyRxPon
X-Gm-Message-State: AOJu0Yx1B97B2yUGvCItsdy/mkJWJClmZwNMoRm1d0Yft4DkninVwy7R
	I+TQ6HBAndWCHrieF2HI4Kl/I2UVdpxCAP/O2dvvwlahWtByHTgmrcwCJkII8jFuPjQB6QdlWn4
	Cel6sbnv1q6YrEHZRYCf4nWsD+R8=
X-Google-Smtp-Source: AGHT+IHi5JgLUaJv3Jn5lpXjTogg62a2Zasdhk/4mdX5PoCB/8KmqqDxU947adSSqytd0FItjd+3PM7H7jrcc+b9c2E=
X-Received: by 2002:a05:6512:ad2:b0:52c:e4bf:d55d with SMTP id
 2adb3069b0e04-5331c692a05mr2375669e87.8.1723811815934; Fri, 16 Aug 2024
 05:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>
In-Reply-To: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Aug 2024 21:36:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnfqcZH7kO-04TvC0aswmC1CV22wm1N0onDM4ezqxcPA@mail.gmail.com>
Message-ID: <CAK7LNASnfqcZH7kO-04TvC0aswmC1CV22wm1N0onDM4ezqxcPA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: turn make command for ccache into
 code block
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 9:17=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> The command provided to use ccache with clang is not a literal code
> block. Once built, the documentation displays the '' symbols as a "
> character, which is wrong, and the command can not be applied as
> provided.
>
> Turn the command into a literal code block.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>



Applied to linux-kbuild/fixes.
Thanks!


> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rs=
t
> index bb5c44f8bd1c..6dc66b4f31a7 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -126,7 +126,7 @@ Ccache
>
>  ``ccache`` can be used with ``clang`` to improve subsequent builds, (tho=
ugh
>  KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between b=
uilds
> -in order to avoid 100% cache misses, see Reproducible_builds_ for more i=
nfo):
> +in order to avoid 100% cache misses, see Reproducible_builds_ for more i=
nfo)::
>
>         KBUILD_BUILD_TIMESTAMP=3D'' make LLVM=3D1 CC=3D"ccache clang"
>
>
> ---
> base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
> change-id: 20240812-ccache-literal-code-block-8462614e91e9
>
> Best regards,
> --
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>


--=20
Best Regards
Masahiro Yamada

