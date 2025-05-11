Return-Path: <linux-kbuild+bounces-7078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D9AB2715
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 09:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 461077A3CEF
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 07:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD691A0731;
	Sun, 11 May 2025 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+AB8vmh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82014A09C;
	Sun, 11 May 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746950088; cv=none; b=LYOJdFqusj4R84kYDk4JN6V2HDb1mZDHzaKJ4Eza9ue+gcoKzFHEroXpKkyKrUyEbmZHc8ixeeeBXd7dO/9kDC1oHcwbrE5YwPP9/Bi/GNsmnhskVowcxaCEnb1txjYnO/cMFOucaq9rgNAFvzAsdrsmze3YKI2u2xK9BcsjDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746950088; c=relaxed/simple;
	bh=KgvWuLu5TUpF+XEUjnoVatiRAl9NxuEB+3LgfTLZt0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2hwBuRpFhdyIrhOpjlnXaM0piEm6mrWt9AtvX4/Laega8iUyUtKJOjmXzpJ0wI9IReXj1yLHD7XB/aVgDbUPQGwUOpZ3wVfNG0KR1FwelycoBjVzOkmuS58b5URoDPR/S1rJB99lDiDmu35YCSYOlb2MmfkjpsyngrZmbTJku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+AB8vmh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984A8C4CEEF;
	Sun, 11 May 2025 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746950087;
	bh=KgvWuLu5TUpF+XEUjnoVatiRAl9NxuEB+3LgfTLZt0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+AB8vmhAS10vF7ZQJGfehbpaGSDo+4xQcdkgE1ph2fpDBH9JqF4AqIO3tWi2+M4r
	 jMXKEGyGB94+om9QNfq//2CmSK/8iKKiNuA9mFF8IO67lHZMHXjMjO+YgQGEJAorKT
	 JPtJ0jGfz9pILBkXCS5lARw2cp4XhQSmDLokKsWn8MBQ1Txb26IWzQWeHfzsedwOVT
	 aXAJKgMkhad8g7tnbukc0ePf4zud5LlguZf0Mu/wysTCOkGs2sejNiHORcrBCfYT2+
	 k6KFb87Tfx8m7+UngBng83OURL6iSH0WzwWOc2vu/b+9Is5a9ZC9S549xeIdYf4dNP
	 h8Zod+xyGqLRg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso3577672e87.3;
        Sun, 11 May 2025 00:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfmxdKjT4BgaplFp2O8IUmCvkMh66CfPEeStfaoaQBxJMZhgg1IvOsHhozlBDSnGTm8TT3OfYFnq1lg2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdkWzC+3yMIjCZgGiB3JSFmwqR4Q/H4YKSzdDwYRFzSfKNSEzA
	RoSBRDwHmcDEtux+fdkYrHAF2bK+FexgA/+AKZCrbHRzj8u7S/ot5tZkf8D1H2Td+YGPmr6Wsyl
	pziMYOBvwgM4oV2il/8EDCGKm034=
X-Google-Smtp-Source: AGHT+IHWqK7uziKxehVAuu+xWXBOVRtMOYO+3UKxvXp9XsUD/fQJaHzCoHvZdBJbTbKh84o/BsLBo/ohoUyYKCILdGY=
X-Received: by 2002:a05:651c:1464:b0:308:e54d:6195 with SMTP id
 38308e7fff4ca-326c461945dmr33682671fa.24.1746950085976; Sun, 11 May 2025
 00:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511035522.62273-1-masahiroy@kernel.org>
In-Reply-To: <20250511035522.62273-1-masahiroy@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 11 May 2025 09:54:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH6M=f=8=MmTjQ6GJCPsywCkozvkfJAf7hK0c8m3QkXGA@mail.gmail.com>
X-Gm-Features: AX0GCFssYGfTPeovmMh1KrZExwzhtI6Kl50uGSrj5QAng_jWgkFRGx23Ih-P3OE
Message-ID: <CAMj1kXH6M=f=8=MmTjQ6GJCPsywCkozvkfJAf7hK0c8m3QkXGA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix dependency on sorttable
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 May 2025 at 05:55, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit ac4f06789b4f ("kbuild: Create intermediate vmlinux build with
> relocations preserved") missed replacing one occurrence of "vmlinux"
> that was added during the same development cycle.
>
> Fixes: ac4f06789b4f ("kbuild: Create intermediate vmlinux build with relocations preserved")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>
>  scripts/Makefile.vmlinux | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index b0a6cd5b818c..d14ab3409da6 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -94,7 +94,7 @@ $(vmlinux-final): $(RESOLVE_BTFIDS)
>  endif
>
>  ifdef CONFIG_BUILDTIME_TABLE_SORT
> -vmlinux: scripts/sorttable
> +$(vmlinux-final): scripts/sorttable
>  endif
>
>  # module.builtin.ranges
> --
> 2.43.0
>

