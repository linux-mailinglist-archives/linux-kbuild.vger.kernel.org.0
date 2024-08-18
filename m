Return-Path: <linux-kbuild+bounces-3082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A9955F5B
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 23:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949761C209D4
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 21:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C706A15535B;
	Sun, 18 Aug 2024 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSfpUAp6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560D72260C;
	Sun, 18 Aug 2024 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724016854; cv=none; b=KPqd7TMLsoE4k1OnrjbXu3vh4MNzs5a4gwJX8x22K9gwlXcffF3FkM2hNA+WGDxkdTqHf+IM9rWAzg71nGK5X9nq8EHDc0y+JTZGlZ0QK41p6SIcTkfspYPbJJP0aBLD84tByM/z9Y51w7Z174LcLqxKRxGrL8fYy+I+1+YNi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724016854; c=relaxed/simple;
	bh=co0ZFxYWxEgyO/etORsMhQApUZ9masoa0CJYA7UyUFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrH9QHvX2UH+sG1396RfqYTFqsxwyPt0OAcgkklPqXHz+nMKZFdTq6GfLPbTkhqCF10oXtWNBPmkSgzOZYbjVEmbLHBRwBNht2tS8RmN+4aPtIuEDYUGTC6q0OOM99JWhCVTu0l/8KA96s4AKZiIbwvJ5SRvKfMfoYFa0r2q1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSfpUAp6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d162eef54so2285951b3a.3;
        Sun, 18 Aug 2024 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724016853; x=1724621653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xB9N2CyUP/tubBRh3HVqclY1aMiqp9wGW1/E9J9qt0=;
        b=KSfpUAp6D61AkKgFA3E2DUOAy4XJiQDKB3+ozZSvG5MfSFM9WHBjNHfkawUWbDT5fb
         CIqK/wePycwoUKYr4bzyxIvrQ07a2z1IpVlsF037ZL9Q7duZhRiY82Ysmf5aWo9YuVlw
         6kAcYfqQfMqTIIDOXSQnUKmTM0T08CaiWTTVK2gMM6VYr0Mi5qCLSvrH/1Zj1rctyFXu
         XBv/G3zkbYOV9dLpoO1uQ/tZp/oRxmYt/TvKiCG2JTwRp/bbPSm/g7bvyxupw+r5CWoP
         tRC9E7dV88DGH4yXBpVhcD70mo+bG8dWRNVuZ7bJpuY2c6YBT3MYnvC0WXr0n9es1b2u
         dgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724016853; x=1724621653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xB9N2CyUP/tubBRh3HVqclY1aMiqp9wGW1/E9J9qt0=;
        b=dAPQXhoD8oGOQonCPdPgXwgjR62vxxHz+HdGabeEhKWX/ST0LiB9/BvQSu9PWfhYJz
         rvfSLvdUNuOFhmdRxKlSCH/CSRR+LZahWBcZlgL0ajfD0y2F75cLpWCNg0Wr0m5OIBoP
         3lT66rzZPmhRjDvToDYsPFUHoHUBTH8AXAZ8EEetn9EHyGgYRSO22UFBxAhLvfdU5Xre
         aMHJuK6hLSSTnCf6IeZxICClvXhZUtYf/AEFO7dVJE89G8QGceeCfjvU9/fUyN3j8muC
         l6HM3U83jwfXVOAav/DawOeq92KG3dgRcdPFkV7MnWPOUaFsfrzy8ejV3V27ot7RxVnJ
         anNw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7syGf4UQ6dfXZ4QrPGcTJFfDDFBlgdd4+24Ds75Gt2ijHgJC167NdCvwCGO641avch4GNM3G9BFZ/wWog34MSwPb9O08fesKTdwlXo7wuPt83q0Gl9Vdgy/xyeb86xl+f/Al90piF6g5S4xIIfUoZ6aod215k+Lw3sJ+V0rfLcNzl3EtGfKON4M=
X-Gm-Message-State: AOJu0YwJnyJD+uBzOi57US55ZThoPZcDQaaUKol4el/hV9r1LDmWNL3U
	0WSAaLZZLag/8qxxuCUmW5Mia1W0PPmpkOWff4r6P/sQl77mJqzC278+/RZd3LmaUJTod4ZbJ3H
	CCKlAfclhOnd7Gs8TszmYVfdvKAg=
X-Google-Smtp-Source: AGHT+IE2oB/OF35u00ICOXXfqe7uDqKEOVBsN3Q+lxAijVdFjL04veni/mfqZNesLIhpDWgJ77HfYSdRLvo4mJfnTb4=
X-Received: by 2002:a05:6a00:1404:b0:70d:262e:7279 with SMTP id
 d2e1a72fcca58-713c4dfbb8cmr9273590b3a.3.1724016852546; Sun, 18 Aug 2024
 14:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725183325.122827-1-ojeda@kernel.org>
In-Reply-To: <20240725183325.122827-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Aug 2024 23:34:00 +0200
Message-ID: <CANiq72mCuPNK4ZRDvvpCz1_=OfSU+ek=ami1auypbnehcfruuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 8:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Miguel Ojeda (6):
>   rust: module: add static pointer to `{init,cleanup}_module()`
>   x86/rust: support MITIGATION_RETPOLINE
>   x86/rust: support MITIGATION_RETHUNK
>   x86/rust: support MITIGATION_SLS
>   objtool/rust: list `noreturn` Rust functions
>   objtool/kbuild/rust: enable objtool for Rust
>
>  arch/x86/Makefile               |  7 ++++-
>  rust/Makefile                   | 22 +++++++++------
>  rust/macros/module.rs           | 12 +++++++++
>  scripts/Makefile.build          |  9 +++++--
>  scripts/generate_rust_target.rs | 15 +++++++++++
>  tools/objtool/check.c           | 48 ++++++++++++++++++++++++++++++++-
>  tools/objtool/noreturns.h       |  2 ++
>  7 files changed, 103 insertions(+), 12 deletions(-)

Applied to `rust-next` -- thanks everyone!

In the `noreturn` patch:

    [ Kees agrees this should be automated and Peter says:

        So it would be fairly simple to make objtool consume a magic sectio=
n
        emitted by the compiler.. I think we've asked the compiler folks
        for that at some point even, but I don't have clear recollections.

      We will ask upstream Rust about it. And if they agree, then perhaps
      we can get Clang/GCC to implement something similar too -- for this
      sort of thing we can take advantage of the shorter cycles of `rustc`
      as well as their unstable features concept to experiment.

      Gary proposed using DWARF (though it would need to be available), and
      wrote a proof of concept script using the `object` and `gimli` crates=
:
      https://gist.github.com/nbdd0121/449692570622c2f46a29ad9f47c3379a

        - Miguel ]

    [ Added `len_mismatch_fail` symbol for new `kernel` crate code merged
      since then as well as 3 more `core::panicking` symbols that appear
      in `RUST_DEBUG_ASSERTIONS=3Dy` builds.  - Miguel ]

Cheers,
Miguel

