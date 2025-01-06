Return-Path: <linux-kbuild+bounces-5392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0017A01F1B
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 07:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1910C3A2B89
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 06:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64D14B94B;
	Mon,  6 Jan 2025 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pcTvClkp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656929A0;
	Mon,  6 Jan 2025 06:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143730; cv=none; b=P4RR0COmuMH15+D36eKL1cWumHqTCWU4cdbxzNUaLgoIrxl+OR0V0G7bSs78LFQzf3+ycH3bKpcdIIFj97tHFF1lu64CD7E+u9uApHZXypXhDCsspRTSa9V6C5SFbqEcVZwmYHKzbKE+MnhaI7G6JDXFp81+fvnvGpxammqHsQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143730; c=relaxed/simple;
	bh=JpnT6XDiDi5v7yU1l/uSYIFMfZG6zHH+8eWd9ppJpT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODuZWVx1qHUEq5SgNwUIKv+fl+t3Lq6i8AKFiO4Bngf6k4Jp02bDD7UKy9LAIW4esB6Pd4kQgU1QDI2ZGfFmpAxKUcIzNdAytV8N2TGuVL3m+KDAJpnUiWQS18rGdFdEbXMR3XZUFlqhMuXer6Nrujwe4uLAqTSmAe6Gv6d7sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pcTvClkp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=466vvuHwmWKlZeIUy/KmSmUiE8XU5/pjhwbYX0vXyBo=; b=pcTvClkpFlq/IwHF4RwHFIFUJc
	JPkNzFBavlHll+VCJ3h0+frT6KgwNmkopeZhSV/TLeyirjRqrq8snGqiEhC/E0bzxpUb1wsvBcydy
	cAMOG6fFcmisnxJ4G3vJ1Kau68dVJ3ozg4E8SdybnCLz7IWVCchU5+BOiJ4FAQ+9zRkAffulas93B
	j/1oNSE1OxHu0xaDSIznq+8KnQOji7uaFeGiMMQtoA4Qsr3KBBLNyGJDAbqNjDgGm7ScaLRHjvcxc
	3Tp3ujhvAvAa243S6u1Z/hxINTYe+qNvxK/ZMmYq+M5n1D7xft2H1d0Fl9YDbTkS4qGzdvV/o12UN
	+hb9td7g==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgHr-00000008ru5-05JL;
	Mon, 06 Jan 2025 06:08:27 +0000
Message-ID: <aacd5e49-2539-4cf5-a3d2-76583e04e08f@infradead.org>
Date: Sun, 5 Jan 2025 22:08:14 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dirk Behme <dirk.behme@de.bosch.com>, Tamir Duberstein <tamird@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Matt Gilbride <mattgilbride@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Eder Zulian <ezulian@redhat.com>, Filipe Xavier <felipe_life@live.com>
Cc: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 Kees Cook <kees@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105194054.545201-1-gary@garyguo.net>
 <20250105194054.545201-3-gary@garyguo.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250105194054.545201-3-gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/5/25 11:40 AM, Gary Guo wrote:
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f3d723705879..8a8834128f13 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3253,6 +3253,20 @@ config RUST_KERNEL_DOCTESTS
>  
>  	  If unsure, say N.
>  
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    help
> +        Links C helpers into with Rust crates through LLVM IR.

cannot parse "into with".

> +
> +        If this option is enabled, instead of generating object files directly,
> +        rustc is asked to produce LLVM IR, which is then linked together with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"

-- 
~Randy


