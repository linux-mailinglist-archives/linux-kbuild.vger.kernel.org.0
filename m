Return-Path: <linux-kbuild+bounces-8199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D2B12B54
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 18:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FBC16B7F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C57523C512;
	Sat, 26 Jul 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nswe3jsq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28236229B28;
	Sat, 26 Jul 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753545929; cv=none; b=L0m7x7kDzlVMJ6DYjsKrAQAz+83Ii+cm3LdwmGFd5wbdVjre6crBzoaBXvHGIfGdx5l8EUmjhukbcovU8cwIXkJri20f5cZlWL5RSZpcpHfDJmtRZog/rHCGKP7HycotOJcbSKEMw5oc8ofFHzY/TnNgqpH1YZSAd4uMfPDgtdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753545929; c=relaxed/simple;
	bh=6MpzxbPX27NadrsGk0zw216Oyyfxgmiy2Y1q0a0nRAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNc4MSWjcjLZKx14+alle/hEB/fpdsS26S2Ug1NcPdKU28JH0PicelUlAKY3bZS5WYrwX+mceII8JOfqjyOvar77F9Sb6Ju//ow6Zq88nHWkXSTc2+u6xARV/h9yb+xQeGuUPUMdWbKFGnOkK4cT/mKdGCGdAb0YwaFK7WvMfmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nswe3jsq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30E6C4CEFB;
	Sat, 26 Jul 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753545928;
	bh=6MpzxbPX27NadrsGk0zw216Oyyfxgmiy2Y1q0a0nRAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nswe3jsqp6uE7J1q7VAwlweFK/2EEUj7/yxpjrJQyvWTj4EeJEZBv0JpsuCBwmk9j
	 KQGbwwXZkDzP3Cv/CmuBqW5czzXH4Amoedtr7f+H5hLT3PHXN7KteirmjuUQiZOAQl
	 klNA3B27wfo4lQDjcAPDelN6tRNDHFIX5fF86m2sx5GTcFLgwLLiXX/d6P7PkMYoCj
	 8kmhXu/aREl7k1k6ju8PWjjtBJetXCVS6rBAYEiiFnlB0QmrzDwj6nZ6ZsREF+y7qo
	 u/Kn73NsPR4Njr7h9iAxCY18/TebJ9DGgoU2vR+YIAqUCF0naKkBNT6CMpQ2EJRehI
	 jsQfyRqmURChQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso26092041fa.2;
        Sat, 26 Jul 2025 09:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm4wZU5Kjo9lk8+VOpDhKzgcRUhbghpshkKkeTR8aUr9pV6U0GTxnihuCgQ80c+qjuAYbN7OxP@vger.kernel.org, AJvYcCW9Pokhay7emdGiqHt7+BJ/vNl5y5V6r+W40XyCeLLDK8bbFakxcS/UJtbTcvs7LNXm5c1SnPIjMf8vhZth@vger.kernel.org, AJvYcCWF91BvpCTpnv5kZOC3Y5dPL5/yb2isbZZvB0iLccT+TCeM0bmCwQi9PagtnGmd66DsrYlfTWv9T2JjD8s=@vger.kernel.org, AJvYcCWbf7DbCWiWXoB8jmrimMnSPXUFJRQDH1whVbEsbSe4mWAtQyzOKvfJUiJvGkD4bklxoH7xLmavrjKUGj2Y4Po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8Mj2Kx5qEffcXyyzK8fzSpczPBUvKo+MAv5wzxYPvon4TN1V
	vSLU75P9yLkFpPa4hUpKtM+JN5bZSVKy3Z5fBpmK1tHGnBYWBq0svO9yfgv/WuwJACrcTCY8jod
	z9CEp0VI8oodwxBeVzXY6CS5nHbk1Zqs=
X-Google-Smtp-Source: AGHT+IG3EDvduZsc53+xFnV4ZnOEuNccFoxXRBW2DEcupA+kF+Dd/tDVGJKqs9SWSByGCvtmwfD4iZl2Wi/hY9T3Dvo=
X-Received: by 2002:a05:651c:154b:b0:32a:8916:55af with SMTP id
 38308e7fff4ca-331ee622688mr19317841fa.2.1753545927125; Sat, 26 Jul 2025
 09:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726133435.2460085-1-ojeda@kernel.org>
In-Reply-To: <20250726133435.2460085-1-ojeda@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 26 Jul 2025 12:04:50 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kneAWVxMNYcmQzks6NaprRPJZPyFkRBtLmtseemyJgbg@mail.gmail.com>
X-Gm-Features: Ac12FXxAFNw0PPG_mgb-afX1RFMqeDfPaH7GOci4UnEY3JifxOIfnYstVIjNq5A
Message-ID: <CAJ-ks9kneAWVxMNYcmQzks6NaprRPJZPyFkRBtLmtseemyJgbg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: clean output before running `rustdoc`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 9:35=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `rustdoc` can get confused when generating documentation into a folder
> that contains generated files from other `rustdoc` versions.
>
> For instance, running something like:
>
>     rustup default 1.78.0
>     make LLVM=3D1 rustdoc
>     rustup default 1.88.0
>     make LLVM=3D1 rustdoc
>
> may generate errors like:
>
>     error: couldn't generate documentation: invalid template: last line e=
xpected to start with a comment
>       |
>       =3D note: failed to create or modify "./Documentation/output/rust/r=
ustdoc/src-files.js"
>
> Thus just always clean the output folder before generating the
> documentation -- we are anyway regenerating it every time the `rustdoc`
> target gets called, at least for the time being.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Reported-by: Daniel Almeida <daniel.almeida@collabora.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic=
/x/near/527201113
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I've seen this as well.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>


> ---
>  rust/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 115b63b7d1e3..771246bc7ae6 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -103,14 +103,14 @@ rustdoc: rustdoc-core rustdoc-macros rustdoc-compil=
er_builtins \
>  rustdoc-macros: private rustdoc_host =3D yes
>  rustdoc-macros: private rustc_target_flags =3D --crate-type proc-macro \
>      --extern proc_macro
> -rustdoc-macros: $(src)/macros/lib.rs FORCE
> +rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
>         +$(call if_changed,rustdoc)
>
>  # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` s=
hould
>  # not be needed -- see https://github.com/rust-lang/rust/pull/128307.
>  rustdoc-core: private skip_flags =3D --edition=3D2021 -Wrustdoc::unescap=
ed_backticks
>  rustdoc-core: private rustc_target_flags =3D --edition=3D$(core-edition)=
 $(core-cfgs)
> -rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> +rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
>         +$(call if_changed,rustdoc)
>
>  rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORC=
E
> @@ -122,7 +122,8 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
>  rustdoc-pin_init_internal: private rustdoc_host =3D yes
>  rustdoc-pin_init_internal: private rustc_target_flags =3D --cfg kernel \
>      --extern proc_macro --crate-type proc-macro
> -rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
> +rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> +    rustdoc-clean FORCE
>         +$(call if_changed,rustdoc)
>
>  rustdoc-pin_init: private rustdoc_host =3D yes
> @@ -140,6 +141,9 @@ rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rus=
tdoc-ffi rustdoc-macros \
>      $(obj)/bindings.o FORCE
>         +$(call if_changed,rustdoc)
>
> +rustdoc-clean: FORCE
> +       $(Q)rm -rf $(rustdoc_output)
> +
>  quiet_cmd_rustc_test_library =3D $(RUSTC_OR_CLIPPY_QUIET) TL $<
>        cmd_rustc_test_library =3D \
>         OBJTREE=3D$(abspath $(objtree)) \
>
> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
> --
> 2.50.1
>
>

