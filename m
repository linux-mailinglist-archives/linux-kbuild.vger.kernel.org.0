Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC13F107F
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 04:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhHSCoG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 22:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbhHSCoG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 22:44:06 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5026C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:43:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f3so3077723plg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d6RN6WWjU7+yVROO0IeFQjWnV4RpGxTCLGpJ+nNfASA=;
        b=m9SVEKkXfVpcrJUqNcwUAyDXNVFqtQxwDtPuguaxMcic3tIpFrx+Nd2vGQx4IGBXs6
         7ojxnwhu5eUIGeLZWDChrm6GiLUeK0jwOalxNRCDIKlfFR008DnCKYnyaErdOvITFFOo
         csd3yWqQK753e4LW2A6+gTYy5SsE4KLNGYv48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d6RN6WWjU7+yVROO0IeFQjWnV4RpGxTCLGpJ+nNfASA=;
        b=XY+eGFj0BwKKozkBjmmZIJGAnb6EM7pV2kIGFInPF3CW6jB7jLshmCVne48CvBW4hf
         aEnbNCxcg7Wmk3LVWCQ7VNSEt7U77KoSPMKxFwaBbx8oicpQfQW35OxVVedGrWfL1eEG
         6vXfSWDk1Ra0yXREQ3Ks0nBPQuchQbVVZjM06xjbkvaTytrdbryap3RU6KN+Tif2CjB0
         V+EpFMEwia3EAPgbvmD3NIYfQJAQ3XIMxp78DhGHYNgugQgt8oyERrAWo/sXbg0AOv4n
         7hjSd04zkIDQZ2PsJsTYM3lHmZvzIDKCPZSMU2g3vy2P+SCmaMPdyqpxOarwBOOxnsSR
         W8fg==
X-Gm-Message-State: AOAM533822TLlhXuCBHuJPBE7vK4eFq+4cDuwcSJQC+cbE5kruNngYXd
        IXwG2DxM9M0jXX97KLPVjyQcqQ==
X-Google-Smtp-Source: ABdhPJxtugWwRKOhljUXXr5aL90+y+pf1GNgIy/wrxr9ddBvgcMDkPZ54Vk9yox14FqX0kky8B0MPQ==
X-Received: by 2002:a17:90b:fd2:: with SMTP id gd18mr12521668pjb.155.1629341010405;
        Wed, 18 Aug 2021 19:43:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o10sm1279305pgp.68.2021.08.18.19.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:43:29 -0700 (PDT)
Date:   Wed, 18 Aug 2021 19:43:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 08/13] kbuild: merge vmlinux_link() between ARCH=um and
 other architectures
Message-ID: <202108181942.1B116E786@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-9-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-9-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:39AM +0900, Masahiro Yamada wrote:
> For ARCH=um, ${CC} is used as the linker driver. Hence, the linker
> options are prefixed with -Wl, .
> 
> Merge the similar code.
> 
> I replaced the -T option with the long option --script= so that it
> works well with/without ${wl}.

And same for this one. So much better!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/link-vmlinux.sh | 56 +++++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 7b9c62e4d54a..d74cee5c4326 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -149,13 +149,12 @@ objtool_link()
>  # ${2}, ${3}, ... - optional extra .o files
>  vmlinux_link()
>  {
> -	local lds="${objtree}/${KBUILD_LDS}"
>  	local output=${1}
> -	local objects
> -	local strip_debug
> -	local map_option
>  	local objs
>  	local libs
> +	local ld
> +	local ldflags
> +	local ldlibs
>  
>  	info LD ${output}
>  
> @@ -171,42 +170,33 @@ vmlinux_link()
>  		libs="${KBUILD_VMLINUX_LIBS}"
>  	fi
>  
> +	if [ "${SRCARCH}" = "um" ]; then
> +		wl=-Wl,
> +		ld="${CC}"
> +		ldflags="${CFLAGS_vmlinux}"
> +		ldlibs="-lutil -lrt -lpthread"
> +	else
> +		wl=
> +		ld="${LD}"
> +		ldflags="${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}"
> +		ldlibs=
> +	fi
> +
> +	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
> +
>  	# The kallsyms linking does not need debug symbols included.
>  	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> -		strip_debug=-Wl,--strip-debug
> +		ldflags="${ldflags} ${wl}--strip-debug"
>  	fi
>  
>  	if [ -n "${CONFIG_VMLINUX_MAP}" ]; then
> -		map_option="-Map=${output}.map"
> +		ldflags="${ldflags} ${wl}-Map=${output}.map"
>  	fi
>  
> -	if [ "${SRCARCH}" != "um" ]; then
> -		objects="--whole-archive ${objs} --no-whole-archive	\
> -			 --start-group ${libs} --end-group		\
> -			 $@"
> -
> -		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
> -			${strip_debug#-Wl,}			\
> -			-o ${output}				\
> -			${map_option}				\
> -			-T ${lds} ${objects}
> -	else
> -		objects="-Wl,--whole-archive			\
> -			${KBUILD_VMLINUX_OBJS}			\
> -			-Wl,--no-whole-archive			\
> -			-Wl,--start-group			\
> -			${KBUILD_VMLINUX_LIBS}			\
> -			-Wl,--end-group				\
> -			${@}"
> -
> -		${CC} ${CFLAGS_vmlinux}				\
> -			${strip_debug}				\
> -			-o ${output}				\
> -			${map_option:+-Wl,${map_option}}	\
> -			-Wl,-T,${lds}				\
> -			${objects}				\
> -			-lutil -lrt -lpthread
> -	fi
> +	${ld} ${ldflags} -o ${output}					\
> +		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
> +		${wl}--start-group ${libs} ${wl}--end-group		\
> +		$@ ${ldlibs}
>  }
>  
>  # generate .BTF typeinfo from DWARF debuginfo
> -- 
> 2.30.2
> 

-- 
Kees Cook
