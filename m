Return-Path: <linux-kbuild+bounces-2332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1A9263B6
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 16:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139801C20F45
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 14:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478D246B5;
	Wed,  3 Jul 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvyumqQb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7B1DA32D;
	Wed,  3 Jul 2024 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017918; cv=none; b=omduEAGs0Ey2FfhjfWVCtwJDIAY0LaY6G7PP5Ukd/FMJ4yoQzuaemgqnwEEQ35y0UH2Q1IEyzuoIqzuRPB7v+NKjl7cUP408Cgcz+l84y6BnPmlLgBH+5mFT9N04n0blhZ/D5mUQfKo1QgZ95U1IjTUyV341hys9EbMCYazoS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017918; c=relaxed/simple;
	bh=8MLZSPdKQEwtId+N1rboQzxPCHIumfHyHcWlOBEgzCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0ZN8bIl9+RtOgrfAfFLWcOaRxSfiOzkM40SN7uMxu6C6afoPFDsFwbG/K0r/ocdR+aRdrcbBhe+laS4MyBy7QH/Ejhyh9vF7oQxlS+9a6tHfHE+hpmvBArjJIZ3jLqF2saj3R35O/5VXmz405ZdXDMSeW1tBa19tw29JIaLXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvyumqQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925F0C2BD10;
	Wed,  3 Jul 2024 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720017917;
	bh=8MLZSPdKQEwtId+N1rboQzxPCHIumfHyHcWlOBEgzCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LvyumqQbwIV9k7EByMcycTpXk3y7TBu/z8QYnr5GWBbSH3D8XKVL51kRwPgqhn+qk
	 VfQxRHzUfB5VKegqUc2YAxLog5tPZHSb8t3ujgLjzPXfG92HLF5pXJEKL54wiGEs/H
	 dTS/8X00+Qq4YfdbkDaGthiPkteghxts0BmL6rPmJNd3lZ6oqEumpXKv/qbcSrK92K
	 pwQPbiUByO6ySwBLFhe0NmoQE3i/nRxsIDbfl1NmfkoxXMafGiP7NFmM++pFZ112Jh
	 q7QdLyXFw3RbRZU4sVy3o/RQ9IMIVJmUSGvIz4/+XLKpM0vjUzFypwVN8QnY8NXlVe
	 0lnSQu1AABgxQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so67046421fa.3;
        Wed, 03 Jul 2024 07:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaz6RzqX15f8zw3k3/yyjf/H/K4cMvScUAOKsh0PRv6lAYI0cdXlkYTqNlMR3myF5jBgfihs5sui+JICv21u38NrC5FkcedbqoDXjOOjvMKnjTl/hx3pmcRwRD7QnuoFaazhojF9/NRdZT
X-Gm-Message-State: AOJu0YyO74vScM4NtDpYoP4BkEc+ec7jETxxShY3uy1FhdIDaql+30DA
	AYClwIvb3FX80RtsGioDWBhvNj19r3Qp+Fix31Pi2/iEN2g10L4rZ08+OLT48UYdo1rbiN720IU
	pPinEpZGyl95J6OJkDgD+zL/qMrg=
X-Google-Smtp-Source: AGHT+IG5Sd4bSXWYjGcKQ9KzumasGYwJzCiLLKVPtWZ2LPlWrEZuQpGY/ZV/RDCcxD81zIMMA77mCw772cPZ+k0DB8E=
X-Received: by 2002:a2e:a813:0:b0:2ee:6b86:b0ab with SMTP id
 38308e7fff4ca-2ee6b86b2b9mr73206421fa.20.1720017916267; Wed, 03 Jul 2024
 07:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702234008.19101-1-richard.weiyang@gmail.com> <20240702234008.19101-2-richard.weiyang@gmail.com>
In-Reply-To: <20240702234008.19101-2-richard.weiyang@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jul 2024 23:44:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
Message-ID: <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 8:40=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
> set, since we define MEM_KEEP()/MEM_DISCARD() according to
> CONFIG_MEMORY_HOTPLUG.
>
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  scripts/mod/modpost.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)



NACK.


The section mismatch is performed _unconditionally_.



In the old days, we did this depending on relevant CONFIG options.
It was more than 15 years ago that we stopped doing that.


See this:


commit eb8f689046b857874e964463619f09df06d59fad
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sun Jan 20 20:07:28 2008 +0100

    Use separate sections for __dev/__cpu/__mem code/data




So, if you wanted to check this only when CONFIG_MEMORY_HOTPLUG=3Dn,
you would need to add #ifdef CONFIG_MEMORY_HOTPLUG to include/linux/init.h

That is what we did in the Linux 2.6.* era, which had much worse
section mismatch coverage.










--=20
Best Regards
Masahiro Yamada

