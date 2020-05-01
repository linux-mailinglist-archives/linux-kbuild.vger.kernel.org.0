Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A86E1C0C96
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 05:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgEAD2S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 23:28:18 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:62324 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgEAD2R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 23:28:17 -0400
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0413Rtl3009806;
        Fri, 1 May 2020 12:27:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0413Rtl3009806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588303676;
        bh=dZPeCNSQY4aYFOOSP6Kq54wydMYSCKOA05XzY7vDE8Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nAhYz0mmmmg7EKCXhCx1Qt6TbEkutIb9JwQPCTRki8n1uume/k39uZKQAkncgucjc
         2PZcWdP2szP2/UmZf/OSw7Gu8CatIcAh52ut6gbx4dkaB2CzGTQDrGW25xLZ8RBU1K
         mPOSqV7Vyw24nWj5AM3QwSJ1Q3o3uvp3upy+R5le/twZ+2EzUyBh5RpGCbvVBYT30B
         q7WyB86luZvUf/q7vr5h/Js7Nqe+mG8JgPu+FbuT2ECfdt+F+jm2smoez/8UF2D/l3
         cdtW/th7IGQCjDCS6ulgZ4uvyKVMGLJK8SmepMvswOaFii/31YbMPR2/U+Q3PaeMId
         0AfQaUeV0uwVw==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id 10so2432524vkr.7;
        Thu, 30 Apr 2020 20:27:56 -0700 (PDT)
X-Gm-Message-State: AGi0Pub49ENNPIXVkv6OHV4oh/Pg8bJZTpLIHzwcQD0tuqjUvqex2CCq
        DhIOfHch4h9GiJOSend6e+sJaQvq6nN0WHb+7KA=
X-Google-Smtp-Source: APiQypJ8lhjrAWwCx9qV0shUtiOp+DaXKU7s0XZXGsQhnFxZJgrDSGADP8IC40NSFu+ypTMRPy4TPYSNq0OENTl8FOU=
X-Received: by 2002:a1f:d182:: with SMTP id i124mr1366860vkg.26.1588303675078;
 Thu, 30 Apr 2020 20:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan> <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
 <20200430184948.27191975@coco.lan> <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
 <20200430211009.3fef03f3@coco.lan> <20200430212511.2115ed98@coco.lan>
In-Reply-To: <20200430212511.2115ed98@coco.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 12:27:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARA2+S5mjzRucvdJ-zQo6UEAuNi9npJvJB+JcVgh+d_3w@mail.gmail.com>
Message-ID: <CAK7LNARA2+S5mjzRucvdJ-zQo6UEAuNi9npJvJB+JcVgh+d_3w@mail.gmail.com>
Subject: Re: [PATCH RFC] Kbuild: Makefile: warn if auto.conf is obsolete
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 1, 2020 at 4:25 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> A new behavior on more recent kernels require to always call
> "make modules_prepare" after *any* Kconfig changes.


Again, this is the behavior since 2004.

This commit:
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=95065ad3fa787c417008a36d3a5d9a3bab17ab98


Shrug if you complain about what has been stable
more than 15 years.


> This is not what a poor mortal would be expecting on a building
> system, as it should, IMHO, be able to detect and auto-run
> whatever is needed to use the newer setup.

No. External module builds should never ever attempt to update
in-tree files.

This is because the build environment for external modules
is usually located in /lib/modules/$(uname -r)/build/,
which is read-only.


A number of upstream developers (ab)use
M= to compile test individual directories,
despite the fact Kbuild supports
the single target 'make drivers/staging/media/stomisp/'



You need to cope with this conflicting comment line:
https://github.com/masahir0y/linux/blob/v5.6/Makefile#L681
since you care if auto.conf is up-to-date.





> Yet, while this is not solved, let's at least stop the build
> and produce a warning, to notify the user about that.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>
> I would still prefer to call "make modules_prepare" directly,
> on such cases, but just calling "make -C . modules_prepare" doesn't
> work. So, the next best thing would be to at least print a message
> and don't try to do a build with a broken auto.conf file.
>
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 70def4907036..492ee2396ab9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1632,6 +1632,11 @@ $(objtree)/Module.symvers:
>  build-dirs := $(KBUILD_EXTMOD)
>  PHONY += modules
>  modules: descend $(objtree)/Module.symvers
> +       @if [ $(KCONFIG_CONFIG) -nt include/config/auto.conf ]; then \
> +               echo "  WARNING: $(KCONFIG_CONFIG) was modified. Need to run:"; \
> +               echo "           $(MAKE) modules_prepare"; \
> +               exit -1; \
> +       fi
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
>  PHONY += modules_install








--
Best Regards
Masahiro Yamada
