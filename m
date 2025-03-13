Return-Path: <linux-kbuild+bounces-6124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A649A5FA06
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 16:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35A2F7AE03F
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852DD26989E;
	Thu, 13 Mar 2025 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m7jbwVXT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4D269880
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Mar 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879809; cv=none; b=HC8+wa0os19M9mFHKq5UfC4d2V3FEJ2IpHn6TVp5xOEK7YImcpos8pKKMUshgXnBji23dnAOG0EZCxtc+Crql6pdUNG62xh7u09V69Zj3a+B/54TRPdL2R6hZHpU+oYUxKX3DaTpSTUZyayECSYocPZGdS1qNzu+9cimHSYlnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879809; c=relaxed/simple;
	bh=tqYcp36kSOOENz/soiYs13MgeYzT3g5zF8GJrqqqqOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ielV3F3Sa+yAg+41sjBtY2WhRS1+upheBYvevJdgekDKltw1S3P5NZvCbg3hnda7XS1YzkSfklc7iSXM61aubJrjcG7UQ4g12i5swz0cC5pVO5ilJPLT2lLfUYxb6o2qcbZOdBvrTOaUVyvDnkYN4dfC6OE75idWU49yoqDpSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7jbwVXT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff087762bbso1948193a91.3
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Mar 2025 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741879806; x=1742484606; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=00u7ecFNyPAZ4Z5cOSw/OvdLmibjnRE9ersVFXwW+QE=;
        b=m7jbwVXTgMrT8qlo5jU2Byj+XHo/ECuMa00iXoxL02g4F93KzNoaZifcVOva4osT+C
         JCAA87InMV1Wqx4txC5XtAC3LzPFo4eYgsmActaBQ5H2MvhVToBecEVFmkvXkWgVWw5p
         +zO3UpjCqU34v88Cg3HAKh9zP4iWE1OIbQ+5/QTsnpfzF4ff+jl7LA1HYo9x+MQLP84t
         Kb3Dgk1VxUDcswj6sN6yR6Sj2f4rqnvcusDbhXApJl0SjzyKPkIuuVT/IgMVCrfKeyIg
         HL8N0RZQ/9MnU4oz4Ph9gbNCM6d5UAPBvTcHamTc9kKBl2cHUdkDR3VbMe8Enwf3fBSz
         weUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879806; x=1742484606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00u7ecFNyPAZ4Z5cOSw/OvdLmibjnRE9ersVFXwW+QE=;
        b=qOL1grjur73SogNJTf4KQOLTk8epWC56Q8tdKyQ8ZA4i82Tvc7vq1RnDRpBh9XQOaD
         T9xGayCcleZG1W5dt3H8b97cIs1T7aHPM/jZ8bq8m11UIhY5HXfD1CTdhFriqdPT9n3y
         U62SM08/eG5+llH8nGzPLlv92/QQ3/Grtgis4SBOCYRDyRc31is7ffxthI1iUTSUUEOz
         fPguEUoh183Upp+q8GET8xtzZVPJWT/jo879U/KCRqO7+VQcbDC8478zUtzVLechwHv8
         UTgNabfVc+0AL2L6CWBWlUQNAV7TqSvW39+LPXNFLQjC2AgsqSYtOpqoEFdL3Bfk06wk
         UFpw==
X-Forwarded-Encrypted: i=1; AJvYcCVrLzHfO+uBmOHyI18dl3m0wZhNNnKiIhIK0M/paraJkrvziCxTvTxanRgUClLGJbr0DY/K+D/q1TwffG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJiT6zzNwk3Byv5opCo6xg80yE6s4eV5DfLpp/jsX3rKlr//m
	iu33Yw/92TiB5J8cdwmcEmJkqq7YEE32+/4EeXI558edmoKvo8bsUm3FlLZ21DFYgs8dCuvEZ5U
	sZXeYSG9qzmdBYnSN0mdPBfK6YwzvSTvGai15
X-Gm-Gg: ASbGncvcGhlNCdsoAR/LFC0WOD68t8CaJbQsljFkDAdy0zGf1/2+KKKIgH8pSssCUA4
	4SePuWM+bb2zJBrEaVxQ5G6w8iRCVBAe+e52iFcueH+derbx/bR9f3LRMfH0Hzv8Bw60QlKkfbX
	2d1HIu7J3DcOET4w6KbAEsAJiThphRRZoeP0dqew==
X-Google-Smtp-Source: AGHT+IEv0rtOsQstIMulfJeTHgWikPpW7fu1mPHnescJ1GSms7d/WLQhnr03CyeNMSYLnDPxmDhcIz/mp/0Hr9kM0jc=
X-Received: by 2002:a17:90b:2741:b0:2ff:7b28:a519 with SMTP id
 98e67ed59e1d1-300ff370231mr15211554a91.30.1741879806198; Thu, 13 Mar 2025
 08:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307040948.work.791-kees@kernel.org> <20250307041914.937329-1-kees@kernel.org>
In-Reply-To: <20250307041914.937329-1-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 13 Mar 2025 11:29:29 -0400
X-Gm-Features: AQ5f1Jo2s3dBQmL6L50YXOekPGf_8rCDFxDD6svVuHOtyM0nHf71JobMTMo6fo0
Message-ID: <CANpmjNOHSanxX7EyXhia4AuVd+6q5v1mXQMTM_k0Rj20P_ASAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ubsan/overflow: Rework integer overflow sanitizer
 option to turn on everything
To: Kees Cook <kees@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 23:19, Kees Cook <kees@kernel.org> wrote:
>
> Since we're going to approach integer overflow mitigation a type at a
> time, we need to enable all of the associated sanitizers, and then opt
> into types one at a time.
>
> Rename the existing "signed wrap" sanitizer to just the entire topic area:
> "integer wrap". Enable the implicit integer truncation sanitizers, with
> required callbacks and tests.
>
> Notably, this requires features (currently) only available in Clang,
> so we can depend on the cc-option tests to determine availability
> instead of doing version tests.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Hao Luo <haoluo@google.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: linux-hardening@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Cc: linux-kbuild@vger.kernel.org
> ---
>  include/linux/compiler_types.h  |  2 +-
>  kernel/configs/hardening.config |  2 +-
>  lib/Kconfig.ubsan               | 23 +++++++++++------------
>  lib/test_ubsan.c                | 18 ++++++++++++++----
>  lib/ubsan.c                     | 28 ++++++++++++++++++++++++++--
>  lib/ubsan.h                     |  8 ++++++++
>  scripts/Makefile.lib            |  4 ++--
>  scripts/Makefile.ubsan          |  8 ++++++--
>  8 files changed, 69 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index f59393464ea7..4ad3e900bc3d 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -360,7 +360,7 @@ struct ftrace_likely_data {
>  #endif
>
>  /* Do not trap wrapping arithmetic within an annotated function. */
> -#ifdef CONFIG_UBSAN_SIGNED_WRAP
> +#ifdef CONFIG_UBSAN_INTEGER_WRAP
>  # define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
>  #else
>  # define __signed_wrap
> diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
> index 3fabb8f55ef6..dd7c32fb5ac1 100644
> --- a/kernel/configs/hardening.config
> +++ b/kernel/configs/hardening.config
> @@ -46,7 +46,7 @@ CONFIG_UBSAN_BOUNDS=y
>  # CONFIG_UBSAN_SHIFT is not set
>  # CONFIG_UBSAN_DIV_ZERO is not set
>  # CONFIG_UBSAN_UNREACHABLE is not set
> -# CONFIG_UBSAN_SIGNED_WRAP is not set
> +# CONFIG_UBSAN_INTEGER_WRAP is not set
>  # CONFIG_UBSAN_BOOL is not set
>  # CONFIG_UBSAN_ENUM is not set
>  # CONFIG_UBSAN_ALIGNMENT is not set
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 1d4aa7a83b3a..63e5622010e0 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -116,21 +116,20 @@ config UBSAN_UNREACHABLE
>           This option enables -fsanitize=unreachable which checks for control
>           flow reaching an expected-to-be-unreachable position.
>
> -config UBSAN_SIGNED_WRAP
> -       bool "Perform checking for signed arithmetic wrap-around"
> +config UBSAN_INTEGER_WRAP
> +       bool "Perform checking for integer arithmetic wrap-around"
>         default UBSAN
>         depends on !COMPILE_TEST
> -       # The no_sanitize attribute was introduced in GCC with version 8.
> -       depends on !CC_IS_GCC || GCC_VERSION >= 80000
>         depends on $(cc-option,-fsanitize=signed-integer-overflow)
> -       help
> -         This option enables -fsanitize=signed-integer-overflow which checks
> -         for wrap-around of any arithmetic operations with signed integers.
> -         This currently performs nearly no instrumentation due to the
> -         kernel's use of -fno-strict-overflow which converts all would-be
> -         arithmetic undefined behavior into wrap-around arithmetic. Future
> -         sanitizer versions will allow for wrap-around checking (rather than
> -         exclusively undefined behavior).
> +       depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
> +       depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
> +       depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)

Can these be in 1 cc-option? I know it might look slightly more ugly,
but having 3 different ones will shell out to the compiler 3 times,
which is a little less efficient. At some point it might noticeably
increase the build initialization latency.

