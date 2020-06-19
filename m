Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA1720115C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2020 17:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393996AbgFSPko (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jun 2020 11:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405071AbgFSPkl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 11:40:41 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E349CC06174E;
        Fri, 19 Jun 2020 08:40:35 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b201so4601983pfb.0;
        Fri, 19 Jun 2020 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VXsSr7bmyZQBE0b3worBsmV7P/tdpTV2bJQlUrhhqcQ=;
        b=M5TLGIFuqpJDMHUQTLRuOKC7QdYUP/iMTdS+SazG0+Ng8zBJ5q/X9KKvq3nSc7wS1i
         eBlDYGPXaIpN2F22eAC3J4mlpFoIqXvZQgstkA9qADd2ottxZow5HoGBcR2I2pwRbjmz
         Bxtn94euG90YPNYe9TXYmwtfNcm6r4yNHKYKF2diNwMkvMGmt/o16f5NdsUG+3uDojAe
         e3tlKE/jyQks3xz9o0oaRH6WITGrLRKc8vNvU/a1xrhKyLeK5WBzo03YUw7KJviAwYS7
         pQGCUsRdU7bt5rfepWYiEKCZFlSWc0USGCWoQEFg5lTyfepg+BjO/usmiNrSpVaiGFbj
         meMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=VXsSr7bmyZQBE0b3worBsmV7P/tdpTV2bJQlUrhhqcQ=;
        b=FhfwVBsPpUXc4fqeKC45B8RkKtlpAYi/UerePAb63RAMuFoPC81pH61FCsDKkDgXaD
         YsU74euDes2GrHIi9d1V7w5wPw8wkYpsi57YycZw2Qs5HUE0mW3Gggu8c2Z8akLM00J0
         lakMAkuB8EOAFb37URjXJAtUp7pngIImL1f+MGjJjcsPgNyGBOvk7gguHXICS2BnEReY
         54wwAHjvcCBWl8jSgR95Q+Igy3Rd0eUtd2l11vIViAUAGhEUrgIE8JTEMmpmZMXWl3L+
         Nh7/efFUjxx3UoCH8PG3ZMirZH6AAtmqaErIgSyITei0XMAfYSKhqDoYyWrVOlM2bUd5
         vYQw==
X-Gm-Message-State: AOAM531b3bdVb+eXuQbBohs1Tcj5XcZ4DX0JeJWGFEFii7UWJ14fi2VW
        yDq+Io82q2OQv6Rz/Z8VBRM=
X-Google-Smtp-Source: ABdhPJyBpd4+hlyRNr/dMZb0eUO4b81hLGUJ470LsLYJcB/HZydxW28TWFaFE9+lq5AHF+UBesOaiA==
X-Received: by 2002:aa7:8506:: with SMTP id v6mr8641084pfn.303.1592581235512;
        Fri, 19 Jun 2020 08:40:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g19sm6271865pfo.209.2020.06.19.08.40.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 08:40:34 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:40:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
Message-ID: <20200619154034.GB57109@roeck-us.net>
References: <20200619150955.13417-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200619150955.13417-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 20, 2020 at 12:09:55AM +0900, Masahiro Yamada wrote:
> This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b,
> which broke build systems that need to install files to a certain
> path, but do not set INSTALL_MOD_PATH when invoking 'make install'.
> 
>   $ make INSTALL_PATH=/tmp/destdir install
>   mkdir: cannot create directory ‘/lib/modules/5.8.0-rc1+/’: Permission denied
>   Makefile:1342: recipe for target '_builtin_inst_' failed
>   make: *** [_builtin_inst_] Error 1
> 
> While modules.builtin is useful also for CONFIG_MODULES=n, this change
> in the behavior is quite unexpected. Maybe "make modules_install"
> can install modules.builtin irrespective of CONFIG_MODULES as Jonas
> originally suggested.
> 
> Anyway, that commit should be reverted ASAP.
> 
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v2:
>   - add more commit description
> 
>  Makefile | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 29abe44ada91..9880e911afe3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1336,16 +1336,6 @@ dt_binding_check: scripts_dtc
>  # ---------------------------------------------------------------------------
>  # Modules
>  
> -# install modules.builtin regardless of CONFIG_MODULES
> -PHONY += _builtin_inst_
> -_builtin_inst_:
> -	@mkdir -p $(MODLIB)/
> -	@cp -f modules.builtin $(MODLIB)/
> -	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
> -
> -PHONY += install
> -install: _builtin_inst_
> -
>  ifdef CONFIG_MODULES
>  
>  # By default, build modules as well
> @@ -1389,7 +1379,7 @@ PHONY += modules_install
>  modules_install: _modinst_ _modinst_post
>  
>  PHONY += _modinst_
> -_modinst_: _builtin_inst_
> +_modinst_:
>  	@rm -rf $(MODLIB)/kernel
>  	@rm -f $(MODLIB)/source
>  	@mkdir -p $(MODLIB)/kernel
> @@ -1399,6 +1389,8 @@ _modinst_: _builtin_inst_
>  		ln -s $(CURDIR) $(MODLIB)/build ; \
>  	fi
>  	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
> +	@cp -f modules.builtin $(MODLIB)/
> +	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
>  
>  # This depmod is only for convenience to give the initial
> -- 
> 2.25.1
> 
