Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4FF20116C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2020 17:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405187AbgFSPl5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jun 2020 11:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405074AbgFSPl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 11:41:56 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2311DC06174E;
        Fri, 19 Jun 2020 08:41:56 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b5so4575870pfp.9;
        Fri, 19 Jun 2020 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=i9+OLyp7V6sirl27V8Yotw04ozvFZItgstHfpcz6w7Y=;
        b=H2sFIt0Eh4rCDqusFPy/L+SNl8YoznhQF4dnlWb+3YW11nC6kC/yPqeENNsyyLdgvo
         ayPhr754O2L2ijskzp/+2V7DJbXYm7Yg7+B+TO59LWcFD0/Jrh8EV0k1sOsTXDbmGsCi
         NEktBcOTiy752oElA8nOVyQykfdq1KhT3OriSQarW+hPMOXcsv6l97RsvLO38pOJXjRC
         CbrSRgCpY+3X+9RiSiuSQa5f8XTccZMUGqWM5hDn9M/VUmFmd3S/nbIPX+jyfLeVE/mf
         p95D+lz1YngCmHyWfRalBa5vwpbs9oCs7wHiq+Y/YCpo9qPpjDiL0pgbFibUcu+Gy5ON
         8VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:content-transfer-encoding
         :user-agent;
        bh=i9+OLyp7V6sirl27V8Yotw04ozvFZItgstHfpcz6w7Y=;
        b=U+dHKwJxonI0tmd3ogDdiza6R3ccN43KQ9+PcfhosRAX/TFP+R1JhS/KgIYFW+YTyX
         SfuGC/VeuwYUzaJP+9B9ttKKH6RY5WVCgZyMtAs8Xukcz24lOINqovKOHAct2W12r7lM
         0MYH0Ky5Vr7lxTT+ykIjECKRvbmVU1Zs9xWJULf1rnCzH1xKXEEzwOMsTyP7rFOfcdd/
         5MR5YcpZ1JdoePmNwWyA7Qz6j3c6+A9OKXsHFn/pdFZZ0mliQCAOmsGWWpv7oZPiogi3
         4q15Q65mjXW8425LJGbAcCYr00liZrSrMjO+vx08iEF1oE63y61f4VYtlokB29YVS2Jt
         uGlQ==
X-Gm-Message-State: AOAM532THX5bjVGBDVsjf4D2DlRvEtUElu+/IbbBtP+Hg2zspI+gWtcC
        4oQkyGC/X8eiaHAh6+2i3hI=
X-Google-Smtp-Source: ABdhPJxLbHeV5yzEpvfP5mcS+4V81PlDu+BLk/SMYtqVENyR2U+MzuUqN3H2C2UnQLu696JQ/HMozA==
X-Received: by 2002:a62:3183:: with SMTP id x125mr8776575pfx.3.1592581315702;
        Fri, 19 Jun 2020 08:41:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm5566631pjw.11.2020.06.19.08.41.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 08:41:55 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:41:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
Message-ID: <20200619154154.GA210604@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Tested-by: Guenter Roeck <linux@roeck-us.net>

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
