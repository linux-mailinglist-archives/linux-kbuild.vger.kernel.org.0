Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893243F1338
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 08:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhHSGUK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 02:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhHSGUK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 02:20:10 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AF9C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:19:34 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r2so4892446pgl.10
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nTW/BLkDiVzO1gHADZsi/9xVxK/pUSXQOI5etxdRSmo=;
        b=WDiDUjA/IkPmySU0d7mj3bP3Qc11FZOOw7DcXzrDxzvEG+BU8sQWn7Nna1tvYaBZzQ
         P2PYtiyMnFiLhJXN3Oya98MBxOqt6Sreu65Wth/4i3/qTPPFpLLijLqzHO3WG3UeYHta
         RG9N84mX5oXZTMSFDqnSmCvbnYlxRO34FdzW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nTW/BLkDiVzO1gHADZsi/9xVxK/pUSXQOI5etxdRSmo=;
        b=YmlUJqcwYFpF0AB6Y44DVfIrZOMGSwSHXt3MyWD4WUYat8fRZITWFg8I7zNmnFWEd2
         b4wIvCpNwnkN0tUEiXCHF60JkC7ZodnpvIBQnNhoShOSuqjvjIhr1eyvizLdp3W8VAKB
         YIbcThDbH4NMCNbxQ6fmCLU9nlyRjXxEFUuHcQ5XFOxjJrM+YCWazykk/sxRsj3WDLPJ
         IbtdQvC6p56SV13lnrbmAYXsYhHtNY+XkEu97cWcNFYWP0IoBUYhrTFOIsjx44pcvdg5
         VdbIl0nSCClMt3bjHBRCcEzkxiOQbfmhwr6sk+9fOzOCDFAQXygtI97stS8sQ6XacprP
         jVLQ==
X-Gm-Message-State: AOAM531a4hvK+brRkPwV/X97N1z08PIZuxIGABLBQ0XkbOh5D4QAvqQx
        CjwcXPyjNZNes4CLAxwXoLCxjA==
X-Google-Smtp-Source: ABdhPJw1BHoL7ttU/DrhdxzeTEDNx3Dg+sBjOFPOFzkh7o2zft9bm56P9m5Pku6XXtfHdC3/dRpDSQ==
X-Received: by 2002:a63:494:: with SMTP id 142mr12437314pge.242.1629353973971;
        Wed, 18 Aug 2021 23:19:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z1sm1983936pfg.18.2021.08.18.23.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:19:33 -0700 (PDT)
Date:   Wed, 18 Aug 2021 23:19:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 04/13] kbuild: remove unused
 quiet_cmd_update_lto_symversions
Message-ID: <202108182317.01AB60ECF9@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-5-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-5-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:35AM +0900, Masahiro Yamada wrote:
> This is not used anywhere.

Ah-ha, I see: cmd_update_lto_symversions is never used through a
$(call cmd, ...) invocation.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3e4cd1439cd4..279363266455 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -411,7 +411,6 @@ $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  
>  # combine symversions for later processing
> -quiet_cmd_update_lto_symversions = SYMVER  $@
>  ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
>        cmd_update_lto_symversions =					\
>  	rm -f $@.symversions						\
> -- 
> 2.30.2
> 

-- 
Kees Cook
