Return-Path: <linux-kbuild+bounces-4052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5AB9999EF
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 04:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521B52833EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 02:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798132F44;
	Fri, 11 Oct 2024 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVD0G3gI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB9A17996;
	Fri, 11 Oct 2024 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612243; cv=none; b=e7LYUL0z/dPQn5NCNxYXnuGqLvuQcB0XLmrWMB5Y2xT7yemKiCpEhYiHQcCzhD+5BLkYL2ogL7S1cu8Tm3N6lLhgfwTqJTCwKLVQeftbPAUFwmoR5jlhbqU5I0yUN75Qq1MPMivw7vX+uhqzwHIGP3G0XbFu1yXaoUFuytVR7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612243; c=relaxed/simple;
	bh=rc7c6U7V+zKbL4Na9AR8IkBF02SXaIKLBlAX9ny1e1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDia1o+R/HB+gyUrTvW342CkAXiBTR+0pWcOzrboeY1LYrxqtmFqLM8oMIYG3m0GQV0vz+UYkFntdJD8CFBJZadrluDzMgKzuN5vL9C7lNfpOMHX5Yg2xp9ZHZjHEUB/8hfR/Wg9VQTdSCTS95+kEhYalHys4bDOeUh0l9wBxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVD0G3gI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC02C4CECD;
	Fri, 11 Oct 2024 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728612242;
	bh=rc7c6U7V+zKbL4Na9AR8IkBF02SXaIKLBlAX9ny1e1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uVD0G3gIiD6YJxFZfEBrloWB3WS2Od2GzHKENU21HmWaPl1ZmFhEeIjboUmX+tON6
	 teRK2fQv3hoJsY17cjBMs9igZeMeWvvcasqizHGWB7XxxnI+kpcuSzoY6FaR59STlQ
	 BgiKrtaYf919RgANF3zbiqxmR0ZEU2WVX/8iEA0J8p9hiiOj4/V7yLAPte/PPR//LE
	 gEPq0ttVcXX6Kbd/MNE8k3IbGLnKHg9xFVQKRNvLnPk2Dp2G0bRVk56jsHZkz/PXGO
	 sCoVmJRYmooFfPdWQVu8+R5MNCdnvTMuT38Uow58fgLAWiqzPRW/N438aQcs+E+s4S
	 Kkfwo0zbAwwxQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb2c68ea2cso6129121fa.2;
        Thu, 10 Oct 2024 19:04:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGZQep411pDii7NU0ParbqRvkaVMu82UJs2DRpiUhn7s5M661ZM8ov/9Rn4umldkcIipj2pyAzcHuG6kDN@vger.kernel.org, AJvYcCW/9fHBYlS+HD/Koi6C83lqwkArp0ACsNmm/v97NeAIae5VhNZvFZK3ymXwFCuluxTTH3QlqHiZzZX+6DyCZ8k=@vger.kernel.org, AJvYcCXZBBFPNBQWFkitrWqmOdkWQjS77S4WhlfiKhmgRiHxqyNPZwWiUUi6hqowv4do0AwxSxmnfX3JObwRzvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtX3vE9i32CrCacnDvLknsxkQPc5we7eLNwv2TXTsebl58yBU
	rkZxOgct4ItaPcn2CkOCQgvVxiaxfwJ0OPWweu+AstzskYKpgsi8auEnl2iEpOhpw0B2nBGDWRZ
	C+lb63Bm8PSCu5Vc0EQLocnR/wrI=
X-Google-Smtp-Source: AGHT+IFSWVXmtFDfsV71FZjubAv2ssNQTvktk2A9cPcXvkGTOGP5RscegNrsCuvPZmJrSlVe3670sSObcbXz/X43boo=
X-Received: by 2002:a05:6512:220a:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-539da3c4bb0mr433254e87.16.1728612241253; Thu, 10 Oct 2024
 19:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com> <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
In-Reply-To: <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 11 Oct 2024 11:03:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
Message-ID: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 6:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Each version of Rust supports a range of LLVM versions. There are cases w=
here
> we want to gate a config on the LLVM version instead of the Rust version.
> Normalized cfi integer tags are one example [1].
>
> For consistency with cc-version and ld-version, the new version number is=
 added
> to the existing rustc-version script, rather than being added to a new sc=
ript.
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
> consistency with cc-version.
>
> Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-032898=
5cdf33@google.com/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  init/Kconfig             |  6 +++++-
>  scripts/Kconfig.include  |  4 ++++
>  scripts/rustc-version.sh | 31 +++++++++++++++++++++++++------
>  3 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 530a382ee0fe..98cf859d58c2 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -62,7 +62,7 @@ config LLD_VERSION
>
>  config RUSTC_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
> +       default $(rustc-version)
>         help
>           It does not depend on `RUST` since that one may need to use the=
 version
>           in a `depends on`.
> @@ -78,6 +78,10 @@ config RUST_IS_AVAILABLE
>           In particular, the Makefile target 'rustavailable' is useful to=
 check
>           why the Rust toolchain is not being detected.
>
> +config RUSTC_LLVM_VERSION
> +       int
> +       default $(rustc-llvm-version)
> +
>  config CC_CAN_LINK
>         bool
>         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG=
_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 785a491e5996..788097a55731 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -65,6 +65,10 @@ cc-option-bit =3D $(if-success,$(CC) -Werror $(1) -E -=
x c /dev/null -o /dev/null,$
>  m32-flag :=3D $(cc-option-bit,-m32)
>  m64-flag :=3D $(cc-option-bit,-m64)
>
> +rustc-info :=3D $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
> +rustc-version :=3D $(shell,set -- $(rustc-info) && echo $1)
> +rustc-llvm-version :=3D $(shell,set -- $(rustc-info) && echo $2)
> +
>  # $(rustc-option,<flag>)
>  # Return y if the Rust compiler supports <flag>, n otherwise
>  # Calls to this should be guarded so that they are not evaluated if
> diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
> index 4e22593e2eab..24e19ed8f234 100755
> --- a/scripts/rustc-version.sh
> +++ b/scripts/rustc-version.sh
> @@ -3,14 +3,23 @@
>  #
>  # Usage: $ ./rustc-version.sh rustc
>  #
> -# Print the Rust compiler version in a 6 or 7-digit form.
> +# Print the Rust compiler version and the LLVM version it uses in a 6 or
> +# 7-digit form.
> +
> +# Convert the version string x.y.z to a canonical up-to-6-digits form.
> +get_llvm_canonical_version()
> +{
> +       IFS=3D.
> +       set -- $1
> +       echo $((10000 * $1 + 100 * $2 + $3))
> +}
>
>  # Convert the version string x.y.z to a canonical up-to-7-digits form.
>  #
> -# Note that this function uses one more digit (compared to other
> -# instances in other version scripts) to give a bit more space to
> +# Note that this function uses one more digit (compared to other instanc=
es in
> +# other version scripts and the instance above) to give a bit more space=
 to
>  # `rustc` since it will reach 1.100.0 in late 2026.
> -get_canonical_version()
> +get_rustc_canonical_version()
>  {
>         IFS=3D.
>         set -- $1
> @@ -19,8 +28,18 @@ get_canonical_version()
>
>  if output=3D$("$@" --version 2>/dev/null); then
>         set -- $output
> -       get_canonical_version $2
> +       rustc_version=3D$(get_rustc_canonical_version $2)
>  else
> -       echo 0
> +       echo 0 0
>         exit 1
>  fi
> +
> +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> +       set -- $output
> +       rustc_llvm_version=3D$(get_llvm_canonical_version $3)
> +else
> +       echo 0 0
> +       exit 1
> +fi
> +
> +echo $rustc_version $rustc_llvm_version
>
> --
> 2.47.0.rc0.187.ge670bccf7e-goog
>
>



Please notice there is no reason to process
rustc_version and rustc_llvm_version in the same script
because they are completely independent.
It even invokes "rustc --version" twice.

If you implement it this way, you do not need to
touch scripts/rustc-version.sh at all.



If both rustc_version and rustc_llvm_version were
retrieved from the single invocation of "rustc --version",
I would agree "OK, it makes sense to implement it in the
same script". But, it isn't.





--
Best Regards


Masahiro Yamada

