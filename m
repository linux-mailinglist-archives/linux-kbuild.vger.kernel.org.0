Return-Path: <linux-kbuild+bounces-6867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56900AA7230
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8834C1151
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5004BA95E;
	Fri,  2 May 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o43WR3/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349822DF95
	for <linux-kbuild@vger.kernel.org>; Fri,  2 May 2025 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189374; cv=none; b=io0Iic0x0jCgKetOSOFZH8NJ7socx7aXAyYdApX2fA87O+FRmvWffnDiwiqBWxM2J4L1DE2mQ05njJzVIKjoa6ER/0yyPFz7YcD6xN4MzkEgOdqUwpOmvHn/FQZjJPganRHt6z2LplMR2/Tju70Yv+xUbS8yYDXeJ+zP4iDocbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189374; c=relaxed/simple;
	bh=JT+qr01uZcVOJZP4RQusBZiCCpnCtGRxDlD4tTq126I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juu45RBeqOMAa6vExwaLnElJVJ9eNpAEbZ7nToqFmB4NF+ULYt3pdIYxKX7dRyXTJpd5CZYDTPeeE8zxETwzBku8qK4L56AjhqDalzZ9cYBCg7FEQRJaBjHFHG7gJ6//17TDtSmulN61VPD+u57Ngb/vh0LA0FGQHgiMoTK1LqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o43WR3/X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso2660081a91.0
        for <linux-kbuild@vger.kernel.org>; Fri, 02 May 2025 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746189372; x=1746794172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bWVNZpDPjN8he9HssEtQl6bUgAXH/F4pjykOH4GCkk=;
        b=o43WR3/XeHPk8/UmkM6gW/6FfzBmuagDR81aPWayeJJshkEPsUp/tA1qINlyN25WAV
         eQ7u6mDW5iQJrKim2+8xXlFvMX6HPgSUOFkTNTMoPuUDOtegMeaimFW2k4lHcHqMqnCT
         lFQYqe617TE64iM9lRo6jZF6OTHCM2bydxicJsfRLMxzrmY69AKPVScV2yT2eAU/DwZx
         oXNDu/NOSkHJTMh1lGvpNGAsqhMSZrFwr5fBsY+ubJoSpHEFSELQUy+zqZJKSgZly8iF
         0UCEft2Xenr7Lp4Z0rDlpI7xT8kqFzS5mluUCmR6+XdIxI+Ytj5KMCYLz50ICesf78X9
         itwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189372; x=1746794172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bWVNZpDPjN8he9HssEtQl6bUgAXH/F4pjykOH4GCkk=;
        b=RJ9d0rKv2U1qHlgTw57FOavybNwbqephkwbHiHFyogs/90mSE4s1jNvK+za1NGOJD2
         4zn5dIsg3zvs1fDZgDwnGk6Ulytldec5d6m+rb90r6ZtLRqgwHQB4y92xmpIEBmUEkPG
         WN2TmmfGB5LHfPqH5I2mO6Sz4lBJtSqlz6hno7yyOXTOJK5+Mc753X/ZDlzWBSr52Wm4
         RrBphrf2f0FZocYjY9b7tew4ZJhA94NC1H6EfJ2n3JJJJxeHJDyx3cZSAXPiSPxjqkQs
         wGyGllpWvVtXqCfZdv3TYLVPJOmdwchG+NBWITbolfacNSgTKSzpi8Nu/rdSzFL4NbCt
         XoTg==
X-Forwarded-Encrypted: i=1; AJvYcCUVuK6fF3L23FoPS8KMC1teBjm7apXnSADWIm4/Hbw+iXkA9NK+yfr3CZXZcuUmpfztFhL5GmgGi1Tdj8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1ueuYzwzPVD1sUeZJdE4Bxn38XKnlqwKfzZfngh/HhwmaatL
	dnnHmfOkbSI/un/890Mtn9eLFV/Oo0mRSUFKWsYblBUiL0wWeEK4t4rm7Gmg8GfXxGF/orH83UU
	kPhAlVOmc0OdEqUI0A6FYFLOlGwkzD86XSWkn
X-Gm-Gg: ASbGncuMQURTBV/on9oy8LgaBRLXHyu033aF0RPWsrT86OJzP23n2NQHB5P5lUzfQMi
	3Yl5D0kRozPdQ0El6d34qLZEUIysqJkeRmxT1s2l8r32vj9zrnIb6R35DbS1GEeBAhmwejxwcK5
	3ZWCCT9iexUru9dALMlim8xwPpReUtdQ1h5EfxEYAnCwNFTzNMNy8=
X-Google-Smtp-Source: AGHT+IF2hAF0/clS4lwwEOMq806j1cV+S29WAOdC4HnfL8cwFDY1AIdDC0g10UG7zShMqw7pJ2uU170Vz680MxOUfJs=
X-Received: by 2002:a17:90b:544c:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30a4e5aa034mr3940014a91.13.1746189371395; Fri, 02 May 2025
 05:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
In-Reply-To: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 2 May 2025 14:36:00 +0200
X-Gm-Features: ATxdqUEo80l6Wmog53pGJlK7MMSvohTGvruUy1uyoixwHojHfstDErpJeGH-R1I
Message-ID: <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
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
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:16=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection. The coverage level is set to 3,
> as that is the level needed by trace-pc.
>
> We do not instrument `core` since when we fuzz the kernel, we are
> looking for bugs in the kernel, not the Rust stdlib.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> I did not pick up the Tested-by due to the changes. I verified that it
> looks right under objdump, but I don't have a syzkaller setup I can try
> it with.

Thanks for incorporating the core.o change!
I've tested the v2 patch on my local setup and it works well.

Tested-by: Aleksandr Nogikh <nogikh@google.com>

> ---
> Changes in v2:
> - Ignore `core` in KCOV.
> - Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae94148=
175@google.com
> ---
>  rust/Makefile         | 1 +
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  3 files changed, 10 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2aa=
bbc944a68d02484 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>  $(obj)/core.o: scripts/target.json
>  endif
> +KCOV_INSTRUMENT_core.o :=3D n
>
>  $(obj)/compiler_builtins.o: private skip_gendwarfksyms =3D 1
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
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

