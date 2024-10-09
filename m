Return-Path: <linux-kbuild+bounces-3995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F22A99691E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBD21C22719
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 11:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5201922FD;
	Wed,  9 Oct 2024 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hjDR6zFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9D1922F6
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474248; cv=none; b=i0UHkzT3vqQTRrRIRbDfwIANCdV+U/EaB8LQXUfvNKYtrCUetjlcjYImQTlty51BBQ3vDvY8ysPuU2mFQa9XH/fgBK6sgYnaVXFyHiqWZmdPkKPnXLAgaUVqsI5RUC6LdFqUizx7EqeoyHnf/hISikLyY51Y1m2Zk8hSOVwj4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474248; c=relaxed/simple;
	bh=g/MMrVGuKitFnhQKoUQnuxLzP+zAlkse9vLSVVra1uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZN33ek09qStDSaoyzYLkg8ZFbOYjIt714dkD4+qZC+D+uBiA1Q3hWkvHCzG8ZmkKZnk2owKD3RyegpY3h1R/NiAEEWRtrFAob3n73Q5lujo1ej7dVDeP5FXTsRelA6J5W6KKU+u2k9tn3A6AP3TtyUFWGTx8MlZTt9T/ekVUQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hjDR6zFf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37ccd50faafso4360280f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2024 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728474245; x=1729079045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrCBXn8OEnLkQ8bOSvLpB3bghVcDr825c4fvC0xS41A=;
        b=hjDR6zFfRn6MZC4Gb/VA1AGaXL7U1zJ5z3iPfxeAQOFy++cR1UZx8/k252inBBv/2v
         U/4BvtXtfeQt8ZTgqzxzg6kUubVTI3xuq4eeBlddUkJYlCDKskHTH1M/FtspARxQSnxC
         rHJPOIDTvieiEdD7uY8jEVgrn1lgCIxw0l9KI8XYl0bJY4hLwvPul12TYSynaISe0Et/
         Kf9opcp7kKME0exhNHI3Y5WHYBAdhWQ7vkMYp9a0Fm86fZ8CIvE7mW75iwjoUtmrhJhC
         skJzsw7HknsPXXjKOdB1cX8q3oBQTzXrAN2sRhE8LNgAYQz930YkgUUIs31CwCjqe80M
         5ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474245; x=1729079045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrCBXn8OEnLkQ8bOSvLpB3bghVcDr825c4fvC0xS41A=;
        b=q0uBlhN1FBZDOvwa0ZPd3+XYkgDSllFZ+pEiBbQMQ0fj16JV0qb4bEJssKvuQGHjci
         gtPbMLhbfVyRCO/tpwlSU+qKcjQ1BkzJRm6zvhnk4zuYvHuhgqOqqrP3VyfZQT5PndSU
         Mu9jUX0JqxrE3Sb6hdHuszD7M7k2JNtkbd/P4SoSpwsYHaDPyIUcr2dbNagK668Too2f
         ZVRhkuAYW0uL6ckTHq9I0gRZX7bNib8zH1n7rPhGCh8hur0kqxbIDJ4JzNdxOpOMkjcZ
         qZBLlXY8Euq3xa8C33QaNhQV/NLLYm/BC7kaYPdTkONvIRv+y4x2+YyDKevGxvQ/3hNq
         Y1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXjIguVmGqLWL3UupdvqHFqCXzGn1Zd3easngVuuf4HZZDser5p/AOPg4BbbW1EapA+5ttWZ8/rgxj//Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRmjqma9I/18ljs6BV5CEahp+INJSRCAfpZmvqo7ETZDYQCTF
	N8ifiZFJ86wdr/HdRV/YOAGEX3tVmeNup7I6VOdzISn4A8J0uVuV7aTUdAhoIUeKB1EjfliYwPn
	zRF2AiFA1+oQ151gxIQXmHwGM3pNRlvsFqfxe
X-Google-Smtp-Source: AGHT+IEC35A5m1UDxY1lu3ETx4PWm6TK94Y/0Tw3NpnNGSCOgs4PXnOMWpDy2rkhXGvULGSApTbUZzCnN3vEFJxFFe4=
X-Received: by 2002:a5d:438b:0:b0:374:c7a3:3349 with SMTP id
 ffacd0b85a97d-37d3aaa3053mr1323357f8f.51.1728474244687; Wed, 09 Oct 2024
 04:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 13:43:52 +0200
Message-ID: <CAH5fLggcDNBv3n3CJ3F1SiRTKbdJ+Z_NkMMJCqpanNW-49hTqw@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 7:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
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
> The probe may also fail incorrectly with the below error message. To fix
> it, the /dev/null argument is replaced with a new rust/probe.rs file
> that doesn't need even the core part of the standard library.
>
> error[E0463]: can't find crate for `std`
>   |
>   =3D note: the `aarch64-unknown-none` target may not be installed
>   =3D help: consider downloading the target with `rustup target add aarch=
64-unknown-none`
>   =3D help: consider building the standard library from source with `carg=
o build -Zbuild-std`
>
> The -o and --out-dir parameters are altered to fix this warning:
>
>         warning: ignoring --out-dir flag due to -o flag
>
> I verified that the Kconfig version of rustc-option doesn't have the
> same issues.
>
> Fixes: c42297438aee ("kbuild: rust: Define probing macros for rustc")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Add `export` to RUSTC_BOOTSTRAP.
> - Fix error about core being missing.
> - Fix warning about -o flag.
> - Link to v1: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v=
1-1-9eb06261d4f7@google.com

v3 sent here:
https://lore.kernel.org/all/20241009-rustc-option-bootstrap-v3-1-5fa0d520ef=
ba@google.com/

Alice

