Return-Path: <linux-kbuild+bounces-2646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF793B8CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 23:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84DF81F23C34
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 21:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244B513AD09;
	Wed, 24 Jul 2024 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f690Mp/H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5713AA2F;
	Wed, 24 Jul 2024 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721857929; cv=none; b=Cp/SBwx75VIBOM53Gc4AXXPjfKrzETiBcO62y3bdYL5tzgD4KONZlcgjYeyqzm4R3GCm6vxyncnyckYR9n0CRabp7wTRHVwmE1YqW7HPQPYJaiI/chtA+84PAeVQLIW9nIISaEYEFo4DyLvlM1PoCAFQLZ8vbgOd5GBA9dmm4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721857929; c=relaxed/simple;
	bh=oEOmOlfz6CpQP8CwygJ/qQgE6bITPukNt50FQUhP2N8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+5Eo0naXUmTFD2BQFZmAxzChbEjegxz3ebTOGW/UQyTx9Mldki9d+ktplyDmfHlCPrdTIO8dF1QE63PshyoNn2uJd3CbIbpnw0Edg3I+2uggHbX5mKFtny0VB2VsdIWD9cETvBMpGmIGBCvVX1pibZpJ9N2OfoGvMEccFDcV6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f690Mp/H; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721857924; x=1722117124;
	bh=9wT9nGk/Kl4gZK0Tax5hk03ECjrHn3Gb2YCLJm9dH3M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f690Mp/HqT5J3u5HaDV08jrxv8C/kMBNcWHBh51benkj26V9zDr5FEZIi8Er6gOW0
	 aVbQSNlkLGegZu9RoGuv+hosNnTKiENbyC/js6rE5aWJYtAD2hg6pD5BRhC+M+mZBE
	 mRWhmSXDgbEeN0dal1v/tiEr9hbvgOdVW1c28qYy8prkG03iYTHn+QA+EnM+aELZp1
	 aSg0Cbdae0xTP5/peyYM97iutSGteAU6l1Efc97G7R3toarBivkNrx/1vjlunbeXBT
	 eCK2g4/jHZ0ojc8MHz2ap1jfeqglC+drOxqzOgTp9kOGBW1VesIsVYwqEVCV6XSwfT
	 dzJYzhoCTIzAg==
Date: Wed, 24 Jul 2024 21:51:57 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
Message-ID: <e51f3b91-690d-4b72-9841-75a61684777d@proton.me>
In-Reply-To: <20240724161501.1319115-1-ojeda@kernel.org>
References: <20240724161501.1319115-1-ojeda@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6af68a83f926bf6d26972ff1532292b9d003c3a4
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24.07.24 18:14, Miguel Ojeda wrote:
> Hi,
>=20
> This is an updated series to the CPU mitigations support for Rust. It
> also has the patch to enable `objtool`, so that we can start running it
> for Rust.
>=20
> It would be nice to get this applied soon, so that we start being
> warning-free (since we already get warnings under IBT builds via
> `vmlinux.o`). I am happy to take it through the Rust tree if the x86 and
> objtool maintainers give an Acked-by, or through any of the other trees,
> as you prefer. Otherwise, I think at this point we would need to make
> Rust exclusive to the mitigations, which isn't great.
>=20
> With this series, again, x86_64 is warning-free with `objtool` enabled. I
> tested `-O2`/`-Os` and the Rust versions we support under `-O2` (mainly
> for the `noreturn` patch, which uses heuristics), as well as IBT vs. no
> IBT (i.e.  running on individual object files vs. in `vmlinux`). I also
> did an arm64 build.
>=20
> Testing is very welcome for this one!
>=20
> Cheers,
> Miguel
>=20
> v2:
>   - Add patch to enable `objtool` for Rust.
>=20
>   - Add patch to list `noreturn` Rust functions (via heuristics) to avoid
>     warnings related to that.
>=20
>   - Make the `RETHUNK` patch not an RFC since the Rust compiler has
>   support for
>     it now.
>=20
>   - Update the names of the migitation config symbols, given the changes
>   at e.g.
>     commit 7b75782ffd82 ("x86/bugs: Rename CONFIG_MITIGATION_SLS =3D>
>     CONFIG_MITIGATION_SLS").
>=20
> Miguel Ojeda (6):
>   rust: module: add static pointer to `{init,cleanup}_module()`
>   x86/rust: support MITIGATION_RETPOLINE
>   x86/rust: support MITIGATION_RETHUNK
>   x86/rust: support MITIGATION_SLS
>   objtool: list `noreturn` Rust functions
>   objtool/kbuild/rust: enable objtool for Rust
>=20
>  arch/x86/Makefile               |  7 ++++++-
>  rust/Makefile                   | 22 ++++++++++++--------
>  rust/macros/module.rs           | 12 +++++++++++
>  scripts/Makefile.build          |  9 +++++++--
>  scripts/generate_rust_target.rs | 15 ++++++++++++++
>  tools/objtool/check.c           | 36 ++++++++++++++++++++++++++++++++-
>  tools/objtool/noreturns.h       |  2 ++
>  7 files changed, 91 insertions(+), 12 deletions(-)
>=20
>=20
> base-commit: b1263411112305acf2af728728591465becb45b0
> --
> 2.45.2
>=20

I tested this series with a config that produces the objtool warnings on
b126341 and it worked flawlessly. I also tried `-O2` and `-Os`:

Tested-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno


