Return-Path: <linux-kbuild+bounces-2506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43A930AAD
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 18:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1721C2099C
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 16:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B400513A88A;
	Sun, 14 Jul 2024 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcUfSXml"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76E13A3F2;
	Sun, 14 Jul 2024 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720973073; cv=none; b=NHoSayXt2Gtx43G2AXC4l9WXlYPX6xgnjg1515IaKs0+4nbFQb9ef4eWFRUUgNuriWUbpmDJxW+ZJGlCygcYHylyHGiZTohZ0oT2x8eWcduasFynlKHWuFW2IzXRGvuyhig0s5YeakLtHATgF7w7UJTwavMlmq6ECPXWDe3ZJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720973073; c=relaxed/simple;
	bh=RTRRO2vy8xanQCybUH+Edw/XKXY47rLbPwqieJG/dIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjYTiYc0+41icgUlXTYiNFWMG+tQ+qGExxxlOt7XdKpOsDzYMa8/iG7dlEvJeVDGU3omPRJxwOPdU0ccqzMMfnI1o8qaSSPxn9rGALZp3UL5UClz3kdkMzk/tIsE5dzX9K7R52KnOtE1a4GjJPLbcm8pKMwdGGoQktYvBL8mNdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcUfSXml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288D3C4AF0F;
	Sun, 14 Jul 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720973073;
	bh=RTRRO2vy8xanQCybUH+Edw/XKXY47rLbPwqieJG/dIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcUfSXmluqODgVtEGBEl4ZAkQX71IxhfECLyGW2eqQgb0UtrPoBu575B2nBrG2hse
	 4HX0FV0vPitiH+wR2UrahzuVV7tDQd88I48iXX+v3SB9iZjQZ3E3G5wiIGkuLqz9Oe
	 +dkb/zJbga1hopF0uAyz5EefmOQdR3Aa/bCHsACpKSJE8e1v6VOHAQgdLm54kwdXD/
	 LRI/tz01sOMKeQkrX+jTB0SETVSmXukdDnBl9rFZTKlOpo9tGbgNnREwbqjiItgHcc
	 i0jOInevgBJzGmEj6a5rcuJA86aWboBSs18Q5vlm431VJlAgOZaJVLrmfbDZX8Nawu
	 O/hsfAvcZGIVA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so4045698e87.3;
        Sun, 14 Jul 2024 09:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ejKlQvGM6ypHl9AsFUa/yobJ/GJvl67n98NbOGW/SqDqB6spS8HvMZQ1c1thS+lKTqeDQt3CEVuXcsmHKY7HXqXIvJDUC53Emhek
X-Gm-Message-State: AOJu0YwSrAsD7NEdgOcbSS9egq7m6zl9WaE9xniplPyv9tMDVDgc3aNu
	iH0Y/eRHGT1hVz6P+YGThkPQ6k/+UNb6fJOr4wQZUuw6EKIQvWp0D19TxSvqJeoc3UmzJThL0fD
	vmWAW76obmF3XgexfUPVmwhgYmyY=
X-Google-Smtp-Source: AGHT+IFMbVpyQOUTQfz4C2QbL0ZoRp3rK1Fqy8y49fsUczHYiQZGDnleJYxsLxCm3b2ysq5czE8hYaucdC50Iv6i7R8=
X-Received: by 2002:a05:6512:3f18:b0:52c:e312:2082 with SMTP id
 2adb3069b0e04-52eb99d2087mr12166834e87.54.1720973071785; Sun, 14 Jul 2024
 09:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714105848.1844400-1-masahiroy@kernel.org>
In-Reply-To: <20240714105848.1844400-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 01:03:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATEdKf6PsOXnnNOyKkbRtOObV84pok8jsR64k_GNDkG4w@mail.gmail.com>
Message-ID: <CAK7LNATEdKf6PsOXnnNOyKkbRtOObV84pok8jsR64k_GNDkG4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 7:58=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The condition 'select HAVE_ARCH_KASAN' is always true because
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


I expect this patch will go through the arm64 tree.

(I just sent it to the kbuild ML by mistake)





--=20
Best Regards
Masahiro Yamada

