Return-Path: <linux-kbuild+bounces-11926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eqkmA9+rtGlNrwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11926-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:29:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97A28AF3F
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E46CE3052BA9
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE82727C162;
	Sat, 14 Mar 2026 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWVm/e4O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA824175A79;
	Sat, 14 Mar 2026 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448137; cv=none; b=NWqLckybCHWJangcJjL6zIz5ExG8NGz4YJWa17+VUUzlhb6NqNL/nttx/sVD1faQGilielX6zg4THXcU8tJTIHADrxKTROuc4+rj/JawuKYJxq58b3S+cjYFHPhLBW0G8JihVobJseiQYEg+0esy4/w5nzvwWqh+gQSxz/GYU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448137; c=relaxed/simple;
	bh=zSE9ZGweC+SFIsH032TFQbSFVYRUcYwmPoW4bQHRezM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW91GqrJGSJftXaGGiMCy9kzgQWnZWtn7zEmplCOlCp1Jx7y+7258f39YeToeDHGuGwQ1WTraD5t6oncuE+JnW/5WK8EyO6M+MHPhX3nWwTo40UfMiMpqmZ2kQDmK2FwSgkWVnBhkqDemZBSqszFaCC1BxTMx+KiMRZIb3qlxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWVm/e4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BB0C19421;
	Sat, 14 Mar 2026 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448137;
	bh=zSE9ZGweC+SFIsH032TFQbSFVYRUcYwmPoW4bQHRezM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWVm/e4OUxlj/A92kYR7Y/AIT1DbGO1/YYGUMfnA/Z/uWpoy8U+OO3g0PasfcD1sn
	 1dkin4Lmf3Mod70C/Y01YmcJKM9KZSkO2dO6hAGVwnwK97nD36PrbfDgVVGUUESddP
	 Y86zcX1El3g7ubhIuj7U3VROlk/TtvAv+BRfc6Rx8w1dJ6sd6r+JFNQ17QHRo6uA8F
	 JCc4Pb3SC53TsksyfFaZmu6jl9zTJ9TTBtu91xxeV/1WYuFwNtPdSOyGGYhIbtaaRf
	 sefWI5TJq8oIxMw7ucBmA/efI7ew9xTcs9/3yYg8J+sjUgn9KwVwqXoFRKD0yVWZls
	 qy9BslFYHmsgA==
Date: Fri, 13 Mar 2026 17:28:50 -0700
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
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] rust: helpers: #define __rust_helper
Message-ID: <20260314002850.GB534169@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-2-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-inline-helpers-v2-2-beb8547a03c9@google.com>
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
	TAGGED_FROM(0.00)[bounces-11926-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 5A97A28AF3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 03, 2026 at 11:34:09AM +0000, Alice Ryhl wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Because of LLVM inling checks, it's generally not possible to inline a C
> helper into Rust code, even with LTO:
> 
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. The C
>   CGUs all have this enabled and Rust CGUs don't. Inlining is okay since
>   this is one of the hardening features that does not change the ABI,
>   and we shouldn't have null pointer dereferences in these helpers.
> 
> * LLVM doesn't want to inline functions with different list of builtins. C
>   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so
>   they should be compatible, but LLVM does not perform inlining due to
>   attributes mismatch.
> 
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64
>   always enable these features, so they are in fact the same target
>   string, but LLVM doesn't understand this and so inlining is inhibited.
>   This can be bypassed with `--ignore-tti-inline-compatible`, but this
>   is a hidden option.
> 
> To fix this, we can add __always_inline on every helper, which skips
> these LLVM inlining checks. For this purpose, introduce a new
> __rust_helper macro that needs to be added to every helper.
> 
> Most helpers already have __rust_helper specified, but there are a few
> missing. The only consequence of this is that those specific helpers do
> not get inlined.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

>  rust/helpers/helpers.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a0990bea81ebce6e99bb397ce7533..e05c6e7e4abb7e6a4c4a3a417e35022dac1d9c58 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -7,7 +7,36 @@
>   * Sorted alphabetically.
>   */
>  
> +#include <linux/compiler_types.h>
> +
> +#ifdef __BINDGEN__
> +// Omit `inline` for bindgen as it ignores inline functions.
>  #define __rust_helper
> +#else
> +// The helper functions are all inline functions.
> +//
> +// We use `__always_inline` here to bypass LLVM inlining checks, in case the
> +// helpers are inlined directly into Rust CGUs.
> +//
> +// The LLVM inlining checks are false positives:
> +// * LLVM doesn't want to inline functions compiled with
> +//   `-fno-delete-null-pointer-checks` with code compiled without.
> +//   The C CGUs all have this enabled and Rust CGUs don't. Inlining is okay
> +//   since this is one of the hardening features that does not change the ABI,
> +//   and we shouldn't have null pointer dereferences in these helpers.
> +// * LLVM doesn't want to inline functions with different list of builtins. C
> +//   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so they
> +//   should be compatible, but LLVM does not perform inlining due to attributes
> +//   mismatch.
> +// * clang and Rust doesn't have the exact target string. Clang generates
> +//   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
> +//   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64 always
> +//   enable these features, so they are in fact the same target string, but
> +//   LLVM doesn't understand this and so inlining is inhibited. This can be
> +//   bypassed with `--ignore-tti-inline-compatible`, but this is a hidden
> +//   option.
> +#define __rust_helper __always_inline
> +#endif
>  
>  #include "atomic.c"
>  #include "atomic_ext.c"
> 
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 

