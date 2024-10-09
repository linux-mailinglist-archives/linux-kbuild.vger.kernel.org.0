Return-Path: <linux-kbuild+bounces-3998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25953996AEC
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5796E1C20C93
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5391E1A2A;
	Wed,  9 Oct 2024 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIp7l66E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A41E1A1C;
	Wed,  9 Oct 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478328; cv=none; b=O0YWY9NdfUBtWMBLLSZs+96oNE+aE+ZFOJTLK/g5s2z0xcIqHAXvlwZFAnbWPAXx+nwLQlHIUexga7XuAH8srvohwONqizLR2kociBPIQkwtvIkpKKgn/mUv6GP9WySnwBWUFX7YA4tvbdesV3o0wm2hSSF27gYT4r0apl8sXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478328; c=relaxed/simple;
	bh=0+g4RPNqFwAiqg4KBBmuIaFNIKye4ixWBlnS5eJsMMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePyNTr1P8xJMPrtDEGeQi7F2omCM+fcPDywDnLp0yjLMYqrIay3IHbpbO4b4y3C0lXvfUYPuSSnt5ZPvf08rmA2YgZ5TeGwW1vtSuiSid2yzIPyfrlGeLlyCD/xowDF/mjhKpiw76xBfMwPhwKmawI93Q+w7ZOZKt5tOaiy6yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIp7l66E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DADC4CED3;
	Wed,  9 Oct 2024 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728478327;
	bh=0+g4RPNqFwAiqg4KBBmuIaFNIKye4ixWBlnS5eJsMMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KIp7l66EpT2A6izrUZIHP1Yk0UtO+G0pMvYfpS+7EDjXZfWyQkNKc4xTfnx8ZPFXa
	 iCYDBYZJItXEWxyTRIlAFKejCVcXHIL5CpCzWnugV0uOzwOWXESIZ4qQBGdAwrUc5t
	 6lsmkP466VA/kJokpBCw5tKwtsK8vuKKR7yvKr3Rr50eHl1KHoU9bWq7QJodDdP8e1
	 stnIidmaJ2aA93fHPHETcudZiDSBKOEBz1sjUKvI2v+yXkKoNUwvY3faEJUyZC59Ex
	 uZSbGGGrRt/BN8tzzyPof3DDlSBHa3mRHAOKC6TKU8Akb81RMTA7CILg3gyZ1DrrmN
	 WzsHICVhnIsnQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2facf48166bso77253011fa.0;
        Wed, 09 Oct 2024 05:52:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbyTYqRpYpyTNsm1Bli09HsLgIyD+e7oi9fWym+3LrTbiWS8mZSpiDcS/VeFSxU/a4pK9tgEsm3s+V0gMX@vger.kernel.org, AJvYcCUcnY9UUwQyFUlm16siESKLTPhIysFWPjtl3Dz2fWiPe2eU6cdBPBFuf7T5GIsR2349HQoBKMX92wDkhh4=@vger.kernel.org, AJvYcCXLr+sidYDeOmwvuLEBCtR7RB7GKYq71cOsl3gqGLBV7tkOZJkkafyfOgrh8X8PXtPIgpFVnCBSsoS0+Jbsupg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8t6X/d0x3TnEkGN/QYqzFahyZ/27W+naVH2W0tstffQBGtiZ
	aKFj7z5U8NOs/ilmlFvm2oYfYSUukK3PQ3WRcBbpS+ELG1JxTIm0scf194BDAoH0plCe7fIGnWM
	8owiQTrxHAyffg3HGbb8qsOjjwbg=
X-Google-Smtp-Source: AGHT+IFRK+yvoT1UlVPKo87bYUb+4B36nxoDIok7/yENu7BJHMscXnfbpeK8yRaile5ut62tvnLD19TAmIC8/YBX5JY=
X-Received: by 2002:a05:651c:150a:b0:2fa:de13:5c1d with SMTP id
 38308e7fff4ca-2fb187385cdmr15453911fa.25.1728478326267; Wed, 09 Oct 2024
 05:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
In-Reply-To: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 21:51:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATSA32f8U1GfiDMwe0CYktTSdecR12Z1YoMZUYJgQCUoA@mail.gmail.com>
Message-ID: <CAK7LNATSA32f8U1GfiDMwe0CYktTSdecR12Z1YoMZUYJgQCUoA@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Fix a few different compiler errors that cause rustc-option to give
> wrong results.
>
> If KBUILD_RUSTFLAGS or the flags being tested contain any -Z flags, then
> the error below is generated. The RUSTC_BOOTSTRAP environment variable
> is added to fix this error.
>
>         error: the option `Z` is only accepted on the nightly compiler
>         help: consider switching to a nightly toolchain: `rustup default =
nightly`
>         note: selecting a toolchain with `+toolchain` arguments require a=
 rustup proxy;
>               see <https://rust-lang.github.io/rustup/concepts/index.html=
>
>         note: for more information about Rust's stability policy, see
>               <https://doc.rust-lang.org/book/appendix-07-nightly-rust.ht=
ml#unstable-features>
>         error: 1 nightly option were parsed
>
> Note that RUSTC_BOOTSTRAP is also defined in the top-level Makefile, but
> its value is unfortunately *not* inherited from the environment. That
> said, this is changing as of commit 98da874c4303 ("[SV 10593] Export
> variables to $(shell ...) commands"), which is part of Make 4.4.
>
> The probe may also fail with the error message below. To fix it, the
> /dev/null argument is replaced with a file containing the crate
> attribute #![no_core]. The #![no_core] attribute ensures that rustc does
> not look for the standard library. It's not possible to instead supply a
> standard library to rustc, as we need `rustc-option` before the Rust
> standard library is compiled.
>
>         error[E0463]: can't find crate for `std`
>           |
>           =3D note: the `aarch64-unknown-none` target may not be installe=
d
>           =3D help: consider downloading the target with `rustup target a=
dd aarch64-unknown-none`
>           =3D help: consider building the standard library from source wi=
th `cargo build -Zbuild-std`
>
> The -o and --out-dir parameters are altered to fix this warning:
>
>         warning: ignoring --out-dir flag due to -o flag
>
> The --sysroot flag is provided as we would otherwise require it to be
> present in KBUILD_RUSTFLAGS. The --emit=3Dobj flag is used to write the
> resulting rlib to /dev/null instead of writing it to a file in
> $(TMPOUT).
>
> I verified that the Kconfig version of rustc-option doesn't have the
> same issues.
>
> Fixes: c42297438aee ("kbuild: rust: Define probing macros for rustc")
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Based on top of:
> https://lore.kernel.org/r/20241009102821.2675718-1-masahiroy@kernel.org
> ---
> Changes in v3:
> - Use stdin instead of a rust/probe.rs file.
> - Fix --out-dir argument.
> - Move RUSTC_BOOTSTRAP to __rustc-option.
> - Add --sysroot and --emit=3Dobj flags.
> - Rebase on top of [PATCH] kbuild: refactor cc-option-yn, cc-disable-warn=
ing, rust-option-yn macros
> - Link to v2: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v=
2-1-e6e155b8f9f3@google.com


V3 looks good to me.

Miguel,
Will you apply this together with my rustc-option-yn refactoring?


Acked-by: Masahiro Yamada <masahiroy@kernel.org>







--
Best Regards
Masahiro Yamada

