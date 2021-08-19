Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE8B3F10E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 05:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbhHSDCg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 23:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbhHSDCf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 23:02:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5230DC061764
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 20:02:00 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j1so3978198pjv.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I0rp13/hYiXexTsoGOfCaUGjNu+cutJP1aayDXzLlXE=;
        b=LD+ghkSsD+j/Q51OprT2uYFk/muTNfxrQIbiSynt4s5ziuD0p+oNzo8GqfQuuy+Et1
         MGRGT7QZk4VJugDwzU2hkRcbdYLvOGvJWNAYCh4Xj9xWrdo5cLpYAQq20aUefoQBPcGw
         Ztb/Q1yZxynPQHphdcD1RnZF/s4H2M/2WVqsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I0rp13/hYiXexTsoGOfCaUGjNu+cutJP1aayDXzLlXE=;
        b=M1vWPjidDTIOyLMYJaOJ2PllMOPcSVtKJ6OlkUuaaR0nOR8ix6fdjrJOcWey6yNCT8
         5By1ZplaesROQ9RuosDcWHJA/ODGKyAcsZMGHht9ybszG79z832Wc24yHlpQbjZbNYM5
         MRz5XbUm0EJBTd8uWOXQJ8QN3LxRH5KDUhq8DiW0YhpbHHDaZJSatkgP3Ba5+zVfz4qy
         bWvRkLdsvqOxRccnCRqp6c6uwprkvBDaHDRW1bWHzPRUlzBL2FbygECSY7J60byxIRdf
         EY9BTeBj1sM6hbyEnpoql5roZUHTeafADVjL06bu5y9GZR9youv7KlavxTicd4S7Fg6M
         SDDA==
X-Gm-Message-State: AOAM533uIItxkYcv4Pyynt8DH/Vm0nkBBILxrhKRGAlXQRJCLoto3lKq
        qVF4CDUJkY5NnEteL6GHXFVNCA==
X-Google-Smtp-Source: ABdhPJw/UKSHM6vsnKx1oqY7IAzjyp4gapTMv7MQDUXlA9AFCwVuV8LGQledPxEGKsMebqrPhxlYyg==
X-Received: by 2002:a17:90a:6906:: with SMTP id r6mr10537566pjj.162.1629342119900;
        Wed, 18 Aug 2021 20:01:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y13sm1224056pfq.147.2021.08.18.20.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:01:59 -0700 (PDT)
Date:   Wed, 18 Aug 2021 20:01:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 13/13] kbuild: merge cmd_ar_builtin and cmd_ar_module
Message-ID: <202108182001.8B2512CC1@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-14-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-14-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:44AM +0900, Masahiro Yamada wrote:
> The difference between cmd_ar_builtin and cmd_ar_module is the
> '[M]' in the short log.
> 
> Merge them into cmd_ar_thin.
> 
> $(quiet_modtag) is expanded to '[M]' when it is merging module objects.

Yup, good good!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 12 +++---------
>  scripts/Makefile.lib   |  5 ++++-
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 97392c26ebd7..17ce37c3eceb 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -370,11 +370,8 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
>  
> -quiet_cmd_ar_builtin = AR      $@
> -      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> -
>  $(obj)/built-in.a: $(real-obj-y) FORCE
> -	$(call if_changed,ar_builtin)
> +	$(call if_changed,ar_thin)
>  
>  #
>  # Rule to create modules.order file
> @@ -434,14 +431,11 @@ cmd_ld_o_a += ; $(objtool) $(objtool_args) --module $@
>  endif
>  endif
>  
> -quiet_cmd_ar_module = AR [M]  $@
> -      cmd_ar_module = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> -
>  $(modules-single): %.a: %.o FORCE
> -	$(call if_changed,ar_module)
> +	$(call if_changed,ar_thin)
>  
>  $(modules-multi): FORCE
> -	$(call if_changed,ar_module)
> +	$(call if_changed,ar_thin)
>  $(call multi_depend, $(modules-multi), .a, -objs -y -m)
>  
>  targets += $(modules-single) $(modules-multi)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f604d2d01cad..bd71a7d6fbc1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -198,7 +198,7 @@ _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
>  endif
>  endif
>  
> -part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> +part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m) $(obj-m)),y)
>  quiet_modtag = $(if $(part-of-module),[M],   )
>  
>  modkern_cflags =                                          \
> @@ -276,6 +276,9 @@ quiet_cmd_ld = LD      $@
>  quiet_cmd_ar = AR      $@
>        cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
>  
> +quiet_cmd_ar_thin = AR $(quiet_modtag)  $@
> +      cmd_ar_thin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> +
>  # Objcopy
>  # ---------------------------------------------------------------------------
>  
> -- 
> 2.30.2
> 

-- 
Kees Cook
