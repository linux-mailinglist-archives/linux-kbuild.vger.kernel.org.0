Return-Path: <linux-kbuild+bounces-7043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50862AB00A1
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 18:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852D5980075
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 16:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE1E283686;
	Thu,  8 May 2025 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAYzuZT/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CF281526;
	Thu,  8 May 2025 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722670; cv=none; b=pgBVfsqSmREK1KPeYrXOf8kXieEY+38L0UvOT+L4255ndG1KH7Y1Tvac7u61VAMgSArumHArVP/R8WIQ7BxBO4ZB86Vk03dLnPcbrZ6vcslUcf3+iBHuSgW0dFrPrYSXJ/zrNPxVlL8sSWdUJ3YoG5zjUQrAdNQUN4x7eFMWEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722670; c=relaxed/simple;
	bh=Yj5rWdXL1B0PS35xQgfhOTmqhutON1mnNoRGG+yajEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OS1qnZBuQwMfAsLWHjrhpeTxA98SQnJdhikbVTJCF8cUvl8g4vYYBm0h/rlFEXrBfvEhqDhw21jW8TZY9L0yKQFvbO7ZRa6SIX1qHACqLBw/yuhbOuARK8AO8P4k+mn+pfYozP0WT9xmK27Y19GXlbTWW644dl1cLSiQt5Xs1es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAYzuZT/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3728C4CEE7;
	Thu,  8 May 2025 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746722669;
	bh=Yj5rWdXL1B0PS35xQgfhOTmqhutON1mnNoRGG+yajEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAYzuZT/sMyR1TSxvGZS7X+IVCqH9v/k7ODamg/4LbWc4rX16tadh5AD+m1zqyVBq
	 8NisPidG7OO9qhaYRxeBAB4MbYh0btpH8MMMjpZr4X2MTzG/tGqS5kVyL1vzbCgwYN
	 Ta2gnEc35a4H6R90H/aBxsCaD3Pa4pxOcOaQgdakPXOoTvZ+xcXnmKPwx18gdM9lBR
	 IaEeSUyKV9ziI6cZOXhQfWuMP10VQAD5PTA8Ay7fitXX2TPDQcW55pAt6Kb7zxxNmc
	 a/sLHrbXqe+YTr6nUwpxJTjpcccLu1yBVLQcXGxMegNWlqQ0DEs2eSxRSo4RNkHNVb
	 2t8lwOtHo9xCQ==
Date: Thu, 8 May 2025 17:44:25 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
Message-ID: <20250508164425.GD834338@ax162>
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507133043.61905-1-lukas.bulwahn@redhat.com>

On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes the
> config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
> compiler option '-fsanitize-coverage=trace-pc' by now.
> 
> The commit however misses the important use of this config option in
> Makefile.kcov to add '-fsanitize-coverage=trace-pc' to CFLAGS_KCOV.
> Include the compiler option '-fsanitize-coverage=trace-pc' unconditionally
> to CFLAGS_KCOV, as all compilers provide that option now.
> 
> Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Good catch.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.kcov | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67de7942b3e7..01616472f43e 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
> +kcov-flags-y					+= -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
>  
>  export CFLAGS_KCOV := $(kcov-flags-y)
> -- 
> 2.49.0
> 

