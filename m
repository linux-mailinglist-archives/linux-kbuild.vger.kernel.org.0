Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A993F13B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 08:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhHSGl5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 02:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhHSGl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 02:41:56 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6667FC061756
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:41:20 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k19so4579154pfc.11
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xiB+2KbO1eKIlK/3thy3RGeiAk7LLg+kMEaKFiML/9Q=;
        b=G2NdaIt6C4kPjrNtxv0XAxdcV881YqQ11HrovrijOSDR7NhAy1aoiZrPSVa5WoDoo4
         sdQgaLERo8lNNdMBvJIuM+P0FfVfi79UcfaDQN9b1ckMJH+VzaFk5L95Uqx9XfNjBlCX
         +JyBCsdYu49mxAJfNASnfEH6C8wpMId9c1+Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiB+2KbO1eKIlK/3thy3RGeiAk7LLg+kMEaKFiML/9Q=;
        b=o1CRNkimcpiJAILQJ9FPcTOG/qEaUvmvmW+V3lvzvFmSfzCUKPBU/PNAyBBhQArI+f
         bq1u5p3d34zgugZKH0d2My2uMGr97kyUcAkZLb4bOQl/vhMJ8fEvPGH0yFj2IJAXoEjp
         btE7e/WaG+5Zz66gMkRxDnBXYBuTVb6Fx5gvpKfndTXEd6btqiq1ayz0guaHiMJARVrK
         jxWpQ3ZwZp+5b5U9KsxLVgzPnJqaqxggrC4Z8t8RRCD1JA3geKkuA6PrxRVyXESjtGNg
         HVdHEgffN0G6NZTTB4v3TSab0Jz9bt1yJyXi/j9b3LpjZoDJnoe4FFebMnHmusarLsXP
         QYAQ==
X-Gm-Message-State: AOAM5336+afZUJ6SZPpZ7BpETQhCaGq5exAc5TfHRcR1OLJkoGDtPgWh
        iMF/98BVAIe04dm0Gn50cmUlUw==
X-Google-Smtp-Source: ABdhPJyx0nngcjPkWY9GKkjcmYLlXphZIZzPp5H9GXQMg0D0046t7VG1T33mCz8Y4IHf9ekjyWU6Eg==
X-Received: by 2002:aa7:9254:0:b029:3c9:268e:ae68 with SMTP id 20-20020aa792540000b02903c9268eae68mr13203134pfp.58.1629355279952;
        Wed, 18 Aug 2021 23:41:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u24sm2025200pfm.85.2021.08.18.23.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:41:19 -0700 (PDT)
Date:   Wed, 18 Aug 2021 23:41:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 09/13] kbuild: do not create built-in.a.symversions or
 lib.a.symversions
Message-ID: <202108182337.25ECD5503B@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-10-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-10-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:40AM +0900, Masahiro Yamada wrote:
> Merge all *.o.symversions in scripts/link-vmlinux.sh instead of
> merging them in the unit of built-in.a or lib.a.
> 
> This is a preparation for further code cleanups.

Looks good, though I wonder about this becoming serialized during the
link phase rather than doing the work per-target. I mean, it always had
to collect them all during the link phase (with "cat"), but before it
wasn't running $(AR) serially to do it.

I'll ponder how this might be made a little more parallel. But for now:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build  | 10 ++--------
>  scripts/link-vmlinux.sh | 22 ++++++++++++++++++----
>  2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 585dae34746a..37d6f6da34d6 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -430,11 +430,8 @@ endif
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>  
> -quiet_cmd_ar_and_symver = AR      $@
> -      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
> -
>  $(obj)/built-in.a: $(real-obj-y) FORCE
> -	$(call if_changed,ar_and_symver)
> +	$(call if_changed,ar_builtin)
>  
>  #
>  # Rule to create modules.order file
> @@ -454,11 +451,8 @@ $(obj)/modules.order: $(obj-m) FORCE
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
>  #
> -quiet_cmd_ar_lib = AR      $@
> -      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
> -
>  $(obj)/lib.a: $(lib-y) FORCE
> -	$(call if_changed,ar_lib)
> +	$(call if_changed,ar)
>  
>  # NOTE:
>  # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d74cee5c4326..17976609c2d8 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -52,6 +52,13 @@ gen_initcalls()
>  		> .tmp_initcalls.lds
>  }
>  
> +append_symversion()
> +{
> +	if [ -f ${1}.symversions ]; then
> +		cat ${1}.symversions >> .tmp_symversions.lds
> +	fi
> +}
> +
>  # If CONFIG_LTO_CLANG is selected, collect generated symbol versions into
>  # .tmp_symversions.lds
>  gen_symversions()
> @@ -59,10 +66,17 @@ gen_symversions()
>  	info GEN .tmp_symversions.lds
>  	rm -f .tmp_symversions.lds
>  
> -	for o in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
> -		if [ -f ${o}.symversions ]; then
> -			cat ${o}.symversions >> .tmp_symversions.lds
> -		fi
> +	for a in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
> +		case $a in
> +		*.a)
> +			for o in $(${AR} t ${a}); do
> +				append_symversion ${o}
> +			done
> +			;;
> +		*)
> +			append_symversion ${a}
> +			;;
> +		esac
>  	done
>  }
>  
> -- 
> 2.30.2
> 

-- 
Kees Cook
