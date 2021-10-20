Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5BD4351EC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhJTRve (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:51:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230445AbhJTRvY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:51:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EDB2611EF;
        Wed, 20 Oct 2021 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634752145;
        bh=qUkSqtT6ZXxe9PpUj77V4X8XVvE98U9OSWC6LuoHU9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPkLr9N7/5AHaiR9lFUn1UUT2uXMLTBvjJGr0Z2HCTpvX+IAlVhNNJfDWNERorWY3
         rNsPhKBBUU6bDKfhXkX8Opj+VPA9qzQ/+r7FZ5iLrrbm0ySzw9ErHl49r9qMV7LXjd
         he0u+pY26ooTJu5zzxpjmrhS1bjLlklDphPpdttbOdptU6fPmvr2NwME9p8dIOIF3O
         ukAvNFm/m7Wb1cYLP13hmNwV7KsDdAdRf/OyL9x6dP02rAhWaGHFog2l6ce+IrAxVB
         fSjtAcAyWdyLfyI2w9rkKl7OQbKZoAUwt6kvVq+CymAG/SGKXK8QEtbFtE/UFY8Ymn
         p5h9Rlhe+ItVQ==
Date:   Wed, 20 Oct 2021 10:48:59 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, Dan Li <ashimida@linux.alibaba.com>,
        ardb@kernel.org, ojeda@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
Message-ID: <YXBWi/bCQoddzXB6@archlinux-ax161>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-3-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020173554.38122-3-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 10:35:54AM -0700, Kees Cook wrote:
> This plugin has no impact on the resulting binary, is disabled
> under COMPILE_TEST, and is not enabled on any builds I'm aware of.
> Additionally, given the clarified purpose of GCC plugins in the kernel,
> remove cyc_complexity.
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One comment below.

> ---
>  Documentation/kbuild/gcc-plugins.rst        |  2 -
>  scripts/Makefile.gcc-plugins                |  2 -
>  scripts/gcc-plugins/Kconfig                 | 16 -----
>  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
>  4 files changed, 89 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
> 
> diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> index 4b28c7a4032f..0ba76719f1b9 100644
> --- a/Documentation/kbuild/gcc-plugins.rst
> +++ b/Documentation/kbuild/gcc-plugins.rst
> @@ -96,7 +96,6 @@ Enable the GCC plugin infrastructure and some plugin(s) you want to use
>  in the kernel config::
>  
>  	CONFIG_GCC_PLUGINS=y
> -	CONFIG_GCC_PLUGIN_CYC_COMPLEXITY=y
>  	CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
>  	...
>  

There is a comment about the cyc_complexity plugin at the very end of
this file that should also be removed it seems:

"See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin."

> @@ -115,4 +114,3 @@ The GCC plugins are in scripts/gcc-plugins/. You need to put plugin source files
>  right under scripts/gcc-plugins/. Creating subdirectories is not supported.
>  It must be added to scripts/gcc-plugins/Makefile, scripts/Makefile.gcc-plugins
>  and a relevant Kconfig file.
> -See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e46876329..6583ecf2e674 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -1,7 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -gcc-plugin-$(CONFIG_GCC_PLUGIN_CYC_COMPLEXITY)	+= cyc_complexity_plugin.so
> -
>  gcc-plugin-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)	+= latent_entropy_plugin.so
>  gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)		\
>  		+= -DLATENT_ENTROPY_PLUGIN
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index 3f5d3580ec06..821a725a7f5c 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -19,22 +19,6 @@ menuconfig GCC_PLUGINS
>  
>  if GCC_PLUGINS
>  
> -config GCC_PLUGIN_CYC_COMPLEXITY
> -	bool "Compute the cyclomatic complexity of a function" if EXPERT
> -	depends on !COMPILE_TEST	# too noisy
> -	help
> -	  The complexity M of a function's control flow graph is defined as:
> -	   M = E - N + 2P
> -	  where
> -
> -	  E = the number of edges
> -	  N = the number of nodes
> -	  P = the number of connected components (exit nodes).
> -
> -	  Enabling this plugin reports the complexity to stderr during the
> -	  build. It mainly serves as a simple example of how to create a
> -	  gcc plugin for the kernel.
> -
>  config GCC_PLUGIN_SANCOV
>  	bool
>  	# Plugin can be removed once the kernel only supports GCC 6.1.0+
> diff --git a/scripts/gcc-plugins/cyc_complexity_plugin.c b/scripts/gcc-plugins/cyc_complexity_plugin.c
> deleted file mode 100644
> index 73124c2b3edd..000000000000
> --- a/scripts/gcc-plugins/cyc_complexity_plugin.c
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -/*
> - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>
> - * Licensed under the GPL v2, or (at your option) v3
> - *
> - * Homepage:
> - * https://github.com/ephox-gcc-plugins/cyclomatic_complexity
> - *
> - * https://en.wikipedia.org/wiki/Cyclomatic_complexity
> - * The complexity M is then defined as:
> - * M = E - N + 2P
> - * where
> - *
> - *  E = the number of edges of the graph
> - *  N = the number of nodes of the graph
> - *  P = the number of connected components (exit nodes).
> - *
> - * Usage (4.5 - 5):
> - * $ make clean; make run
> - */
> -
> -#include "gcc-common.h"
> -
> -__visible int plugin_is_GPL_compatible;
> -
> -static struct plugin_info cyc_complexity_plugin_info = {
> -	.version	= "20160225",
> -	.help		= "Cyclomatic Complexity\n",
> -};
> -
> -static unsigned int cyc_complexity_execute(void)
> -{
> -	int complexity;
> -	expanded_location xloc;
> -
> -	/* M = E - N + 2P */
> -	complexity = n_edges_for_fn(cfun) - n_basic_blocks_for_fn(cfun) + 2;
> -
> -	xloc = expand_location(DECL_SOURCE_LOCATION(current_function_decl));
> -	fprintf(stderr, "Cyclomatic Complexity %d %s:%s\n", complexity,
> -		xloc.file, DECL_NAME_POINTER(current_function_decl));
> -
> -	return 0;
> -}
> -
> -#define PASS_NAME cyc_complexity
> -
> -#define NO_GATE
> -#define TODO_FLAGS_FINISH TODO_dump_func
> -
> -#include "gcc-generate-gimple-pass.h"
> -
> -__visible int plugin_init(struct plugin_name_args *plugin_info, struct plugin_gcc_version *version)
> -{
> -	const char * const plugin_name = plugin_info->base_name;
> -
> -	PASS_INFO(cyc_complexity, "ssa", 1, PASS_POS_INSERT_AFTER);
> -
> -	if (!plugin_default_version_check(version, &gcc_version)) {
> -		error(G_("incompatible gcc/plugin versions"));
> -		return 1;
> -	}
> -
> -	register_callback(plugin_name, PLUGIN_INFO, NULL,
> -				&cyc_complexity_plugin_info);
> -	register_callback(plugin_name, PLUGIN_PASS_MANAGER_SETUP, NULL,
> -				&cyc_complexity_pass_info);
> -
> -	return 0;
> -}
> -- 
> 2.30.2
> 
