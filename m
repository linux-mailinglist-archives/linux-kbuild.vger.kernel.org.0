Return-Path: <linux-kbuild+bounces-7522-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADB7ADB92B
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 20:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BB393AD81E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 18:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E9928983A;
	Mon, 16 Jun 2025 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHkvQ2uh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385C204C1A;
	Mon, 16 Jun 2025 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100260; cv=none; b=tKOUQJk8kLIIg8I6uu77y9xUdwPCr99ZEh1R0UXXAcu0kxGmI48AT1gWx10b7v2vx+jmlWffAgMf8skybaGrUH9sEVF9yPrZcEYw7klb4T80sO+V5sOL98IOCO7sUjEu7yUcPMn3BgeCFdWPllCxoUawltG/XoIpVTMuyzDZBRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100260; c=relaxed/simple;
	bh=O3cwjLR1nWA9GzL+14mlgq2jH/1IszF/eakSRYB/Kgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTNAPjvm66va9zv0E9Eas3j0E/d4QKH08HvUidVLpmw/slHH4IKe0U/x6+Ocz9d8ksGXRSGbR0WxescFPZxKJYDEHygyNrf2gE6xkmBQfLUxPRSIfLbKDB4jKW4ZpFkpVRWDKxNj/0nDLZtmvi4dr/Th0DdK2P7Ccu5lbTwVriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHkvQ2uh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42F2C4CEEA;
	Mon, 16 Jun 2025 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750100260;
	bh=O3cwjLR1nWA9GzL+14mlgq2jH/1IszF/eakSRYB/Kgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHkvQ2uhb8xOzRj67T0Ov8ofLgTpkGDaoUNNrMhfYFye/9O7CmbrCPLfpN+CG8q9U
	 VfMDagsOvJJFE/EfZOxStyLqGFCUmgjdZ0B2Hf1Ylp6Z7YyZUOp2M+GvAFXE/or+tU
	 ZoqFCe6WW9Ly7ZglrCHd/fS93xB5dRE1wxsTHRqNYAm47n2Kr6WrqWkc4QMtj3oIC0
	 GZbROuonYGM0HjsgU3pII6STo2vI3HlbuTVfYDOBz4nfmXJZ7YKN0nuS7mw04uK7B5
	 Mj9T2gSVyCEi3Cme1b4saNTSylUhGIzYa2STGvZS9jtBMYpnpjzehljcSE1LhvkI3N
	 vxa77LjNKkuvA==
Date: Mon, 16 Jun 2025 18:57:37 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Fix build warnings about export.h
Message-ID: <20250616185737.GA23807@google.com>
References: <20250608141509.157300-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608141509.157300-1-chenhuacai@loongson.cn>

On Sun, Jun 08, 2025 at 10:15:09PM +0800, Huacai Chen wrote:
> diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
> index b37cd8537b45..db22c2ec55e2 100644
> --- a/arch/loongarch/lib/crc32-loongarch.c
> +++ b/arch/loongarch/lib/crc32-loongarch.c
> @@ -11,6 +11,7 @@
>  
>  #include <asm/cpu-features.h>
>  #include <linux/crc32.h>
> +#include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/unaligned.h>

You can drop the change to crc32-loongarch.c, as it would conflict with
https://lore.kernel.org/r/20250601224441.778374-8-ebiggers@kernel.org/ and
https://lore.kernel.org/r/20250612183852.114878-1-ebiggers@kernel.org/ which are
in crc-next for 6.17 and already handle this issue.

- Eric

