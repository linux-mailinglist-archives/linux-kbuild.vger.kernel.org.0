Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0163D22CC05
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 19:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgGXRWy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 13:22:54 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:26946 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgGXRWw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 13:22:52 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06OHMC1T015856;
        Sat, 25 Jul 2020 02:22:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06OHMC1T015856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595611333;
        bh=fG2yn0pcLIIBdxT8aZxqMxQEYQaapN+gY06fxpmJOts=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I85Xyy2Yx90AU6uhgw4j5t15yjd/yQw/7qA/07XjFLdpWhBjHpP/a4OWadwjPFWsc
         8wKvWyxQf0qloU7cxw05aDEk/EVL3ic9hKqq/KQfhcYhJ8FLWmL99kh1cMvu+AyDyY
         iVGUBwOncm09J/rdW6P+Yli6fNipjA6sTgjAUfGWBmm+N+sCV7Y5RBCMqUm84jygx7
         jlqbQ7ZgWvnEi848Hqg96VSRIr3FDdMaThaT3z0voyda6bFrhy7LxvLpzW6IjRY8m0
         uU5Ul5VzO0Unu9Fobqk5pPQO9p7uZ0QdePRPoJ32n4rfmFtNGSCEypigNW84UtMd/I
         ub14RmVrSEhFQ==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id r63so3179662uar.9;
        Fri, 24 Jul 2020 10:22:13 -0700 (PDT)
X-Gm-Message-State: AOAM533Y3GATB+PUOA3hMGY3b3+lYHhIGNBOC67N/+LY+9wa2Yh2sLmP
        +4rgcXRLkD0phn0USFBl7gLECoxtLSZYlLbn0jM=
X-Google-Smtp-Source: ABdhPJw26mXp9fv/rqe2SYqBL5Li25Za2DnnmpAUUUMiSv1JOH2MOK5Uv0dahEyeurACAAgkCjM3R/WMpuRIk+l9fyk=
X-Received: by 2002:ab0:48:: with SMTP id 66mr9217639uai.40.1595611331833;
 Fri, 24 Jul 2020 10:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200722053417.5915-1-jcmvbkbc@gmail.com> <20200722053417.5915-2-jcmvbkbc@gmail.com>
In-Reply-To: <20200722053417.5915-2-jcmvbkbc@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Jul 2020 02:21:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+mEEqY65AYpU8dxLDLj-NX-A44m86UbOP9g1KajTABA@mail.gmail.com>
Message-ID: <CAK7LNAS+mEEqY65AYpU8dxLDLj-NX-A44m86UbOP9g1KajTABA@mail.gmail.com>
Subject: Re: [PATCH 1/2] xtensa: move vmlinux.bin[.gz] to boot subdirectory
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Chris Zankel <chris@zankel.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 22, 2020 at 2:34 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> vmlinux.bin and vmlinux.bin.gz are always rebuilt in the kernel build
> process. Add them to 'targets' and move them to the boot subdirectory
> where their rules are. Update make rules that refer to them.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


>  arch/xtensa/boot/Makefile              | 11 ++++++-----
>  arch/xtensa/boot/boot-elf/Makefile     |  4 ++--
>  arch/xtensa/boot/boot-redboot/Makefile |  4 ++--
>  3 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
> index 1a14d38d9b33..801fe30b4dfe 100644
> --- a/arch/xtensa/boot/Makefile
> +++ b/arch/xtensa/boot/Makefile
> @@ -17,6 +17,7 @@ BIG_ENDIAN    := $(shell echo __XTENSA_EB__ | $(CC) -E - | grep -v "\#")
>  export BIG_ENDIAN
>
>  subdir-y       := lib
> +targets                += vmlinux.bin vmlinux.bin.gz
>
>  # Subdirs for the boot loader(s)
>
> @@ -35,19 +36,19 @@ boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y))
>
>  OBJCOPYFLAGS = --strip-all -R .comment -R .notes -O binary
>
> -vmlinux.bin: vmlinux FORCE
> +$(obj)/vmlinux.bin: vmlinux FORCE
>         $(call if_changed,objcopy)
>
> -vmlinux.bin.gz: vmlinux.bin FORCE
> +$(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
>         $(call if_changed,gzip)
>
> -boot-elf: vmlinux.bin
> -boot-redboot: vmlinux.bin.gz
> +boot-elf: $(obj)/vmlinux.bin
> +boot-redboot: $(obj)/vmlinux.bin.gz
>
>  UIMAGE_LOADADDR = $(CONFIG_KERNEL_LOAD_ADDRESS)
>  UIMAGE_COMPRESSION = gzip
>
> -$(obj)/uImage: vmlinux.bin.gz FORCE
> +$(obj)/uImage: $(obj)/vmlinux.bin.gz FORCE
>         $(call if_changed,uimage)
>         $(Q)$(kecho) '  Kernel: $@ is ready'
>
> diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> index badee63dae27..0ebc9827f7e5 100644
> --- a/arch/xtensa/boot/boot-elf/Makefile
> +++ b/arch/xtensa/boot/boot-elf/Makefile
> @@ -19,9 +19,9 @@ targets               += $(boot-y) boot.lds
>
>  OBJS           := $(addprefix $(obj)/,$(boot-y))
>
> -$(obj)/Image.o: vmlinux.bin $(OBJS)
> +$(obj)/Image.o: $(obj)/../vmlinux.bin $(OBJS)
>         $(Q)$(OBJCOPY) $(OBJCOPY_ARGS) -R .comment \
> -               --add-section image=vmlinux.bin \
> +               --add-section image=$< \
>                 --set-section-flags image=contents,alloc,load,load,data \
>                 $(OBJS) $@
>
> diff --git a/arch/xtensa/boot/boot-redboot/Makefile b/arch/xtensa/boot/boot-redboot/Makefile
> index 1a277dd57b2a..07cb24afedc2 100644
> --- a/arch/xtensa/boot/boot-redboot/Makefile
> +++ b/arch/xtensa/boot/boot-redboot/Makefile
> @@ -20,9 +20,9 @@ LIBS  := arch/xtensa/boot/lib/lib.a arch/xtensa/lib/lib.a
>
>  LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>
> -$(obj)/zImage.o: vmlinux.bin.gz $(OBJS)
> +$(obj)/zImage.o: $(obj)/../vmlinux.bin.gz $(OBJS)
>         $(Q)$(OBJCOPY) $(OBJCOPY_ARGS) -R .comment \
> -               --add-section image=vmlinux.bin.gz \
> +               --add-section image=$< \
>                 --set-section-flags image=contents,alloc,load,load,data \
>                 $(OBJS) $@
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
