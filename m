Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBBB2EA074
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 00:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbhADXKq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Jan 2021 18:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbhADXKp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jan 2021 18:10:45 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E700C061794;
        Mon,  4 Jan 2021 15:10:05 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id d14so24996684qkc.13;
        Mon, 04 Jan 2021 15:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vJ3RfD8rR9bTAqytKoHNwBuoJEeDfrDCx0M5UaMLsiY=;
        b=m9mGjmR2KJtQfDzCJM6wYqdTqnIcauGy2bexGKOIKKZ91hOfuqJl5tsfC9mTlXvPrW
         Sn/kr6nLvsVUYWW9jS9WvlOLFeC9XbDjfPRBqHmiEvGjcRThNjkHO7KTfvXYCXX5HSKv
         t3W9guYD+88c6GE54v7OogpNF8Fw71TlaoCBSsMuJgveCn5vJCs0e05B2N6vPn2Thxhx
         EHVoYegONoHBP0V8h+oKBHVH/t22V8/fK4jnYpSx0GgZCrCOxjYiK+/M9il314CxJQGy
         nmMIxJxydlNnTST32qU9QH84hpVWoKHhJG+0Z8yeaYCAEdDOnDbXIpxVpKp/tvO/npYx
         WkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vJ3RfD8rR9bTAqytKoHNwBuoJEeDfrDCx0M5UaMLsiY=;
        b=K5NQkINpJdO9LaY4a9siKGel32GQn8IrUimrnxps41FvUHTo/I+2/t4+B6K0/5I3dv
         Cf69m6VlInbf95rDI/ILbMR+N42kndIsQgmTYQl2nOQLxrdQOnKYazBF7NNWMeMXi0gx
         +3LQV21CUXOPIon/wVLJyApr404Pr83fd54sWtc/jlHg/lbs4chWwlth0CLuvJ8dx4fy
         y01e6OKXqDTIcHkiRnNzxRQGbxySFErY7787P4U8cXYIRflN9KfGtY8pC1EHEPX5sjlw
         kR7NPmPy4qHAJfWm8lLkiY95Rj4CbC531dqxGnlklUVzx2mArpeeNhNdhgCJJWqt3B77
         onsg==
X-Gm-Message-State: AOAM533GRs6AWtsSwfxt+Mf+mBZ75b9bLtZNRb6prrYGKD+DKXYuI6AF
        j7JKAoZZlV+zr65h2vC7WzL/9+sfOow=
X-Google-Smtp-Source: ABdhPJwJLFrh/o1UkZ3qZm7egy/GpMq2K5sYFuKN9wsvg0qho3H7HAnxQE1YVHu1eiv7zNs1HVjmlw==
X-Received: by 2002:ac8:6f4f:: with SMTP id n15mr73864340qtv.216.1609797788503;
        Mon, 04 Jan 2021 14:03:08 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id i4sm36389618qti.78.2021.01.04.14.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 14:03:07 -0800 (PST)
Date:   Mon, 4 Jan 2021 15:03:06 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux@googlegroups.com,
        Nick Clifton <nickc@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Kbuild: make DWARF version a choice
Message-ID: <20210104220306.GA1405526@ubuntu-m3-large-x86>
References: <20201204011129.2493105-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204011129.2493105-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 03, 2020 at 05:11:26PM -0800, 'Nick Desaulniers' via Clang Built Linux wrote:
> Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
> explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
> way that's forward compatible with existing configs, and makes adding
> future versions more straightforward.
> 
> Suggested-by: Fangrui Song <maskray@google.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Makefile          | 14 ++++++++------
>  lib/Kconfig.debug | 21 ++++++++++++++++-----
>  2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a2ded5029084..2430e1ee7c44 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -826,12 +826,14 @@ else
>  DEBUG_CFLAGS	+= -g
>  endif
>  
> -ifneq ($(LLVM_IAS),1)
> -KBUILD_AFLAGS	+= -Wa,-gdwarf-2
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_DWARF4
> -DEBUG_CFLAGS	+= -gdwarf-4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
> +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> +# Binutils 2.35+ required for -gdwarf-4+ support.
> +dwarf-aflag	:= $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
> +DEBUG_CFLAGS	+= $(dwarf-aflag)
> +KBUILD_AFLAGS	+= $(dwarf-aflag)
>  endif
>  
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 0c7380e36370..04719294a7a3 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -256,14 +256,25 @@ config DEBUG_INFO_SPLIT
>  	  to know about the .dwo files and include them.
>  	  Incompatible with older versions of ccache.
>  
> +choice
> +	prompt "DWARF version"
> +	help
> +	  Which version of DWARF debug info to emit.
> +
> +config DEBUG_INFO_DWARF2
> +	bool "Generate DWARF Version 2 debuginfo"
> +	help
> +	  Generate DWARF v2 debug info.
> +
>  config DEBUG_INFO_DWARF4
> -	bool "Generate dwarf4 debuginfo"
> +	bool "Generate DWARF Version 4 debuginfo"
>  	depends on $(cc-option,-gdwarf-4)
>  	help
> -	  Generate dwarf4 debug info. This requires recent versions
> -	  of gcc and gdb. It makes the debug information larger.
> -	  But it significantly improves the success of resolving
> -	  variables in gdb on optimized code.
> +	  Generate DWARF v4 debug info. This requires gcc 4.5+ and gdb 7.0+.
> +	  It makes the debug information larger, but it significantly
> +	  improves the success of resolving variables in gdb on optimized code.
> +
> +endchoice # "DWARF version"
>  
>  config DEBUG_INFO_BTF
>  	bool "Generate BTF typeinfo"
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 
