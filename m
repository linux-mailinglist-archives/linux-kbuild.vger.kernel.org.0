Return-Path: <linux-kbuild+bounces-8968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011FBA686F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 07:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5473BF8E2
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 05:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F728261B65;
	Sun, 28 Sep 2025 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEZvar7I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B49194137;
	Sun, 28 Sep 2025 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759037889; cv=none; b=ucU34+0gE1MN+PI8iT7HLE5yyG7vh7ogZja63b9s7obsaptTg2wZWIZ+71U2O6/qoQdOz/f709YOY98W+uDQh2f6mqnCeg7EqHdveyjUT7f5ta/XrS7VpJxFZ2G+JyjKLBu49IgE+dsYatJE/x5wwvLViSbTGj7l4eCtxnAedeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759037889; c=relaxed/simple;
	bh=03eDEl2vFW5dt8Z7i6VEbEDuWYL3FWijkg9sF9wftNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMevw5TZMRDZ6Vmn5GFF99powHPCrVaA3BrFxU8MZsQ94MS6GkWTu9k2h6Hh9NGApKK0ke/k4mtm/Btf67oM1x8UF6KQirtE5ECGgAiGj95HgeGcMihRsu7W/cOxHCq0TsQlkcxgGBqzTGhfOY5TKqr5OcxBQhsqQmdtC/buD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEZvar7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C24BC4CEF0;
	Sun, 28 Sep 2025 05:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759037888;
	bh=03eDEl2vFW5dt8Z7i6VEbEDuWYL3FWijkg9sF9wftNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEZvar7IAFF6Eeao0yOf/cSCVqbwl3az4VUVb+2OH7LMx2Zo4iQ5rYdpCwSfCUitn
	 sK0rzU3nO5+uHxbcPJEC6S3cHjkjgPES9pqfyl5+PoQyMsVq4vIsy+mCbpCbNLlxCY
	 PuXg6+ia1ws30g4OnXJ8HURuo0SZ9GNvhTkiuoPzX7k40vOc6Up71NtXhzDtK+DHeI
	 CUzfR8X0sg63eTrAwlZOXvJKxYIBOnAd6yhrjC7AUf6xqfsT/Fa/0CYVaWmyz0srJa
	 dzBEG6HoejkdTp5FgGyMb251U9clu6qs1yj/mWuC3wzWbgn3pg8pkliLPcfqE8eghz
	 f27CyXJInW0pg==
Date: Sun, 28 Sep 2025 07:37:18 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Hugh Dickins <hughd@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] modpost: Initialize builtin_modname to stop SIGSEGVs
Message-ID: <aNjJjoEKAzUjhZqj@levanger>
References: <4590a243-0a7e-b7e6-e2d3-cd1b41a12237@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4590a243-0a7e-b7e6-e2d3-cd1b41a12237@google.com>

On Sat, Sep 27, 2025 at 09:28:06PM -0700, Hugh Dickins wrote:
> Segmentation fault ./scripts/mod/modpost -o vmlinux.symvers vmlinux.o
> stops the kernel build.  It comes when write_vmlinux_export_c_file()
> tries to buf_printf alias->builtin_modname.  malloc'ed memory is not
> necessarily zeroed.  NULL new->builtin_modname before adding to aliases.
> 
> Fixes: 5ab23c7923a1 ("modpost: Create modalias for builtin modules")
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  scripts/mod/file2alias.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 7da9735e7ab3..b3333560b95e 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -94,6 +94,7 @@ module_alias_printf(struct module *mod, bool append_wildcard,
>  		}
>  	}
>  
> +	new->builtin_modname = NULL;
>  	list_add_tail(&new->node, &mod->aliases);
>  }
>  
> -- 
> 2.48.2

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

