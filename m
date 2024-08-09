Return-Path: <linux-kbuild+bounces-2924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331894D579
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 19:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A288BB21537
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 17:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985295A4D5;
	Fri,  9 Aug 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIvCwOth"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE146425;
	Fri,  9 Aug 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723224707; cv=none; b=QJanb8kHifq6FsEJ9AhxX7qVd0B2MclLYt2BvasqjumJUsPy1YJL2jzs0yJKBAPzkDayNcfHDjeUgCqMbiQRGbNoL1cw+GiUINcdZNVE0LVU78gjtanirGQ/6+aRtjaVsaciWqLPIZwZivBmNk0omtJZmel+d4ImA+t4HElwX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723224707; c=relaxed/simple;
	bh=B1tPt2x47jWMPCmFbad8PbgBKHeFXTJjz5sbLvEj89Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onWaXbl3kf8ybY7ikuHR1YS736R+2ZTAlDsYDS3fEsEXPsRz7lTOXsbqBktqxCRiCAIR0JwWtycnSiA0VKxxLJnXrgfDLgo2dLSURRVl/VfXlC0b3Tyo2vZppt3vg1sajPYIISoIIrnXfMKSbEKiA38eG3eD6pyQDL86yxzMezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIvCwOth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517E9C4AF09;
	Fri,  9 Aug 2024 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723224707;
	bh=B1tPt2x47jWMPCmFbad8PbgBKHeFXTJjz5sbLvEj89Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KIvCwOthaSYvnMmQvLtNxeHD4z9Y8uOK680sYuMoHJHMMC9+O+dKugmhaKnkwbil3
	 kyQBZN97kKo65zkh4AGhPg0uRQsYaHykC+ZG3VNmf9Qz9hZjUmzf/mrS/Ag2oYRMoz
	 iS1TDiIZcX+F764xX6o0QUzDpbQSSGZWfrH5GbMPlekbUIpVw1qXNAUDSZGVj5GFlZ
	 GPtwEmbUJEq5BzZU0LHscPxlQ1stETr9dKz9CuyYNoFrhaMyQyZ5yO2jGiuVFbj+Du
	 v0pUgxrVYCiHSAximOo0Fw4rXeQOsjlEJsAV9rSggXFVs2h3ycPoInSdYKfinnKwsv
	 JpmymHMi6NUPw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f183f4fa63so19389971fa.1;
        Fri, 09 Aug 2024 10:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3XU/lQ3fTWYvzUIjfDl1koudgoYFrEij0970lfNYL+EeFyND3pxiY3Zu47JWPV51sOMqMrs4OvN8Afj9x@vger.kernel.org, AJvYcCVi6jRw1pMVVM4pR27sRsyUmwkyHXDyBXF2EU31ktkvpZiu0urvMFukehf+0gpxaGapmKUdEN/bn274ml0=@vger.kernel.org, AJvYcCWkvmIrHUe1D3SnOoFrdI0ULSqkCd0rE17BcxUdDQwdhGTR1JNMs9LoszaNEJIc1/X8DiRn3iCtWzobo5aqzQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+OCML0UAIqt4QyuoD79KCNva+XC32EVms/MkHxLP2JYSRRcT
	mOf0Dkqmb8bLu7GlH4CzWmzHY8bJbmRettTxP4ietiAem5UNgtxAYEdfjHtN7edntsEgIsOdb8u
	itLRwBcVrrI9T3XjKDMo1c2veepY=
X-Google-Smtp-Source: AGHT+IExsuSuqXRo19fwiANbiO6YZXnMjSylykBB8elfZCRswlRHZA4pGb68g38boZBAAcqt0qToAq6btKa4wOS7mQU=
X-Received: by 2002:a05:651c:551:b0:2ef:1efb:1b6b with SMTP id
 38308e7fff4ca-2f1a7a67ae6mr6213451fa.15.1723224705902; Fri, 09 Aug 2024
 10:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-6-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-6-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Aug 2024 02:31:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com>
Message-ID: <CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com>
Subject: Re: [PATCH 5/6] kbuild: rust: replace proc macros dependency on
 `core.o` with the version text
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 7:12=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> With the `RUSTC_VERSION_TEXT` rebuild support in place, now proc macros
> can depend on that instead of `core.o`.
>
> This means that both the `core` and `macros` crates can be built in
> parallel, and that touching `core.o` does not trigger a rebuild of the
> proc macros.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 966743a9ee25..40c8d2c57024 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -329,9 +329,8 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET=
) P $@
>                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
>
>  # Procedural macros can only be used with the `rustc` that compiled it.
> -# Therefore, to get `libmacros.so` automatically recompiled when the com=
piler
> -# version changes, we add `core.o` as a dependency (even if it is not ne=
eded).
> -$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
> +$(obj)/libmacros.so: $(src)/macros/lib.rs \
> +    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
>         +$(call if_changed_dep,rustc_procmacro)



The touched file, include/config/*, is an implementation detail
in Kconfig and fixdep.


Rather, I'd like to put the string "CONFIG_RUST_VERSION_TEXT"
in the comment of the source file.

This is the idea adopted in include/linux/compiler-version.h



diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 5be0cb9db3ee..91be2112ceee 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -2,6 +2,10 @@

 //! Crate for all kernel procedural macros.

+// When fixdep scans this, it will find this string "CONFIG_RUSTC_VERSION_=
TEXT"
+// and add dependency on include/config/RUSTC_VERSION_TEXT, which is touch=
ed
+// by Kconfig when the version string from the compiler changes.
+
 #[macro_use]
 mod quote;
 mod concat_idents;






I do not know how to do it for rust/core.o because there is no in-tree
source file.

But, can we add rust/core.rs, from which
rustlib/src/rust/library/core/src/macros/mod.rs is imported?








>
>  quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_=
QUIET)) L $@
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada

