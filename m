Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A043F0E91
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 01:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhHRXTt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 19:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234791AbhHRXTs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 19:19:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80EE36109F;
        Wed, 18 Aug 2021 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1629328753;
        bh=yTnTdUc2FJ+hnloFknl4xzYCBGT0SKFtOXGmR2H+Gcc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g5WQ5XEKuqNkZvg501/hNDfCi1BlX7V+Oxm7YQsoC9u8SKDmi2hIfJkyZ7Dw5bByJ
         aRsxrH+mToBBVxnAGWKoYrAU/Vb6aVRdYbk6Em/zj3tKecYvijnejNzbMKVLIWeX3A
         6Ddg2jhv+0FOyxn8lVSeWg3SHzSJsJIIdT+d8NkI=
Date:   Wed, 18 Aug 2021 16:19:12 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Compiler Attributes: Add __alloc_size() for
 better bounds checking
Message-Id: <20210818161912.f14722707e06de1f046e948d@linux-foundation.org>
In-Reply-To: <20210818214021.2476230-2-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
        <20210818214021.2476230-2-keescook@chromium.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 18 Aug 2021 14:40:15 -0700 Kees Cook <keescook@chromium.org> wrote:

> GCC and Clang can use the "alloc_size" attribute to better inform the
> results of __builtin_object_size() (for compile-time constant values).
> Clang can additionally use alloc_size to inform the results of
> __builtin_dynamic_object_size() (for run-time values).
> 
> Because GCC sees the frequent use of struct_size() as an allocator size
> argument, and notices it can return SIZE_MAX (the overflow indication),
> it complains about these call sites may overflow (since SIZE_MAX is
> greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
> isn't helpful since we already know a SIZE_MAX will be caught at run-time
> (this was an intentional design). Instead, just disable this check as
> it is both a false positive and redundant. (Clang does not have this
> warning option.)
> 
> ...
>
> --- a/Makefile
> +++ b/Makefile
> @@ -1078,9 +1078,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>  # Another good warning that we'll want to enable eventually
>  KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>  
> -# Enabled with W=2, disabled by default as noisy
>  ifdef CONFIG_CC_IS_GCC
> +# Enabled with W=2, disabled by default as noisy
>  KBUILD_CFLAGS += -Wno-maybe-uninitialized
> +
> +# The allocators already balk at large sizes, so silence the compiler
> +# warnings for bounds checks involving those possible values.
> +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
>  endif
>  
>  # disable invalid "can't wrap" optimizations for signed / pointers

Makefile has changed.  I did this:

--- a/Makefile~compiler-attributes-add-__alloc_size-for-better-bounds-checking
+++ a/Makefile
@@ -1003,6 +1003,12 @@ KBUILD_CFLAGS += $(call cc-disable-warni
 # Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
 
+ifdef CONFIG_CC_IS_GCC
+# The allocators already balk at large sizes, so silence the compiler
+# warnings for bounds checks involving those possible values.
+KBUILD_CFLAGS += -Wno-alloc-size-larger-than
+endif
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
_

