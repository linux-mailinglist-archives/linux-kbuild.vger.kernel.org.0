Return-Path: <linux-kbuild+bounces-4542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B09C03A5
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 12:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F34B1C225CA
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 11:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCBE1F4FDB;
	Thu,  7 Nov 2024 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofwSPZyr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4E1F4FA8;
	Thu,  7 Nov 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978128; cv=none; b=dbJhya7iuiw3w/AyL1WEsi9gM7S3JDISHVMF6/L4UP6Wv223FQmvIfvxtntlhuWXvKtSTUguPMLi7GY4oek1g2l0633S1McciXKjHf6ajno4EdH5Pbmubd9ANkpV6VX/OOjCkvquNmO6u/s6bhnTmsI3Ss5j0tJf1IFjE5iWAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978128; c=relaxed/simple;
	bh=wbS02V77scOYdGKZZz1iG3AkivFOp7wRJnAr5g/X2r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEvXEFEwOmW6s4g0fwDiLv0iJ5EKNURrFZ5+LfJ/QJvGT8aDgpN+5KX4JIiRQAGagMi2LwLZKsE5gsnFC/LMaarzLnhR45OKjGiwUGOiy0FccwQlQv2y4Z384z2g8nRAyeqXWSvxChjqxEmDLCEYA6Z3ClGfuTG15ruC0NJo4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofwSPZyr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AB4C4CECC;
	Thu,  7 Nov 2024 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730978125;
	bh=wbS02V77scOYdGKZZz1iG3AkivFOp7wRJnAr5g/X2r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofwSPZyrIVv2/JfS6YW5WHoUJ1qQFBcQurfF9TymyF/NWJA+WRzcOzh/nFQAgY7er
	 v/jVE9IcDqxQrEpLIWTUQHwlTpX9G5MczYkmMCpZXDqnfF0KxNF7bnj/teErpIws4T
	 UHBWQUChXLhk3D/3VXIW2w3/1voxjX2dzMBPJ4UAvmzZwIcsFDV92Fe+ZlGWJQhARg
	 53PMl5+ICIdM6qg9UNdVJjiZ7CQwQD4SO9avwxwy9zoOkGmrJmF+yCAd36CFuGneiE
	 epKcETNUVi3UZandmbhLNlAT/DSUCT1iJhcsqVPkDVq5OZ0fB2UahGzs4N1jTYSH5a
	 YhLSK+S2MBCMw==
Date: Thu, 7 Nov 2024 11:15:20 +0000
From: Will Deacon <will@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix .data.rel.ro size assertion when
 CONFIG_LTO_CLANG
Message-ID: <20241107111519.GA15424@willie-the-truck>
References: <20241106161843.189927-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106161843.189927-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Nov 07, 2024 at 01:18:42AM +0900, Masahiro Yamada wrote:
> Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
> introduced an assertion to ensure that the .data.rel.ro section does
> not exist.
> 
> However, this check does not work when CONFIG_LTO_CLANG is enabled,
> because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
> DATA_MAIN macro.
> 
> Move the ASSERT() above the RW_DATA() line.
> 
> Fixes: be2881824ae9 ("arm64/build: Assert for unwanted sections")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm64/kernel/vmlinux.lds.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 58d89d997d05..f84c71f04d9e 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -287,6 +287,9 @@ SECTIONS
>  	__initdata_end = .;
>  	__init_end = .;
>  
> +	.data.rel.ro : { *(.data.rel.ro) }
> +	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
> +
>  	_data = .;
>  	_sdata = .;
>  	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
> @@ -343,9 +346,6 @@ SECTIONS
>  		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
>  	}
>  	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
> -
> -	.data.rel.ro : { *(.data.rel.ro) }
> -	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
>  }
>  
>  #include "image-vars.h"

Acked-by: Will Deacon <will@kernel.org>

Catalin, please can you pick this up for 6.13?

Will

