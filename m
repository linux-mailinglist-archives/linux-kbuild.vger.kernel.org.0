Return-Path: <linux-kbuild+bounces-2526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F659315C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 15:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA281C211CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 13:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C08518E74A;
	Mon, 15 Jul 2024 13:29:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F1518D4BD;
	Mon, 15 Jul 2024 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050199; cv=none; b=H9o7BJ9d5lv7XI5ZSPhkGuei+ZaP80VQRwgqo7w7yAAO4OnB0l+KETkulefsJr6krKTeK7uwD0tNMBj2Xn1ZG0tBNIertJqQbFeb4uOWVwPfEF7n7KBNY2oGfEYsyOJAjYjiBaYCobALyJqOXTlMVpJAAZrGqWC0WTSUKQUYJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050199; c=relaxed/simple;
	bh=LdfFp9Oev6TICDgd3+9casnTksNS7wRLmKcfH5O2KAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUPSV9F0mRb2AB4xBG8QkUzumwzpDphMi3STkdrv556W1ghH/E66XeilNG1JM98vVZFFy6BIIqETvdokwhnS198kTOS4quoEjSk5xO42C72Ft6s1OJVvyZ6oZ5U1NvWerEgnBjPvH/c4ithrFFKjtBmrPrE79zuRyL963SdDmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8D9DA7;
	Mon, 15 Jul 2024 06:30:21 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EAF03F73F;
	Mon, 15 Jul 2024 06:29:55 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:29:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
Message-ID: <ZpUkTZYt5DSHP5aP@J2N7QTR9R3>
References: <20240714105848.1844400-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714105848.1844400-1-masahiroy@kernel.org>

On Sun, Jul 14, 2024 at 07:58:46PM +0900, Masahiro Yamada wrote:
> The condition 'select HAVE_ARCH_KASAN' is always true because
> there is 'select HAVE_ARCH_KASAN' statement above.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks like we forgot to simplify this in commit:

  0383808e4d99ac31 ("arm64: kasan: Reduce minimum shadow alignment and enable 5 level paging")

... where we began selecting HAVE_ARCH_KASAN unconditionally.

FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

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
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> -	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> +	select HAVE_ARCH_KASAN_VMALLOC
> +	select HAVE_ARCH_KASAN_SW_TAGS
> +	select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
>  	# Some instrumentation may be unsound, hence EXPERT
>  	select HAVE_ARCH_KCSAN if EXPERT
>  	select HAVE_ARCH_KFENCE
> -- 
> 2.43.0
> 
> 

