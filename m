Return-Path: <linux-kbuild+bounces-5238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFF9FB668
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 22:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10A00163156
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 21:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295E41C3F3B;
	Mon, 23 Dec 2024 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rl6ZzXf4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210E1C3C0C;
	Mon, 23 Dec 2024 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734990436; cv=none; b=T+WOjUmbG731VcgO49JQcDhGvenDWixxhfjog2l4llH9wO8zZ9DJvDZILvDsCsNvSBlgHH/Rt7Ho58LVVan51R5pWtyFc+DkC+53Z5z+wZ9CKqtn/eBf3gb9YiuM7YysnJ2s9gfaTaOygYq0Td80K/mjdUU71jlevPnZZZ9evwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734990436; c=relaxed/simple;
	bh=trF7QxEOiRc1jBw0jCrLZLo4WoObI44Lx5SByYHZx5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj2bpLFSlOtrt7vkHtJJsCgbGCMd9+1CDj8tcSlcRxYPnPzAYOlB2Tud4ffhHZN1XP1q5DvZOWytQ3sMtOjqnnqlai4xl/7c4igNa5GvfaeZzJ+Ph7pzxdToj7pX4ukwHiUPd203aa1WPr7ewD1BYJ6QZf+HE1u4+R8TmEXBO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl6ZzXf4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22864C4CED3;
	Mon, 23 Dec 2024 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734990433;
	bh=trF7QxEOiRc1jBw0jCrLZLo4WoObI44Lx5SByYHZx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rl6ZzXf4pUhL61Zsbtxc0aRDesSymjJLafD1CwBrGnXzugkHkkJrePfv+gy141VoM
	 6vkXBfcUvdcpG8IgBonQB3+Er1VjTHeIh311ZkLOkdV8zuxUnl7U4GwHxm7xC83EAv
	 73xvRkcNO6kZQ+WQKUi/zjaSI2259PP/PQyRzlAQqm+wzHBgd9W+N4yvEelvQk8swm
	 snqvKNQwR+RY2p+MVkJu8/Ap3t53wmGqMWzdb09cezqJmR7hALOAK710bhwpy5gsv0
	 8Y7GDnLFSOHI9FlnzcotQX1eUbWexNuet3ldgAHoqkbhVTDZ+w+3hnIaX1FslMinyL
	 ayhHTF/WzTNig==
Date: Mon, 23 Dec 2024 14:47:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nicolas@fjasle.eu, ptosi@google.com
Subject: Re: [PATCH] scripts/mksysmap: Fix escape chars '$'
Message-ID: <20241223214708.GC1188382@ax162>
References: <20241223124454.3614680-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223124454.3614680-1-smostafa@google.com>

On Mon, Dec 23, 2024 at 12:44:53PM +0000, Mostafa Saleh wrote:
> commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> changed the invocation of the script, to call sed directly without
> shell.
> 
> That means, the current extra escape that was added in:
> commit ec336aa83162 ("scripts/mksysmap: Fix badly escaped '$'")
> for the shell is not correct any more, at the moment the stack traces
> for nvhe are corrupted:
> [   22.840904] kvm [190]:  [<ffff80008116dd54>] __kvm_nvhe_$x.220+0x58/0x9c
> [   22.842913] kvm [190]:  [<ffff8000811709bc>] __kvm_nvhe_$x.9+0x44/0x50
> [   22.844112] kvm [190]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_save+0x4/0x4
> 
> With this patch:
> [   25.793513] kvm [192]: nVHE call trace:
> [   25.794141] kvm [192]:  [<ffff80008116dd54>] __kvm_nvhe_hyp_panic+0xb0/0xf4
> [   25.796590] kvm [192]:  [<ffff8000811709bc>] __kvm_nvhe_handle_trap+0xe4/0x188
> [   25.797553] kvm [192]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_save+0x4/0x4
> 
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/mksysmap | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index c12723a04655..3accbdb269ac 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -26,7 +26,7 @@
>  #  (do not forget a space before each pattern)
>  
>  # local symbols for ARM, MIPS, etc.
> -/ \\$/d
> +/ \$/d
>  
>  # local labels, .LBB, .Ltmpxxx, .L__unnamed_xx, .LASANPC, etc.
>  / \.L/d
> @@ -39,7 +39,7 @@
>  / __pi_\.L/d
>  
>  # arm64 local symbols in non-VHE KVM namespace
> -/ __kvm_nvhe_\\$/d
> +/ __kvm_nvhe_\$/d
>  / __kvm_nvhe_\.L/d
>  
>  # lld arm/aarch64/mips thunks
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

