Return-Path: <linux-kbuild+bounces-2661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528093C89C
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C27FEB220F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555F436AFE;
	Thu, 25 Jul 2024 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JLu2BEAD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3B6FB8;
	Thu, 25 Jul 2024 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721934637; cv=none; b=W3iJ9Ifby0hynsvi0HByxvlIfEoTvwpFJOPPNaaV9kOwUl1RrYlk41G8L4NUqkIbLAXbTPjkMP+nkJuia+80/k1AGvWDrTCrbTKOZpc4vUJVKQbekQMAm6KKQxxO/EEKGis4kkfBsPzqyXmdlwFnEznCW1x18lVO661N5WhIeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721934637; c=relaxed/simple;
	bh=0+K5df3pYW8anY0W7obHsaG3gVTkwY1s5smtjcmRj0M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWXWl+6ZPBiOCHz7CSBJpPpes9spwGjH4tXcPp6VDXG4Qmbe/JUvfkXc9bKVWDTk4infr8u+YVSy4oK2cH5RXVwV6h34DD+SYtBqkB4UhMyxAoWiHpcI1UikAmeh2ZjVc0609VRFNnXuZwHXCen8mSANV43hy/EA4dGPd2Sgueo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JLu2BEAD; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721934633; x=1722193833;
	bh=+CMCti/PRpVhFuv6i+zLd7yDwT8XVdBoNnx76B9/VLg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JLu2BEADeyUSCboFFSVtM3xxwMnYlT+4DktTQ1ofiuZjuuErGYwSRDGX5CEInEVIo
	 CZOoZXi7DMkabYi7oaoUMSC9+cm2IF5tbcvERTaepA9a1XWVNBxx3Tc4APMWhEUlW0
	 qQrN2S00FulHLiyAReddRzjh/s9eUn1rydoeGonzquLq8ze6mMMKkFATgfVJaaI13o
	 NeU7QLbFCiKg9hE9n4EVg3T+SSd0FXFAjUEec9pgnyVmDkveejTR78/n6wKOeIxaKT
	 OK9ohY9MeHyRyBi0QgZFG2xKE19xXt7H0UhlC5FG4pZwcd1Nm+hJ5niu5rnCfNF301
	 FPginJIo6A4lg==
Date: Thu, 25 Jul 2024 19:10:27 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
Message-ID: <6d898710-6864-4a1b-81d3-49a7dd41c166@proton.me>
In-Reply-To: <20240725183325.122827-1-ojeda@kernel.org>
References: <20240725183325.122827-1-ojeda@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2583f17197da26fae3dcd7c623aa827bcef29f06
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.07.24 20:33, Miguel Ojeda wrote:
> Hi,
>=20
> This is just v2 with the helper function suggested by Peter.
>=20
> I dropped Benno's and Alice's Tested-bys from the modified patch, just
> in case, but the logic should be equivalent.

I re-ran my tests and the results are the same as with v1.

Tested-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> Cheers,
> Miguel
>=20
> v3:
>   - Added `is_rust_noreturn()` helper function (Peter).
>   - Reworded a couple bits.
>=20
> v2: https://lore.kernel.org/rust-for-linux/20240724161501.1319115-1-ojeda=
@kernel.org/
> v1: https://lore.kernel.org/rust-for-linux/20231023174449.251550-1-ojeda@=
kernel.org/
>=20
> Miguel Ojeda (6):
>   rust: module: add static pointer to `{init,cleanup}_module()`
>   x86/rust: support MITIGATION_RETPOLINE
>   x86/rust: support MITIGATION_RETHUNK
>   x86/rust: support MITIGATION_SLS
>   objtool/rust: list `noreturn` Rust functions
>   objtool/kbuild/rust: enable objtool for Rust
>=20
>  arch/x86/Makefile               |  7 ++++-
>  rust/Makefile                   | 22 +++++++++------
>  rust/macros/module.rs           | 12 +++++++++
>  scripts/Makefile.build          |  9 +++++--
>  scripts/generate_rust_target.rs | 15 +++++++++++
>  tools/objtool/check.c           | 48 ++++++++++++++++++++++++++++++++-
>  tools/objtool/noreturns.h       |  2 ++
>  7 files changed, 103 insertions(+), 12 deletions(-)
>=20
>=20
> base-commit: b1263411112305acf2af728728591465becb45b0
> --
> 2.45.2


