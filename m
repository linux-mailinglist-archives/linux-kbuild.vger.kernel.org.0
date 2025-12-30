Return-Path: <linux-kbuild+bounces-10377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46657CEA938
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 21:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D2BC3016DEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 20:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C7A2773FC;
	Tue, 30 Dec 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPV7BQum"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CB23D288;
	Tue, 30 Dec 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125022; cv=none; b=kTC/V7SdCJfVkYA5nrPHhrAwznq1VKFF/NolGHmyqAohYLxOpoptetWIjpcR6gVlDD4Pi+/eNPhWh/75LF1AB2q/+EdPTtEAUT1p8j7+yqMyH7lm0N6qmxqUbYN6JBq+U/LbDm6zLQvjX8D8HLDYVGyK6WLe9FekqlJn2C8QKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125022; c=relaxed/simple;
	bh=Thx+nORb8zp8PxkWWwnYA4kbyhZZT9wdRf1FYRDT714=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X38IBiqXc0uaW5j8kKA2iRjCLyWwgle9UIIgm0Fn8VqWX/N2SLdoJ3HCA8N+WjR/GFOeV5CESVd1ClRvZJT/BC6QQDIq4Je4xCRAuwlmcFjl6378Y04trywcXBw9HFmxA/iRIcfiGuA4EOc5GQStm+C66y+gXzRSon6n+v8Ku3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPV7BQum; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB696C4CEFB;
	Tue, 30 Dec 2025 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125022;
	bh=Thx+nORb8zp8PxkWWwnYA4kbyhZZT9wdRf1FYRDT714=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPV7BQumz+Yoo6X42rYr0I+PAAHo4sF19hboFDQbKP/PmVutvZH0Xo0VD+vBYlNRQ
	 b6PzGOceX5aLNWXJL7UfV4dzrUp/sWmIL+s6P5W097LWX+CaIgOBfJrBFjgdmABWEO
	 OCtv1RRKhl+/AO8xJhcnsean1fATa6t9lEOeB0HnQK9HPpk+ge9knBYPM06SdzHIP+
	 +5dlTur+sq2Li8vHqYgy3GFOS5dQO47fXX/Ew8k7/6dr3YJMOmgYSN9+au7FsleZNc
	 LDHRBx13LIZww4IoBuJHYwtMWwQOTC1RPonjo39yvv0wQOVi9z0gVbIOcXMcZg4fBg
	 EEfKz9Vd78JPg==
Date: Tue, 30 Dec 2025 13:03:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexey Gladkov <legion@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
Message-ID: <20251230200336.GA4062669@ax162>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>

On Tue, Dec 30, 2025 at 09:39:17PM +0800, Vivian Wang wrote:
> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
> caused by this chain of events:
> 
> - Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>   vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
> - The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
>   of it.
> - The Image header's image_size field does not expect to include
>   .modinfo and does not account for it, since it should not be in Image.
> - If .modinfo is large enough, the file size of Image ends up larger
>   than image_size, which eventually leads to it failing
>   sanity_check_segment_list().
> 
> Using vmlinux instead of vmlinux.unstripped means that the unexpected
> .modinfo section is gone from Image, fixing the file size problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Yes, this seems reasonable. I suspect this could have been done after
commit e9d86b8e17e7 ("scripts: Do not strip .rela.dyn section") in 6.15
since it has the same effect that 4b47a3aefb29 does but there was no
visible problem.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/boot/Makefile | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index bfc3d0b75b9b..5301adf5f3f5 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
>  
>  endif
>  
> -ifdef CONFIG_RELOCATABLE
> -$(obj)/Image: vmlinux.unstripped FORCE
> -else
>  $(obj)/Image: vmlinux FORCE
> -endif
>  	$(call if_changed,objcopy)
>  
>  $(obj)/Image.gz: $(obj)/Image FORCE
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang
> 

