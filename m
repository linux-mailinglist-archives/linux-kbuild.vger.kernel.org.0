Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2659C107EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 May 2019 14:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfEAMgi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 May 2019 08:36:38 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30802 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfEAMgi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 08:36:38 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x41CaEwG024127;
        Wed, 1 May 2019 21:36:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x41CaEwG024127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1556714175;
        bh=VK7aHk/MZyDUXyWzUHoo1zrK2o+1I6T6YLA0xHdjYGg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eg0eNTzo19rCdtgKFC1ZUtcz1rgCM34HuHQkMv9LN9PbFQxiNv73S/BXioyjjSfpc
         vbKh0FUKDB9LmjBaHMDJCDLr1lOZh2LaAOulEPpmEyqsRkLtY6YcPu7Sx+nobu3tAF
         S0M1yMKJizIL7xvWoG5zbUumFLSexOkwZUuhDmW36aiCo2SOkzzYvDIEPTA48sm/c3
         m6s1WLPlWRY82+KhyP1sNiWVUKWEqM7guW5mVw1xzx//oOTgFQfA9KrmNfVNHDDut9
         6uRsar+A1Ck/mCwxvLYqURDbPqlAKZhBXTd8aZhx3A9BU9UXYkYv+2snDl6kChc97m
         yjPINA6OVWdQw==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id b74so6626852vsd.9;
        Wed, 01 May 2019 05:36:14 -0700 (PDT)
X-Gm-Message-State: APjAAAUVtvx0sYKFZEUt+IYcX/fwOo10OG3hD0Oq2Il/If/4RsD752BU
        bqlwFq6JqbWYiQ2M58S5KcLmV6g7RjrAVVfV2Bk=
X-Google-Smtp-Source: APXvYqwk/3oj1zhoTg+o3jglmbW/W9o7ZngLSFSQf3gejL3K9CRIKMsePE069jMjLhDPgdaXIwLGCuhAMjSsxpyQi08=
X-Received: by 2002:a67:fc4:: with SMTP id 187mr12621550vsp.215.1556714173746;
 Wed, 01 May 2019 05:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 1 May 2019 21:35:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=0qxrCWawSQpoc9qfqM5GZmnznAA-RXrtBzZ5m0Y3mA@mail.gmail.com>
Message-ID: <CAK7LNAT=0qxrCWawSQpoc9qfqM5GZmnznAA-RXrtBzZ5m0Y3mA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: move samples/ to KBUILD_VMLINUX_OBJS
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 27, 2019 at 12:34 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Handle samples/ like the other top-level directories to simplify
> the Makefile.
>
> Include include/config/auto.conf earlier to evaluate
> drivers-$(CONFIG_SAMPLES).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.



>  Makefile         | 18 ++++++++----------
>  samples/Makefile |  2 +-
>  2 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 15e17b4..251ded5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -598,20 +598,21 @@ endif
>
>  export KBUILD_MODULES KBUILD_BUILTIN
>
> +ifeq ($(dot-config),1)
> +include include/config/auto.conf
> +endif
> +
>  ifeq ($(KBUILD_EXTMOD),)
>  # Objects we will link into vmlinux / subdirs we need to visit
>  init-y         := init/
>  drivers-y      := drivers/ sound/
> +drivers-$(CONFIG_SAMPLES) += samples/
>  net-y          := net/
>  libs-y         := lib/
>  core-y         := usr/
>  virt-y         := virt/
>  endif # KBUILD_EXTMOD
>
> -ifeq ($(dot-config),1)
> -include include/config/auto.conf
> -endif
> -
>  # The all: target is the default when no target is given on the
>  # command line.
>  # This allow a user to issue only 'make' to build a kernel including modules
> @@ -1005,7 +1006,7 @@ export KBUILD_VMLINUX_LIBS := $(libs-y1)
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>  export LDFLAGS_vmlinux
>  # used by scripts/package/Makefile
> -export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include samples scripts tools)
> +export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include scripts tools)
>
>  vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
>
> @@ -1042,11 +1043,8 @@ vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
>
>  targets := vmlinux
>
> -# Build samples along the rest of the kernel. This needs headers_install.
> -ifdef CONFIG_SAMPLES
> -vmlinux-dirs += samples
> +# Some samples need headers_install.
>  samples: headers_install
> -endif
>
>  # The actual objects are generated when descending,
>  # make sure no implicit rule kicks in
> @@ -1362,7 +1360,7 @@ MRPROPER_FILES += .config .config.old .version \
>  #
>  clean: rm-dirs  := $(CLEAN_DIRS)
>  clean: rm-files := $(CLEAN_FILES)
> -clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs) Documentation samples)
> +clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs) Documentation)
>
>  PHONY += $(clean-dirs) clean archclean vmlinuxclean
>  $(clean-dirs):
> diff --git a/samples/Makefile b/samples/Makefile
> index b1142a9..50f8586 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -1,6 +1,6 @@
>  # Makefile for Linux samples code
>
> -obj-$(CONFIG_SAMPLES)  += kobject/ kprobes/ trace_events/ livepatch/ \
> +obj-y                  += kobject/ kprobes/ trace_events/ livepatch/ \
>                            hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
>                            configfs/ connector/ v4l/ trace_printk/ \
>                            vfio-mdev/ statx/ qmi/ binderfs/
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
