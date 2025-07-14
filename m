Return-Path: <linux-kbuild+bounces-8003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA3B039C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 10:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5A4176A68
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 08:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EB6221268;
	Mon, 14 Jul 2025 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K7jUc9ez"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238118D;
	Mon, 14 Jul 2025 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752482804; cv=none; b=bbvwZgHMoqxbdDfSeQnwlfg06U0wN07JZnT+zbcabGLFrf0HXVnqTHREtb2jjq01lEVXsJMjI33J2/rl5V9gHOij8NIb8zmgqegaF4PF+oWrYLWG7s3OWZ5OsDRiClO7wJhs2vILgYX6zgYf9s3C/jMotaQxkJNWnTHcH5H+usk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752482804; c=relaxed/simple;
	bh=BFy8MleXcXtgklpMCeGYGOJYu9f9q7epntNXpb7QDto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YesFEQbXKiqt65arDoBtiIWQ+gXtwvhQGfjWAnO+KpMA+VBNKEJF8omEgD3rix8l5ZGHwx1i7ukeTkCLsTIfFLxpA86zQjdFump6i60jyKE5Sa9T+6wkhGb/znQnTO2TXYRGUXio+Vh9RuzRXfHA96o64CyWlpuPpp/2A3dz7F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K7jUc9ez; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RsVjotjGFwn4gIDgrJ+E8OefcgZwcT0N+CJTunCyL8Q=; b=K7jUc9ez58nrxekhKWTDy3aWp4
	iDC4IIF/G05u3M7NlfaatOz9FE+wZRp8sonmYHGNl7oecBk8slqvLTCAEOnlffc4Uh7N+nAOpk4pz
	SX0XsH0yFKPnTPeiLFNW0okicua/2mvtRMvm3PjjtFdapR6/IQOC/Ah1hBaw5KD1QnhkDxlfIPPB5
	qkFyG2c8vwTbTDwymDVBXJvT9/RLlnQpC1VEtOf3OXeV1aH81Wr9Egk+jGOmjYlxotL3rEOH0uG+z
	8Pu6KYcdwJV89B/vi7ipBBcmkKmY55gGvsMRV8CxQCc+g3zop2Vqr9kk0CwvGjGpoVNxyXULc6olE
	XPAoy1Pg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEpa-00000009il9-39sR;
	Mon, 14 Jul 2025 08:46:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4DB90300186; Mon, 14 Jul 2025 10:46:38 +0200 (CEST)
Date: Mon, 14 Jul 2025 10:46:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] objtool/rust: add one more `noreturn` Rust function
 for Rust 1.89.0
Message-ID: <20250714084638.GL905792@noisy.programming.kicks-ass.net>
References: <20250712160103.1244945-1-ojeda@kernel.org>
 <20250712160103.1244945-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712160103.1244945-2-ojeda@kernel.org>

On Sat, Jul 12, 2025 at 06:01:02PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.89.0 (expected 2025-08-07), under
> `CONFIG_RUST_DEBUG_ASSERTIONS=y`, `objtool` may report:
> 
>     rust/kernel.o: warning: objtool: _R..._6kernel4pageNtB5_4Page8read_raw()
>     falls through to next function _R..._6kernel4pageNtB5_4Page9write_raw()
> 
> (and many others) due to calls to the `noreturn` symbol:
> 
>     core::panicking::panic_nounwind_fmt
> 
> Thus add the mangled one to the list so that `objtool` knows it is
> actually `noreturn`.
> 
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  tools/objtool/check.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index f23bdda737aa..3257eefc41ed 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -224,6 +224,7 @@ static bool is_rust_noreturn(const struct symbol *func)
>  	       str_ends_with(func->name, "_4core9panicking14panic_explicit")				||
>  	       str_ends_with(func->name, "_4core9panicking14panic_nounwind")				||
>  	       str_ends_with(func->name, "_4core9panicking18panic_bounds_check")			||
> +	       str_ends_with(func->name, "_4core9panicking18panic_nounwind_fmt")			||
>  	       str_ends_with(func->name, "_4core9panicking19assert_failed_inner")			||
>  	       str_ends_with(func->name, "_4core9panicking30panic_null_pointer_dereference")		||
>  	       str_ends_with(func->name, "_4core9panicking36panic_misaligned_pointer_dereference")	||

Just having "_4core9panicking" substring is not sufficient?


