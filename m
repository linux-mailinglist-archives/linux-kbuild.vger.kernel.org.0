Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9001A3AFDDB
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 09:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhFVH2a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 03:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFVH21 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 03:28:27 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A58C061574;
        Tue, 22 Jun 2021 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ChDiBXqAGycwZ327ht94EElL6EgZhmaY+P0RC9fzg+o=; b=rJKaj++3CD7nUku99L5fJotGEg
        uUjeh5s9rmUqKpotWRKo2zVAKEjdLH8B2uuaTM7VaE2rxjkdzh45KWQ2LopSeLxML1jCwuVCi2C+j
        B1Jj0sD6Co17xseOWgDQ5HADsMRV5M7KJjwtwssBDr7i+UfuMrXjcWtZSsuNFrY5n/FpZ10Kat2hu
        afrbaeew3uAsYwfV5zhX3VQq8tonNrFc2+ms2TQzRNVDzSLxdQweJhoe8Oegig4Y/kK9RbUpILRgY
        x5qePMZvd92Es+wvM7ZUkQ9NyQHGZAPDbRh/vpGoJ+lajt7uHm7IuKpmnN3HW+WJIHtaK80rkwu/h
        W6j5OZFA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lvanA-00AWLV-FD; Tue, 22 Jun 2021 07:25:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D55373002C5;
        Tue, 22 Jun 2021 09:25:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C45BD2C6EEC7C; Tue, 22 Jun 2021 09:25:58 +0200 (CEST)
Date:   Tue, 22 Jun 2021 09:25:58 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>, Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 3/3] Kconfig: add
 ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
Message-ID: <YNGQhgKd9Ruti5qZ@hirez.programming.kicks-ass.net>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621231822.2848305-4-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 04:18:22PM -0700, Nick Desaulniers wrote:
> We don't want compiler instrumentation to touch noinstr functions, which
> are annotated with the no_profile_instrument_function function
> attribute. Add a Kconfig test for this and make PGO and GCOV depend on
> it.
> 
> If an architecture is using noinstr, it should denote that via this
> Kconfig value. That makes Kconfigs that depend on noinstr able to
> express dependencies in an architecturally agnostic way.
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * Add ARCH_WANTS_NO_INSTR
> * Change depdendencies to be !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
>   rather than list architectures explicitly, as per Nathan.
> * s/no_profile/no_profile_instrument_function/
> 
>  arch/Kconfig        | 7 +++++++
>  arch/arm64/Kconfig  | 1 +
>  arch/s390/Kconfig   | 1 +
>  arch/x86/Kconfig    | 1 +
>  init/Kconfig        | 3 +++
>  kernel/gcov/Kconfig | 1 +
>  kernel/pgo/Kconfig  | 3 ++-
>  7 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2b4109b0edee..2113c6b3b801 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -285,6 +285,13 @@ config ARCH_THREAD_STACK_ALLOCATOR
>  config ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	bool
>  
> +config ARCH_WANTS_NO_INSTR
> +	bool
> +	help
> +	  An architecure should select this if the noinstr macro is being used on
> +	  functions to denote that the toolchain should avoid instrumenting such
> +	  functions and is required for correctness.
> +
>  config ARCH_32BIT_OFF_T
>  	bool
>  	depends on !64BIT

There's also CC_HAS_WORKING_NOSANITIZE_ADDRESS in lib/Kconfig.kasan that
might want to be hooked into this, but that can be done separately I
suppose.
