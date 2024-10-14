Return-Path: <linux-kbuild+bounces-4114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1899D96C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 23:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5585B2164F
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 21:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AF71C243C;
	Mon, 14 Oct 2024 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiudfWvf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0B1CBEB8;
	Mon, 14 Oct 2024 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943106; cv=none; b=tODgbWZWdJnSpZeVYUf/70rIxEbOSXMm19o6ZzfH4uLFfcr/pZhJycjxjyf726R1DRnQezS68XQrKgAYohFfauYQlDfPCCyJGzROv9AvAOXwNvilwu/U7thPbBXK4a13zTLj1UebIowa6l1CSPyiVIOjlA5pZYjR0saIRdPjV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943106; c=relaxed/simple;
	bh=ttMsIMdRS5R2Hugo7M2F50BnB7oPaz4uXKdUV1oAH6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQqB+tI0xP8l2HBNxaXfI36h3Iz4c2WstUOiDzD1XbZ8Ss7OJpfeoJ6ZhkI7I7PeE7EHOKdwRpSiKke4GTWSHvB5IbhC03akcxSjv9p4UlGJ/ikmg0007I7yzT025LweenPY1krEYkMy6jpRwpKVfRRuYeAVblKQm01V7RVdPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiudfWvf; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so835229a91.1;
        Mon, 14 Oct 2024 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943104; x=1729547904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubSJ5tRPhprz0A5bi/zbTllR6+1VeW5u79KZJdH1ZGs=;
        b=HiudfWvfJy94GpICXEoF/OqAMIjRY9+L83xaH/bmbgEUT+35uZORfLIGt+N20+e0g2
         IqfwcGhKm+cL2At8VRPn0M2jBlKrA99HRQAqYb63WF4OvsCTrALAfndcNXbIcWIfxgDW
         fdJoBVyNpcQ7YHciQuxUc53/f9YU+gyX4pFXz9kaHZDmDY0C47uZhwGLhYFGf39sHQGg
         oGWgAZIU9g5hL6etpTVKI5LFY6paax4ZQJG85KwKwPKcR27IyvX6EVcv4DWe+GfmRsey
         NbaUmdXi85lmOknOiBt4CsPG2lqCDKhQka3KDXeJjzOvY0EuQ1EkS4QuzGyIJSF6po6o
         BePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943104; x=1729547904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubSJ5tRPhprz0A5bi/zbTllR6+1VeW5u79KZJdH1ZGs=;
        b=uFTpJjDXrA8aoXMtbsxf3KG8Yeel3VAuAjuQ9kLlKYEfoH/adO6+h8u+bivans0old
         Xv3C0S4gYeU2DPAwDqV5m64yxrZoY+Z8hDX/SsfJ88dFcxjDPBmfGHmIE5SRqO+Jhu6f
         Oa/BtF4RBS1u1jfal5y96ECkQ8xZbcKF2p7i37Vcgr78tLvCi1lbQd/wkICbQLMrNFSG
         4rimjMhbN7evPxkwSNG5aRo4sN4ZbfdYLKUtxIj85XddKSjwHvl4kfPeLxUSct1Ash6r
         /z1ltAbpQC75188nhFlSOeQ3E2K+62PnWHb+Da6ZSBR9MJkubJfZExROxTnCjin8rrAv
         Gyfw==
X-Forwarded-Encrypted: i=1; AJvYcCUBzwmmicVhxftScvTjJmvpeVt+v0ZpqGXhVQJ0u0eCa0slZMHc8l/QrqQyzbZXVfzhphYhFn95FQ9uaWSq@vger.kernel.org, AJvYcCVrN/TSVp5XAa3F5RRYWLMg7natU6rYaBLI40Z2EXNnO0S45Nnokxpxm6qoY5E1fUiEQlcJaqghau2zkyI=@vger.kernel.org, AJvYcCXbqvUxqiBnCCx3WAtlsv8mBUkjQGgG0xq2+fbYMn4a0CTCd6GGDJaVpirAqM7mZxADVIn+ZRGaov6Th94Z1Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1hHolYvPczmIzvto/Qmc3H89DujWZWFVRQnRtJH4AIJIM3Df
	Jb1gNzKtRMNRxANygEStDT2riW5yrut/I83RmtxWDrH0cSySFi9hL20HyboqN0GvlLX08PFcJRX
	KIe5rXUongUhlgshIF1tVVsgXi7s=
X-Google-Smtp-Source: AGHT+IF1/ePcqZaNK7IjkUdd3e7oTsvCElbjK7vmVBIEFbOLk6wzv1hIsS0DE5TDQLXl8hkwMn3RH6cSENewAcF3ghw=
X-Received: by 2002:a17:90a:3f08:b0:2e1:f0ee:f41 with SMTP id
 98e67ed59e1d1-2e2f09d7353mr6178387a91.2.1728943104497; Mon, 14 Oct 2024
 14:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
In-Reply-To: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Oct 2024 23:58:11 +0200
Message-ID: <CANiq72nQ2PWLEw1J_8hqdX4LmZY80a7JQhJfs_UGV+SJ1h6OEQ@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 1:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
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

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded as discussed in the list. - Miguel ]

Cheers,
Miguel

