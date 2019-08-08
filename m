Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600AA865B5
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732680AbfHHP1q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 11:27:46 -0400
Received: from goliath.siemens.de ([192.35.17.28]:51700 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfHHP1p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 11:27:45 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x78FRVAq020810
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Aug 2019 17:27:31 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x78FRVDw010152;
        Thu, 8 Aug 2019 17:27:31 +0200
Subject: Re: [PATCH v2] kbuild: show hint if subdir-y/m is used to visit
 module Makefile
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
References: <20190808112111.16159-1-yamada.masahiro@socionext.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4377a933-1550-d95f-8a71-bb7f64756eb5@siemens.com>
Date:   Thu, 8 Aug 2019 17:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808112111.16159-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 08.08.19 13:21, Masahiro Yamada wrote:
> Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
> of $(MODVERDIR)/*.mod"), a module is no longer built in the following
> pattern:
> 
>   [Makefile]
>   subdir-y := some-module
> 
>   [some-module/Makefile]
>   obj-m := some-module.o
> 
> You cannot write Makefile this way in upstream because modules.order is
> not correctly generated. subdir-y is used to descend to a sub-directory
> that builds tools, device trees, etc.
> 
> For external modules, the modules order does not matter. So, the
> Makefile above was known to work.
> 
> I believe the Makefile should be re-written as follows:
> 
>   [Makefile]
>   obj-m := some-module/
> 
>   [some-module/Makefile]
>   obj-m := some-module.o
> 
> However, people will have no idea if their Makefile suddenly stops
> working. In fact, I received questions from multiple people.
> 
> Show a warning if obj-m is specified in a Makefile visited by subdir-y
> or subdir-m.
> 
> I touched the %/ rule to avoid false-positive warnings for the single
> target.
> 
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>  - fix false-positive warnings for single targets
> 
>  Makefile               | 2 +-
>  scripts/Makefile.build | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0e37ad2f77bf..fac25e279da6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1783,7 +1783,7 @@ PHONY += /
>  /: ./
>  
>  %/: prepare FORCE
> -	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
> +	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
>  
>  # FIXME Should go into a make.lib or something
>  # ===========================================================================
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 37a1d2cd49d4..2f66ed388d1c 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -52,6 +52,13 @@ ifndef obj
>  $(warning kbuild: Makefile.build is included improperly)
>  endif
>  
> +ifeq ($(MAKECMDGOALS)$(need-modorder),)
> +ifneq ($(obj-m),)
> +$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
> +$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
> +endif
> +endif
> +
>  # ===========================================================================
>  
>  ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
> 

FWIW, I've thrown this patch (with the other 2) at our "special" out-of-tree
modules repo, and it worked as expected: Warned when we were still using
subdir-y, remained silent after the fix.

Tested-by: Jan Kiszka <jan.kiszka@siemens.com>

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
