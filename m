Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC3D3F1078
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 04:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhHSCm4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 22:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhHSCm4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 22:42:56 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38A9C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:42:20 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x16so4116133pfh.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kTQ3kRPj8CF2wk5bsK7dVYrKndPpuEnS1MQvOqgpp64=;
        b=Wz3kuq+TUag7kDt/E9j8i7P+9Bx+a6aG1BBw1BnUCzHroMbRqHRUr/cQn8D+IO2N31
         bzc40Y2o7mBlA6ZRu5vhA/Pa7jhkjf82qaTe8IlDCHf8qDDp6q32lbmIaljMPJxeJmyG
         KAv1uDBX3Jd8Csj/rOS7GbocfpwMk8x8BaT0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kTQ3kRPj8CF2wk5bsK7dVYrKndPpuEnS1MQvOqgpp64=;
        b=bPqMQnHvkeMwH6cTZaaUe31yBkQH/3YR5dt/6b8SmDLB6qd6HQ3q9W47233mVA38yu
         7EyYlwZxy7QyH8kUz16RpUIbwaFmKAFVHYbwgOP6GQMxflhOtYC0dQAuJ+iukvwjF7a7
         wgYU1RYzRqLDbi3xEtarGyPHTbLEd30eD9n8Qkq9Rgcjw+hlqL/MBAk5QLH53SGzP54D
         +RSEe/iUvIKnCzmS8hOp+tz6BCfKJRfunoSpASqjVIhyH256GrTLwhOhwOyOfCtj7LjO
         ketdGcyYAVpFzwOJpK9jwQEKAFnn9UDa4VYV2uY0RJZITYdj5f64QxlO4nRsuX3R6H+C
         2ONg==
X-Gm-Message-State: AOAM530kjw4+KmHjYHabFa+/H+l1uTtAEbE7FtyR03Nl1UC0B1kZ8rNs
        jd66svvS0hkN2lheaVVZJd3jIg==
X-Google-Smtp-Source: ABdhPJzum0y4eTNHGP90rMiqwDF1/sXCjz+5QWRP2pZ3QU2uU9BcbSyELVQc1NkDmxDol0pCo7hqhw==
X-Received: by 2002:a05:6a00:2309:b0:3e1:e727:ec68 with SMTP id h9-20020a056a00230900b003e1e727ec68mr12339527pfh.26.1629340940413;
        Wed, 18 Aug 2021 19:42:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c196sm1330861pga.92.2021.08.18.19.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:42:19 -0700 (PDT)
Date:   Wed, 18 Aug 2021 19:42:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 06/13] kbuild: merge vmlinux_link() between the ordinary
 link and Clang LTO
Message-ID: <202108181940.896CA4311@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-7-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-7-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:37AM +0900, Masahiro Yamada wrote:
> When Clang LTO is enabled, vmlinux_link() reuses vmlinux.o instead of
> linking ${KBUILD_VMLINUX_OBJS} and ${KBUILD_VMLINUX_LIBS} again.
> 
> That is the only difference here, so merge the similar code.

Oh excellent! I had tried to get this merged before and was not happy
with anything I constructed. This is much cleaner. Nice! (I think I
didn't realize there could be an empty --start-group/--end-group with
no side-effects.)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/link-vmlinux.sh | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 36ef7b37fc5d..a6c4d0bce3ba 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -154,12 +154,23 @@ vmlinux_link()
>  	local objects
>  	local strip_debug
>  	local map_option
> +	local objs
> +	local libs
>  
>  	info LD ${output}
>  
>  	# skip output file argument
>  	shift
>  
> +	if [ -n "${CONFIG_LTO_CLANG}" ]; then
> +		# Use vmlinux.o instead of performing the slow LTO link again.
> +		objs=vmlinux.o
> +		libs=
> +	else
> +		objs="${KBUILD_VMLINUX_OBJS}"
> +		libs="${KBUILD_VMLINUX_LIBS}"
> +	fi
> +
>  	# The kallsyms linking does not need debug symbols included.
>  	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
>  		strip_debug=-Wl,--strip-debug
> @@ -170,22 +181,9 @@ vmlinux_link()
>  	fi
>  
>  	if [ "${SRCARCH}" != "um" ]; then
> -		if [ -n "${CONFIG_LTO_CLANG}" ]; then
> -			# Use vmlinux.o instead of performing the slow LTO
> -			# link again.
> -			objects="--whole-archive		\
> -				vmlinux.o 			\
> -				--no-whole-archive		\
> -				${@}"
> -		else
> -			objects="--whole-archive		\
> -				${KBUILD_VMLINUX_OBJS}		\
> -				--no-whole-archive		\
> -				--start-group			\
> -				${KBUILD_VMLINUX_LIBS}		\
> -				--end-group			\
> -				${@}"
> -		fi
> +		objects="--whole-archive ${objs} --no-whole-archive	\
> +			 --start-group ${libs} --end-group		\
> +			 $@"
>  
>  		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
>  			${strip_debug#-Wl,}			\
> -- 
> 2.30.2
> 

-- 
Kees Cook
