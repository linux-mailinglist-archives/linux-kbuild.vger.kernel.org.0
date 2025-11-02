Return-Path: <linux-kbuild+bounces-9359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC7C28ACC
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 08:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC553B5B35
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 07:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C6E261B9E;
	Sun,  2 Nov 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="mSQt7UJy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from inert-arianrhow.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.216.144.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E225DAFF;
	Sun,  2 Nov 2025 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.216.144.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762070310; cv=none; b=dktesLf8pfy+CYSey2dume1RP4xOhbOQljtgH+GZINAkPdO4JcJyD69NMSlyFPS1CxSl++UP+ur9j0hFllU87/F5VnUJxH7OfDFwrSfWqtyBOx8yG2iTXSR/bKWAnM3UoKQniIUw0f4CwiiOszLOsobOVtuxSyvAMs/P+Rz3YSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762070310; c=relaxed/simple;
	bh=GnZVaprzaUNXLrszhG+AfitqnH/3NOGgJ9lds690guY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=mWHoqDvlH9+AjAHXxV27It2W8RIC2+30DgGY4vrokgWcPBo99MEWRfzkjBztr5CqsKABH4U/+FLQVDf+yq9Cm1YfADVzXpekBP0Qvywc5tnz7wAHyD3u5Z/pbnewJ330bQpAwLmj7fLLL3BosgO9bxUvjUah7caTT1hZkSyrefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=mSQt7UJy; arc=none smtp.client-ip=18.216.144.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Received: from fond-ellyllon.authn-relay.a.mail.umich.edu (ip-10-0-74-91.us-east-2.compute.internal [10.0.74.91])
	by inert-arianrhow.relay-egress.a.mail.umich.edu with ESMTPS
	id 69070F05.25C6ECA1.3F784CED.974104;
	Sun, 02 Nov 2025 02:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1762070274;
	bh=JOCHX5StUrYQWAzbdTyea3OJMkuVyGm3IZMtYYvHQ5s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=mSQt7UJysnXvFKKXtAnGgrl2JQEi0272axO6sMubWvJ4yV12qGYdhWJmwWnTl3BgJ
	 p3G+Z8eaz6ymweRctxWkxYSUI+YNiogXWcZdi+t16S7uI7Q1ELmHfM7Ktu0p/SaYh7
	 fdGcQF5UU+F6ADFDyPzFgpzgsy4vREG76fNIK+gwyzno+MafApTBCiHyMGu1TYkYPt
	 5m+2vtf9E8BRpmUcnwI+wrdPVVUuLMHIGqLZdMHVOmZZkW2UlQZTIt8GUUrkiuk6xG
	 TUqt5mg0LWxTSVxjyZcUt9oqysgcZxEgpBL0bpp0/CZTA+zMP7w5PTEMW92yMq968W
	 4jfVzaqv5op0Q==
Authentication-Results: fond-ellyllon.authn-relay.a.mail.umich.edu; 
	iprev=fail policy.iprev=73.110.187.65 (Mismatch);
	auth=pass smtp.auth=tmgross
Received: from localhost (Mismatch [73.110.187.65])
	by fond-ellyllon.authn-relay.a.mail.umich.edu with ESMTPSA
	id 69070F01.33BAC196.2EB97120.90244;
	Sun, 02 Nov 2025 02:57:54 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 01:57:52 -0600
Message-Id: <DDY1S4C4NY54.1S5RB5BI48AEJ@umich.edu>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
From: "Trevor Gross" <tmgross@umich.edu>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nicolas@fjasle.eu>, "Huacai Chen" <chenhuacai@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 <loongarch@lists.linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 <linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20251101094011.1024534-1-ojeda@kernel.org>
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>

On Sat Nov 1, 2025 at 4:40 AM CDT, Miguel Ojeda wrote:
> Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
> [1][2] as `-Cjump-tables=3Dn` [3].
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

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> ---
>  arch/loongarch/Makefile | 2 +-
>  arch/x86/Makefile       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index dc5bd3f1b8d2..96ca1a688984 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -109,7 +109,7 @@ endif
>  ifdef CONFIG_RUSTC_HAS_ANNOTATE_TABLEJUMP
>  KBUILD_RUSTFLAGS		+=3D -Cllvm-args=3D--loongarch-annotate-tablejump
>  else
> -KBUILD_RUSTFLAGS		+=3D -Zno-jump-tables # keep compatibility with older =
compilers
> +KBUILD_RUSTFLAGS		+=3D $(if $(call rustc-min-version,109300),-Cjump-tabl=
es=3Dn,-Zno-jump-tables) # keep compatibility with older compilers
>  endif
>  ifdef CONFIG_LTO_CLANG
>  # The annotate-tablejump option can not be passed to LLVM backend when L=
TO is enabled.
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 4db7e4bf69f5..c60371db49d9 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -98,7 +98,7 @@ ifeq ($(CONFIG_X86_KERNEL_IBT),y)
>  #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104816
>  #
>  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dbranch -fno-jump-t=
ables)
> -KBUILD_RUSTFLAGS +=3D -Zcf-protection=3Dbranch -Zno-jump-tables
> +KBUILD_RUSTFLAGS +=3D -Zcf-protection=3Dbranch $(if $(call rustc-min-ver=
sion,109300),-Cjump-tables=3Dn,-Zno-jump-tables)
>  else
>  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dnone)
>  endif
>
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa


