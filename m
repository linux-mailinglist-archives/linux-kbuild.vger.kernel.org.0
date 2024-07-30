Return-Path: <linux-kbuild+bounces-2743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92F940F7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 12:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46C01F26099
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 10:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA65A1A01C5;
	Tue, 30 Jul 2024 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pJv7QNv2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE61A00FF;
	Tue, 30 Jul 2024 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335356; cv=none; b=FSC8L3zByvzbc1ORXknHvxVpuSVIHZ+TJcYNWL8OB7GSjC77FvWObpleAVyeO3RHvLPQxtwG4/zB1EuSQnJiAJYr5q2XrZ+0ZIlUowTyOUcHOmXYfLt3THXF7zKZEgUPkZwPwAmDwt5P10UFD6FKmMsgnc39h0cXENkmTjpwj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335356; c=relaxed/simple;
	bh=gxuMO3WA7r0lRTCSm60P0H7U4GRUl+0qO72i/Ha/vE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQYQcTAyP6AnD6gCd2zEt+swyLP48bfNwREZK222uEUh3IQvu3XkQUCY7YKdyeV3bEyTj24WbYo2C1xO6Y0JqjV6akcVO3+0KuvS6HVALHt2M8EpzAC1ahxGTvngV9fNraEhEw2usGd+mII9zyrFvyPYO0mG4Am9PO/KF/V/Mnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pJv7QNv2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UdM67X/xx61UGIdMltlhRMJOPvzjTnn/1w8+N55YvxY=; b=pJv7QNv282lubpyKXaObaB0MNB
	h7s2YOCwEZt6EB4CfjWBhta4zMAswtkW1OyBa5vDPGj1ntXpxdQztUFD/9Lk8d88/1USHrh6JG2sf
	3qF0EJVe0lBURuMaHu+N/GIaq4HVMeM+Q/66W76laFcmFJWuiuIDHjIAgE67SQYd93NsPEcee7B+6
	PX0fxskSHyxCyMbgksZbbiEa8IVJCbkPr0qw5XZuUWNpJQCbTkxe6jvkNlCCRSdbzzQlJlod2SEoQ
	9qg2VQWI5a5YpbZzCx402SFbQp/IEm/CRvv9CeiM3dvOUBA0tLGi5RQE35lkiA3rGZMLtwLNt4fpz
	SYEzHqOg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYk6E-00000004yS0-0Tnp;
	Tue, 30 Jul 2024 10:28:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D37573003EA; Tue, 30 Jul 2024 12:28:56 +0200 (CEST)
Date: Tue, 30 Jul 2024 12:28:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
Message-ID: <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
 <20240730-kcfi-v1-1-bbb948752a30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-kcfi-v1-1-bbb948752a30@google.com>

On Tue, Jul 30, 2024 at 09:40:11AM +0000, Alice Ryhl wrote:
> Introduce a Kconfig option for enabling the experimental option to
> normalize integer types. This ensures that integer types of the same
> size and signedness are considered compatible by the Control Flow
> Integrity sanitizer.
> 
> This option exists for compatibility with Rust, as C and Rust do not
> have the same set of integer types. There are cases where C has two
> different integer types of the same size and alignment, but Rust only
> has one integer type of that size and alignment. When Rust calls into
> C functions using such types in their signature, this results in CFI
> failures.
> 
> This patch introduces a dedicated option for this because it is
> undesirable to have CONFIG_RUST affect CC_FLAGS in this way.

To be clear, any code compiled with this is incompatible with code
compiled without this, as the function signatures will differ, right?

Specifically, it will map things like 'unsigned long long' and 'unsigned
long' -- which are both u64 on LP64 targets to the same 'type', right?

I suppose it has been decided the security impact of this change is
minimal?

All in all, there is very little actual information provided here.

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile     |  3 +++
>  arch/Kconfig | 11 +++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 2b5f9f098b6f..484c6900337e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -952,6 +952,9 @@ endif
>  
>  ifdef CONFIG_CFI_CLANG
>  CC_FLAGS_CFI	:= -fsanitize=kcfi
> +ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
> +	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
> +endif
>  KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
>  export CC_FLAGS_CFI
>  endif
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..f6ecb15cb8ba 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -826,6 +826,17 @@ config CFI_CLANG
>  
>  	    https://clang.llvm.org/docs/ControlFlowIntegrity.html
>  
> +config CFI_ICALL_NORMALIZE_INTEGERS
> +	bool "Normalize CFI tags for integers"
> +	depends on CFI_CLANG
> +	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
> +	help
> +	  This option normalizes the CFI tags for integer types so that all
> +	  integer types of the same size and signedness receive the same CFI
> +	  tag.
> +
> +	  This option is necessary for using CFI with Rust. If unsure, say N.
> +
>  config CFI_PERMISSIVE
>  	bool "Use CFI in permissive mode"
>  	depends on CFI_CLANG
> 
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

