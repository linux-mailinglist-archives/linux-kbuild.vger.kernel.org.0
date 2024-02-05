Return-Path: <linux-kbuild+bounces-827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39628498DB
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 12:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87E21C2276F
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6D8BE7;
	Mon,  5 Feb 2024 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFMInyRv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29318EC3
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Feb 2024 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707132600; cv=none; b=cpG3pF7wpVQGRVoFgUhyn4dHV+dSot66OCKsIq1YbuNDtc/sMC/h/r4o6QEr/6i45xMMvbuan8RPqFSsskPqASH0cGpYUT26Q78JLcRHNr1105l2Sh4k42i9hWUnZl8e3NhlvNXUcnF6mvTZ+bUPOgcysIdeJAEAG+j+kM1O7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707132600; c=relaxed/simple;
	bh=UaOqrvHYGSF6VE1WPYrk7Srnwc/FX3u5N5ueartigQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qt439Nq878QsDXGiw++qYnJPZ+c9h1ERvuIlwPSRHy6hs/g8jqzle9nltgvm72BHvXqdnP+kCdOmNy6k1UiRUzL6tFYNCdT7VbaUpWqnhyr0bxID8mcSpxyu6j+T+xfXhJFE7C9UdNh4wgTfZooWN4ZOqr4FtQekUJGpb6ZR5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vFMInyRv; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4c0215837e2so318402e0c.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Feb 2024 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707132597; x=1707737397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvI9aaRfua6v4nfD4rYGGOnDdTCaiW+Zj9IgNXb8Lrs=;
        b=vFMInyRvxbN4GFROk2hQcKOEwyvnshkaUw799IVPzwFAISuHS34opfB7RL+eB00ufo
         +Ox1E0lNUGOq3r7z6tXo2cKSK+9ILzd0FEBCxQc6A3t+0kCH46Uo0gfFzpf5QNwezT8e
         81BMhGGA1NmXbh1RiAahaNTvsz+gqdTtbNsZrprGkhm83jW8qdbIJzkLqr9XAKbr99tF
         vYtcxisaqjymTbDWERYBUEMN5XtupSdpfxcCrdh3ThJ1wZAOZkXJSKJ7RaQIIR22z0GB
         JKK6zOnF4jKcv7vwfEWHVcX1rppMsJT3JqPFx1JiM4RgAs2v90zXDFVh4AqKy6AJWd/U
         O7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132597; x=1707737397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvI9aaRfua6v4nfD4rYGGOnDdTCaiW+Zj9IgNXb8Lrs=;
        b=vEeYpouOtyq5YR0W+4TcYvs9YcPhUZC2aJPAHFo6f3OV3N/CDpnzyljROQdly1uu3q
         4YbdHuZX97smnO8pyw9YecVuSVSbzmw8cyLBxIyDnla3lD3KomJzGJuqD63vthy8Sf+f
         WxbwL2KSM56P4bsh3OZNPbo+CiqIj5o+jNEHdidcnPTiKtf7Toa9jp14NQU/Pt0h09nE
         sRxOA74baQkOsiyAT89GKUjB+CU7x5QNHctokf+N0N8JKdTg1RMZv3+XaebHvVtEJ4qA
         AnD5P1M8jrAnxtSoJLtWkA6PT4s/hWsXX01psR5ZtzNl2kemFn/A2asP3EhGZ6BnSyk/
         dQNA==
X-Gm-Message-State: AOJu0Yx914YbaNIzCwA3ngRy73h+z3ghdSv2DL1xaDV9GC7rf1laVqq8
	/n1bEKVoWyUuSR9rOZSfehXeJEK2ZtwTjiHqgYE0Ox2TWmfgSL/syugBoTq+YGW7SDnHQNxJv6B
	5XZtLtUBxTno7oN3fNe6QUtuT4yhb0JH9zGYi
X-Google-Smtp-Source: AGHT+IGpz+XItun4hnJfRA5+/+XnT9ktLIIH41D72jD2YdquWjc+TflpJr5mNBIdUEbL/ILA5rN2fcFujrHE2G4/kZI=
X-Received: by 2002:a1f:fc0e:0:b0:4c0:2767:b778 with SMTP id
 a14-20020a1ffc0e000000b004c02767b778mr1353840vki.16.1707132597345; Mon, 05
 Feb 2024 03:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093725.make.582-kees@kernel.org>
In-Reply-To: <20240205093725.make.582-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Mon, 5 Feb 2024 12:29:21 +0100
Message-ID: <CANpmjNO0QOsHQOqDf_87uXFB0a=p6BW+=zF_ypb5K0FbaObvzA@mail.gmail.com>
Subject: Re: [PATCH v3] ubsan: Reintroduce signed overflow sanitizer
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Hao Luo <haoluo@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 10:37, Kees Cook <keescook@chromium.org> wrote:
>
> In order to mitigate unexpected signed wrap-around[1], bring back the
> signed integer overflow sanitizer. It was removed in commit 6aaa31aeb9cf
> ("ubsan: remove overflow checks") because it was effectively a no-op
> when combined with -fno-strict-overflow (which correctly changes signed
> overflow from being "undefined" to being explicitly "wrap around").
>
> Compilers are adjusting their sanitizers to trap wrap-around and to
> detecting common code patterns that should not be instrumented
> (e.g. "var + offset < var"). Prepare for this and explicitly rename
> the option from "OVERFLOW" to "WRAP".
>
> To annotate intentional wrap-around arithmetic, the add/sub/mul_wrap()
> helpers can be used for individual statements. At the function level,
> the __signed_wrap attribute can be used to mark an entire function as
> expecting its signed arithmetic to wrap around. For a single object file
> the Makefile can use "UBSAN_WRAP_SIGNED_target.o := n" to mark it as
> wrapping, and for an entire directory, "UBSAN_WRAP_SIGNED := n" can be
> used.
>
> Additionally keep these disabled under CONFIG_COMPILE_TEST for now.
>
> Link: https://github.com/KSPP/linux/issues/26 [1]
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Hao Luo <haoluo@google.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Looks good.

Reviewed-by: Marco Elver <elver@google.com>

And just to double check, you don't think we need 'depends on EXPERT'
(or DEBUG_KERNEL) to keep the noise down initially?

> ---
> v3:
>  - split out signed overflow sanitizer so we can do each separately

Thanks for splitting.

> v2: https://lore.kernel.org/all/20240202101311.it.893-kees@kernel.org/
> v1: https://lore.kernel.org/all/20240129175033.work.813-kees@kernel.org/
> ---
>  include/linux/compiler_types.h |  9 ++++-
>  lib/Kconfig.ubsan              | 14 +++++++
>  lib/test_ubsan.c               | 37 ++++++++++++++++++
>  lib/ubsan.c                    | 68 ++++++++++++++++++++++++++++++++++
>  lib/ubsan.h                    |  4 ++
>  scripts/Makefile.lib           |  3 ++
>  scripts/Makefile.ubsan         |  3 ++
>  7 files changed, 137 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 6f1ca49306d2..ee9d272008a5 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -282,11 +282,18 @@ struct ftrace_likely_data {
>  #define __no_sanitize_or_inline __always_inline
>  #endif
>
> +/* Do not trap wrapping arithmetic within an annotated function. */
> +#ifdef CONFIG_UBSAN_SIGNED_WRAP
> +# define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
> +#else
> +# define __signed_wrap
> +#endif
> +
>  /* Section for code which can't be instrumented at all */
>  #define __noinstr_section(section)                                     \
>         noinline notrace __attribute((__section__(section)))            \
>         __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
> -       __no_sanitize_memory
> +       __no_sanitize_memory __signed_wrap
>
>  #define noinstr __noinstr_section(".noinstr.text")
>
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 56d7653f4941..129e9bc21877 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -116,6 +116,20 @@ config UBSAN_UNREACHABLE
>           This option enables -fsanitize=unreachable which checks for control
>           flow reaching an expected-to-be-unreachable position.
>
> +config UBSAN_SIGNED_WRAP
> +       bool "Perform checking for signed arithmetic wrap-around"
> +       default UBSAN
> +       depends on !COMPILE_TEST
> +       depends on $(cc-option,-fsanitize=signed-integer-overflow)
> +       help
> +         This option enables -fsanitize=signed-integer-overflow which checks
> +         for wrap-around of any arithmetic operations with signed integers.
> +         This currently performs nearly no instrumentation due to the
> +         kernel's use of -fno-strict-overflow which converts all would-be
> +         arithmetic undefined behavior into wrap-around arithmetic. Future
> +         sanitizer versions will allow for wrap-around checking (rather than
> +         exclusively undefined behavior).
> +
>  config UBSAN_BOOL
>         bool "Perform checking for non-boolean values used as boolean"
>         default UBSAN
> diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
> index f4ee2484d4b5..276c12140ee2 100644
> --- a/lib/test_ubsan.c
> +++ b/lib/test_ubsan.c
> @@ -11,6 +11,39 @@ typedef void(*test_ubsan_fp)(void);
>                         #config, IS_ENABLED(config) ? "y" : "n");       \
>         } while (0)
>
> +static void test_ubsan_add_overflow(void)
> +{
> +       volatile int val = INT_MAX;
> +
> +       UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
> +       val += 2;
> +}
> +
> +static void test_ubsan_sub_overflow(void)
> +{
> +       volatile int val = INT_MIN;
> +       volatile int val2 = 2;
> +
> +       UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
> +       val -= val2;
> +}
> +
> +static void test_ubsan_mul_overflow(void)
> +{
> +       volatile int val = INT_MAX / 2;
> +
> +       UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
> +       val *= 3;
> +}
> +
> +static void test_ubsan_negate_overflow(void)
> +{
> +       volatile int val = INT_MIN;
> +
> +       UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
> +       val = -val;
> +}
> +
>  static void test_ubsan_divrem_overflow(void)
>  {
>         volatile int val = 16;
> @@ -90,6 +123,10 @@ static void test_ubsan_misaligned_access(void)
>  }
>
>  static const test_ubsan_fp test_ubsan_array[] = {
> +       test_ubsan_add_overflow,
> +       test_ubsan_sub_overflow,
> +       test_ubsan_mul_overflow,
> +       test_ubsan_negate_overflow,
>         test_ubsan_shift_out_of_bounds,
>         test_ubsan_out_of_bounds,
>         test_ubsan_load_invalid_value,
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index df4f8d1354bb..5fc107f61934 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -222,6 +222,74 @@ static void ubsan_epilogue(void)
>         check_panic_on_warn("UBSAN");
>  }
>
> +static void handle_overflow(struct overflow_data *data, void *lhs,
> +                       void *rhs, char op)
> +{
> +
> +       struct type_descriptor *type = data->type;
> +       char lhs_val_str[VALUE_LENGTH];
> +       char rhs_val_str[VALUE_LENGTH];
> +
> +       if (suppress_report(&data->location))
> +               return;
> +
> +       ubsan_prologue(&data->location, type_is_signed(type) ?
> +                       "signed-integer-overflow" :
> +                       "unsigned-integer-overflow");
> +
> +       val_to_string(lhs_val_str, sizeof(lhs_val_str), type, lhs);
> +       val_to_string(rhs_val_str, sizeof(rhs_val_str), type, rhs);
> +       pr_err("%s %c %s cannot be represented in type %s\n",
> +               lhs_val_str,
> +               op,
> +               rhs_val_str,
> +               type->type_name);
> +
> +       ubsan_epilogue();
> +}
> +
> +void __ubsan_handle_add_overflow(void *data,
> +                               void *lhs, void *rhs)
> +{
> +
> +       handle_overflow(data, lhs, rhs, '+');
> +}
> +EXPORT_SYMBOL(__ubsan_handle_add_overflow);
> +
> +void __ubsan_handle_sub_overflow(void *data,
> +                               void *lhs, void *rhs)
> +{
> +       handle_overflow(data, lhs, rhs, '-');
> +}
> +EXPORT_SYMBOL(__ubsan_handle_sub_overflow);
> +
> +void __ubsan_handle_mul_overflow(void *data,
> +                               void *lhs, void *rhs)
> +{
> +       handle_overflow(data, lhs, rhs, '*');
> +}
> +EXPORT_SYMBOL(__ubsan_handle_mul_overflow);
> +
> +void __ubsan_handle_negate_overflow(void *_data, void *old_val)
> +{
> +       struct overflow_data *data = _data;
> +       char old_val_str[VALUE_LENGTH];
> +
> +       if (suppress_report(&data->location))
> +               return;
> +
> +       ubsan_prologue(&data->location, "negation-overflow");
> +
> +       val_to_string(old_val_str, sizeof(old_val_str), data->type, old_val);
> +
> +       pr_err("negation of %s cannot be represented in type %s:\n",
> +               old_val_str, data->type->type_name);
> +
> +       ubsan_epilogue();
> +}
> +EXPORT_SYMBOL(__ubsan_handle_negate_overflow);
> +
> +
>  void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
>  {
>         struct overflow_data *data = _data;
> diff --git a/lib/ubsan.h b/lib/ubsan.h
> index 5d99ab81913b..0abbbac8700d 100644
> --- a/lib/ubsan.h
> +++ b/lib/ubsan.h
> @@ -124,6 +124,10 @@ typedef s64 s_max;
>  typedef u64 u_max;
>  #endif
>
> +void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
> +void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
> +void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
> +void __ubsan_handle_negate_overflow(void *_data, void *old_val);
>  void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
>  void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
>  void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 52efc520ae4f..7ce8ecccc65a 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -177,6 +177,9 @@ ifeq ($(CONFIG_UBSAN),y)
>  _c_flags += $(if $(patsubst n%,, \
>                 $(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)y), \
>                 $(CFLAGS_UBSAN))
> +_c_flags += $(if $(patsubst n%,, \
> +               $(UBSAN_WRAP_SIGNED_$(basetarget).o)$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_WRAP_SIGNED)$(UBSAN_SANITIZE)y), \
> +               $(CFLAGS_UBSAN_WRAP_SIGNED))
>  endif
>
>  ifeq ($(CONFIG_KCOV),y)
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 7cf42231042b..bc957add0b4d 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -13,3 +13,6 @@ ubsan-cflags-$(CONFIG_UBSAN_ENUM)             += -fsanitize=enum
>  ubsan-cflags-$(CONFIG_UBSAN_TRAP)              += $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
>
>  export CFLAGS_UBSAN := $(ubsan-cflags-y)
> +
> +ubsan-wrap-signed-cflags-$(CONFIG_UBSAN_SIGNED_WRAP)     += -fsanitize=signed-integer-overflow
> +export CFLAGS_UBSAN_WRAP_SIGNED := $(ubsan-wrap-signed-cflags-y)
> --
> 2.34.1
>

