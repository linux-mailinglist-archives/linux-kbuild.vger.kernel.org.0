Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C9F2F217A
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 22:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389206AbhAKVFD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 16:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389211AbhAKVFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 16:05:02 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3441FC061786;
        Mon, 11 Jan 2021 13:04:22 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id z5so1114917iob.11;
        Mon, 11 Jan 2021 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N/JvOTzwKH7g4yOdOBaQJ0iIJUcwItzyG+gczSopw4M=;
        b=OXMlL0nFMwpzNwC2f9hygACs5XEunTsQpb6aACMX25jkbji9m8sSHFDsmhnp3mPYlp
         SlLN/oThul0KAa75nH+HduGfoaUrlmvTnc+vUKl+0rGbgc9PQ13hqoHp30u4GxpuL5BC
         drCtzm7vvpXBrSy5FHkBMKMHqhi07+9SDjvB+edTg0vuNByQ1XXJtSM4S5c7ACOxUv+1
         khCCeK7WSN1uAunAcFugHBzaLVFRJ0V1MDTo5e+bMSje1OnOcz3pvZ9GCoofCoaU0VKE
         deXhPop+4w63HKcMjfAM77cdGSdmE/mA7P9sgfumesBviMBDDnz3FP9zk/45zCJLsBGw
         vFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/JvOTzwKH7g4yOdOBaQJ0iIJUcwItzyG+gczSopw4M=;
        b=FyCxhM7tkQqrj6xEjqLHUblB5ugP8tm0Pr4fCq3/lIwzV8r4Cy8AxjMG+ZmT6TcSzK
         eWpsHs4lzm5OQMXOUJ214UCi2SuvmEv2ilS81B0XhvZK1Iema6TPXLRZAFvHFr9TrYvq
         0jZ/jRTelF1btZGtvJ9oK7Na+3fpprwrW7KAkB/w9IgQj80xLx6yVg2/b4bbgW09Yf6L
         Xv6c9p5HaDp/Z3Rxmw9lculaztcbzj2Ibu///hBifQEKViZfCcqoF60f5DeuIUV/oJNM
         OXjMkRIekPZhTkN5aNBD1AVuZjGK0mCjp31ICFBWWkpZpRXRYUpT7+qpvEp3HhuLuAn9
         bBzA==
X-Gm-Message-State: AOAM533rfYLdbfXWcmp1FwRqI9j3EvR68eCXj9iqAdVMT51DUCrLpA0V
        z9QiK50nwsiL2BAFHS1jExY=
X-Google-Smtp-Source: ABdhPJzlX1J0Me+WPyfffdtszIDtkV578KtRvvz7AHXun8SDcNdQAuwilVMi0DH4aOhMBMS4yA17gw==
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr858966iof.111.1610399061403;
        Mon, 11 Jan 2021 13:04:21 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id r9sm547004ill.72.2021.01.11.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 13:04:20 -0800 (PST)
Date:   Mon, 11 Jan 2021 14:04:18 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210111210418.GA3660906@ubuntu-m3-large-x86>
References: <20210111081821.3041587-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111081821.3041587-1-morbo@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 12:18:21AM -0800, Bill Wendling wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
> 
> The raw profile data must be processed by clang's "llvm-profdata" tool before
> it can be used during recompilation:
> 
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> 
> Multiple raw profiles may be merged during this step.
> 
> The data can be used either by the compiler if LTO isn't enabled:
> 
>     ... -fprofile-use=vmlinux.profdata ...
> 
> or by LLD if LTO is enabled:
> 
>     ... -lto-cs-profile-file=vmlinux.profdata ...
> 
> This initial submission is restricted to x86, as that's the platform we know
> works. This restriction can be lifted once other platforms have been verified
> to work with PGO.
> 
> Note that this method of profiling the kernel is clang-native and isn't
> compatible with clang's gcov support in kernel/gcov.
> 
> [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Bill Wendling <morbo@google.com>

I took this for a spin against x86_64_defconfig and ran into two issues:

1. https://github.com/ClangBuiltLinux/linux/issues/1252

   There is also one in drivers/gpu/drm/i915/i915_query.c. For the time
   being, I added PGO_PROFILE_... := n for those two files.

2. After doing that, I run into an undefined function error with ld.lld.

How I tested:

$ make -skj"$(nproc)" LLVM=1 defconfig

$ scripts/config -e PGO_CLANG

$ make -skj"$(nproc)" LLVM=1 olddefconfig vmlinux all
ld.lld: error: undefined symbol: __llvm_profile_instrument_memop
>>> referenced by head64.c
>>>               arch/x86/kernel/head64.o:(__early_make_pgtable)
>>> referenced by head64.c
>>>               arch/x86/kernel/head64.o:(x86_64_start_kernel)
>>> referenced by head64.c
>>>               arch/x86/kernel/head64.o:(copy_bootdata)
>>> referenced 2259 more times

Local diff:

diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index ffce287ef415..4b2f238770b5 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-y				+= mem.o random.o
+PGO_PROFILE_random.o		:= n
 obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
 obj-y				+= misc.o
 obj-$(CONFIG_ATARI_DSP56K)	+= dsp56k.o
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index e5574e506a5c..d83cacc79b1a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -168,6 +168,7 @@ i915-y += \
 	  i915_vma.o \
 	  intel_region_lmem.o \
 	  intel_wopcm.o
+PGO_PROFILE_i915_query.o := n
 
 # general-purpose microcontroller (GuC) support
 i915-y += gt/uc/intel_uc.o \
