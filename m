Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA4834687A
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 20:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbhCWTFm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 15:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233150AbhCWTFi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 15:05:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5E4461481;
        Tue, 23 Mar 2021 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616526337;
        bh=6ZHP8MFB2ymQv7mUuxKr/5U6De8Q+AtpNBIOCnsCdPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RWmrJKJyK+drSJdf9hoR2aVbtsmnJ7YA1sEwgb/TGOW5SqcLjTNjd1KTziA28g91l
         pZG+vzCOQ6Jj8NXckH5DMgoq95GnIA0fQmDBMcURn9r1RLw0UvKRizrhVQ0VqspTNT
         yYlfh9OL3etyV7L9pNQEBrf5EJETP3PUurRHoMBoXmXo4NKdvblPzoMA1E8Ew5c+dG
         xzDbkA/EIBnnYwPWPk8MIfPExWvcTk3xTN48QK3I9vpSBwOrVNCB+yEZWARDsqS1nf
         YjfmVnv81tzv9iX+mOiEPgIE+P8vGAoiT7HHIGBaJ3Bv1i7drNUkpFqOuEUUMwzKI5
         bv2kfdhcohIaw==
Date:   Tue, 23 Mar 2021 12:05:32 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Makefile: fix GDB warning with CONFIG_RELR
Message-ID: <20210323190532.eiqxmskiankf7hn3@archlinux-ax161>
References: <20210319000708.1694662-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319000708.1694662-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 18, 2021 at 05:07:06PM -0700, Nick Desaulniers wrote:
> GDB produces the following warning when debugging kernels built with
> CONFIG_RELR:
> 
> BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'
> 
> when loading a kernel built with CONFIG_RELR into GDB. It can also
> prevent debugging symbols using such relocations.
> 
> Peter sugguests:
>   [That flag] means that lld will use dynamic tags and section type
>   numbers in the OS-specific range rather than the generic range. The
>   kernel itself doesn't care about these numbers; it determines the
>   location of the RELR section using symbols defined by a linker script.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1057
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile                      | 2 +-
>  scripts/tools-support-relr.sh | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5160ff8903c1..47741cb60995 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1088,7 +1088,7 @@ LDFLAGS_vmlinux	+= $(call ld-option, -X,)
>  endif
>  
>  ifeq ($(CONFIG_RELR),y)
> -LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
> +LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr --use-android-relr-tags
>  endif
>  
>  # We never want expected sections to be placed heuristically by the
> diff --git a/scripts/tools-support-relr.sh b/scripts/tools-support-relr.sh
> index 45e8aa360b45..cb55878bd5b8 100755
> --- a/scripts/tools-support-relr.sh
> +++ b/scripts/tools-support-relr.sh
> @@ -7,7 +7,8 @@ trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
>  cat << "END" | $CC -c -x c - -o $tmp_file.o >/dev/null 2>&1
>  void *p = &p;
>  END
> -$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr -o $tmp_file
> +$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr \
> +  --use-android-relr-tags -o $tmp_file
>  
>  # Despite printing an error message, GNU nm still exits with exit code 0 if it
>  # sees a relr section. So we need to check that nothing is printed to stderr.
> -- 
> 2.31.0.rc2.261.g7f71774620-goog
> 
