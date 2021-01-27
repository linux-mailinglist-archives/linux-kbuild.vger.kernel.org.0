Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75333062F3
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 19:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344351AbhA0SDi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 13:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344148AbhA0SDZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 13:03:25 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86490C061786;
        Wed, 27 Jan 2021 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=nmUx9B3ctDFuPF+9qyK11uP4F24HgbZFCLayZjdworI=; b=dGoevGX3QmkwspJI/OcjS4PdEB
        otTuvRN8H2wmmLy428qul28x8SshGvG2iwX/XN+sQyreT+bV0IVptj4h0DXbxb9q6SK4TRzNL0pna
        2a17Wzw/Qy0qI0jBMjNIW8/WMCHlCps/e8tlDuAZsoHnh1FFLVdV8t6ijdNuYj3Yboq6hpw4aUcsm
        Lb+5HPxPzPGemJWzYSQy6lItWWrZ/o6kQyvRzVIUf2S3IomXyh43llg6KRmjNHUaQO/ly1KlUGtqP
        qfJeYCRhp+7wu/qTlaq1peBp6dd5SNvnfVhgQnZ/oRxN7qVoELZG1/VcUUtq0agfeawqDCy9Pc0P2
        mLgPh3Iw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4p8x-007KFR-3d; Wed, 27 Jan 2021 18:02:19 +0000
Date:   Wed, 27 Jan 2021 18:02:15 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210127180215.GA1745339@infradead.org>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Please don't add all this garbage.  We only add infrastructure to the
kernel for what the kernel itself needs, not for weird out of tree
infrastructure.

On Mon, Jan 25, 2021 at 02:42:10PM -0600, Josh Poimboeuf wrote:
> When building out-of-tree kernel modules, the build system doesn't
> require the GCC version to match the version used to build the original
> kernel.  That's probably [1] fine.
> 
> In fact, for many distros, the version of GCC used to build the latest
> kernel doesn't necessarily match the latest released GCC, so a GCC
> mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
> it's probably more common.
> 
> So a lot of users have come to rely on being able to use a different
> version of GCC when building OOT modules.
> 
> But with GCC plugins enabled, that's no longer allowed:
> 
>   cc1: error: incompatible gcc/plugin versions
>   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
> 
> That error comes from the plugin's call to
> plugin_default_version_check(), which strictly enforces the GCC version.
> The strict check makes sense, because there's nothing to prevent the GCC
> plugin ABI from changing -- and it often does.
> 
> But failing the build isn't necessary.  For most plugins, OOT modules
> will otherwise work just fine without the plugin instrumentation.
> 
> When a GCC version mismatch is detected, print a warning and disable the
> plugin.  The only exception is the RANDSTRUCT plugin which needs all
> code to see the same struct layouts.  In that case print an error.
> 
> [1] Ignoring, for the moment, that the kernel now has
>     toolchain-dependent kconfig options, which can silently disable
>     features and cause havoc when compiler versions differ, or even when
>     certain libraries are missing.  This is a separate problem which
>     also needs to be addressed.
> 
> Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---
>  scripts/Makefile.gcc-plugins | 19 +++++++++++++++++++
>  scripts/Makefile.kcov        | 11 +++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e46876329..7227692fba59 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -51,6 +51,25 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
>  # The sancov_plugin.so is included via CFLAGS_KCOV, so it is removed here.
>  GCC_PLUGINS_CFLAGS := $(filter-out %/sancov_plugin.so, $(GCC_PLUGINS_CFLAGS))
> +
> +# Out-of-tree module check: If there's a GCC version mismatch, disable plugins
> +# and print a warning.  Otherwise the OOT module build will fail due to
> +# plugin_default_version_check().
> +ifneq ($(GCC_PLUGINS_CFLAGS),)
> +    ifneq ($(KBUILD_EXTMOD),)
> +        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
> +
> +            ifdef CONFIG_GCC_PLUGIN_RANDSTRUCT
> +                $(error error: CONFIG_GCC_PLUGIN_RANDSTRUCT requires out-of-tree modules to be built using the same GCC version as the kernel.)
> +            endif
> +
> +            $(warning warning: Disabling GCC plugins for out-of-tree modules due to GCC version mismatch.)
> +            $(warning warning: The following plugins have been disabled: $(gcc-plugin-y))
> +            GCC_PLUGINS_CFLAGS :=
> +	endif
> +    endif
> +endif
> +
>  export GCC_PLUGINS_CFLAGS
>  
>  # Add the flags to the build!
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b..63a2bc2aabb2 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,15 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
>  
> +# Out-of-tree module check for GCC version mismatch.
> +# See the similar check in scripts/Makefile.gcc-plugins
> +ifneq ($(CONFIG_GCC_PLUGIN_SANCOV),)
> +    ifneq ($(KBUILD_EXTMOD),)
> +        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
> +            $(warning warning: Disabling CONFIG_GCC_PLUGIN_SANCOV for out-of-tree modules due to GCC version mismatch.)
> +            kcov-flags-y := $(filter-out %/sancov_plugin.so, $(kcov-flags-y))
> +        endif
> +    endif
> +endif
> +
>  export CFLAGS_KCOV := $(kcov-flags-y)
> -- 
> 2.29.2
> 
---end quoted text---
