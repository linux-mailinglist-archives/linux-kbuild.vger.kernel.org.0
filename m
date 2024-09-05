Return-Path: <linux-kbuild+bounces-3386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0196CC0B
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 03:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7371C247CD
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 01:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9E21C27;
	Thu,  5 Sep 2024 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyY5zIoB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEFB7464;
	Thu,  5 Sep 2024 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725498528; cv=none; b=R9h3GXvurhZOA/rvWcwTbzQBhTN2odAYsca7elew555WvNl16Le3Au6hqbApSkWBH6XL6NUgJlnPl+6ajnWbVHvff9VON+G2IoMI+hftAGmuIoT7aXNcp262rQZmFSxaxVU++EgHX9Jk7LsP8uFttXH4COmF52YgjJ/Jcd2I2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725498528; c=relaxed/simple;
	bh=0eAygMpYMUKKaVFYb0b+bSm3rV9+kxvO8ubLJ0QOGA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5v82HI8GWcgElrthC87EQjFx1QDmhVfyjgldRMzz76kk6xcn4Zrawk1fqHtfG+GCkQItK/m9nY5aSGyi8tuETS9SEv0xLHJ4xOlymqco+5b2GcAdAlFRy/MXAfKL4R8xKzFxRDAAgSZ50w7O8dk550sLqT5vpH5TKC4mS+YAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyY5zIoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D03C4CEC8;
	Thu,  5 Sep 2024 01:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725498528;
	bh=0eAygMpYMUKKaVFYb0b+bSm3rV9+kxvO8ubLJ0QOGA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nyY5zIoBI5TvuW78FqWVdu7BNa5qbyRC6QJkDznQIRa9ktn5a8hS9/R4SUqCLoqWJ
	 gIiItndm7j86axv5Pufk+DumtrDqlK6QEg7zVed0YOn5sAALSOL74VYS9GJ4oJY+SK
	 4AnW4nIZxt2YQwoxeEPU51OMMYFaPNXKzTuTw6HCf6mGw/RQC862NBEPvqjBkqFswa
	 nFtlv8fi+LXHTvTyVxNANbhrvLjC8/4HiIp2zfYHrO4tTzpsTwxjyuxgDFtL7Nc837
	 /sbaiXyzUG9e6MwE75upY2ijY7LQBykCvC7fiHb01MvvfvH3/lzTc+4mnDcbzOgLDO
	 l+5qvqsTxrBsQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356bb55224so165350e87.0;
        Wed, 04 Sep 2024 18:08:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9WnUjIn+eb8xTLBKKOwhVvT8LF85RoSWCg4AMIuoucJSpXtNtyayrDOB4XsS540Mi2aOytuwwZ2CUQP8=@vger.kernel.org, AJvYcCXkz58HgM+2VFR7M3UOFks9gsYKnjt63C2iPt6NQ88cigtEQYsqwFf1SXtiXpm/GLxwkzA+uXzUhzYJi8SG@vger.kernel.org, AJvYcCXnSyVsg/iC4ApoGoiwCmMPZNosNpFE9fFhANuAz5Dqtoc4pvlGyMU7S/rcr7kQO69aXyBRf4Nl1bUAalmfyjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqnaegtNgBMwe0L64viRjyruUn4kgjEI+q5/39Mq56Y0Mh3DdF
	l1oNe/wSUhbjCJw4ZPo+Eg+vgkHs43vZrosJ8J9/CZXwE3ASzFNo2WyFrMvlr6PtmG4CiBMEKhh
	9XdHYWwsHBnn/rd6WE9L9Zg7eNsQ=
X-Google-Smtp-Source: AGHT+IHVMo+ONycK3UXEft3pK8yg79GjhZ75/GGU3cZa9yMkIhsCrhbO46PszfxVAOdcSPUpUyvUy5lf5PYym5BvIY4=
X-Received: by 2002:a05:6512:2807:b0:536:14a1:d660 with SMTP id
 2adb3069b0e04-53614a1d71cmr333883e87.6.1725498526672; Wed, 04 Sep 2024
 18:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org> <20240902165535.1101978-2-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-2-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Sep 2024 10:08:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5Fz=qf1Srf=RJhGANQZDmiKkuHPeTbqyT+SEwjtDZWQ@mail.gmail.com>
Message-ID: <CAK7LNAR5Fz=qf1Srf=RJhGANQZDmiKkuHPeTbqyT+SEwjtDZWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] kbuild: rust: add `CONFIG_RUSTC_VERSION`
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

On Tue, Sep 3, 2024 at 1:56=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Now that we support several Rust versions, introduce
> `CONFIG_RUSTC_VERSION` so that it can be used in Kconfig to enable and
> disable configuration options based on the `rustc` version.
>
> The approach taken resembles `pahole`'s -- see commit 613fe1692377
> ("kbuild: Add CONFIG_PAHOLE_VERSION"), i.e. a simple version parsing
> without trying to identify several kinds of compilers, since so far
> there is only one (`rustc`).
>
> However, unlike `pahole`'s, we also print a zero if executing failed for
> any reason, rather than checking if the command is found and executable
> (which still leaves things like a file that exists and is executable,
> but e.g. is built for another platform [1]). An equivalent approach to
> the one here was also submitted for `pahole` [2].
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3D4vX_tJMJLE6e+bg7ZE=
CHkS-AQpm8GBzuK75G1EB7+Nw@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/linux-kbuild/20240728125527.690726-1-ojeda@=
kernel.org/ [2]
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  init/Kconfig             |  7 +++++++
>  scripts/rustc-version.sh | 26 ++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100755 scripts/rustc-version.sh
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 839c83034006..38c1cfcce821 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -60,6 +60,13 @@ config LLD_VERSION
>         default $(ld-version) if LD_IS_LLD
>         default 0
>
> +config RUSTC_VERSION
> +       int
> +       default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
> +       help
> +         It does not depend on `RUST` since that one may need to use the=
 version
> +         in a `depends on`.
> +
>  config RUST_IS_AVAILABLE
>         def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
>         help
> diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
> new file mode 100755
> index 000000000000..62ea510be71b
> --- /dev/null
> +++ b/scripts/rustc-version.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Usage: $ ./rustc-version.sh rustc
> +#
> +# Print the Rust compiler name and its version in a 6 or 7-digit form.


This script does not print the name.

Only the version.




> +
> +# Convert the version string x.y.z to a canonical up-to-7-digits form.
> +#
> +# Note that this function uses one more digit (compared to other
> +# instances in other version scripts) to give a bit more space to
> +# `rustc` since it will reach 1.100.0 in late 2026.
> +get_canonical_version()
> +{
> +       IFS=3D.
> +       set -- $1
> +       echo $((100000 * $1 + 100 * $2 + $3))
> +}
> +
> +if output=3D$("$@" --version 2>/dev/null); then
> +       set -- $output
> +       get_canonical_version $2
> +else
> +       echo 0
> +       exit 1
> +fi
> --
> 2.46.0
>


--=20
Best Regards
Masahiro Yamada

