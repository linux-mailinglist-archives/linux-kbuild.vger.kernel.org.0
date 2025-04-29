Return-Path: <linux-kbuild+bounces-6799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35DCAA1B8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 21:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 675347B70CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 19:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254C82620C9;
	Tue, 29 Apr 2025 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcD7tVsY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C8259CAF;
	Tue, 29 Apr 2025 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956287; cv=none; b=Ey3jDw61hIBsjOXc7sZ81iqIfLz5HCLegGEW1WCaIxovBslcz0xBQcICSmaSb7DuDc1zTdchb2oofLK8DUUPkYdV1Rrz2N5BHGaqRr6LoeRo0VvdF+FHpbY28DTndSvklM2wJBr1sGJj/gBWvakHKfayhKeTS+0Azx8AAHPol9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956287; c=relaxed/simple;
	bh=VJTYJ+DRSOZ7GY8qrph88f8OFS52yzkIz78IYtEQHco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYGKlP9OOx0yKvfqrXN356HfYmX316Tq+YGnvhNmb27563Un2PTKjBhc1yr+FkYEx3unixM0no2skXYVSvJe8be7bz+zG0RWEDdL/fsAOkJSvfLM9cNQvDpeUOQklCFWEV3UIZ8a2bXQIqKhPPJVWhM0FpVV7GH1Gp4kyQcGcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcD7tVsY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745956286; x=1777492286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VJTYJ+DRSOZ7GY8qrph88f8OFS52yzkIz78IYtEQHco=;
  b=GcD7tVsY1TN0SPLyuWhmiOJWcXe3tcjo+K5CYODSiGv8Pk7ZJzf2oA5g
   06+gf6yD//TKHHAGksO4qnia4UnPF+8ZuUZorPX0Sn4FJ2tBKG69TtnXM
   xxwsRTxrDEMEA8WhWgmD+9PFh6/H+MnPjpubsnbxr7xNMFjRNT+yd5HNZ
   SJg5iSO9kB3lxFsVphFuKhyAyDQZeT+BWg9HufjEm+AVDAoGDpDr/QBJE
   WybIhg8TiORrQ4Ib6KPdRl6UMtECMoE5bJuK1azQx55ykjq/KqsA3zgzP
   fb7UZVExc14dvrEtdLsRCe3T4fg+OPd9okKxBsEz+jw4jxO8r6jKWOlN6
   g==;
X-CSE-ConnectionGUID: XcXhtjlMTZmC8LjrDX/wCA==
X-CSE-MsgGUID: 995BFKt2Sxqis8TxeEVYJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65009684"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="65009684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 12:51:25 -0700
X-CSE-ConnectionGUID: Nyl775vaQ86rWQdZs/rvnA==
X-CSE-MsgGUID: gOyjbdY+Qn24s/zSN/8koQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="139102749"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orviesa005.jf.intel.com with SMTP; 29 Apr 2025 12:51:19 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 29 Apr 2025 22:51:17 +0300
Date: Tue, 29 Apr 2025 22:51:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
Message-ID: <aBEttQH4kimHFScx@intel.com>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
X-Patchwork-Hint: comment

On Sat, Mar 15, 2025 at 02:20:14PM +0100, Thomas Weiﬂschuh wrote:
> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> Other references, for example in debug information, are not affected.
> This makes handling of file references in the compiler outputs harder to
> use and creates problems for reproducible builds.
> 
> Switch to -ffile-prefix map which affects all references.
> 
> Also drop the documentation section advising manual specification of
> -fdebug-prefix-map for reproducible builds, as it is not necessary
> anymore.

Hi,

This broke 'objdump -S' completely for me.

I see the following difference in the debug info:
-    <12>   DW_AT_name        : (indirect line string, offset: 0): drivers/gpu/drm/i915/i915_config.c
-    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x23): /home/.../src/linux-2.6/build
+    <12>   DW_AT_name        : (indirect line string, offset: 0): ../drivers/gpu/drm/i915/i915_config.c
+    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x26): /home/.../src/linux-2.6/build

Looks like I can work around it with some combination of --prefix and
--prefix-strip, but that seems far too tedious to have to do every
time I need to decode an oops.

> 
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Pick up Ack from Borislav
> - Merge all changes into single patch
> - Also drop link to KCFLAGS from docs
> - Link to v1: https://lore.kernel.org/r/20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net
> ---
>  Documentation/kbuild/reproducible-builds.rst | 17 -----------------
>  Makefile                                     |  2 +-
>  arch/x86/boot/Makefile                       |  2 +-
>  arch/x86/boot/compressed/Makefile            |  2 +-
>  4 files changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index f2dcc39044e66ddd165646e0b51ccb0209aca7dd..a7762486c93fcd3eba08b836bed622a41e829e41 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -46,21 +46,6 @@ The kernel embeds the building user and host names in
>  `KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
>  building from a git commit, you could use its committer address.
>  
> -Absolute filenames
> -------------------
> -
> -When the kernel is built out-of-tree, debug information may include
> -absolute filenames for the source files.  This must be overridden by
> -including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
> -
> -Depending on the compiler used, the ``__FILE__`` macro may also expand
> -to an absolute filename in an out-of-tree build.  Kbuild automatically
> -uses the ``-fmacro-prefix-map`` option to prevent this, if it is
> -supported.
> -
> -The Reproducible Builds web site has more information about these
> -`prefix-map options`_.
> -
>  Generated files in source packages
>  ----------------------------------
>  
> @@ -131,7 +116,5 @@ See ``scripts/setlocalversion`` for details.
>  
>  .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
>  .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
> -.. _KCFLAGS: kbuild.html#kcflags
> -.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
>  .. _Reproducible Builds project: https://reproducible-builds.org/
>  .. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/
> diff --git a/Makefile b/Makefile
> index 5c333682dc9142b1aacfe454a5c77f5923554b7d..4f920187cee658ae4d1b807fca365f6994274828 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1067,7 +1067,7 @@ endif
>  
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
> -KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
> +KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
>  KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
>  endif
>  
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 9cc0ff6e9067d574488a35573eff4d0f8449e398..f500f82864aae80deb74faa3df9a8b6333d6c4ca 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -54,7 +54,7 @@ targets += cpustr.h
>  
>  KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
>  KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
> -KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> +KBUILD_CFLAGS	+= $(call cc-option,-ffile-prefix-map=$(srctree)/=)
>  KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>  
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 5edee7a9786c67e13c295473751b82387bcbd67e..ad324978b2e5b1b6f8be82647769c99db8257ac7 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -38,7 +38,7 @@ KBUILD_CFLAGS += -fno-stack-protector
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS += -Wno-pointer-sign
> -KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> +KBUILD_CFLAGS += $(call cc-option,-ffile-prefix-map=$(srctree)/=)
>  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS += -D__DISABLE_EXPORTS
>  # Disable relocation relaxation in case the link is not PIE.
> 
> ---
> base-commit: a57512d6cd88eba04cdc1fb83832c00d248bd0d1
> change-id: 20250312-kbuild-prefix-map-5ae76c209e7a
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

-- 
Ville Syrj‰l‰
Intel

