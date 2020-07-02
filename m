Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9139B211703
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jul 2020 02:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgGBAIW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 20:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbgGBAIV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 20:08:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8B1C08C5DB
        for <linux-kbuild@vger.kernel.org>; Wed,  1 Jul 2020 17:08:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z3so2414850pfn.12
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Jul 2020 17:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T7hL8oTAJrT5pDPCgIg1OSRZK1ha79xq6AjDa0eoWzM=;
        b=LEnbYfoJKkXege/aZzvcuMIoxLycA71bdbZUWiA0LKPJBzkLr1NjDtTji/yDoZuqmG
         SgutKsd0nQlY6f/Oma3BlcuhwG05exEmsXqQ9208gaTQunAfOLKywX4jv0Fxzew26g2a
         wZCM0ff+knpkbcgFiJb+L/92Q0VSD2dUJMOhWCnX7NILxMlN5brpRMEGbfeKN7eN+ZAY
         mMcn0I7Ug79H/4rZYHVtjSvBxZTLkvVDDOWGIFcSsdjeibceFDUt13Yt14N0UjY3jNM6
         sU0WepShcec2/AjUp2bPrUQpBQumxh6+j8IXJ8nJl4Qt+2UK3tXlGWn/E2V7J/4V6BhJ
         Lz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T7hL8oTAJrT5pDPCgIg1OSRZK1ha79xq6AjDa0eoWzM=;
        b=mhqrwILiXstglzBKfS3M3GWLG/qVm0mQZ+jqQj9/NZniAxVvDX6AcNA4jSJqeU/o4r
         PCNhf5eUK5Cwj1RuJsgetolHHBGknzdMEpNNWn7Gwj7BcY3m+EgzuiTz1aNhEAH+NrOQ
         j49zY5gg1aq78D/XlAjiN6dYBmT1igBoXDK2R/KTAdUSQm3ZGL7PLBwZCdIa7aPqM23M
         paqZ3LpWP/EKcWP6UaRpdfcrNTZ1X6IDLpdNZZb9cvJaOWlIQ74s0VdpiCiXC4KeNFkq
         AE+Rt/ypEPv7d//PW9twf43t+/ePvM8Jr/Q2WUp3irf8Zd2JF7HAVazOyO5tAf9N2GVW
         ELvg==
X-Gm-Message-State: AOAM532Yq6fA+JUTiOJ4USNOFA1a6cYvabUGTu2BgBuM8YtJFo9hfQin
        QtNgKfvl/ipDAPmzQC9J/7KrsL9FjQ2diArEW3XW0g==
X-Google-Smtp-Source: ABdhPJxay3+NVL7g1bJnT+SW3CTXpy+QaVtu3iAFRk0eR/kGTftYv4RPNc3Q2z6F1HP2TV7SPwIqDxHbgd2M97d9yeA=
X-Received: by 2002:aa7:9303:: with SMTP id 3mr17081569pfj.108.1593648500571;
 Wed, 01 Jul 2020 17:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org>
In-Reply-To: <20200701192936.1397152-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 1 Jul 2020 17:08:07 -0700
Message-ID: <CAKwvOdkwgTxHWAD1L63vOn4TGVjr0EOKTUnZ1KsW=mh1wxNTGQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not export LDFLAGS_vmlinux
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Guan Xuetao <gxt@pku.edu.cn>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When you clean the build tree for ARCH=arm, you may see the following
> error message:
>
> $ make -j24 ARCH=arm clean
>   CLEAN   arch/arm/crypto
>   CLEAN   arch/arm/kernel
>   CLEAN   arch/arm/mach-at91
>   CLEAN   arch/arm/mach-omap2
>   CLEAN   arch/arm/vdso
>   CLEAN   certs
>   CLEAN   lib
>   CLEAN   usr
>   CLEAN   net/wireless
>   CLEAN   drivers/firmware/efi/libstub
> nm: 'arch/arm/boot/compressed/../../../../vmlinux': No such file
> /bin/sh: 1: arithmetic expression: expecting primary: " "
>   CLEAN   arch/arm/boot/compressed
>   CLEAN   drivers/scsi
>   CLEAN   drivers/tty/vt
>   CLEAN   arch/arm/boot
>   CLEAN   vmlinux.symvers modules.builtin modules.builtin.modinfo

Thanks for the patch, Masahiro. This fixes the issue I was also
observing.  Curious case of shadowing env vars.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Even if you run the same command again, the error message is not shown
> despite vmlinux is already gone.
>
> To reproduce it, the parallel option -j is needed. Single thread
> cleaning always executes 'archclean', 'vmlinuxclean' in this order,
> so vmlinux still exists when arch/arm/boot/compressed/ is cleaned.
>
> Looking at arch/arm/boot/compressed/Makefile does not help understand
> the reason of the error message. Both KBSS_SZ and LDFLAGS_vmlinux are
> assigned with '=' operator, hence, they are not expanded until they are
> used. Obviously, 'make clean' does not use them.
>
> In fact, the root cause exists in the top Makefile:
>
>   export LDFLAGS_vmlinux
>
> Since LDFLAGS_vmlinux is an exported variable, LDFLAGS_vmlinux in
> arch/arm/boot/compressed/Makefile is expanded when scripts/Makefile.clean
> has a command to execute. This is why the error message shows up only
> when there exist build artifacts in arch/arm/boot/compressed/.
>
> Adding 'unexport LDFLAGS_vmlinux' to arch/arm/boot/compressed/Makefile
> will fix it as far as ARCH=arm is concerned, but I believe the proper
> fix is to get rid of 'export LDFLAGS_vmlinux' from the top Makefile.
>
> LDFLAGS_vmlinux in the top Makefile contains linker flags for the top
> vmlinux. LDFLAGS_vmlinux in arch/arm/boot/compressed/Makefile is for
> arch/arm/boot/compressed/vmlinux. They just happen to have the same
> variable name, but are used for different purposes. Exporting the former
> bothers the decompressor Makefiles.
>
> This commit passes LDFLAGS_vmlinux to scripts/link-vmlinux.sh via a
> command line parameter instead of via an environment variable. LD and
> KBUILD_LDFLAGS are exported, but I did the same for consistency. Anyway,
> they must be included in cmd_link-vmlinux to allow if_changed to detect
> the changes in LD or KBUILD_LDFLAGS.
>
> The following Makefiles are not affected:
>
>   arch/arm/boot/compressed/Makefile
>   arch/h8300/boot/compressed/Makefile
>   arch/nios2/boot/compressed/Makefile
>   arch/parisc/boot/compressed/Makefile
>   arch/s390/boot/compressed/Makefile
>   arch/sh/boot/compressed/Makefile
>   arch/sh/boot/romimage/Makefile
>   arch/x86/boot/compressed/Makefile
>
> They use ':=' or '=' to clear the LDFLAGS_vmlinux inherited from the
> top Makefile.
>
> We need to take a closer look at the impact to unicore32 and xtensa.
>
> arch/unicore32/boot/compressed/Makefile only uses '+=' operator for
> LDFLAGS_vmlinux. So, the decompressor previously inherited the linker
> flags from the top Makefile.
>
> However, commit 70fac51feaf2 ("unicore32 additional architecture files:
> boot process") was merged before commit 1f2bfbd00e46 ("kbuild: link of
> vmlinux moved to a script"). So, I believe this is rather a bug fix of
> 1f2bfbd00e46.
>
> arch/xtensa/boot/boot-elf/Makefile is also affected, but this is a fix
> for the same reason. It did not inherit LDFLAGS_vmlinux when commit
> 4bedea945451 ("[PATCH] xtensa: Architecture support for Tensilica Xtensa
> Part 2") was merged. I deleted $(LDFLAGS_vmlinux), which is now empty.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile                           | 3 +--
>  arch/xtensa/boot/boot-elf/Makefile | 2 +-
>  scripts/link-vmlinux.sh            | 4 ++++
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5496a32dffa6..075f2f943180 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1100,7 +1100,6 @@ KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))
>
>  export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
> -export LDFLAGS_vmlinux
>  # used by scripts/Makefile.package
>  export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) LICENSES arch include scripts tools)
>
> @@ -1132,7 +1131,7 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link-vmlinux =                                                 \
> -       $(CONFIG_SHELL) $< $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) ;    \
> +       $(CONFIG_SHELL) $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";    \
>         $(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>
>  vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
> diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> index 12ae1e91cb75..c6538d3321b9 100644
> --- a/arch/xtensa/boot/boot-elf/Makefile
> +++ b/arch/xtensa/boot/boot-elf/Makefile
> @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
>                 $(OBJS) $@
>
>  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> +       $(LD) $(KBUILD_LDFLAGS) \
>                 -T $(obj)/boot.lds \
>                 --build-id=none \
>                 -o $@ $(obj)/Image.o
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 7eaf70d58488..16c7818b3e19 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -30,6 +30,10 @@
>  # Error out on error
>  set -e
>
> +LD="$1"
> +KBUILD_LDFLAGS="$2"
> +LDFLAGS_vmlinux="$3"
> +
>  # Nice output in kbuild format
>  # Will be supressed by "make -s"
>  info()
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
