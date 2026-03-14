Return-Path: <linux-kbuild+bounces-11925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANgvB0CrtGk1rwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11925-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:26:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F828AF17
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80707308B737
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62BC279DB1;
	Sat, 14 Mar 2026 00:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfELWr6x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100A2765D2;
	Sat, 14 Mar 2026 00:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447974; cv=none; b=I09la40F0Td+bn8tJ7BPP24Cs/RWsgZpAJTkybvxn5LnvWpQSWF5xK1xoRij8zrVocH/gNfARs+WVFNRdIKy1ZZDHtARPHVyY1ktCl/eh33yq+pL9g+BsT/ku6WJqIqxasrUBBN8KegxudxhNNswDA7+bJz4igElIklDVisJWf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447974; c=relaxed/simple;
	bh=WNfONBSSwZlJ93h+nb5fE553EGLxDy6HctjwVBRE1ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYjB6uujO6648vZTbxBn2/4EBnMDCKfvt1BX2etNmfc7fVqOJ1yXU++isDo+Ewm7mkHSUd/Dmrf+v9Kq/+CXOJDzWXyNimZy6nezRelvnbSjRXemrWXHRky+awE+tMaFjbCH47I4XaaC8LIN815ciTP8fdgqeTPowCK73lg2Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfELWr6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C00C19421;
	Sat, 14 Mar 2026 00:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773447974;
	bh=WNfONBSSwZlJ93h+nb5fE553EGLxDy6HctjwVBRE1ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfELWr6xe8ogQ1Dzt1ph1Or4CkDZzba6Dj0w7TfjGFx7fqwjvcmAVVVT0R/DPqd9m
	 0zfwGJ9/PfYd8hnArBJWqLzO8abNX4kfpLdlAoysNoHk9ciuYiB0zrH5APEC+yfDKY
	 i/tbaAiM3xx9fNSd9SYdf8zHtsa5KM10xK+IK0E0s2czV/4ieNNF14jcmVew8CvxhE
	 FxoqUTcKnqL0ahxZjyf6Px/jGf0wbNIEvXaSRnIT/BGKMNNlpkLZtReXfoF8LKAjAF
	 4xr+PT3o09wfsIrp4m5CXbX0OWHNRIwgixKLFri8JEjhqYCYEkVXL1LSOLh0/pw5ZJ
	 UQJipt2AFo4Gg==
Date: Fri, 13 Mar 2026 17:26:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add
 `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
Message-ID: <20260314002606.GA534169@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-inline-helpers-v2-1-beb8547a03c9@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11925-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rust-lang.org:url]
X-Rspamd-Queue-Id: 725F828AF17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 03, 2026 at 11:34:08AM +0000, Alice Ryhl wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This config detects if Rust and Clang have matching LLVM major version.
> All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> matching, otherwise it may generate errors, or worse, miscompile
> silently due to change of IR semantics.
> 
> It's usually suggested to use the exact same LLVM version, but this can
> be difficult to guarantee. Rust's suggestion [1] is also major-version
> only, so I think this check is sufficient for the kernel.
> 
> Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Aliee Ryhl <aliceryhl@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index e95d43457851862afc8313389777e4dd9348c178..0e900d3d8be7874a33e0f44754a8d038e68d7e65 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +config RUSTC_LLVM_MAJOR_VERSION
> +	int
> +	default $(shell,expr $(rustc-llvm-version) / 10000)
> +
> +config RUSTC_CLANG_LLVM_COMPATIBLE
> +	bool
> +	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
> +	help
> +	  This indicates whether Rust and Clang use LLVM of the same major
> +	  version.
> +
> +	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
> +	  LTO) requires the same LLVM major version to work properly. For best
> +	  compatibility it is recommended that the exact same LLVM is used.
> +
>  config ARCH_HAS_CC_CAN_LINK
>  	bool
>  
> 
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 

