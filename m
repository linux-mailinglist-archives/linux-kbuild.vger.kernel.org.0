Return-Path: <linux-kbuild+bounces-7124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828CAB858F
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 14:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998618C59EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB1F2989BD;
	Thu, 15 May 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Er/WQ+yK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691232989AD
	for <linux-kbuild@vger.kernel.org>; Thu, 15 May 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310516; cv=none; b=p3MHbcG/S4SoV+k+w2fpBZV4bPxB6vOTv890H+Q8kHSgHa8p3xMbUDqgjMpJ7UVbQ3lOls/pmRyVHbx6jiuvWgW5WrYdeNUf3Cw9tBq8Jl1apiUQXUttZRsskeVdNdGoYhpoqz+qD28q82W2ppB2qfytr/nfyjwpN3ZGDZHBUJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310516; c=relaxed/simple;
	bh=Fdp7xVM18mo3Yqt6zkHyz5SyCalDrq40OIWz1NE2ywo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHXQYDCl5EQ8oqfFz10aHxBqUKfXa19dqDQUmChl60wLy6RcpBLB/lvOvZuURxFIiOYGBgngqGcShr0F/8lpyoq4HIKAK7FcVqgo0/tEbXOq1+GRPVYF3fI0Ud4tgnBLXxe/+9/A0jDck+BAPC+TCwE4ZyLFOsHsh4e6Br4rtig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Er/WQ+yK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-326c77c40b7so8958461fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 May 2025 05:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747310511; x=1747915311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnTjnlgUmpVWJ6YWjJU//zRxWhIuxh7JMTjWe20f0OY=;
        b=Er/WQ+yKKksi3HJNmUYxf/x8ta4dJK1krUMQ4YpEuFjPoDNtMmUMhvpNTESQK0QNqy
         V6f9xGoO2k7Ht9VutnI9g8YTCFT7WuKaMngCVpE9dJxU1x69iFKoTqZQRo20QdhW3dZs
         ShJij1T6RZagYG5cE4fR9m2lonGIniCBthY4EwocC48NRgb3PO2ptCNzvcgXCdXYodGt
         Inaq4MzrLKQKgS1txA9FrRUGBvTt8moUBxkWaHZEXaaYBtWotVJkGoaScjPRlkAoNgRc
         0Qk0YuFpBHRmG1E2Q4W+PK9wl60MsjYwMcvewoMXApv8fwHCWk5xrQdTJzmJnCK15C/4
         wcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310511; x=1747915311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnTjnlgUmpVWJ6YWjJU//zRxWhIuxh7JMTjWe20f0OY=;
        b=tRri208MMcLhGAJ5Mxz4xmaG+Qn/8MQJI0+zoe5L63IkeyXwzyaJRcISAv3UDdKsDH
         66ahq+npOVPJp/IeHXoo+16OwR/6WI+Ijpy6lvY/5CyBqn4Zlg1Ko94nanKhgkq8Wzny
         wNZId5saQqZuI2DJXyJx2UnjwR7XDXAPgUW4sweYQKh9/PGcJsBcjrJZl5IGVwRALdN3
         oQhSiGVzeWfu6wfhnwcRbzOz87B6xY6rJBwbrW8fHhvYkn79oW8QUGKfRzVR6xA+vdqU
         ExyOS4DcSvFDqpUdnypU/vd1UCbLNkvr+5dUO19WuyXiysbui/DnZ6ge2DZgOok8Ru1+
         eheg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmRq1U4/NT6lesNeZ9C2le+vGlfbA4IwRKHI19qowNe0aoLlSeLr6Q6oIa0pYDl89gQ9tWduGdUBKbng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPH8a+YOJuRzObD5Z/5XsPwtq/9+Tm8gys0zNaSDL2nIPT8dU
	TNmDaIJD3O0N6Oko1dz5yxQ0uh0W86fArpMRoHw3OaSOZ7mGpA4Ezek3+2GG1W5/mEbBa+P8NoX
	zc3P0kFyCSTg4dYro5s2PoM6X2WxrhHWGsBjR
X-Gm-Gg: ASbGncuV084JfyTUCQenz0uophCzWqdAlElbB0C8TkUhbI1bxTH70043Tf2M48dtsgQ
	i+UBgrslYGq1OyQt/4dfllPnN5CNWkuBuOzyycyx81sKLH4BpX4nfcUMDk6I7AkxjKqpBuu7DNS
	+S9URkFTwjHYlg7ArqMITxokTh25ltJdtMg/GD3DqL9Fnvny4VWaGWGsV45QLjV9nUlQ==
X-Google-Smtp-Source: AGHT+IEH96IKGmX2cAO3uTh1/QBEiqEJWRHviVXK7nh1F5DrmoVawhFe8JJNtch0htaUl2OJIB1mEZGGUPXNBHxisBM=
X-Received: by 2002:a2e:a542:0:b0:326:c07e:b0a4 with SMTP id
 38308e7fff4ca-327ed0de53bmr28047271fa.11.1747310510182; Thu, 15 May 2025
 05:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
In-Reply-To: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 15 May 2025 14:01:39 +0200
X-Gm-Features: AX0GCFuQowmy9iaNX31ALvCLpL5T4nDokRyS7Qih7uVxXxqrT3ubbzv9Q8-xB8w
Message-ID: <CACT4Y+Yzmd7BtrpqUPrbXAAGzMnO0YKZnhVxLgyyXEftscEUnQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 14:16, Alice Ryhl <aliceryhl@google.com> wrote:
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

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> I did not pick up the Tested-by due to the changes. I verified that it
> looks right under objdump, but I don't have a syzkaller setup I can try
> it with.
> ---
> Changes in v2:
> - Ignore `core` in KCOV.
> - Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae94148175@google.com
> ---
>  rust/Makefile         | 1 +
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  3 files changed, 10 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2aabbc944a68d02484 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>  $(obj)/core.o: scripts/target.json
>  endif
> +KCOV_INSTRUMENT_core.o := n
>
>  $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
>  $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8efa106e8dffa640 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    += -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         += -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
>
> +kcov-rflags-y                                  += -Cpasses=sancov-module
> +kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-level=3
> +kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  += -Cllvm-args=-sanitizer-coverage-trace-compares
> +
>  export CFLAGS_KCOV := $(kcov-flags-y)
> +export RUSTFLAGS_KCOV := $(kcov-rflags-y)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e129effb8846d5b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
>  _c_flags += $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
>         $(CFLAGS_KCOV))
> +_rust_flags += $(if $(patsubst n%,, \
> +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
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

