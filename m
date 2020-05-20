Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048FA1DC2C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 01:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgETXWH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 May 2020 19:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728754AbgETXWE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 19:22:04 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56BB52070A;
        Wed, 20 May 2020 23:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590016922;
        bh=AsSVm6NLAAijnxZcRLGgoFhfjji3z54uqps3wBlWm/Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lLOeQzkh+QC8uwlwZLPY1lfaxSrGob0cJXqpDGWwnj6ZI10Lk4vmWj7uTli2UBhgc
         1AxRyHJwQfkIb3BFg90Pn2rNvQn5c1Z0x9FrQ+oRTz8gg/n71dkcUfIcVtn/XZqELr
         rVWygvDl1iHE14aCtpzhZ4w3LZ8ao8D+y9B7N4go=
Date:   Wed, 20 May 2020 16:22:01 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blakie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2] Makefile: support compressed debug info
Message-Id: <20200520162201.0d18667c12c144c09112cdfc@linux-foundation.org>
In-Reply-To: <20200520193637.6015-1-ndesaulniers@google.com>
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
        <20200520193637.6015-1-ndesaulniers@google.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 20 May 2020 12:36:36 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:

> As debug information gets larger and larger, it helps significantly save
> the size of vmlinux images to compress the information in the debug
> information sections. Note: this debug info is typically split off from
> the final compressed kernel image, which is why vmlinux is what's used
> in conjunction with GDB. Minimizing the debug info size should have no
> impact on boot times, or final compressed kernel image size.
> 
> All of the debug sections will have a `C` flag set.
> $ readelf -S <object file>
> 
> $ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
>     vmlinux.gcc75.uncompressed.dwarf4
> 
>     FILE SIZE        VM SIZE
>  --------------  --------------
>   +0.0%     +18  [ = ]       0    [Unmapped]
>  -73.3%  -114Ki  [ = ]       0    .debug_aranges
>  -76.2% -2.01Mi  [ = ]       0    .debug_frame
>  -73.6% -2.89Mi  [ = ]       0    .debug_str
>  -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
>  -82.9% -4.88Mi  [ = ]       0    .debug_ranges
>  -70.5% -9.04Mi  [ = ]       0    .debug_line
>  -79.3% -10.9Mi  [ = ]       0    .debug_loc
>  -39.5% -88.6Mi  [ = ]       0    .debug_info
>  -18.2%  -123Mi  [ = ]       0    TOTAL
> 
> $ bloaty vmlinux.clang11.compressed.dwarf4 -- \
>     vmlinux.clang11.uncompressed.dwarf4
> 
>     FILE SIZE        VM SIZE
>  --------------  --------------
>   +0.0%     +23  [ = ]       0    [Unmapped]
>  -65.6%    -871  [ = ]       0    .debug_aranges
>  -77.4% -1.84Mi  [ = ]       0    .debug_frame
>  -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
>  -73.1% -2.43Mi  [ = ]       0    .debug_str
>  -84.8% -3.07Mi  [ = ]       0    .debug_ranges
>  -65.9% -8.62Mi  [ = ]       0    .debug_line
>  -86.2% -40.0Mi  [ = ]       0    .debug_loc
>  -42.0% -64.1Mi  [ = ]       0    .debug_info
>  -22.1%  -122Mi  [ = ]       0    TOTAL
> 
> For x86_64 defconfig + LLVM=1 (before):
> Elapsed (wall clock) time (h:mm:ss or m:ss): 3:22.03
> Maximum resident set size (kbytes): 43856
> 
> For x86_64 defconfig + LLVM=1 (after):
> Elapsed (wall clock) time (h:mm:ss or m:ss): 3:32.52
> Maximum resident set size (kbytes): 1566776

I'm not sure who we're expecting to merge this, but I like shiny things ;)

> --- a/Makefile
> +++ b/Makefile
> @@ -822,6 +822,12 @@ DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
>  		   $(call cc-option,-fno-var-tracking)
>  endif
>  
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +DEBUG_CFLAGS	+= -gz=zlib
> +KBUILD_AFLAGS	+= -Wa,--compress-debug-sections=zlib
> +KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
> +endif
> +
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>  
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b8f023e054b9..5a423cbfaea4 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -225,6 +225,21 @@ config DEBUG_INFO_REDUCED
>  	  DEBUG_INFO build and compile times are reduced too.
>  	  Only works with newer gcc versions.
>  
> +config DEBUG_INFO_COMPRESSED
> +	bool "Compressed debugging information"
> +	depends on DEBUG_INFO
> +	depends on $(cc-option,-gz=zlib)
> +	depends on $(as-option,-Wa,--compress-debug-sections=zlib)
> +	depends on $(ld-option,--compress-debug-sections=zlib)

huh, I didn't know kbuild/kconfig could do this.  Does it all work as
expected when cross-compiling?

> +	help
> +	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> +	  5.0+, binutils 2.26+, and zlib.
> +
> +	  Users of dpkg-deb via scripts/package/builddeb may
> +	  wish to set the $KDEB_COMPRESS env var to "none" to avoid recompressing
> +	  the debug info again with a different compression scheme, which can
> +	  result in larger binaries.
> +

