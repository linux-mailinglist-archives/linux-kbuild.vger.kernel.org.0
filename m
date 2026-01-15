Return-Path: <linux-kbuild+bounces-10593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E262D22579
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 05:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFA053013560
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 04:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF1127979A;
	Thu, 15 Jan 2026 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih5KFo+k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F95136358;
	Thu, 15 Jan 2026 04:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449655; cv=none; b=nJb9RYvybbnAUyk68gjX5xRtinPbQ0ctOxwaWD+V7Mq6iqAfZLwN+UYLNo/GWnNYNGA5MAtZnIdU3x2C4roDXDAOkXWg20Vfkppk0Xpa4n0VtiRXp0ZT8wv8lEibbSnw/BfeZAChkDeN8Ac/HVlKXjtj1aBD0Htz1lCmtu33k4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449655; c=relaxed/simple;
	bh=alpvrE4MA5mOr3g4huj8ydkWW+lT29ccJ07tRex1/nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3/qxucZaPE+qDVshHsuej1RQZVyUuHeeNx8p30hoM22eFSXtAXDWNy+lyXxrb7JfoxVmjh9NPzDRmYezT49wSX50bKm97eab4lpBwinyZBrMRSTiB5MiCqNupDVP9I/dW8j3pAgRrPcuExGYIrO/2Hq/xymAHr5DVUuE+tpFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih5KFo+k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A309C116D0;
	Thu, 15 Jan 2026 04:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768449654;
	bh=alpvrE4MA5mOr3g4huj8ydkWW+lT29ccJ07tRex1/nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ih5KFo+kzCZ0Ds0LFPydQdIUXSVyjQEowKpzDaqO+dPRAkwOCd5Pbr37CaYuxoSQd
	 3kMsJDUgje4NfAzIKG0bmGRiwMou2Ct/fay6QpUhktTEInZXk3YuaG9vWA0YiLC16v
	 /e39LY5fgiPW/7/X/B/RgzrBv96pMnSH1cq7eTXxuc+snlQuOfxFKXsl7G4MTXqe2x
	 PH+HGyP1YfpY0XVWAt7Dbj5JVypcXAYvVrEH1iWBpiqFfI1huj8IsYh44aOMeEJOFP
	 UpGZKwhcn5p5EXasKdSbMFZ9/XhDpz9C7aq7ZWBnTKJd9z9Coqg4zmAOLME5T4WRuu
	 +prqWbqdopzOQ==
Date: Wed, 14 Jan 2026 20:00:54 -0800
From: Kees Cook <kees@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Marc Herbert <Marc.Herbert@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <202601141956.A798BFF@keescook>
References: <20251121195504.1661783-1-morbo@google.com>
 <20260114193716.1740684-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114193716.1740684-1-morbo@google.com>

On Wed, Jan 14, 2026 at 07:36:47PM +0000, Bill Wendling wrote:
> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members.
> 
> struct foo {
> 	int a, b, c;
> 	char *buffer __counted_by_ptr(bytes);
> 	short nr_bars;
> 	struct bar *bars __counted_by_ptr(nr_bars);
> 	size_t bytes;
> };
> 
> Because "counted_by" can only be applied to pointer members in very
> recent compiler versions, its application ends up needing to be distinct
> from flexibe array "counted_by" annotations, hence a separate macro.
> 
> Note that Clang's support for "void *" members will be in version 22.
> So, when using Clang, you'll need to wait until its release before using
> the feature with "void *". No such restriction applies to GCC's version
> 16.

I think to keep operational parity, we should limit counted_ptr on Clang
to version 22 then, otherwise we'll have problems using it on void *.

> This is a reworking of Kees' previous patch [1].

Thanks for this!

> 
> Link: https://lore.kernel.org/all/20251020220118.1226740-1-kees@kernel.org/ [1]
> Co-developed-by: Kees Cook <kees@kernel.org>

This needs to be followed by my S-o-b, I think? checkpatch.pl ought to
check this.

> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> Cc: Kees Cook <kees@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
> Cc: Uros Bizjak <ubizjak@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Jeff Xu <jeffxu@chromium.org>
> Cc: "Michal Koutný" <mkoutny@suse.com>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: "Thomas Weißschuh" <thomas.weissschuh@linutronix.de>
> Cc: John Stultz <jstultz@google.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> ---
> v3 - Replace the previous code with a modified version of Kees' previous patch
>      [1].
>    - The question about the naming of the macro was considered, but we decided
>      to keep the original naming (__counted_by_ptr), because it mirrors the current
>      macros like "__counted_by_{le,be}".
> v2 - Add support for GCC.
> ---
>  Makefile                       |  6 ++++++
>  include/linux/compiler_types.h | 18 +++++++++++++++++-
>  include/uapi/linux/stddef.h    |  4 ++++
>  init/Kconfig                   |  7 +++++++
>  4 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 9d38125263fb..6b029f694bc2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -952,6 +952,12 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>  
> +ifdef CONFIG_CC_IS_CLANG
> +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +KBUILD_CFLAGS	+= -fexperimental-late-parse-attributes
> +endif
> +endif
> +
>  # Explicitly clear padding bits during variable initialization
>  KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
>  
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index d3318a3c2577..e597c814d60b 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -369,7 +369,7 @@ struct ftrace_likely_data {
>   * Optional: only supported since clang >= 18
>   *
>   *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
> - * clang: https://github.com/llvm/llvm-project/pull/76348
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
>   *
>   * __bdos on clang < 19.1.2 can erroneously return 0:
>   * https://github.com/llvm/llvm-project/pull/110497
> @@ -383,6 +383,22 @@ struct ftrace_likely_data {
>  # define __counted_by(member)
>  #endif
>  
> +/*
> + * Runtime track number of objects pointed to by a pointer member for use by
> + * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> + *
> + * Optional: only supported since gcc >= 16
> + * Optional: only supported since clang >= 21.1

As I mention above, let's make this 22

> + *
> + *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> + * clang: https://github.com/llvm/llvm-project/pull/137250

Oh, hm, did the docs for
https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
not get updated by the above PR? Docs should get added to LLVM for this
so we can link to the same AttributeReference.html as above.

And, actually, same question for GCC, now that I'm looking at this...


> + */
> +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +#define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
> +#else
> +#define __counted_by_ptr(member)
> +#endif
> +
>  /*
>   * Optional: only supported since gcc >= 15
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
>  #define __kernel_nonstring	__nonstring
>  #else
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..dc27b998d111 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -143,6 +143,13 @@ config CC_HAS_COUNTED_BY
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
>  	default y if CC_IS_GCC && GCC_VERSION >= 150100
>  
> +config CC_HAS_COUNTED_BY_PTR
> +	bool
> +	# supported since clang 21.1.0
> +	default y if CC_IS_CLANG && CLANG_VERSION >= 210100

Let's do 22

> +	# supported since gcc 16.0.0
> +	default y if CC_IS_GCC && GCC_VERSION >= 160000
> +
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>  	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>  
> -- 
> 2.52.0.457.g6b5491de43-goog
> 

Great! Once this is fixed up, I'll snag the other 2 patches from my
original series too.

Thanks!

-Kees

-- 
Kees Cook

