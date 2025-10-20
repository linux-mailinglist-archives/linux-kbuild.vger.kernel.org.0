Return-Path: <linux-kbuild+bounces-9227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7FBF3F84
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 00:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2053AE5F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 22:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE45334C13;
	Mon, 20 Oct 2025 22:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZQlq7YN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E62F49F9
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761000857; cv=none; b=fPRArBuZEsin0m5ncXSvLy9TkS8hhehf3w9kRgjM9hhxiHOL4hWeGos9T/YWGN+FqgLxufFpydF2+SoXgC8iRaejGpQeq8LtH+Z94DqwXwHK/r/kffHiR3GQQv07370HKureDorY2gLMcvi5M8+Bk699ZADS3b2mBSXitNZuM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761000857; c=relaxed/simple;
	bh=8RWPc/J+gIMcQEFxOG6dFR+ohNHjmy+3waEaDz3hd8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjzPrRiM5U5XA66jiT8FD5rtGUtgu83gzghvT97NXNb4UwCQBwj1nV7I57Adv6R1rYGtFymnHSY5LlFfsjajX7JuZbGmsPU6MRuhX11phUgmfdn6K8RFJfMF7vqV/B6NcZahXUIGjgcTLW3heJUOHTXfOf+3AdvIjWFT/ClzuEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZQlq7YN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso869534766b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761000853; x=1761605653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXVpf+jOLhkP3YQQfTg59JZdjchGBwXlDGaLekMrenI=;
        b=fZQlq7YNoYMHppESHlwQG5I3l7GO5ieUNhqKmfW11p9p8OvzR4xXelVLV4W83Alf6M
         zUuZ+ii+K3diVyNTEv+0VX71jxoltsKcu5BQvCJI/mN6mymfYP+pjkrh5hznGTKzrJGA
         l8aPhL0CVp/xzdmll1JX/2oiyWnagDm1a8e5hvc/Fvve+GPxPCedN3VAKlvdRohp/ueC
         eJkg/wzZUGmIPbtYHwgY5nzOxFg6RdRfKDAYtOCQRHT3RvtlaDcnEHqyvWRfkKXx50q1
         SyPUWy9/E2ZU1dW2QN1qvxts0gc6mUDonnWwoTXfL8FqW447jsBbd9Y5mltqxDOt3h8l
         4Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761000853; x=1761605653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXVpf+jOLhkP3YQQfTg59JZdjchGBwXlDGaLekMrenI=;
        b=GFOE9JwjMh8YKbA7CwHAt3F3IjGeYqcPtZepnR7g5D/RODmHIiXc5NIEiW9VPIMCzY
         eqXjIDHfbRzRM2j3siFF8anS8/A4p3nH7tEOLtG8QHzgbPXuRmOa738lDNTQj9ihpMDY
         X1fEdB4QtGC9YHVtidm0gGrgEP8eeDSJRRiQut9OI4PaZS9BXxPmHEvv8K8xeHYhZlLI
         x2zM36JQLWjtrHzljIEdr0OFE6u8Y4SAVCYJWHchCCG7CrPKYXtG7Qk6vTCckhJJFSNl
         HsKH66umcfFMRJ8YmXy/WCWIsDRPt5rZTyM5OyhQ/OEi+XVS1l4P67+smClskDjGi+rI
         PLbA==
X-Forwarded-Encrypted: i=1; AJvYcCVUhZIbeWTfUtVl9dbVJX3SlWcXh++4upLdfA+7Rkymk4jcKyAd87cpHfwbPKSTuw6VNjwqKxN4qoIEhps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pKAlTkE0gouc1bP8GISmjwaW+4TbptsPTneUtu5Nte2q2wDk
	684raS5lQs9phEB/LtbHjag0beFTE0INb54k0e2HpIT4Sa7mRSFNX7/CcHfEY3abZnpkPakXQcv
	4hDWmzoZtuQzbP4pc443IaoqmtTvEGkytE+V8VuQ=
X-Gm-Gg: ASbGncvRf4g9au5ZJuYcwef5rPdBXz8o3syge+WuRq+mNt1vriCiUkCDG7k/kC32HLu
	KvA8XGtqc0q1Psz7hrqY0KxEqo8888+82MxDOTLTS88PZGWa4VLheYP2ZVOPI27RF+uhf/4pXEk
	aBalNRea6cmGFWRqqZ++3059zl/fsmvuTRat44S4GBf7Gv/osuntPI+7x2Ewp1tR/h5Th5tfHLU
	gVtwXL2e1GX7UyQ+yIWU1lNSESUpILjAMoHCJa+HejjzcdEN6HbE2Q+5Qr+xjnRdChd
X-Google-Smtp-Source: AGHT+IGxESvOLWCY5N66S/ojP/nYOYl3Tj24HBpCyNwp/S7zxilqgZUafQa2wCmwT4NmlDi/C89pR/VoaK4wOYRrO28=
X-Received: by 2002:a17:907:1c82:b0:b4e:a47f:715d with SMTP id
 a640c23a62f3a-b6472a6a145mr1759951766b.17.1761000852713; Mon, 20 Oct 2025
 15:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020220005.work.095-kees@kernel.org> <20251020220118.1226740-1-kees@kernel.org>
In-Reply-To: <20251020220118.1226740-1-kees@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Mon, 20 Oct 2025 15:53:55 -0700
X-Gm-Features: AS18NWAFS0u2q23JU9GZh3nxGXIAaxKW62Opi8L5p1adGFlg6Vwpq6L8QQr0HRw
Message-ID: <CAGG=3QV7-W5vEPNtABghg=ktn6kKs45_e-PWBT9oCUzURod1bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] compiler_types: Introduce __counted_by_ptr()
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Tamir Duberstein <tamird@gmail.com>, Michael Kelley <mhklinux@outlook.com>, 
	kernel test robot <lkp@intel.com>, Heiko Carstens <hca@linux.ibm.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Yafang Shao <laoar.shao@gmail.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Christopher Ferris <cferris@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Paolo Abeni <pabeni@redhat.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
	Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 3:01=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members:
>
> struct foo {
>         int a, b, c;
>         char *buffer __counted_by_ptr(bytes);
>         short nr_bars;
>         struct bar *bars __counted_by_ptr(nr_bars);
>         size_t bytes;
> };
>
> Since "counted_by" can only be applied to pointer members in very recent
> compiler versions, its application ends up needing to be distinct from
> flexible array "counted_by" annotations, hence a separate macro.
>
> Unfortunately, this annotation cannot be used for "void *" members
> (since such a member is considered a pointer to an incomplete type,
> and neither Clang nor GCC developers could be convinced otherwise[1],
> even in the face of the GNU extension that "void *" has size "1 byte"
> for pointer arithmetic). For "void *" members, we must use the coming
> "sized_by" attribute.
>
I'm pretty sure that "sized_by" is available in Clang right now.

-bw

> Link: https://gcc.gnu.org/pipermail/gcc-patches/2025-May/683136.html [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: <llvm@lists.linux.dev>
> ---
>  init/Kconfig                   | 11 +++++++++++
>  Makefile                       |  4 ++++
>  include/linux/compiler_types.h | 21 ++++++++++++++++++++-
>  include/uapi/linux/stddef.h    |  4 ++++
>  4 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49..54691b086bc6 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -139,6 +139,17 @@ config CC_HAS_COUNTED_BY
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
>         default y if CC_IS_GCC && GCC_VERSION >=3D 150100
>
> +config CC_HAS_COUNTED_BY_PTR_BARE
> +       def_bool $(success,echo 'struct foo { int *ptr __attribute__((__c=
ounted_by__(count))); int count; };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /d=
ev/null -Werror)
> +
> +config CC_HAS_COUNTED_BY_PTR_EXP
> +       def_bool $(success,echo 'struct foo { int *ptr __attribute__((__c=
ounted_by__(count))); int count; };' | $(CC) $(CLANG_FLAGS) -fexperimental-=
late-parse-attributes -x c - -c -o /dev/null -Werror)
> +       depends on !CC_HAS_COUNTED_BY_PTR_BARE
> +
> +config CC_HAS_COUNTED_BY_PTR
> +       def_bool y
> +       depends on CC_HAS_COUNTED_BY_PTR_BARE || CC_HAS_COUNTED_BY_PTR_EX=
P
> +
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring=
__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> diff --git a/Makefile b/Makefile
> index d14824792227..1b297dcbb0df 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -933,6 +933,10 @@ KBUILD_CFLAGS      +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
>  endif
>  endif
>
> +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR_EXP
> +KBUILD_CFLAGS  +=3D -fexperimental-late-parse-attributes
> +endif
> +
>  # Explicitly clear padding bits during variable initialization
>  KBUILD_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_type=
s.h
> index 59288a2c1ad2..f197ea03b593 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -353,11 +353,14 @@ struct ftrace_likely_data {
>  #endif
>
>  /*
> + * Runtime track number of flexible array member elements for use by
> + * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> + *
>   * Optional: only supported since gcc >=3D 15
>   * Optional: only supported since clang >=3D 18
>   *
>   *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
> - * clang: https://github.com/llvm/llvm-project/pull/76348
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by=
-counted-by-or-null-sized-by-sized-by-or-null
>   *
>   * __bdos on clang < 19.1.2 can erroneously return 0:
>   * https://github.com/llvm/llvm-project/pull/110497
> @@ -371,6 +374,22 @@ struct ftrace_likely_data {
>  # define __counted_by(member)
>  #endif
>
> +/*
> + * Runtime track number of objects pointed to by a pointer member for
> + * use by CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> + *
> + * Optional: only supported since gcc >=3D 16
> + * Optional: only supported since clang >=3D 20
> + *
> + *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.ht=
ml
> + * clang: ...
> + */
> +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +# define __counted_by_ptr(member)      __attribute__((__counted_by__(mem=
ber)))
> +#else
> +# define __counted_by_ptr(member)
> +#endif
> +
>  /*
>   * Optional: only supported since gcc >=3D 15
>   * Optional: not supported by Clang
> diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> index 9a28f7d9a334..111b097ec00b 100644
> --- a/include/uapi/linux/stddef.h
> +++ b/include/uapi/linux/stddef.h
> @@ -72,6 +72,10 @@
>  #define __counted_by_be(m)
>  #endif
>
> +#ifndef __counted_by_ptr
> +#define __counted_by_ptr(m)
> +#endif
> +
>  #ifdef __KERNEL__
>  #define __kernel_nonstring     __nonstring
>  #else
> --
> 2.34.1
>

