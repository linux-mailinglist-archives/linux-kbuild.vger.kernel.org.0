Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4796635FB47
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353185AbhDNTAQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:00:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231152AbhDNTAQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:00:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47D9B61222;
        Wed, 14 Apr 2021 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426794;
        bh=LYYO4HZeiyflbXu22XRjrSqjKF1aopb6IFR/toz6BrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FY4OSukw42A9w7mugJGLbvz/lUKmexZF/yWDTt2BWAbYW83VLNwWl0kylYrgH2skv
         fzEq1f8xFrKkCmep36ljW9SZr7v/N8bcUw8FBFCmSQLoJO5e5o4Sq+qBwEkdHcTOIs
         izaI3KuImeeCevmPFysG6ltEyNIZSkaEvmqRUW2WYHXXoyUweNGV5jUz2uNBTbqLQ2
         JMoTP/zW++fruQbMxXh2pOH5E2tnZYreKPVfwUDQPQjdoSw0r33bWOgA/RBM293BgP
         si6IhZObIvHGAMj1LCO3cIXqzWGWmWCvatDVrTlCeIp6yTMT6HY7f153kJ9uwh+ocd
         P0/+CF6HuvFgw==
Date:   Wed, 14 Apr 2021 11:59:48 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michal Suchanek <msuchanek@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 03/13] Makefile: Generate CLANG_FLAGS even in GCC builds
Message-ID: <YHc7pHjwmDJrkXqZ@archlinux-ax161>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-4-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-4-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Miguel,

On Wed, Apr 14, 2021 at 08:45:54PM +0200, ojeda@kernel.org wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> To support Rust under GCC-built kernels, we need to save the flags that
> would have been passed if the kernel was being compiled with Clang.
> 
> The reason is that bindgen -- the tool we use to generate Rust bindings
> to the C side of the kernel -- relies on libclang to parse C. Ideally:
> 
>   - bindgen would support a GCC backend (requested at [1]),
> 
>   - or the Clang driver would be perfectly compatible with GCC,
>     including plugins. Unlikely, of course, but perhaps a big
>     subset of configs may be possible to guarantee to be kept
>     compatible nevertheless.
> 
> This is also the reason why GCC builds are very experimental and some
> configurations may not work (e.g. GCC_PLUGIN_RANDSTRUCT). However,
> we keep GCC builds working (for some example configs) in the CI
> to avoid diverging/regressing further, so that we are better prepared
> for the future when a solution might become available.
> 
> [1] https://github.com/rust-lang/rust-bindgen/issues/1949
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/167
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d4784d181123..9c75354324ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -559,26 +559,31 @@ ifdef building_out_of_srctree
>  	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>  
> -# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> -# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> -# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> -CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
> +TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
>  
> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> +TENTATIVE_CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))

Shuffling this around will cause this issue (I never saw you CC'd on the
thread).

https://lore.kernel.org/r/f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de/

Perhaps that patch should be added to this series?

> -CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +TENTATIVE_CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
> +TENTATIVE_CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  ifneq ($(LLVM_IAS),1)
> -CLANG_FLAGS	+= -no-integrated-as
> +TENTATIVE_CLANG_FLAGS	+= -no-integrated-as
>  endif
> -CLANG_FLAGS	+= -Werror=unknown-warning-option
> +
> +export TENTATIVE_CLANG_FLAGS
> +
> +# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> +# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> +# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> +# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
> +
> +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> +CLANG_FLAGS	+= $(TENTATIVE_CLANG_FLAGS)
>  KBUILD_CFLAGS	+= $(CLANG_FLAGS)
>  KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>  export CLANG_FLAGS
> -- 
> 2.17.1
> 
