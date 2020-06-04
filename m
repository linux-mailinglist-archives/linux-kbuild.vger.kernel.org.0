Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA8E1EDA08
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 02:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFDAeg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 20:34:36 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54363 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgFDAeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 20:34:36 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0540YKt1028919
        for <linux-kbuild@vger.kernel.org>; Thu, 4 Jun 2020 09:34:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0540YKt1028919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591230861;
        bh=jnf3snn62qn2riSkfbulvfDD29+nkYbS5PCar+jeT70=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pO2FjTAz2SPpp1GA6AgVl4U3qExPhfX+Htyk3MqP0tv4al6UMNBoEa2cblMaehkye
         4u0C016D9im9amoAHvNK6FWQvJhCW2u+2w5pHc/bZFg7kCKEYX6gvMbLumor60cBZf
         nQoLfsZn6pnmqURvCMyNFMn6nk+NDDSKyTQ8o/x6NQ8HLMSq+fUGnqyJAluOpw0XXd
         E1kmjfeKOcmtJWHLb8osGzw/SObVzVSrb81TYJZeSNPAziOwIwT6EQx28pM6Gql/Om
         PNwwSa3iIpcQeHR31+1U72PHXt8ih5U61CLCfhxiAkhcGgnPIsx58AJnazjv2CJYjK
         NN17ooJeXxwUQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id g129so2529746vsc.4
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2020 17:34:20 -0700 (PDT)
X-Gm-Message-State: AOAM533tFuME+VAYrupdzMx4kD4xaSPxUCc3DIoPEVninxv8aIyjgVMO
        fEr2pTx7ByUzKMpYLLlhx5I/CJPT/qmZPy0WdY0=
X-Google-Smtp-Source: ABdhPJznNi6rknWI7Kvt+GLX39h2zOvRst4XDH4S3MiOySJLQkUWLHC2Ol4+58p6IsUaH5cSD2vF5rqgKNoYS4n1k50=
X-Received: by 2002:a67:2d42:: with SMTP id t63mr1512654vst.181.1591230859698;
 Wed, 03 Jun 2020 17:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com> <3cd1a050fe692425352745672295033c@talpidae.net>
In-Reply-To: <3cd1a050fe692425352745672295033c@talpidae.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Jun 2020 09:33:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQg6JF9JuqC-7KGCCxJ-bfxvNt9HCGnJmEq+18XkKw8kQ@mail.gmail.com>
Message-ID: <CAK7LNAQg6JF9JuqC-7KGCCxJ-bfxvNt9HCGnJmEq+18XkKw8kQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
To:     Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 3, 2020 at 10:34 PM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
>
> Many applications check for available kernel features via:
>
>   - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
>   - $(MODLIB)/modules.builtin (builtin modules)
>
> They fail to detect features if the kernel was built with
> CONFIG_MODULES=n
> and modules.builtin isn't installed.
>
> Therefore, add the target "_builtin_inst_" and make "install" and
> "modules_install" depend on it.
>
> Tests results:
>
>   - make install: kernel image is copied as before, modules.builtin
> copied
>   - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1
>
> Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> ---

Applied to linux-kbuild,
but this patch format is broken.

I manually fixed it up, but
please use 'git send-email' next time.




>   Makefile | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a7bc91cbac8f..a160efd62897 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1315,6 +1315,16 @@ dt_binding_check: scripts_dtc
>   #
> ---------------------------------------------------------------------------
>   # Modules
>
> +# install modules.builtin regardless of CONFIG_MODULES
> +PHONY += _builtin_inst_
> +_builtin_inst_:
> +       @mkdir -p $(MODLIB)/
> +       @cp -f modules.builtin $(MODLIB)/
> +       @cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
> +
> +PHONY += install
> +install: _builtin_inst_
> +
>   ifdef CONFIG_MODULES
>
>   # By default, build modules as well
> @@ -1344,7 +1354,7 @@ PHONY += modules_install
>   modules_install: _modinst_ _modinst_post
>
>   PHONY += _modinst_
> -_modinst_:
> +_modinst_: _builtin_inst_
>         @rm -rf $(MODLIB)/kernel
>         @rm -f $(MODLIB)/source
>         @mkdir -p $(MODLIB)/kernel
> @@ -1354,8 +1364,6 @@ _modinst_:
>                 ln -s $(CURDIR) $(MODLIB)/build ; \
>         fi
>         @sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
> -       @cp -f modules.builtin $(MODLIB)/
> -       @cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
>
>   # This depmod is only for convenience to give the initial
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
