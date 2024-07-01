Return-Path: <linux-kbuild+bounces-2298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D216691E8DD
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 21:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB561F22BEE
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 19:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F37A171088;
	Mon,  1 Jul 2024 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="rqbkAqSV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40572171071
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jul 2024 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719863348; cv=none; b=QTEJrby/XgprmtIaODRSd5PtYQQAvVBT+rJ94B+7hg/GxmtZV+joeZ4MrksR0eZiuiqwAHkQxhF7Jr9JrD/ruw1/TUZXyiWhQ4rkHrQXDLALGFPlGJ7mvFzyMXKaRD/JPcxR1vPYVGCTARBeevz191d6KbtCV3rW9Duxw/9Wq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719863348; c=relaxed/simple;
	bh=MaqieYH112oPeJZK27+SKMAD5jIe1kLvdOEPP39gHfg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AiuicZ1LZ5MrueSuKLlpNcQfAW3iiiJSeK4gteOiAPP/caz1BuQg1pchq9+iCc2dyNpxwQwaiFm4Jk1oaN8aVTo7fht2SsuXEJzxijo4D07OoKF8sTC6HavScFlhBzv2Hh+7V0tHOpI4Q0TnkFyqd24ERwf7pdZd81KD1kMa/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=rqbkAqSV; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719863330; x=1720122530;
	bh=K3c5EVsP0XfpFZ6X22wj/d/TUh2Dx07pnTyKDliG6wk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rqbkAqSVEfeyiJjiC9gdSvdjHlygJUzG6NJclDbYW2It8FHDKHlq8fO+KBdss6ERu
	 n+BtJijDqskNyN/rPuV1Wo2W/PlNr1f3AWVXu0JDyXzwpNStculXOj3Z75BeXrU30c
	 LArwtlH/x0CC+DpN2+RaLNlErLPVDqS42JmmZvdP3thzt4szVMUxA66V+nn+rH5nQ1
	 9Bc83w4RqAT8zGHhxz1OO0w7p/SRzPFqoOWTgJ4LMR7zr33uVQufx09soAG+4KseJe
	 CZDxg/9tBTj6vU56RePRd7mCY88BR5cz5AkemrAh/LMTWhd4e2N3qHPSeiE8S0RNiC
	 GA9Zgommdc+QA==
Date: Mon, 01 Jul 2024 19:48:46 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 04/13] rust: relax most deny-level lints to warnings
Message-ID: <WGFMwMlEU5xZ0Gz_9eqp_ATSk4UiloYSjxQi3JpxZsPQK_HU5S0RYxvLO9KXJEkADsKWKmtDfRYdpAkLrUpprgS2tbo-vIKfAW6Inc-Lhxc=@protonmail.com>
In-Reply-To: <20240701183625.665574-5-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org> <20240701183625.665574-5-ojeda@kernel.org>
Feedback-ID: 27884398:user:proton
X-Pm-Message-ID: 1420cc18cd1b73203510a1b88c89f56411879ff1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, July 1st, 2024 at 20:36, Miguel Ojeda <ojeda@kernel.org> wrote:

> Since we are starting to support several Rust toolchains, lints (includin=
g
> Clippy ones) now may behave differently and lint groups may include
> new lints.
>=20
> Therefore, to maximize the chances a given version works, relax some
> deny-level lints to warnings. It may also make our lives a bit easier
> while developing new code or refactoring.
>=20
> To be clear, the requirements for in-tree code are still the same, since
> Rust code still needs to be warning-free (patches should be clean under
> `WERROR=3Dy`) and the set of lints is not changed.
>=20
> `unsafe_op_in_unsafe_fn` is left unmodified, i.e. as an error, since
> 1) it is simple enough that it should not have false positives (unlike
> e.g. `rust_2018_idioms`'s `explicit_outlives_requirements`) and 2) it is
> becoming the default in the language (warn-by-default in Rust 2024 [1] an=
d
> ideally an error later on) and thus it should also be very well tested.
>=20
> Link: https://github.com/rust-lang/rust/pull/112038 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile      | 22 +++++++++++-----------
>  rust/Makefile |  4 ++--
>  2 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 4d36f943b3b1..056176a55d63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -461,17 +461,17 @@ KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
>  # host programs.
>  export rust_common_flags :=3D --edition=3D2021 \
>  =09=09=09    -Zbinary_dep_depinfo=3Dy \
> -=09=09=09    -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
> -=09=09=09    -Dunreachable_pub -Dnon_ascii_idents \
> +=09=09=09    -Dunsafe_op_in_unsafe_fn -Wrust_2018_idioms \
> +=09=09=09    -Wunreachable_pub -Wnon_ascii_idents \

Maybe also keep non_ascii_idents as error? It shouldn't have any false posi=
tives.

>  =09=09=09    -Wmissing_docs \
> -=09=09=09    -Drustdoc::missing_crate_level_docs \
> -=09=09=09    -Dclippy::correctness -Dclippy::style \
> -=09=09=09    -Dclippy::suspicious -Dclippy::complexity \
> -=09=09=09    -Dclippy::perf \
> -=09=09=09    -Dclippy::let_unit_value -Dclippy::mut_mut \
> -=09=09=09    -Dclippy::needless_bitwise_bool \
> -=09=09=09    -Dclippy::needless_continue \
> -=09=09=09    -Dclippy::no_mangle_with_rust_abi \
> +=09=09=09    -Wrustdoc::missing_crate_level_docs \
> +=09=09=09    -Wclippy::correctness -Wclippy::style \
> +=09=09=09    -Wclippy::suspicious -Wclippy::complexity \
> +=09=09=09    -Wclippy::perf \
> +=09=09=09    -Wclippy::let_unit_value -Wclippy::mut_mut \
> +=09=09=09    -Wclippy::needless_bitwise_bool \
> +=09=09=09    -Wclippy::needless_continue \
> +=09=09=09    -Wclippy::no_mangle_with_rust_abi \
>  =09=09=09    -Wclippy::dbg_macro
>=20
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(H=
OSTCFLAGS)
> @@ -573,7 +573,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>  =09=09    -Csymbol-mangling-version=3Dv0 \
>  =09=09    -Crelocation-model=3Dstatic \
>  =09=09    -Zfunction-sections=3Dn \
> -=09=09    -Dclippy::float_arithmetic
> +=09=09    -Wclippy::float_arithmetic
>=20
>  KBUILD_AFLAGS_KERNEL :=3D
>  KBUILD_CFLAGS_KERNEL :=3D
> diff --git a/rust/Makefile b/rust/Makefile
> index f70d5e244fee..4c03e53d3084 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -421,7 +421,7 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(C=
ONFIG_64BIT))),)
>  endif
>=20
>  $(obj)/core.o: private skip_clippy =3D 1
> -$(obj)/core.o: private skip_flags =3D -Dunreachable_pub
> +$(obj)/core.o: private skip_flags =3D -Wunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intrin=
sics),--redefine-sym $(sym)=3D__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> @@ -435,7 +435,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.=
rs $(obj)/core.o FORCE
>  =09+$(call if_changed_dep,rustc_library)
>=20
>  $(obj)/alloc.o: private skip_clippy =3D 1
> -$(obj)/alloc.o: private skip_flags =3D -Dunreachable_pub
> +$(obj)/alloc.o: private skip_flags =3D -Wunreachable_pub
>  $(obj)/alloc.o: private rustc_target_flags =3D $(alloc-cfgs)
>  $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtin=
s.o FORCE
>  =09+$(call if_changed_dep,rustc_library)
> --
> 2.45.2

Cheers,
Bjorn

