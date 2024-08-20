Return-Path: <linux-kbuild+bounces-3120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169F958D71
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F411C21B6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991311BD023;
	Tue, 20 Aug 2024 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhHt5dB3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0C18C92C;
	Tue, 20 Aug 2024 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724175056; cv=none; b=VmumkvR7j8Z+cbZmTz/vieNo/2axCXSuKpoVxX52o0Vna4Vv1wEmR0VUyjIbkfsisy/sq4WuKODv6BqMkQ4EP/BAHZCOTvEzYL+0fxUXNKBaAEOvoPCIRr340YRa2wbVAesq+a93kxjPrxIx+GTqAjeBHoaesrqSG+rLSYe6w8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724175056; c=relaxed/simple;
	bh=fFqJ9FHhdqc5EiDj+/EgS54hgZ2Qvxvrhj0vFRrhVl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skWT4zwdmpy8YAZ9RY6Kmr33xhxrJe/hk5QDzH2tWgB/RmDTj2xZPfuHSR1Fa/++58fx+GIKo0W0a5X0buMa4rvp1uofZMAn3C8QWNFa60ZVlxHIjxh/OgU1Z+YLNR4N4pfvh17h5NxIASJZvEr7Zlwgd7ogePjuqvYqQe4qDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhHt5dB3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3719f0758c6so2321405f8f.1;
        Tue, 20 Aug 2024 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724175053; x=1724779853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wISXuCBhmhFmaFFKaHK4h6CHKUfKYQSgO+IzNbasqs=;
        b=nhHt5dB30mFEpte5i8Zqq00b7INkKheH5GlO1Nokka2OjT1ZhGBjdb4LGkyMoLexTg
         katpdn2Rdho+Vj9C1yeWIVaP8iAXpcMQPwMKIq08cA0E+Uby613ZDpRho6Zk6TUGC9g1
         pAuQYhyAoo+oxh/3tvpe1c8CSM2iAZyGLqlysnSRaMvqq7sCTxBHd3vYKND8cpkptDZO
         cuu0WDLMjL4WFP3feVS53m9iGV/CNKHlTd080oYeeNN7nq8z9Wg7kF2BRUbs06RmvHoj
         X12YAIwNtFgEUwnJwwo0Dw3C+GWWSw86ZdfpRmCN2ssIjTpMIy3cI7H+jQjSA8SQOlHJ
         sNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724175053; x=1724779853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wISXuCBhmhFmaFFKaHK4h6CHKUfKYQSgO+IzNbasqs=;
        b=o5N8nfEoibx5m5sCShiv5TD4IKlJptMz1WewgrkJwsHVU3Xqf0zr1IIjh15JXbJemG
         SRH5GoClS76hnT9xbL6Q4I32BCT9d+UciIGTkGiMg6g7peq4re//ioSoRK2RHWIQhy/t
         R04L0CNglsbvyBkkW/rvMfH4AsOsBm0YL3nernPsAjPJx+4A9GY2+F8LWkS/9VuXt55J
         kFSvjhxwocF7k1hVocL9jzupsyPp7XNeYLr9qseK4gyZgblQBvIgyJcK3IgJuE+iebTZ
         ETb3kJeiyp/McyBGZcxBMM2mK+iisriVgsaETOMIGWfmzmPdIU/j+QjNcqNOLlD1ivhU
         20IA==
X-Forwarded-Encrypted: i=1; AJvYcCVTGmQEw5klKKZzXvitoCNs7OlhV6OwY4bQGNrbAStrrrsUXhQMBAvgArUrac9bG0pYfqd9INsR+3YrMVjlxkmaqI1wHL9cQDSXPntjx1ZhJBZ4tZgLCpdkz+Qk7vJ2PvQiHTUDHmhLXmXerShWKv2LFUafXvdYJK7O2Cwo8J0TTbsAHBxeeEx+FnM=
X-Gm-Message-State: AOJu0YzgEF6GM1nwwCAn4HCc4tBX8l8Rdo+9CbqTjiNMMddlSoWDLsUV
	CPEqpBw/prDM94SzIeg3jrQOU9F31vnDSaPndq22KVxGX8CEGCWgiBFxLP1O8SkefGWWX4hA/Kt
	FMjT2B0d+Jx3IHbAt0JwtztjL/Uw=
X-Google-Smtp-Source: AGHT+IEAtX244iYeZYPk7sy9TeAceSFJTN5yXWToK5PNGBrEPxv2PkC7QDXiz5Fnm4hlwP9R1e29NsFLdm/qMR+Mbbs=
X-Received: by 2002:a5d:4386:0:b0:362:b906:99c4 with SMTP id
 ffacd0b85a97d-371c6060c90mr1694765f8f.58.1724175052539; Tue, 20 Aug 2024
 10:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-3-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-3-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 19:30:41 +0200
Message-ID: <CA+fCnZeA_GOdqidEhP81TvwiSSgJNEoXa85ooqVpfPOk3v4S0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	Nicolas Schier <nicolas@fjasle.eu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Rust hasn't yet enabled software-tagged KWHASAN (only regular HWASAN),
> so explicitly prevent Rust from being selected when it is enabled.

This is done in the next patch, not in this one.

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/Makefile.kasan          | 54 +++++++++++++++++++++++----------
>  scripts/Makefile.lib            |  3 ++
>  scripts/generate_rust_target.rs |  1 +
>  3 files changed, 42 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index aab4154af00a..163640fdefa0 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -12,6 +12,11 @@ endif
>  KASAN_SHADOW_OFFSET ?=3D $(CONFIG_KASAN_SHADOW_OFFSET)
>
>  cc-param =3D $(call cc-option, -mllvm -$(1), $(call cc-option, --param $=
(1)))
> +rustc-param =3D $(call rustc-option, -Cllvm-args=3D-$(1),)
> +
> +check-args =3D $(foreach arg,$(2),$(call $(1),$(arg)))
> +
> +kasan_params :=3D
>
>  ifdef CONFIG_KASAN_STACK
>         stack_enable :=3D 1
> @@ -41,39 +46,56 @@ CFLAGS_KASAN :=3D $(call cc-option, -fsanitize=3Dkern=
el-address \
>                 $(call cc-option, -fsanitize=3Dkernel-address \
>                 -mllvm -asan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)))
>
> -# Now, add other parameters enabled similarly in both GCC and Clang.
> -# As some of them are not supported by older compilers, use cc-param.
> -CFLAGS_KASAN +=3D $(call cc-param,asan-instrumentation-with-call-thresho=
ld=3D$(call_threshold)) \
> -               $(call cc-param,asan-stack=3D$(stack_enable)) \
> -               $(call cc-param,asan-instrument-allocas=3D1) \
> -               $(call cc-param,asan-globals=3D1)
> +# The minimum supported `rustc` version has a minimum supported LLVM
> +# version late enough that we can assume support for -asan-mapping-offse=
t

Nit: dot at the end.

> +RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-address \
> +                  -Zsanitizer-recover=3Dkernel-address \
> +                  -Cllvm-args=3D-asan-mapping-offset=3D$(KASAN_SHADOW_OF=
FSET)
> +
> +# Now, add other parameters enabled similarly in GCC, Clang, and rustc.
> +# As some of them are not supported by older compilers, these will be fi=
ltered
> +# through `cc-param` or `rust-param` as applicable.
> +kasan_params +=3D asan-instrumentation-with-call-threshold=3D$(call_thre=
shold) \
> +               asan-stack=3D$(stack_enable) \
> +               asan-instrument-allocas=3D1 \
> +               asan-globals=3D1
>
>  # Instrument memcpy/memset/memmove calls by using instrumented __asan_me=
m*()
>  # instead. With compilers that don't support this option, compiler-inser=
ted
>  # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures=
.
> -CFLAGS_KASAN +=3D $(call cc-param,asan-kernel-mem-intrinsic-prefix=3D1)
> +kasan_params +=3D asan-kernel-mem-intrinsic-prefix=3D1
>
>  endif # CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_SW_TAGS
>
>  ifdef CONFIG_KASAN_INLINE
> -       instrumentation_flags :=3D $(call cc-param,hwasan-mapping-offset=
=3D$(KASAN_SHADOW_OFFSET))
> +       kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
>  else
> -       instrumentation_flags :=3D $(call cc-param,hwasan-instrument-with=
-calls=3D1)
> +       kasan_params +=3D hwasan-instrument-with-calls=3D1
>  endif
>
> -CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress \
> -               $(call cc-param,hwasan-instrument-stack=3D$(stack_enable)=
) \
> -               $(call cc-param,hwasan-use-short-granules=3D0) \
> -               $(call cc-param,hwasan-inline-all-checks=3D0) \
> -               $(instrumentation_flags)
> +kasan_params +=3D hwasan-instrument-stack=3D$(stack_enable) \
> +               hwasan-use-short-granules=3D0 \
> +               hwasan-inline-all-checks=3D0

Let's put these kasan_params parts after CFLAGS_KASAN.

> +
> +CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
> +RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
> +                  -Zsanitizer-recover=3Dkernel-hwaddress

What's the intention of defining RUSTFLAGS_KASAN for SW_TAGS if it's
not supported by Rust? Should this be removed?

If this is just a foundation for potential future support of
Rust+SW_TAGS, please add a comment explaining this. And also please
put the patch that disallows Rust+SW_TAGS before this one, if you keep
RUSTFLAGS_KASAN.

>  # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_=
mem*().
>  ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y=
)
> -       CFLAGS_KASAN +=3D $(call cc-param,hwasan-kernel-mem-intrinsic-pre=
fix=3D1)
> +       kasan_params +=3D hwasan-kernel-mem-intrinsic-prefix=3D1
>  endif
>
>  endif # CONFIG_KASAN_SW_TAGS
>
> -export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
> +# Add all as-supported KASAN LLVM parameters requested by the configurat=
ion

Nit: dot at the end.


> +CFLAGS_KASAN +=3D $(call check-args, cc-param, $(kasan_params))
> +
> +ifdef CONFIG_RUST
> +       # Avoid calling `rustc-param` unless Rust is enabled.
> +       RUSTFLAGS_KASAN +=3D $(call check-args, rustc-param, $(kasan_para=
ms))
> +endif # CONFIG_RUST
> +
> +export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE RUSTFLAGS_KASAN
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f06f6aaf7fc..4a58636705e0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -167,6 +167,9 @@ ifneq ($(CONFIG_KASAN_HW_TAGS),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>                 $(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-k=
ernel-object)), \
>                 $(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +               $(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-k=
ernel-object)), \
> +               $(RUSTFLAGS_KASAN))
>  endif
>  endif
>
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index ced405d35c5d..c24c2abd67db 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -192,6 +192,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> +        ts.push("supported-sanitizers", ["kernel-address"]);
>          ts.push("target-pointer-width", "64");
>      } else if cfg.has("LOONGARCH") {
>          panic!("loongarch uses the builtin rustc loongarch64-unknown-non=
e-softfloat target");
> --
> 2.46.0.184.g6999bdac58-goog
>

