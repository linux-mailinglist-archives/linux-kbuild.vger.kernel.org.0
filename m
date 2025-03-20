Return-Path: <linux-kbuild+bounces-6258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B1A6A1E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 09:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC45F1893B0D
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2982121ABA2;
	Thu, 20 Mar 2025 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJAl2gYF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79A215162;
	Thu, 20 Mar 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460854; cv=none; b=K4UX5W4RpouqPD3bvBPtqH4rjQEqVfMRgKJa276nzF+mtpovdmQOFqH4XCyJuzrVNLfO4amPtCjZWCwd+Qe6ojCK+V2m7aS/jCdLb2g7LAYOF1YxVtBihWjwLFGorovm66LYb/SA58gYU5Wm9FBtOdOYG/3Nz8ELo23BIpRfHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460854; c=relaxed/simple;
	bh=F55ugxVH5lNvnYmcUAixAJ8y/QoIFHaC+YlixKioZyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCua+9yx25WLiB+9trNgm48bM2TcPf5ZRurBKGXYwMJs6LM4+CjqioQC6BVJSc4o1Oi3yNsPMLo3WY69m+cauKAfvgo4fjSF/IPYwsMPaMZCrYA+81lJjoTauM2HT2UjJ7OK2io8r1QyZgfInEjJwYTrqRZoy4tHaEYAC8XfVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJAl2gYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFEDC4CEDD;
	Thu, 20 Mar 2025 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742460853;
	bh=F55ugxVH5lNvnYmcUAixAJ8y/QoIFHaC+YlixKioZyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJAl2gYFIZV5wPyhf3FaQZcfrMy00B6eSZGPHh0y5cAkaHkEZfLX69dPmlg6N1huu
	 20wai01+6nkllBGBUjGp3oZ0HaoJ2SJU/faJXornK+ckGpG4KIPFyXsLys7dia7RJ/
	 isu3SFKPqwf+3mHq06v2p8LsrTCbOs8GmL4USTJULfwRNbhGz0o4wZtwZfx8okAXmH
	 13x4BjHncNaFywu29DCMGlP9HByYGIa/ubhP/SL5AGhUCIxSbpyytYxm/DS5DReG+x
	 ko6ueCQIFdk7YOJuDlqZQCLAFCpXHx9vCmhJBF/WQCCkcbqvwp+GgGEQe3CVO5MjlD
	 J1/6/+v0PPzqg==
Date: Thu, 20 Mar 2025 09:54:11 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	R@macos.smtp.subspace.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-modules@vger.kernel.org
Subject: Re: [PATCH v8 7/7] modules: add rust modules files to MAINTAINERS
Message-ID: <cdudbtd7qkspxgglsdfjmd665cqij7u57sdvakyj3wudobsqzm@t7lpbrc3byqy>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
 <20250227-module-params-v3-v8-7-ceeee85d9347@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-module-params-v3-v8-7-ceeee85d9347@kernel.org>

On Thu, Feb 27, 2025 at 03:38:13PM +0100, Andreas Hindborg wrote:
> The module subsystem people agreed to maintain rust support for modules
> [1]. Thus, add entries for relevant files to modules entry in MAINTAINERS.
> 
> Link: https://lore.kernel.org/all/0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com/ [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

And this is what we signed up for here:

https://lore.kernel.org/all/ZsPANzx4-5DrOl5m@bombadil.infradead.org/

Acked-by: Daniel Gomez <da.gomez@samsung.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..ff65178f6e06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15991,6 +15991,8 @@ F:	include/linux/kmod.h
>  F:	include/linux/module*.h
>  F:	kernel/module/
>  F:	lib/test_kmod.c
> +F:	rust/kernel/module_param.rs
> +F:	rust/macros/module.rs
>  F:	scripts/module*
>  F:	tools/testing/selftests/kmod/
>  
> 
> -- 
> 2.47.0
> 
> 

