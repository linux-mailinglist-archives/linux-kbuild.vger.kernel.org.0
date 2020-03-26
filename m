Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81CB8193AC2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgCZIYP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:24:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:57886 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727682AbgCZIYO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:24:14 -0400
IronPort-SDR: S10lxP/O15Up24keMPS3juuvsFWH+ZQjuOsTnwKwpKIg/ZeiUoR0MZXdF9aimJlXJnLIJ5IzGc
 EFL0Wc77VUYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:24:14 -0700
IronPort-SDR: 5SWx7LobP7Xk7vAZTAJX2qluD5fcl2KfCQrXaLbWi5S2WCQNBYGo4s5/hFX18gOYhnHfbYeuqC
 pMs/3FbeTOdQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="393901243"
Received: from mschuste-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.32.130])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:24:07 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/16] drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
In-Reply-To: <20200326080104.27286-10-masahiroy@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-10-masahiroy@kernel.org>
Date:   Thu, 26 Mar 2020 10:24:04 +0200
Message-ID: <87ftdvikwr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 26 Mar 2020, Masahiro Yamada <masahiroy@kernel.org> wrote:
> CONFIG_AS_MOVNTDQA was introduced by commit 0b1de5d58e19 ("drm/i915:
> Use SSE4.1 movntdqa to accelerate reads from WC memory").
>
> We raise the minimal supported binutils version from time to time.
> The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
> required binutils version to 2.21").
>
> I confirmed the code in $(call as-instr,...) can be assembled by the
> binutils 2.21 assembler and also by LLVM integrated assembler.
>
> Remove CONFIG_AS_MOVNTDQA, which is always defined.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ack for merging this via whichever tree you see fit; please let me know
if you want me to pick this up via drm-intel.

BR,
Jani.


> ---
>
> Changes in v2: None
>
>  drivers/gpu/drm/i915/Makefile      | 3 ---
>  drivers/gpu/drm/i915/i915_memcpy.c | 5 -----
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a1f2411aa21b..e559e53fc634 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -28,9 +28,6 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
>  CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>  
> -subdir-ccflags-y += \
> -	$(call as-instr,movntdqa (%eax)$(comma)%xmm0,-DCONFIG_AS_MOVNTDQA)
> -
>  subdir-ccflags-y += -I$(srctree)/$(src)
>  
>  # Please keep these build lists sorted!
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
> index fdd550405fd3..7b3b83bd5ab8 100644
> --- a/drivers/gpu/drm/i915/i915_memcpy.c
> +++ b/drivers/gpu/drm/i915/i915_memcpy.c
> @@ -35,7 +35,6 @@
>  
>  static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>  
> -#ifdef CONFIG_AS_MOVNTDQA
>  static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
>  {
>  	kernel_fpu_begin();
> @@ -93,10 +92,6 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
>  
>  	kernel_fpu_end();
>  }
> -#else
> -static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len) {}
> -static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len) {}
> -#endif
>  
>  /**
>   * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC

-- 
Jani Nikula, Intel Open Source Graphics Center
