Return-Path: <linux-kbuild+bounces-7017-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D124AAEC8B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 21:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C0F1C40CC7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 19:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB5F28E59C;
	Wed,  7 May 2025 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2d1cU0/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609CC20C029;
	Wed,  7 May 2025 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647811; cv=none; b=eHh6p79+Hn6RLIrtRPT72Dfe1PfEWffNijuc85yZmZ9nuZclrrC+6f6d2jE6pT7tnb5rl4bXVtDY+lhjtNJl1GMVI9CjL89SWc1g5SFQCvilOKaCp+LhqVBabmhKk+ZMaqKGrJU+OXpW4GeWxySaSpByBc7agu2/+itl0S34Yvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647811; c=relaxed/simple;
	bh=n7i/C4k/NDYrgmMrEYFjLtFupTx5QpBhzxPTi55bTNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPVB9LZNuHqBDzv0oku8CQ7rWqZrOZuMgPx27duHH/D1LRNCRTPlUzAzo+sj1pDb7wAglrHAGzcHzFGDr+/xPJ+/L/mpZzlcVduGzWCWcWZaJwWioxWrjBEk1Pn5AG9PTRogdPwerZrlkvPuwCNhNcqZIjhYkeVAo4V5L1nqaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2d1cU0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C236C4CEE2;
	Wed,  7 May 2025 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746647810;
	bh=n7i/C4k/NDYrgmMrEYFjLtFupTx5QpBhzxPTi55bTNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2d1cU0/StVmFCqO/8YdhsZFgS9XxNkvOkQ+f08KdH5KI6ae3BzJLWJdTnmdk0VK4
	 SgRPlO331cfKe6jk5GKZyrka2txxO87RCEr6eFLVje4+xlopUxmfocpBW1SRUYCT6p
	 yCsdn/cb/8/ShjR0Y7g/SNfV1+2pHNxhP3pRpbvf4GXwNJwuaejF2WOVaXGlpp3CqC
	 zSbFR/vUrbteVIcm6UFyJRBj8IzY4lREGwDnMGEX8BMJKbSXOb3Yvu9zW531hElqk1
	 0y86aorQ+nqYwVfGpxPjirPxYzCG0JcvKJ1GedBODGlo23MtMK4v8TmVgvR3bGPv40
	 uc6MtwPge9GTQ==
Date: Wed, 7 May 2025 20:56:46 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	m.seyfarth@gmail.com, zhanjun@uniontech.com,
	niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: [PATCH] kbuild: Disable -Wdefault-const-init-var-unsafe
Message-ID: <20250507195646.GA3495761@ax162>
References: <7331A23DB8786121+20250507091340.276092-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7331A23DB8786121+20250507091340.276092-1-wangyuli@uniontech.com>

On Wed, May 07, 2025 at 05:13:40PM +0800, WangYuli wrote:
> Similar to ("kbuild: Disable -Wdefault-const-init-field-unsafe")
> from list, -Wdefault-const-init-var-unsafe need to be disabled too.

Thanks for the change but I already sent a v2 of that change to cover
this warning too:

https://lore.kernel.org/20250506-default-const-init-clang-v2-1-fcfb69703264@kernel.org/

> While I haven't found this warning triggered in the kernel code
> itself (my testing covers just a tiny fraction), it's clearly
> something that should be disabled for the same reason.
> 
> Additionally, because dkms uses kernel compile parameters, some
> out-of-tree modules might also hit this warning, like the Mucse
> network driver.
> 
> Fix follow error with -Werror:
>   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6126:11: error: default initialization of an object of type 'const u8[6]' (aka 'const unsigned char[6]') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-var-unsafe]
>    6126 |         const u8 target_addr[ETH_ALEN];
>         |                  ^
>   1 error generated.

For the record, we do not care if warnings trigger in out of tree code,
that is not justification enough to disable the warning. If this warning
is coming from rnpgbe_set_mac() like I have seen in some downstream
trees, I don't even understand why this is marked const when there is

  memcpy((void *)target_addr, addr->sa_data, netdev->addr_len);

right after it :/

> Link: https://lore.kernel.org/all/20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a7b680df5b24..14e22310fbbf 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -44,6 +44,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
>  # the field is within a union with other non-const members, or the containing
>  # object is not const so the field can be modified via memcpy() / memset().
>  KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-field-unsafe)
> +KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-var-unsafe)
>  else
>  
>  # gcc inanely warns about local variables called 'main'
> -- 
> 2.49.0
> 

