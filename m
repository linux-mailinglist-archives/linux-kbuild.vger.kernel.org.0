Return-Path: <linux-kbuild+bounces-2971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75628950FEC
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 00:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27AE6282398
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 22:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EA81ABED7;
	Tue, 13 Aug 2024 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUwAUB3J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7507B1AB51F;
	Tue, 13 Aug 2024 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723589606; cv=none; b=fQ5U/P4Dx2vZT5NYgeMsjTV7lU8GS4daMdKW0r8ayXOtsrdXqyqmUjlMTfRr3zXSYjqbsnTkBQLbCu8mjXYse0n5Qg5bTMfIYXKj0FdPOEeAeGNEjvpj+BGrasBndHCS2Bytjd3f3Lp+e79M3uqmUmkdOt63J/QihaUNfO8aYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723589606; c=relaxed/simple;
	bh=QVB3XUtCbjsyZ5tiC/QmcApx8zSusE9/0Ek8LzR86O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1hILSgdXhZYHs0vOD9oTIVJ6cSJ9mphgZ+8wFn0UAiJNpJfEcsw9xpORyntZOc6my8hvSLgAWoHiY+2aivcsU4WXVHSvsfFgPbwzS6KVVH1TqSsOsoWZ9H2rbHdR6h6AvLlXwcLmvCw+JamLuFY/m73ypS9+HHtk8AfmUW848A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUwAUB3J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42816ca782dso46022475e9.2;
        Tue, 13 Aug 2024 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723589603; x=1724194403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otYKhkTTVwFrNMc4y8Lo3x+9H/dZK04aKqqwJVfyjXE=;
        b=BUwAUB3JjX6i5TBVAyT94f1hF5eATSSII0qAeL64IsZY1baWvxBUM43GlSQPDuaetK
         amWe5jmhWOnurOOmkZBBdOn8ZzaXhIKbDhk0FRpfOwZnVKKV1/WiLAv5udVQIotJZlel
         s79yFpOpgaoesL5wbDBBgKJqXdS5VwwyjUjh+rEZzVlyuuerMsn8t0f7YEuZhB7+8KjC
         U6FJc5B7oy9+h4L3585a13ucXq0pUwVKCQgFmo2kOLAjyhWE2umt0Um53FEwtOhY9ujG
         Ogbp6YsgWlIaR+PXm70jrv075ZhAdf7xEOQZpO0qUo1VmG5Fd3G7uO94jv8PPMfEjgEz
         TWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723589603; x=1724194403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otYKhkTTVwFrNMc4y8Lo3x+9H/dZK04aKqqwJVfyjXE=;
        b=mZXfxzsmDrwIMYGBcJdMKXnzZj6NWOZrdxZ00AoQ1r8iyetGkDycEBnRlRSHS9bUnP
         FgobxRjiCHpIolXgPMlye+mXDUHNCsUMvbGFNb9yn+LGTuCq2158tIBmeb0Hm5i1yJM3
         UWHNCnINoNzhtudNcj2UlEVPpTSlfQ7rAz9dht9c9lYe7NKe4VZIJARni+GEDK5wtJHS
         BYXY0/XjQFKZNjzMk8154/YqRuAfbsBm7t8tVWYURU/0MuDGOoQo3lNjXtOxFE1ZX8ji
         q1xmCEEkfhHCoeuWr6cNS1JWEr907cvY7NepKx6QbpK/lmw2VQ2zalsu+H9WGsFSd6zn
         5x0A==
X-Forwarded-Encrypted: i=1; AJvYcCW7ioRPEnlmYJ61pk9kl0lW0UmqLxjF1aAXy4pbiHNrAM5fYsOEvDDYIO++/6qI8Np/FwtxECd9yffQmGc=@vger.kernel.org, AJvYcCWMRyBWXqQBSTgxDJft3LBy5PDueWmNfnIJe5Xq+GCyIX8R9tI45RH4hcZes3/hMyqeMXPNCA5/RnKP9P0zINs=@vger.kernel.org, AJvYcCWSx428o9ItIJGpLNZJ5bzqbahDfaLaSCxfoeF7qNIN45hGB8Z+DYjCGcq9UD9pQjMVTcUgXCtDTF4fJl9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+r5cepEn+fCQCnOQyVHWlrfu5m5H1gAeFxis6v7/MqUqsRpE2
	/FtHOosw7BcaId2lTMxNTuKr33r51Btb/UagnIJ4aRxaHzp+m4eP3sVtNvPE336/HKb4AHmqkuK
	lxC0AqbYg9JWIhGFEH+pkXKQSmfI=
X-Google-Smtp-Source: AGHT+IGR7W98LzFxhKyi9BaEIe7h8jPyiH/V3S9wInwVZhrMgTjU/0iYdt5GZWW7enBCnRaiuqbjtcqyMdrB9Mhfe94=
X-Received: by 2002:a05:600c:3b18:b0:426:60bc:8f4e with SMTP id
 5b1f17b1804b1-429dd22ee6amr5734115e9.5.1723589602277; Tue, 13 Aug 2024
 15:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-3-mmaurer@google.com>
In-Reply-To: <20240812232910.2026387-3-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 00:53:11 +0200
Message-ID: <CA+fCnZcVEp7Jc3kKPv59oqOxjGguV54ZaCcb1eX=Gx6ehSWHUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	Nicolas Schier <nicolas@fjasle.eu>, Alexander Potapenko <glider@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 1:29=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/Makefile.kasan          | 51 +++++++++++++++++++++++----------
>  scripts/Makefile.lib            |  3 ++
>  scripts/generate_rust_target.rs |  1 +
>  3 files changed, 40 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 390658a2d5b7..bfd37be9cc45 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -12,6 +12,9 @@ endif
>  KASAN_SHADOW_OFFSET ?=3D $(CONFIG_KASAN_SHADOW_OFFSET)
>
>  cc-param =3D $(call cc-option, -mllvm -$(1), $(call cc-option, --param $=
(1)))
> +rustc-param =3D $(call rustc-option, -Cllvm-args=3D-$(1),)
> +
> +check-args =3D $(foreach arg,$(2),$(call $(1),$(arg)))
>
>  ifdef CONFIG_KASAN_STACK
>         stack_enable :=3D 1
> @@ -28,6 +31,7 @@ else
>  endif
>
>  CFLAGS_KASAN_MINIMAL :=3D -fsanitize=3Dkernel-address
> +RUSTFLAGS_KASAN_MINIMAL :=3D -Zsanitizer=3Dkernel-address -Zsanitizer-re=
cover=3Dkernel-address
>
>  # -fasan-shadow-offset fails without -fsanitize
>  CFLAGS_KASAN_SHADOW :=3D $(call cc-option, -fsanitize=3Dkernel-address \
> @@ -35,44 +39,61 @@ CFLAGS_KASAN_SHADOW :=3D $(call cc-option, -fsanitize=
=3Dkernel-address \
>                         $(call cc-option, -fsanitize=3Dkernel-address \
>                         -mllvm -asan-mapping-offset=3D$(KASAN_SHADOW_OFFS=
ET)))
>
> +# The minimum supported `rustc` version has a minimum supported LLVM
> +# version late enough that we can assume support for -asan-mapping-offse=
t
> +RUSTFLAGS_KASAN_SHADOW :=3D $(RUSTFLAGS_KASAN_MINIMAL) \
> +                         -Cllvm-args=3D-asan-mapping-offset=3D$(KASAN_SH=
ADOW_OFFSET)
> +
> +KASAN_PARAMS :=3D
> +
>  ifeq ($(strip $(CFLAGS_KASAN_SHADOW)),)
>         CFLAGS_KASAN :=3D $(CFLAGS_KASAN_MINIMAL)
> +       # We still need to consider this case for Rust because we want Ru=
st code
> +       # to match the behavior of possibly old C compilers when linked t=
ogether.
> +       ifdef CONFIG_RUST
> +               RUSTFLAGS_KASAN :=3D $(RUSTFLAGS_KASAN_MINIMAL)
> +       endif

Eh, this is getting ugly. I sent a patch that simplifies the KASAN
Makefile, please rebase your changes on top of it.

>  else
> -       # Now add all the compiler specific options that are valid standa=
lone
> -       CFLAGS_KASAN :=3D $(CFLAGS_KASAN_SHADOW) \
> -        $(call cc-param,asan-globals=3D1) \
> -        $(call cc-param,asan-instrumentation-with-call-threshold=3D$(cal=
l_threshold)) \
> -        $(call cc-param,asan-instrument-allocas=3D1)
> +       KASAN_PARAMS +=3D asan-globals=3D1 asan-instrumentation-with-call=
-threshold=3D$(call_threshold) asan-instrument-allocas=3D1
> +       CFLAGS_KASAN :=3D $(CFLAGS_KASAN_SHADOW)
> +       ifdef CONFIG_RUST
> +               RUSTFLAGS_KASAN :=3D $(RUSTFLAGS_KASAN_SHADOW)
> +       endif
>  endif
>
> -CFLAGS_KASAN +=3D $(call cc-param,asan-stack=3D$(stack_enable))
> +KASAN_PARAMS +=3D asan-stack=3D$(stack_enable)
>
>  # Instrument memcpy/memset/memmove calls by using instrumented __asan_me=
m*()
>  # instead. With compilers that don't support this option, compiler-inser=
ted
>  # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures=
.
> -CFLAGS_KASAN +=3D $(call cc-param,asan-kernel-mem-intrinsic-prefix=3D1)
> +KASAN_PARAMS +=3D asan-kernel-mem-intrinsic-prefix=3D1
>
>  endif # CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_SW_TAGS
>
>  ifdef CONFIG_KASAN_INLINE
> -    instrumentation_flags :=3D $(call cc-param,hwasan-mapping-offset=3D$=
(KASAN_SHADOW_OFFSET))
> +    KASAN_PARAMS +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
>  else
> -    instrumentation_flags :=3D $(call cc-param,hwasan-instrument-with-ca=
lls=3D1)
> +    KASAN_PARAMS +=3D hwasan-instrument-with-calls=3D1
>  endif
>
> -CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress \
> -               $(call cc-param,hwasan-instrument-stack=3D$(stack_enable)=
) \
> -               $(call cc-param,hwasan-use-short-granules=3D0) \
> -               $(call cc-param,hwasan-inline-all-checks=3D0) \
> -               $(instrumentation_flags)
> +KASAN_PARAMS +=3D hwasan-instrument-stack=3D$(stack_enable) hwasan-use-s=
hort-granules=3D0 hwasan-inline-all-checks=3D0 $(instrumentation_params)

What are instrumentation_params? instrumentation_flags? They are not
defined in the Makefile anymore.

> +CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
>
>  # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_=
mem*().
>  ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y=
)
>  CFLAGS_KASAN +=3D $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=3D1=
)
>  endif
>
> +ifdef CONFIG_RUST
> +       RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress -Zsanitizer-r=
ecover=3Dkernel-hwaddress
> +endif

Let's change the order of the definitions to:

1. CFLAGS_KASAN
2. RUSTFLAGS_KASAN
3. KASAN_PARAMS


> +
>  endif # CONFIG_KASAN_SW_TAGS
>
> -export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
> +# Add all as-supported KASAN LLVM parameters requested by the configurat=
ion
> +CFLAGS_KASAN +=3D $(call check-args, cc-param, $(KASAN_PARAMS))
> +RUSTFLAGS_KASAN +=3D $(call check-args, rustc-param, $(KASAN_PARAMS))
> +
> +export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE RUSTFLAGS_KASAN
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index fe3668dc4954..27999da3d382 100644
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
> index 8a0644c0beed..1a4d468c575f 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -187,6 +187,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> +        ts.push("supported-sanitizers", ["kernel-address"]);
>          ts.push("target-pointer-width", "64");
>      } else if cfg.has("X86_32") {
>          // This only works on UML, as i386 otherwise needs regparm suppo=
rt in rustc
> --
> 2.46.0.76.ge559c4bf1a-goog
>

