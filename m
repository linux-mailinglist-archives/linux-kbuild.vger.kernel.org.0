Return-Path: <linux-kbuild+bounces-6182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD52A63244
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 21:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11E0189656A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 20:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB2519E994;
	Sat, 15 Mar 2025 20:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1pAvEpj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F919995B;
	Sat, 15 Mar 2025 20:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742069570; cv=none; b=fpJ3ZvQq9W8AwcLCwulZB+RVRwPLSGPDBHoR26UGha6mldU5P9DbXhiDhK5PM5Z72ZiYGxeIv3g3d1tXP0psp3vn/MMMYQweGVCZmbxOTM7pW0djKnc6edb0xtgSv8e7tut1ri85airohlfuE/RX04PbiXZMUB9rGW1PXfM4+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742069570; c=relaxed/simple;
	bh=QDbqp1bEfuNRkAkeWgCe8le/REa+td5CGaS1SXutrYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jaj84yPaGzjuVn4gZc4XKrcWnm39fdp9sEQqFxZJYBbIzK0agLkkUu8KkixhsxfvB/AlP1OVHmPmmgHvyIj1c8IEb2IY+XMqHfcGb05sza2YZaeu4hC225LjCMwW9GtvUKDSSJ1Y/RIQMswVqx8H33wOG+SfQsihovvjDAX3fhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1pAvEpj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30761be8fcfso35442771fa.0;
        Sat, 15 Mar 2025 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742069567; x=1742674367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3phS/r1RDvxvQ2MTiit7eQFWn/59+JXZG3F6Hx5Hm8I=;
        b=k1pAvEpjgeYNG5h8R1Gylhm/gxlia0/cRN88Oxn3HXaHhioCcdY/Yh4xq6E9zf17W3
         +lQrcOEWb7y4lLc5HAxX6ABKl7ZbMCRsEBFMon5cY/ufklj/9eIZinSvybL5xEg3FJiu
         DR8YLHYlepsYugz1iaRob2yR0Fm22WhD1+D+nwJOxe+F/AsbuytZLvZtU2EKeYvv9Y2Q
         a3lk3a2oE5rudyT6spIKk6HIJj5bUvoem07likb00zfiiUgyJJQ/WfHDCvxLhrBAPrBQ
         38UlUCdm+22WKtZLK+iXL4+G64Ih1hPMkBGjGmhdSYxS4D2NFgC08lZCzQ0m0xRFjZts
         fSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742069567; x=1742674367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3phS/r1RDvxvQ2MTiit7eQFWn/59+JXZG3F6Hx5Hm8I=;
        b=YXyDGwIxCMJH+ziq+nY2CiDW6d7hRQALotRDKaCxkPcoQeEhB7aL168jfa12OwpfqL
         jVnFmRbG0uACHFG086LlcGeK/kBpYOAJq/sM5mB6+aO9AOc4CXlXeGpgWmERH1xgyntT
         wREEItdK8r7vlpyw0+coLLnF7f4COaTqUkRcGOUDUEUwo9Cc5gd1Qf83xVKIjPpsOEyM
         vymVpxaY+W+eAzVYcixZ+QP+C9qKokeJLGJ0I9YqHxA7EFeEUI0iApOmwJUEaHUYjcAd
         PPfnR/15VFaBpTTGdy+6UKqLwBzIFza6sz/aywSPLDUubSycu5YmdXmBtuwx60Y7ZyJL
         YuyA==
X-Forwarded-Encrypted: i=1; AJvYcCWCrpPh0+3hbluI72m1TsAzN1DSmxqAwCBLaS7L8cdCbrpRWk6mzwLZe0ISbFFI53QFzUpwd3kT8Z0O1qM=@vger.kernel.org, AJvYcCWWDzTeMsKKtZxebaPOcvsga1b7hKt+PTyu5tjnOF6jELIiNCOnbd+FffReQnmHgNcOzTWOiuegaemz3oQkSow=@vger.kernel.org, AJvYcCX6CFr2ejlPgNoJgylum7LpF0q4l6u72y10W3Uj45E4s0kmkdEx8ZUN+LpMNz6Wj6TQqQMSQmpxi4jvGRw6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYH/mx7OBuxaIPI9n/rkn9ER/VnMS0wNxFDfVYQnaeW5dABtmO
	1Y8QXY+l59IyUC4InfCpJHA1RNi/ncm7lGUVzcXjrhQPsbmPrx2sp5Y+aNBe6YOu0XIePnH6lrE
	D9GBJbFIKmwX3jcGrYliyzl34fQU=
X-Gm-Gg: ASbGncsuNTRwBFtxK7u6G6/z2tUdRXLZdlxj/ddadNDQyz2NBrbiHaEXOapXsuH1RKh
	/mEfSvqVkVrkiWGA6pEmA1P5GQ2/MzpxPBzIMU3vbLV7V+AZnQDOdiLm/fFZcraz8+wUDZDn6yr
	vuHOII0+1W5LrBYYelTJ/tA2Y9XAvTGgd6oTuCDacPB3Hv9L7AHnZTXZObBDZR
X-Google-Smtp-Source: AGHT+IFm7u/ca+fpxCQ+7+YMZzrKOStRLWcuvfvFBYSJTa+No/pqBu7Qqr1e6HCaZmCkLCgP+lX+Ttx/F2r2o7AdNoE=
X-Received: by 2002:a2e:b895:0:b0:30c:1af6:b41a with SMTP id
 38308e7fff4ca-30c4a8769fcmr32496991fa.18.1742069566448; Sat, 15 Mar 2025
 13:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194045.2353200-1-ojeda@kernel.org>
In-Reply-To: <20250315194045.2353200-1-ojeda@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 15 Mar 2025 16:12:10 -0400
X-Gm-Features: AQ5f1JoSHl9Pk5sGde8YLinE1OIhoyWuxkSyv0i4A4qoM-oYiV0cuN7rEeMjPpY
Message-ID: <CAJ-ks9kk-31CfavAHqgzmZMXcaq07ZwMyButDVqNG-g5RMSD6A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: skip `--remap-path-prefix` for `rustdoc`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 3:41=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
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
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

