Return-Path: <linux-kbuild+bounces-6184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D483DA63341
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 03:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0E13B0619
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 02:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13768847B;
	Sun, 16 Mar 2025 02:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa/FB3Ap"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5382F36;
	Sun, 16 Mar 2025 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742090500; cv=none; b=TAAf66GS9L7Oz5G0KnGVpKQiTJZoypvOOnQilBQfTGesGNpUvl7uBkYDg3oqVQx1WdbEyj7KmUn6sBhajhZXPP1djx6hya3Ne0GUXEsf/Ll6V8jjHq6TH3DDduk5r7rI7+6qqTTXj3vPQvK5qcL/BZO1uXQGxE0D9iiQLCtfkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742090500; c=relaxed/simple;
	bh=2Arjfizzb2gSNR+WjTG8lT9cZFk0IOT5NlnWiOw5AcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHJdRfG/l9cYgf7RmVVnSbvdL8dlTrpWZOo4gC4yeVjzQRJJe0BSrTjeZ9i417EQXFAkwcU5hiio6O/gDXZZ3fjzCLca5i0ppIupEhlfYYXaKDxfJ/1ms6AwFiQ7QG6vNDkPejlSRPCl22bMRiG6SShZY3+kMm2SwDYCXmjNv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa/FB3Ap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87E6C4AF09;
	Sun, 16 Mar 2025 02:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742090499;
	bh=2Arjfizzb2gSNR+WjTG8lT9cZFk0IOT5NlnWiOw5AcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pa/FB3Apbu9QlSUxKPWng5A/TGin832UA7TOq+VIVbcrOYf0Rzd6awNSCoqhPlULV
	 W9gdh/cGCZg2wvf16M47ebiE0IN4axN7mFGwQvIvOa0YtDdnR3sh9uH2LLAOj3GUhR
	 7gpCzIyqAyF9GTYr0JiSEAFN88a/coyD+LIBxWNFH4TAwWLC5RJpcK5EVs92loEYY3
	 ZtseYLwww1jVYH75qYfnKSZ1iU+kMQy/5cmfRSHJxCW6f9WAQ5VeZNjpxOJMWDLJbD
	 fX+twUWZHZkaiByf1Fi3bz0Kt5+z1FP5SMm24MG069ZEX4Psn+U6JUFJ76VPiZvrVG
	 Xw1VUtkHqNSPQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b116321aso3756212e87.3;
        Sat, 15 Mar 2025 19:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5AnLqlDaxfCu9ps70H6/QUP1cB238BuilvQvi+yxDiuUKPsA6KUz6Iva98A5YVAd4AcM/eaFTb56RS7k=@vger.kernel.org, AJvYcCUzFJlaZSV/1RXCfFpLJiMtgXGIPUZU037Mlwndq9EE6XVbM8tSRITBqTv+GXp5lA3ewh/egjUkqe5z0lTam7s=@vger.kernel.org, AJvYcCWVItII7p6bAjpyvedN7phnEyNgxEdSs9weL04sllUoG+tW7J+zeR3WmpSEPB0GhvwRHJ2jcJ7ZT9Q0SLiV@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaC8s4PIoNETdwI+wJWD0ufokLXu+rhiflvPR4/JD0zshSV1Q
	d6rdlLC/uSeaOJZRMnPGqhJNWL8Ci9oJert6kHtjQPxBgzoAD09ZPnom363pUMMnWjHhX9x9S3E
	Ooqf4bBZ+jYHJB4YnVUtozN1ypIE=
X-Google-Smtp-Source: AGHT+IFxa4d1/tQXHJ1+iZsSL1Rrhqc7WpycIqFFXpi5pz+aSLjYUG5l3bMLK7CtiNadloFwe4WxtjLZLSReotL56FM=
X-Received: by 2002:a05:6512:31d5:b0:549:39ca:13fc with SMTP id
 2adb3069b0e04-549c394fdffmr2992262e87.49.1742090498341; Sat, 15 Mar 2025
 19:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194045.2353200-1-ojeda@kernel.org>
In-Reply-To: <20250315194045.2353200-1-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Mar 2025 11:01:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaXXWCJtrt+wp3jr4GEC4M8QknKouWSOQ-eqpVkak5Pw@mail.gmail.com>
X-Gm-Features: AQ5f1JreqjeN0HiiGMEIFMWQpGk6bl16687TeIEZofS1RjmgnF6S_TivIYKx2jA
Message-ID: <CAK7LNAQaXXWCJtrt+wp3jr4GEC4M8QknKouWSOQ-eqpVkak5Pw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: skip `--remap-path-prefix` for `rustdoc`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 4:40=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `rustdoc` only recognizes `--remap-path-prefix` starting with
> Rust 1.81.0, which is later than on minimum, so we cannot pass it
> unconditionally. Otherwise, we get:
>
>     error: Unrecognized option: 'remap-path-prefix'
>
> Note that `rustc` (the compiler) does recognize the flag since a long
> time ago (1.26.0).
>
> Moreover, `rustdoc` since Rust 1.82.0 ICEs in out-of-tree builds when
> using `--remap-path-prefix`. The issue has been reduced and reported
> upstream [1].
>
> Thus workaround both issues by simply skipping the flag when generating
> the docs -- it is not critical there anyway.
>
> The ICE does not reproduce under `--test`, but we still need to skip
> the flag as well for `RUSTDOC TK` since it is not recognized.
>
> Fixes: 6b5747d07138 ("kbuild, rust: use -fremap-path-prefix to make paths=
 relative")

Applied to linux-kbuild. Thanks.

Please note I locally modified the Fixes tag as follows:

Fixes: dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make
paths relative")

I rebased in order to fix my missing Signed-off-by,
so the commit ID of the former commits changed.






> Link: https://github.com/rust-lang/rust/issues/138520 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> v2:
>   - Skip the flag also in `RUSTDOC TK`. The ICE does not apply there,
>     but we still need to skip the flag.
>
>  rust/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ea3849eb78f6..089473a89d46 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -57,10 +57,14 @@ endif
>  core-cfgs =3D \
>      --cfg no_fp_fmt_parse
>
> +# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` o=
nly
> +# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds sinc=
e Rust
> +# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaro=
und both
> +# issues skipping the flag. The former also applies to `RUSTDOC TK`.
>  quiet_cmd_rustdoc =3D RUSTDOC $(if $(rustdoc_host),H, ) $<
>        cmd_rustdoc =3D \
>         OBJTREE=3D$(abspath $(objtree)) \
> -       $(RUSTDOC) $(filter-out $(skip_flags),$(if $(rustdoc_host),$(rust=
_common_flags),$(rust_flags))) \
> +       $(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=3D%,$(i=
f $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
>                 $(rustc_target_flags) -L$(objtree)/$(obj) \
>                 -Zunstable-options --generate-link-to-definition \
>                 --output $(rustdoc_output) \
> @@ -171,7 +175,7 @@ quiet_cmd_rustdoc_test_kernel =3D RUSTDOC TK $<
>         rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
>         mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
>         OBJTREE=3D$(abspath $(objtree)) \
> -       $(RUSTDOC) --test $(rust_flags) \
> +       $(RUSTDOC) --test $(filter-out --remap-path-prefix=3D%,$(rust_fla=
gs)) \
>                 -L$(objtree)/$(obj) --extern ffi --extern kernel \
>                 --extern build_error --extern macros \
>                 --extern bindings --extern uapi \
>
> base-commit: bc5431693696b3f928b0b7acf8d7a120127db7a4
> --
> 2.49.0



--=20
Best Regards
Masahiro Yamada

