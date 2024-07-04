Return-Path: <linux-kbuild+bounces-2347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D928927883
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B5CEB24A64
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1731AEFEC;
	Thu,  4 Jul 2024 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="liZVLx5M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D011A070D;
	Thu,  4 Jul 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103686; cv=none; b=Zv7Rl1ae6zGLH+t9xBF3e0575U9YyHnY5U0Ais/uIW78lKJZZLZzo9MLvsGZgJUgPE9ndXBduZMBFLy0jhze38fY9X0yRIT7BCU68SuruqZG9E36LQ7WKj6mvQ3CNTDGQs4mGEdcE8qO4LgOebS5OkkbLAksPCuVThLy/5hN3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103686; c=relaxed/simple;
	bh=R0Q6zdlmxDR45Ivw4NB26oWMIWWUcsNPRZNtLqdZrSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMB6tjugdVtkCf7aAQUBVCqxtosXfT1TAWJB7huWj1fflcKVHXh6P5S45aslrP3NwutpYZlxvblNgmVGerw5hNc29b95XQHXRqtzzmmQbYoD1Wm+6m29v55B+HkuRiWPWI0YZ4zL7ugeh40NuKlW31cQyKLYzWC9v1vVEpaDqyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=liZVLx5M; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1720103681; bh=qthsm8N8HCDjpX99KA0BIXEcfX2ziMFLPNgaK3RprEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=liZVLx5MgjM6acXMyKBcN3RfD995PDZlnAxDfHwin+LOHIlWd6iiEkmqEv02ZgvEO
	 wcO/zilJ4e2mxcmFCpsJ92d56FzBMwd/8Lw/Xd5/dMwdyqZ7O8axESJdMCTjFH9wgP
	 chUYMT4aVZjmcq+5DE7kcRUd96gS+VuF/8FGL76Y=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 04/13] rust: relax most deny-level lints to warnings
Date: Thu, 04 Jul 2024 16:34:39 +0200
Message-ID: <E76F0B90-F437-4425-9186-AEFFAC2A3304@kloenk.dev>
In-Reply-To: <20240701183625.665574-5-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
 <20240701183625.665574-5-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 1 Jul 2024, at 20:36, Miguel Ojeda wrote:

> Since we are starting to support several Rust toolchains, lints (includ=
ing
> Clippy ones) now may behave differently and lint groups may include
> new lints.
>
> Therefore, to maximize the chances a given version works, relax some
> deny-level lints to warnings. It may also make our lives a bit easier
> while developing new code or refactoring.
>
> To be clear, the requirements for in-tree code are still the same, sinc=
e
> Rust code still needs to be warning-free (patches should be clean under=

> `WERROR=3Dy`) and the set of lints is not changed.
>
> `unsafe_op_in_unsafe_fn` is left unmodified, i.e. as an error, since
> 1) it is simple enough that it should not have false positives (unlike
> e.g. `rust_2018_idioms`'s `explicit_outlives_requirements`) and 2) it i=
s
> becoming the default in the language (warn-by-default in Rust 2024 [1] =
and
> ideally an error later on) and thus it should also be very well tested.=

>
> Link: https://github.com/rust-lang/rust/pull/112038 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Also in favour of disallowing non ASCII idents. Either way

Reviewed-by: Finn Behrens <me@kloenk.dev>

> ---
>  Makefile      | 22 +++++++++++-----------
>  rust/Makefile |  4 ++--
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4d36f943b3b1..056176a55d63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -461,17 +461,17 @@ KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
>  # host programs.
>  export rust_common_flags :=3D --edition=3D2021 \
>  			    -Zbinary_dep_depinfo=3Dy \
> -			    -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
> -			    -Dunreachable_pub -Dnon_ascii_idents \
> +			    -Dunsafe_op_in_unsafe_fn -Wrust_2018_idioms \
> +			    -Wunreachable_pub -Wnon_ascii_idents \
>  			    -Wmissing_docs \
> -			    -Drustdoc::missing_crate_level_docs \
> -			    -Dclippy::correctness -Dclippy::style \
> -			    -Dclippy::suspicious -Dclippy::complexity \
> -			    -Dclippy::perf \
> -			    -Dclippy::let_unit_value -Dclippy::mut_mut \
> -			    -Dclippy::needless_bitwise_bool \
> -			    -Dclippy::needless_continue \
> -			    -Dclippy::no_mangle_with_rust_abi \
> +			    -Wrustdoc::missing_crate_level_docs \
> +			    -Wclippy::correctness -Wclippy::style \
> +			    -Wclippy::suspicious -Wclippy::complexity \
> +			    -Wclippy::perf \
> +			    -Wclippy::let_unit_value -Wclippy::mut_mut \
> +			    -Wclippy::needless_bitwise_bool \
> +			    -Wclippy::needless_continue \
> +			    -Wclippy::no_mangle_with_rust_abi \
>  			    -Wclippy::dbg_macro
>
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $=
(HOSTCFLAGS)
> @@ -573,7 +573,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>  		    -Csymbol-mangling-version=3Dv0 \
>  		    -Crelocation-model=3Dstatic \
>  		    -Zfunction-sections=3Dn \
> -		    -Dclippy::float_arithmetic
> +		    -Wclippy::float_arithmetic
>
>  KBUILD_AFLAGS_KERNEL :=3D
>  KBUILD_CFLAGS_KERNEL :=3D
> diff --git a/rust/Makefile b/rust/Makefile
> index f70d5e244fee..4c03e53d3084 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -421,7 +421,7 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$=
(CONFIG_64BIT))),)
>  endif
>
>  $(obj)/core.o: private skip_clippy =3D 1
> -$(obj)/core.o: private skip_flags =3D -Dunreachable_pub
> +$(obj)/core.o: private skip_flags =3D -Wunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intr=
insics),--redefine-sym $(sym)=3D__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> @@ -435,7 +435,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtin=
s.rs $(obj)/core.o FORCE
>  	+$(call if_changed_dep,rustc_library)
>
>  $(obj)/alloc.o: private skip_clippy =3D 1
> -$(obj)/alloc.o: private skip_flags =3D -Dunreachable_pub
> +$(obj)/alloc.o: private skip_flags =3D -Wunreachable_pub
>  $(obj)/alloc.o: private rustc_target_flags =3D $(alloc-cfgs)
>  $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_built=
ins.o FORCE
>  	+$(call if_changed_dep,rustc_library)
> -- =

> 2.45.2

