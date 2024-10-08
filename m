Return-Path: <linux-kbuild+bounces-3976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5267499574B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 21:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7104B1C2116A
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B42B212EE0;
	Tue,  8 Oct 2024 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6CFAavH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C046212D34;
	Tue,  8 Oct 2024 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728414001; cv=none; b=lu3bcXJUvDrJMKDSGSMnEV11Np9aOtgyi11NZoUyVmE/9Nr4jlExDll97ZR6QJdCsLWaiuJt+tXDgZ32o7mMoqstKQyf9uVCmSFraUDP5rFgUlHly2G1M2Ff4pbTCBaxOAfSebW2HqgAl1ImlA91vKwFIhawHrPe3dM5APQN4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728414001; c=relaxed/simple;
	bh=47tfC/mE+wTXdkhshcNOQiX/AwP/9xfoQpjkWe8GJ54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7EBcXibx16Hm1GA2scmIZZQH+BDnayLqUQ0D6hBMJbVy6q+AWQ6v4OGjks9RDdNO+sopl9JuLgsgpPtY64qecg9lkyUn+aKv0t5Pa1qVyLtnim6dJUFvvHi45HYQiICBJRWe7MMgkGTT7x2OqSLjiPm7ZETItO/v/hCgygShLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6CFAavH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF0DC4AF09;
	Tue,  8 Oct 2024 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728414000;
	bh=47tfC/mE+wTXdkhshcNOQiX/AwP/9xfoQpjkWe8GJ54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N6CFAavHLwTMnmEAgGLDNnUaMDRflfBbb1zkD6bkzW6A8HoN9b9HftoZKJR313ogX
	 IA+xQoT+2E6h8q/l5MvjO2Lu4m7x4ftUjm7+OJ+gjki7KBDRQ0kWt2ozlzXZ8ZisPi
	 o2qdtrcoHiIFd29jc6TqTRgKMk8nqMFEFOLVFG9vMPStyK3UNoVj3sGRbg8l+sLWsT
	 mY/lOSIsTYMl3Gft4NCLErFXtAClRokvi2ths758rx1A4kZhWfcdt4qH6pmSKL/y58
	 nmTqssdIN1OS+J+w+gRDJOHuuE5ynJaMdtQDAlb9KyB6EnWx0RQ7NS3e0b3WvSkt9p
	 MBbixwpLdM34w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so6860782e87.1;
        Tue, 08 Oct 2024 12:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3d/u9muDHxjUyaZ9ImGPTsfKat15yfZX/bm+EhSvVk6pJPoOGYZ4qIfeg2dwK9uUX48gI2wqPrjm4X4w=@vger.kernel.org, AJvYcCWR32jj8CFpO6f4slBL1qBlFpYdUF+dJ6XFwqsBOzKr1DPDJYqsCGif46GlAEXMOBbZ7qLjXhDJrmKNUWajRUY=@vger.kernel.org, AJvYcCX2DEVwQCi33StCkQatyW2KFLS6UyKslSSnlA5BnF+DUGr1eTebHNcQhi+jH2kW8EZzs+PSzWlL4cNZ17O7@vger.kernel.org
X-Gm-Message-State: AOJu0YybCZuO0DUo2LdN7nV7OLij1QXymGTJAznMLgBkjL4zJiErWblA
	3MQKtks9MQsQPgn1t9rgL6RLVs3YtFb2r4lBcbYcXhGkyLYzdrWPlutbKi18LmsunHlXBIlNKPS
	J81KnfbZTIeeNMyz2dcI0Vj3STaY=
X-Google-Smtp-Source: AGHT+IFL0+56APXMRNNBA/oAasZ+hCI5jkZVbCo1YoQYkIXukLn0HULtiOBaRxytK5YOlMXoY35N6xRMtbY87QQpVK0=
X-Received: by 2002:a05:6512:3c88:b0:52e:9f6b:64 with SMTP id
 2adb3069b0e04-539ab86b7d3mr8056365e87.34.1728413999094; Tue, 08 Oct 2024
 11:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 03:59:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
Message-ID: <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
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
> ---
>  rust/probe.rs             | 7 +++++++
>  scripts/Makefile.compiler | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/rust/probe.rs b/rust/probe.rs
> new file mode 100644
> index 000000000000..bf024e394408
> --- /dev/null
> +++ b/rust/probe.rs
> @@ -0,0 +1,7 @@
> +//! Nearly empty file passed to rustc-option by Make.
> +//!
> +//! The no_core attribute is needed because rustc-option otherwise fails=
 due to
> +//! not being able to find the core part of the standard library.
> +
> +#![feature(no_core)]
> +#![no_core]
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 057305eae85c..08d5b7177ea8 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_E=
XTMOD))/).tmp_$$$$
>  # automatically cleaned up.
>  try-run =3D $(shell set -e;              \
>         TMP=3D$(TMPOUT)/tmp;              \
> +       export RUSTC_BOOTSTRAP=3D1;       \


try-run is not Rust-specific.

Is there any reason why you did not add it
to __rustc-option?


__rustc-option =3D $(call try-run,\
       RUSTC_BOOTSTRAP=3D1 $(1) $(2) $(3) --crate-type=3Drlib
$(srctree)/rust/probe.rs --out-dir=3D$$TMP,$(3),$(4))



I guess it is still suspicious because the top-level Makefile
exports RUCTC_BOOTSTRAP.










>         trap "rm -rf $(TMPOUT)" EXIT;   \
>         mkdir -p $(TMPOUT);             \
>         if ($(1)) >/dev/null 2>&1;      \
> @@ -76,7 +77,7 @@ ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS) $=
(1) -v,$(1),$(2),$(3))
>  # __rustc-option
>  # Usage: MY_RUSTFLAGS +=3D $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS=
),-Cinstrument-coverage,-Zinstrument-coverage)
>  __rustc-option =3D $(call try-run,\
> -       $(1) $(2) $(3) --crate-type=3Drlib /dev/null --out-dir=3D$$TMPOUT=
 -o "$$TMP",$(3),$(4))
> +       $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs --out=
-dir=3D$$TMP,$(3),$(4))
>
>  # rustc-option
>  # Usage: rustflags-y +=3D $(call rustc-option,-Cinstrument-coverage,-Zin=
strument-coverage)
> @@ -86,4 +87,4 @@ rustc-option =3D $(call __rustc-option, $(RUSTC),\
>  # rustc-option-yn
>  # Usage: flag :=3D $(call rustc-option-yn,-Cinstrument-coverage)
>  rustc-option-yn =3D $(call try-run,\
> -       $(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=3Drlib /dev/null -=
-out-dir=3D$$TMPOUT -o "$$TMP",y,n)
> +       $(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=3Drlib $(srctree)/=
rust/probe.rs --out-dir=3D$$TMP,y,n)
>
> ---
> base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
> change-id: 20241008-rustc-option-bootstrap-607e5bf3114c
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
>


--=20
Best Regards
Masahiro Yamada

