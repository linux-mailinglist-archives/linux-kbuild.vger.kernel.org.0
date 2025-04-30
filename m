Return-Path: <linux-kbuild+bounces-6803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E8AA4A66
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 13:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233E79C68D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 11:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C3D2586C1;
	Wed, 30 Apr 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YoJ+ndUL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015702586E2
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014122; cv=none; b=iPMRIy+MkYPtbIWKGlBYYDdCCNJTu7/sQ+N+9VnuA07EbRv928KxOiNZaWQWGd+olbWFt6Ox0zJAi5WyIjXkU7/p1oUEDrv1k8ZN+2bZS83CVAEcqO8SmL3gAMKcVhzctZ0KPFBI7urWP2eGcZRgAgSJDibmXa5O13PY/1LjeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014122; c=relaxed/simple;
	bh=cEafmn+CQvRdDtyXdQjjjTvqE/nBCdUlVRZYmX2VXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXg4TqjA9HbWFcae+ygMNZQ+3G+sxewuvRrJ+cnN00a5kA2oqeMiDAswmdaQjHF+wlPKpQoSO4mgfjGuAgk5tCtLcV6UtxUbW8v0iXc25sJqJUpLM7TKK3RIjz/YaxlGSwHtKwgHJcEuld5RX2I3qc+YnRJSezOalA+w0YnqhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YoJ+ndUL; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30a0c05e2c6so4156089a91.2
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746014120; x=1746618920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=YoJ+ndULHvhDDEaOaEviI4jkJJ55/+UgDZdUpuZX3Yg7aXH44j24FW2HPRc6neAjB3
         QMuJFyjSMM3HzbrIwJ1eBkxer5cYtPgS8In+F2nEM0drWzg8fLlNlyFSAb/+KKIi+/qx
         KExhH+iQYaU1RWKP6tfLQillpfBjgmxsKElcjI1JBDrut5D4/KYKZ49MZ7OuTyIcLc+S
         FG/esUVPqhypZ6OAJsWiFQw13wwT7PEuff/RWm6i2yLEGCs+4+Vp1csnoRZ3HQM5HsmN
         b2LWovWx7uuXjlAnsafGySecjRuec7/AFNBUg4FZCprNBHXB559rWOX5KCsbO4q+biEB
         83DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014120; x=1746618920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=i6VGyA2qn5mFvdyiQw+qb586HqcsEaZfSxQBW92PdzgwBqVFKZDQCWdYrbvGs0pre4
         2gw2jCSo9bSIIbqoJBOc+QRTPKhYtlXZGTbDG7Z4Y5L+kXK5Mpnd6nUQjmQzUmLl5C6C
         CplY1ayTlxRzS0MjugKZcBI3Nq2jej3C7WUtDtu6/J7+v5O9rje14zKx9jTATTDtHrni
         CglzjuHi96yovFr6m1+YpjTAPR8fjgmiHbFkjbq5zsLiacuFTrJvTC3TYjhajLlBSuCx
         4nOivxedncizy3+kv9iCM+mAyF2XeWkYC3ZqQ9107+qqWGahMUzcKFErJT/aiWIBcWEv
         u7EA==
X-Forwarded-Encrypted: i=1; AJvYcCV9EpMY++Jvqz3xG15PVFv5mZwoQML2sWJ+Z7UMNQx6EZfGDlpwx8y+4Rc2x2u8UTN/DXhsO2IJziDz6PM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GUe9g9MaAmNvE+xel/g6+jKCVl2Z4IPovshzngBWK3SkbY0W
	47OZuGzI+3WGYQ1+MG7+2v+lblIsEteLXnV6QWmk5jmf6DzRClfYjjkDCV2pcl1/kEw/oN3gtOt
	3n78G7EyhxcHkKwOuyKb/InJOrBcF8Iy0muF4
X-Gm-Gg: ASbGnct7JhAImXdL1hCVr+P4sTnMapepzUIrz5GBGxs2ZO3aFG1iaHQlaAp6J45ZT9X
	W8OqA17JH+HOn1k94ZidDf8+DUP6n1/2RbxqK4LrhHFH4MtY6pOGGyCyoV5dcQ6D3HFVko/u+3c
	+bBDU50wKar0+F+fWzedezC6oPmoGb4xo9g5tcrJ40/RlJTDNP+yNE
X-Google-Smtp-Source: AGHT+IGwJXAzQrRYamfgcjkePkCyZD/+tcwqKUOPh3vaz9WJg9ywHz6ypW3p7A0p0mLXG8BPw3/UYz781u1FtNYWFzs=
X-Received: by 2002:a17:90a:da83:b0:305:2d27:7c9f with SMTP id
 98e67ed59e1d1-30a3331eebbmr4689528a91.16.1746014119912; Wed, 30 Apr 2025
 04:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 30 Apr 2025 13:55:06 +0200
X-Gm-Features: ATxdqUGMpC2B1RGjyZnHvqdqDFG5FAFUqW_p8EIC04ZX-V4PP8t0Bammv6S-GJE
Message-ID: <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

I've run syzkaller against a kernel built with the patch applied and
the tool was able to successfully obtain coverage feedback from the
Rust code, so
Tested-by: Aleksandr Nogikh <nogikh@google.com>

As a side note, in the resulting code coverage I also see a lot of PCs
from rustlib, which isn't the primary target when fuzzing the kernel.
Do you find it reasonable not to instrument rustlib with coverage
callbacks? For C code, there do exist some exceptions for KCOV, see
e.g. lib/Makefile.

> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8=
efa106e8dffa640 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -fsa=
nitize-coverage=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtree=
)/scripts/gcc-plugins/sancov_plugin.so
>
> +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-mo=
dule
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-level=3D3
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-compares
> +
>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e=
129effb8846d5b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
>         $(CFLAGS_KCOV))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> +       $(RUSTFLAGS_KCOV))
>  endif
>
>  #
>
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250430-rust-kcov-6c74fd0f1f06
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>

