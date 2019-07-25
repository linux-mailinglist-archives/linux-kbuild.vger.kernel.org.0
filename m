Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FC674990
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 11:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389659AbfGYJIR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 05:08:17 -0400
Received: from david.siemens.de ([192.35.17.14]:59885 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389193AbfGYJIR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 05:08:17 -0400
X-Greylist: delayed 1733 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jul 2019 05:08:15 EDT
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6P8dEDt000362
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Jul 2019 10:39:15 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P8dEl8022937;
        Thu, 25 Jul 2019 10:39:14 +0200
Subject: Re: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of
 $(MODVERDIR)/*.mod
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
 <20190717061800.10018-8-yamada.masahiro@socionext.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
Date:   Thu, 25 Jul 2019 10:39:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190717061800.10018-8-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 17.07.19 08:17, Masahiro Yamada wrote:
> Towards the goal of removing MODVERDIR, read out modules.order to get
> the list of modules to be processed. This is simpler than parsing *.mod
> files in $(MODVERDIR).
> 
> For external modules, $(KBUILD_EXTMOD)/modules.order should be read.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3:
>   - Add ifdef CONFIG_MODULES to avoid warning
> 
> Changes in v2: None
> 
>  scripts/Makefile.modpost | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index fec6ec2ffa47..5841508ffca9 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -8,9 +8,10 @@
>  # b) A <module>.o file which is the .o files above linked together
>  # c) A <module>.mod file in $(MODVERDIR)/, listing the name of the
>  #    the preliminary <module>.o file, plus all .o files
> +# d) modules.order, which lists all the modules
>  
>  # Stage 2 is handled by this file and does the following
> -# 1) Find all modules from the files listed in $(MODVERDIR)/
> +# 1) Find all modules listed in modules.order
>  # 2) modpost is then used to
>  # 3)  create one <module>.mod.c file pr. module
>  # 4)  create one Module.symvers file with CRC for all exported symbols
> @@ -60,10 +61,12 @@ include scripts/Makefile.lib
>  kernelsymfile := $(objtree)/Module.symvers
>  modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
>  
> -# Step 1), find all modules listed in $(MODVERDIR)/
> -MODLISTCMD := find $(MODVERDIR) -name '*.mod' | xargs -r grep -h '\.ko$$' | sort -u
> -__modules := $(shell $(MODLISTCMD))
> -modules   := $(patsubst %.o,%.ko, $(wildcard $(__modules:.ko=.o)))
> +modorder := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
> +
> +# Step 1), find all modules listed in modules.order
> +ifdef CONFIG_MODULES
> +modules := $(sort $(shell cat $(modorder)))
> +endif
>  
>  # Stop after building .o files if NOFINAL is set. Makes compile tests quicker
>  _modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
> @@ -84,7 +87,7 @@ MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
>  
>  # We can go over command line length here, so be careful.
>  quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
> -      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T -
> +      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
>  
>  PHONY += __modpost
>  __modpost: $(modules:.ko=.o) FORCE
> 

This affects also external modules builds: I have patterns here that do

[Makefile]
subdir-y := some-module

[some-module/Makefile]
obj-m := some-module.o

and since this patch, the final some-module.ko is no longer built. Am I missing
something in the kbuild makefiles, or is this a regression?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
