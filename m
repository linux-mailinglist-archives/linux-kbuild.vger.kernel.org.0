Return-Path: <linux-kbuild+bounces-9356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD9C28470
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 18:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C561A2120F
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 17:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9273B284881;
	Sat,  1 Nov 2025 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Skve4AR4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077A2727FE;
	Sat,  1 Nov 2025 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019871; cv=none; b=Oj3gInVsDBvnJ4dcUOtCKfKCHA06pCFddS5Jmp7r6ZXs01YXI106DtxBFD2T8kKVLUGfiziRLQ5SZl3aWGR8S9KxDw4wpORtkw9mKjALukC2NepZmzB6pFqm2/EMZhVUQY/Gkavv631ME+jghJs458UFACm+q1DAzEj0IJuKjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019871; c=relaxed/simple;
	bh=I+kQ9tDRrEbESkDzWsCmJUi6GBWfk4oyAl58SJAjkxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1FiaxlgpT8ZcgNpf6oYJLO4e+jrVKxzezAPLzuOFTjn2CldnoiuAJYqjBGoTTIlOkgHuSNMyI1dPwiq5Sb1N4rM4rniSekbKhYpp9lFi7Ji7OG3Uvb1vPP6xDoCWQXJvtT3uVmRvoq+9/P7KuDPfgCy/qdi5YJ+9qwejFad0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Skve4AR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDA5C4CEF1;
	Sat,  1 Nov 2025 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762019870;
	bh=I+kQ9tDRrEbESkDzWsCmJUi6GBWfk4oyAl58SJAjkxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Skve4AR4jkw+UfiyCWIydCfYHCOXy/vSWfd+651n1VLTlw/tYEIe1BViYrj+BZ3wg
	 VZy09aPhIC1E0wXgaV1yAMPwg+mHjIdKx0l8FARVFpCOKz0n6oecBP815ueF/OE33l
	 iYGmfdrezGx3O1axm/D50OIEOFsCReSSPoGs22dWFfvOVkDS5C9t8oSktiPuYbWDlV
	 PsT84aLNZa1jvCLnOAy1ELwlPR1zsCIikuBg1L67DHlkj9/Iroi215Kys6QTNUeloQ
	 bmKrxw304QGsJe1NpRRXBcESDacDA1itM/Hf9b0l1lgBgXVi1AL1JjXzhuaU21jmKq
	 bhM1M9VaofAFg==
Date: Sat, 1 Nov 2025 18:25:35 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
Message-ID: <aQZCj5XZvXAt_lgl@levanger>
References: <20251101094011.1024534-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>

On Sat, Nov 01, 2025 at 10:40:11AM +0100, Miguel Ojeda wrote:
> Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
> [1][2] as `-Cjump-tables=n` [3].
> 
> Without this change, one would eventually see:
> 
>       RUSTC L rust/core.o
>     error: unknown unstable option: `no-jump-tables`
> 
> Thus support the upcoming version.
> 
> Link: https://github.com/rust-lang/rust/issues/116592 [1]
> Link: https://github.com/rust-lang/rust/pull/105812 [2]
> Link: https://github.com/rust-lang/rust/pull/145974 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  arch/loongarch/Makefile | 2 +-
>  arch/x86/Makefile       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

