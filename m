Return-Path: <linux-kbuild+bounces-6992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496EAADDF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9783E3BB3FB
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F5B21770A;
	Wed,  7 May 2025 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KqvLLeaW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7174B1E45
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619298; cv=none; b=L8DWMwIiDut7vBdvABIwK4MCebSG3xqWC+BIFg4IDgdtqdVK0cp8KSt11jXSWIcaVkLvXFgITAUvNP2ASIztjltI/wYHZI9rA9M0vYejFga8aOX8oc/F1iaNX4C3DM83xqJcbnWMvwUIo+5529Phl3mKmaB2JUokght6/6yINMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619298; c=relaxed/simple;
	bh=aH4+3i8OZH7nxCS1kUVDJOYoGbnWmIhuHdgXBFhNqkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIgDntLCAT2gijdp6J7uyMe36hMjJXe06kwXtZ+x/lOuLJPYXoYy54mqt7xoTWmjJXBnt5DRK6SGHjAfCIN9iGJiLXZYKpYBng4c3tcRSejgS5aJZBt6uWxQexTP9UyXUOF7m5EXw+gbRahUwNTK3FTwvgzCfUTje00wmVTGQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KqvLLeaW; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 7 May 2025 14:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746619284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL2wxXAmed+PI/IjubgKwat4E+CcspkAjjt3L6RhK6w=;
	b=KqvLLeaW68RPJ4At5QovaE5Sva77KYzEOsefT5qStixFTp6/uBdnq3GpuKrkvHotSROeBA
	5QutOvgN6WqN4SLtjNl+PFwFXj1rxFGP91Sh5jNEqs8ZLG8e1KVLiAuFZO36KU+vE6MyZ/
	HzVoE17P6zQf4aIJ4ugp1eqpwyFQe5g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] gcc-plugins: Force full rebuild when plugins
 change
Message-ID: <20250507-emerald-lyrebird-of-advertising-e86beb@l-nschier-aarch64>
References: <20250503184001.make.594-kees@kernel.org>
 <20250503184623.2572355-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503184623.2572355-1-kees@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, 03 May 2025, Kees Cook wrote:

> There was no dependency between the plugins changing and the rest of the
> kernel being built. This could cause strange behaviors as instrumentation
> could vary between targets depending on when they were built.
> 
> Generate a new header file, gcc-plugins.h, any time the GCC plugins
> change. Include the header file in compiler-version.h when its associated
> feature name, GCC_PLUGINS, is defined. This will be picked up by fixdep
> and force rebuilds where needed.
> 
> Add a generic "touch" kbuild command, which will be used again in
> a following patch. Add a "normalize_path" string helper to make the
> "TOUCH" output less ugly.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: <linux-hardening@vger.kernel.org>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  include/linux/compiler-version.h |  4 ++++
>  scripts/Makefile.gcc-plugins     |  2 +-
>  scripts/Makefile.lib             | 18 ++++++++++++++++++
>  scripts/gcc-plugins/Makefile     |  4 ++++
>  4 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
> index 573fa85b6c0c..74ea11563ce3 100644
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -12,3 +12,7 @@
>   * and add dependency on include/config/CC_VERSION_TEXT, which is touched
>   * by Kconfig when the version string from the compiler changes.
>   */
> +
> +#ifdef GCC_PLUGINS

Out of curiousity:  Why can't we use CONFIG_GCC_PLUGINS here?

> +#include <generated/gcc-plugins.h>
> +#endif
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 5b8a8378ca8a..e50dc931be49 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
>  
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
> -GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> +GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -DGCC_PLUGINS
>  export GCC_PLUGINS_CFLAGS
>  
>  # Add the flags to the build!
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bdd..6fc2a82ee3bb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -296,6 +296,19 @@ $(foreach m, $1, \
>  	$(addprefix $(obj)/, $(call suffix-search, $(patsubst $(obj)/%,%,$m), $2, $3))))
>  endef
>  
> +# Remove ".." and "." from a path, without using "realpath"
> +# Usage:
> +#   $(call normalize_path,path/to/../file)
> +define normalize_path
> +$(strip $(eval elements :=) \
> +$(foreach elem,$(subst /, ,$1), \
> +	$(if $(filter-out .,$(elem)), \
> +	     $(if $(filter ..,$(elem)), \
> +		  $(eval elements := $(wordlist 2,$(words $(elements)),x $(elements))), \
> +		  $(eval elements := $(elements) $(elem))))) \
> +$(subst $(space),/,$(elements)))
> +endef

Nice :)

> +
>  # Build commands
>  # ===========================================================================
>  # These are shared by some Makefile.* files.
> @@ -343,6 +356,11 @@ quiet_cmd_copy = COPY    $@
>  $(obj)/%: $(src)/%_shipped
>  	$(call cmd,copy)
>  
> +# Touch a file
> +# ===========================================================================
> +quiet_cmd_touch = TOUCH   $(call normalize_path,$@)
> +      cmd_touch = touch $@
> +
>  # Commands useful for building a boot image
>  # ===========================================================================
>  #
> diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
> index 320afd3cf8e8..05b14aba41ef 100644
> --- a/scripts/gcc-plugins/Makefile
> +++ b/scripts/gcc-plugins/Makefile
> @@ -66,3 +66,7 @@ quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
>  
>  $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
>  	$(call if_changed_dep,plugin_cxx_o_c)
> +
> +$(obj)/../../include/generated/gcc-plugins.h: $(plugin-single) $(plugin-multi) FORCE
> +	$(call if_changed,touch)
> +always-y += ../../include/generated/gcc-plugins.h
> -- 
> 2.34.1
> 

Tested-by: Nicolas Schier <n.schier@avm.de>
Reviewed-by: Nicolas Schier <n.schier@avm.de>


