Return-Path: <linux-kbuild+bounces-2367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4B92798E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633491F21D45
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524C01B11E9;
	Thu,  4 Jul 2024 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="oL/xeAqo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650771AEFF5;
	Thu,  4 Jul 2024 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105566; cv=none; b=WImbED8gL+uzfgTMslA+4IOXMlfZvK8io+IPxLStQ7m9sVi//9Sie5NkgYTto/SJNiDYUiMQmxBg4NwRX/urNqLsEGsxWkvrED0ecFIsRtIJo8RGI22k8H9pD+CnZubt2WyB/DyWuAv858vYmXmJUNar/wBr8KzFnDd+pCKUNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105566; c=relaxed/simple;
	bh=O/rIHm2vHUSZsxeUoiEX/0t9NEzq9RzAEAqRqaKvRhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3basVCJ6J0kP43mo72NskFTidl3mIGUOnTPFFxE4IadFHgODrMrIdlmwIL9HjOwZn5G4wdv1ZG4c8gEWSd/URJ0dlp77HcqeTpkYDXi9nsfso+Qe7iq2aVKEpJw+VuHJ4dDgeA7MmiovOB+hPA0+Zv+vQxjxtCi4xBI1U2iQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=oL/xeAqo; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1720105558; bh=BfMLSZ0AT/mlle+53mZ6wwVCSyTdxQNs4XoaGRKGrCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oL/xeAqo14mbEBOpub69gGN+CpzUImD6m2uaiva1K4yk815JJV04Ygsr3TV/FwYzH
	 6M4ZOzXJzjQyuodgNP9TVEBvaQ9TWy88txYGLKkWJwpD1xG5BoT+fLR6Nkd/FxNof8
	 sfu4i3dJKsPM4y2ZAJk3fwhJB92z/b93HtFMPkLQ=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 11/13] kbuild: rust: add `rustc-version` support
Date: Thu, 04 Jul 2024 17:05:56 +0200
Message-ID: <69FCD7F0-9B70-45B5-B58D-E952A2FA99A1@kloenk.dev>
In-Reply-To: <20240701183625.665574-12-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
 <20240701183625.665574-12-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 1 Jul 2024, at 20:36, Miguel Ojeda wrote:

> Now that we are starting to support several Rust versions, introduce
> `rustc-version` support, mimicking the C side:
>
>   - `scripts/rustc-version.sh`, that mimics the other version scripts
>      (with one more digit, e.g. Rust 1.79.0 is 107900).
>
>   - `rustc-{info,name,version}` Kbuild macros.
>
>   - `CONFIG_RUSTC_VERSION` Kconfig symbol that calls `rustc-version`.
>
>   - `rustc-min-version` Kbuild macro that uses `CONFIG_RUSTC_VERSION`.
>
> With these, we can easily support flags conditionally depending on
> `rustc`'s version -- a user comes in the next patch.
>
> Another user will be the `-Ctarget-feature=3D+reserve-x18`/`-Zfixed-x18=
`
> arm64 flags [1].
>
> Link: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack=
-v2-1-c7b4a3f4d616@google.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Finn Behrens <me@kloenk.dev>

> ---
>  init/Kconfig              |  6 +++++
>  scripts/Kconfig.include   |  6 +++++
>  scripts/Makefile.compiler |  4 +++
>  scripts/rustc-version.sh  | 52 +++++++++++++++++++++++++++++++++++++++=

>  4 files changed, 68 insertions(+)
>  create mode 100755 scripts/rustc-version.sh
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 94e20d3b99d4..7d344f248785 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1920,6 +1920,12 @@ config RUST
>
>  	  If unsure, say N.
>
> +config RUSTC_VERSION
> +	int
> +	depends on RUST
> +	default $(rustc-version)
> +	default 0
> +
>  config RUSTC_VERSION_TEXT
>  	string
>  	depends on RUST
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 3ee8ecfb8c04..82ab889725db 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(co=
mma) this C compiler is not
>  cc-name :=3D $(shell,set -- $(cc-info) && echo $1)
>  cc-version :=3D $(shell,set -- $(cc-info) && echo $2)
>
> +# Get the Rust compiler name, version, and error out if it is not supp=
orted.
> +rustc-info :=3D $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
> +$(error-if,$(success,test -z "$(rustc-info)"),Sorry$(comma) this Rust =
compiler is not supported.)
> +rustc-name :=3D $(shell,set -- $(rustc-info) && echo $1)
> +rustc-version :=3D $(shell,set -- $(rustc-info) && echo $2)
> +
>  # Get the assembler name, version, and error out if it is not supporte=
d.
>  as-info :=3D $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FL=
AGS))
>  $(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assemble=
r is not supported.)
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 92be0c9a13ee..17eaa085b59c 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -69,6 +69,10 @@ gcc-min-version =3D $(call test-ge, $(CONFIG_GCC_VER=
SION), $1)
>  # Usage: cflags-$(call clang-min-version, 110000) +=3D -foo
>  clang-min-version =3D $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
>
> +# rustc-min-version
> +# Usage: rustflags-$(call rustc-min-version, 107900) +=3D -foo
> +rustc-min-version =3D $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
> +
>  # ld-option
>  # Usage: KBUILD_LDFLAGS +=3D $(call ld-option, -X, -Y)
>  ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2=
),$(3))
> diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
> new file mode 100755
> index 000000000000..4e658fd55ae6
> --- /dev/null
> +++ b/scripts/rustc-version.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the Rust compiler name and its version in a 5 or 6-digit form.=

> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical up-to-7-digits form.=

> +#
> +# Note that this function uses one more digit (compared to other
> +# instances in other version scripts) to give a bit more space to
> +# `rustc` since it will reach 1.100.0 in late 2026.
> +get_canonical_version()
> +{
> +	IFS=3D.
> +	set -- $1
> +	echo $((100000 * $1 + 100 * $2 + $3))
> +}
> +
> +orig_args=3D"$@"
> +
> +set -- $("$@" --version)
> +
> +name=3D$1
> +
> +min_tool_version=3D$(dirname $0)/min-tool-version.sh
> +
> +case "$name" in
> +rustc)
> +	version=3D$2
> +	min_version=3D$($min_tool_version rustc)
> +	;;
> +*)
> +	echo "$orig_args: unknown Rust compiler" >&2
> +	exit 1
> +	;;
> +esac
> +
> +rustcversion=3D$(get_canonical_version $version)
> +min_rustcversion=3D$(get_canonical_version $min_version)
> +
> +if [ "$rustcversion" -lt "$min_rustcversion" ]; then
> +	echo >&2 "***"
> +	echo >&2 "*** Rust compiler is too old."
> +	echo >&2 "***   Your $name version:    $version"
> +	echo >&2 "***   Minimum $name version: $min_version"
> +	echo >&2 "***"
> +	exit 1
> +fi
> +
> +echo $name $rustcversion
> -- =

> 2.45.2

