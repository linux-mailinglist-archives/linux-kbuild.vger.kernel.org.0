Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14DCB7BBDEF
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 19:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjJFRp4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 13:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbjJFRpy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 13:45:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C393D8
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 10:45:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5457C433C8;
        Fri,  6 Oct 2023 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696614352;
        bh=jBKBLIb5gtXFkRdhknEB7nTah9CF01q9K0zVTAHqY/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HxnfSB9dVqwi5mV+4hZM76JLrZd89qAHAUFLJugE3i3Dm5zvjoOmFhu3ijHqpvsli
         wpO2dWNmy1sJ716bmq+pna3I6nNXVFQr9bRCGd7lBwkhQNJh8sPC4CmwsI5xKwN5R9
         KwHE1xcY9V9N9FTZRZPBxXD00ylZCe9/yD3qKo8ExyIrbg8XZg3DLotTLQjoOKtqWF
         NQs3CrgmkIiHF8m/dgvxV86cpnWggbu3J2Yo7ANzSaRZdWlmlnKk1NTW5MwGIXOrWH
         u0Kv3P6Q0sKOUfkctZP9IqsqBTvVQvbFRgLntf8QnAdakvpX0tsWV+Qv/8au0gmk5k
         dnYW+ttD7h+XQ==
Date:   Fri, 6 Oct 2023 10:45:50 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915: enable W=1 warnings by default
Message-ID: <20231006174550.GC3359308@dev-arch.thelio-3990X>
References: <cover.1696595500.git.jani.nikula@intel.com>
 <f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 06, 2023 at 03:34:47PM +0300, Jani Nikula wrote:
> We enable a bunch more compiler warnings than the kernel
> defaults. However, they've drifted to become a unique set of warnings,
> and have increasingly fallen behind from the W=1 set.
> 
> Align with the W=1 warnings from scripts/Makefile.extrawarn for clarity,
> by copy-pasting them with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it
> easier to compare in the future.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

One meta comment and review comment below. Feel free to carry forward

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

on future revisions.

> ---
> 
> An alternative or future option would be to have Makefile.extrawarn
> assign W=1 etc. flags to intermediate variables, say KBUILD_CFLAGS_W1,
> like this:
> 
> KBUILD_CFLAGS_W1 += -Wextra -Wunused -Wno-unused-parameter
> etc...
> 
> export KBUILD_CFLAGS_W1
> 
> ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
> 
> KBUILD_CFLAGS += $(KBUILD_CFLAGS_W1)
> 
> else
> etc...
> 
> and then drivers and subsystems could simply use:
> 
> subdir-ccflags-y += $(KBUILD_CFLAGS_W1)
> 
> to enable and remain up-to-date with W=1 warnings.

This has definitely come up a few times and while I am generally in
favor of something like this, it makes adding warnings to W=1 a little
bit harder because when we add warnings to W=1, we typically are not
concerned with breaking the build, as W=1 is not the default build. If a
subsystem has opted into "whatever the current W=1 is" by default,
changes to W=1 will have to be reviewed/tested within a normal build.

Doing something like this patch with a more regular cadence (maybe every
update after the merge window) seems like a reasonable compromise to me,
although I know that means more work for individual subsystem
maintainers.

> ---
>  drivers/gpu/drm/i915/Makefile | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 623f81217442..0485157054fc 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -3,22 +3,25 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
> -# Add a set of useful warning flags and enable -Werror for CI to prevent
> -# trivial mistakes from creeping in. We have to do this piecemeal as we reject
> -# any patch that isn't warning clean, so turning on -Wextra (or W=1) we
> -# need to filter out dubious warnings.  Still it is our interest
> -# to keep running locally with W=1 C=1 until we are completely clean.
> -#
> -# Note the danger in using -Wextra is that when CI updates gcc we
> -# will most likely get a sudden build breakage... Hopefully we will fix
> -# new warnings before CI updates!
> -subdir-ccflags-y := -Wextra
> -subdir-ccflags-y += -Wno-unused-parameter
> -subdir-ccflags-y += -Wno-type-limits
> -subdir-ccflags-y += -Wno-missing-field-initializers
> -subdir-ccflags-y += -Wno-sign-compare
> -subdir-ccflags-y += -Wno-shift-negative-value

As the test robot points out, you'll want to keep these four, as they
are only enabled for W=2 or W=3. With this diff on top of these two
patches:

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 0485157054fc..9c4e09c8aa4e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -21,6 +21,12 @@ subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
 subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
 # --- end copy-paste
 
+# The following turn off the warnings enabled by -Wextra
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-sign-compare
+subdir-ccflags-y += -Wno-shift-negative-value
+
 # Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
I can continue to build i915 warning free with ARCH=x86_64 allmodconfig
using all supported versions of LLVM for building the kernel.

> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
>  subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# --- end copy-paste
> +
> +# Enable -Werror in CI and development
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  
>  # Fine grained warnings disable
> -- 
> 2.39.2
> 
