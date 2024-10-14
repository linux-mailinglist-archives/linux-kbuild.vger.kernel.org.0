Return-Path: <linux-kbuild+bounces-4102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242D99D6B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 20:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EF60B20CE2
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 18:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBE01B4F0B;
	Mon, 14 Oct 2024 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbWEKxsw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25581749;
	Mon, 14 Oct 2024 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728931515; cv=none; b=BSWiXlBo6nIyjr3a8O3yfFQ8i+6vUUV6smhZZgbOjNEOdY5ZDlXpom9PVU9SzPJxMGbBRnmuXA8YDoBFDd0DzBsui+l7pQ2wzHYCoh26vXToPSNB9nsH/5ztGS6OjlAHn/KnnBpWxlfWmUpOXnV3uht4cC8+fpJEz18xpV3eM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728931515; c=relaxed/simple;
	bh=AR7OI2AJq0pfcic+fS8++QGc+5Nkqb8E/hRfpcLjoL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXmfPBjiIFAyD+e2QWyzcumT+/NA2ASOFTR2Ayn5DvZdPUhEMAoP3nlMR5RjLP7YnL7jqWQE9w8tIVJMBrmupMyEklcFja5LH+nE1mdN7M+kAO3Ck7Tkxi04T6oeVXCsVkinoDW7k3i0DsAzZr149V1g12NIa3S6vJAPbpMVTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbWEKxsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBFAC4CED8;
	Mon, 14 Oct 2024 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728931514;
	bh=AR7OI2AJq0pfcic+fS8++QGc+5Nkqb8E/hRfpcLjoL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fbWEKxswALB8w+wS7lMPXBe61QYP7L6PcYRfN7i/Bim9ejQYA5lQ9mLZd4SYWktne
	 6tWIqX02b8DLdle5/RvuNYh2C20p4AIP1sbB2DxFZB82C+FmvIorA9Rg+Nq5GBVmu1
	 iF9Vi1ruLJUKR6ATM2u0OGCM/5BdG/5753GI5/5NDJiaY+YRzxWotFqHkSlV5ZcvBS
	 /tF1EhKsvUlbgYUMijxVu1HBZPMDrdbfRIFhps+0CncWIVv1+n2zahhArsEHIiFDaT
	 7MAZc9UgxnQPJmRHg5FRszWUILaVM1SnAnzUeHAQMbc+A8mWy9doq9jr7ILkby6aRJ
	 BNsyLs2zA1wLA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so1806144e87.1;
        Mon, 14 Oct 2024 11:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS9sv7b35dTK1iqn5nBIkF5EWZaiOUtYFyJaR4BJbRBxrHhjZt1pnUCQyqb2waTbGzSQBqp+LL3DlQXaI=@vger.kernel.org, AJvYcCVkG8YwX1rkHSttcmtHqkA+kcCu7j//LjDqmqlAONWCCGMx6osA6EkmOcslEVblcqQJ3j30leFWw/Xx/xf8@vger.kernel.org, AJvYcCW5Wo6CX4+ngq88nHzSCqPU6Wbm0tFlZ5gTmgwKTeDbvkB+ebEUEi3Jc0k2VcMRIlCy9ELJ46pDKmXXGAjpgjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aRPNhWkkc5oWlc2cotT1th9HjeHQsZyEo5m3EZCttMDUckkV
	ti814VNh918g/3N4vkKcdoGVudW+J7Z9fRp2qSbGYos5g/zMmQ16KNMV/658ZGJR73kTzkHqKS/
	KAEW0ef4Z0EUdPCIJyq2wXI7sk7A=
X-Google-Smtp-Source: AGHT+IHB1/ngWG50lMG4VjFiCLG+stNu7Qu3+hhIK/gzKRjLsiHv7sJeF7uKA2FJfkj1yXyKzZQ+9Ywi7xTTgtvHJ6k=
X-Received: by 2002:ac2:4c4c:0:b0:536:73b5:d971 with SMTP id
 2adb3069b0e04-539da565d7emr5875422e87.38.1728931513081; Mon, 14 Oct 2024
 11:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <20241010142833.98528-2-tamird@gmail.com>
In-Reply-To: <20241010142833.98528-2-tamird@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 15 Oct 2024 03:44:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5BGwM2CYckhM5J70eCpLunBG6hToR_K604nXgxnHL4w@mail.gmail.com>
Message-ID: <CAK7LNAS5BGwM2CYckhM5J70eCpLunBG6hToR_K604nXgxnHL4w@mail.gmail.com>
Subject: Re: [PATCH v5] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, Fiona Behrens <me@kloenk.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	Danny Lin <danny@kdrag0n.dev>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Rust proc-macro crates are loaded by the compiler at compile-time, so
> are always dynamic libraries; on macOS, these artifacts get a .dylib
> extension rather than .so.
>
> Replace hardcoded paths ending in .so with paths obtained from the
> compiler.
>
> This allows the kernel to build with CONFIG_RUST=3Dy on macOS.
>
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> V4 -> V5: Added missing `shell` in rust/Makefile.
> V3 -> V4: Added motivation. Added missing Signed-off-by.
> V2 -> V3: Added .strip() to rustc output to remove errant newline.
> V1 -> V2: De-duplicated and sorted imports. Changed Signed-off-by to
> Co-developed-by.
>
>  .gitignore                        |  1 +
>  Makefile                          |  2 +-
>  rust/Makefile                     | 21 ++++++++++++---------
>  scripts/generate_rust_analyzer.py | 15 +++++++++++----
>  4 files changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index a61e4778d011..088696a6a46a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -22,6 +22,7 @@
>  *.dtb.S
>  *.dtbo.S
>  *.dwo
> +*.dylib
>  *.elf
>  *.gcno
>  *.gcda
> diff --git a/Makefile b/Makefile
> index a9e723cb0596..470e6f20c513 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1513,7 +1513,7 @@ MRPROPER_FILES +=3D include/config include/generate=
d          \
>                   certs/x509.genkey \
>                   vmlinux-gdb.py \
>                   rpmbuild \
> -                 rust/libmacros.so
> +                 rust/libmacros.so rust/libmacros.dylib
>
>  # clean - Delete most, but leave enough to build external modules
>  #
> diff --git a/rust/Makefile b/rust/Makefile
> index 0856fd6bc610..2e9fd151fce4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -11,9 +11,6 @@ always-$(CONFIG_RUST) +=3D exports_core_generated.h
>  obj-$(CONFIG_RUST) +=3D helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-decla=
rations
>
> -always-$(CONFIG_RUST) +=3D libmacros.so
> -no-clean-files +=3D libmacros.so
> -
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D alloc.o bindings.o kernel.o
>  always-$(CONFIG_RUST) +=3D exports_alloc_generated.h exports_helpers_gen=
erated.h \
> @@ -36,9 +33,15 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_ke=
rnel_generated_kunit.c
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated_kunit.=
o
>
> -# Avoids running `$(RUSTC)` for the sysroot when it may not be available=
.
> +# Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
>
> +libmacros_name :=3D $(shell $(RUSTC) --print file-names --crate-name mac=
ros --crate-type proc-macro - < /dev/null)
> +libmacros_extension :=3D $(patsubst libmacros.%,%,$(libmacros_name))
> +
> +always-$(CONFIG_RUST) +=3D $(libmacros_name)
> +no-clean-files +=3D $(libmacros_name)


This no-clean-files is meaningless and unnecessary.
This line exists inside the "ifdef CONFIG_RUST" ... "endif" block.

no-clean-files is only used by scripts/Makefile.clean,
which does not include include/config/auto.conf.







--=20
Best Regards
Masahiro Yamada

