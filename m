Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC45A07B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfH1QoS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:44:18 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50291 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfH1QoR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:44:17 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x7SGhuDU003279;
        Thu, 29 Aug 2019 01:43:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x7SGhuDU003279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567010637;
        bh=+iR2wGeB3ADz18zgAyOrpJCFTT9CHJCP8dcmnyGJwvs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=edIjBueoXPfrTuXqzqsgCqHEbSZvpndN0QckeBuAvljwoLk3eF/HKsEFosLWl1lwf
         SZWEgIc4Gg7TLe1DsKovEisZ4srJzndZZpSjIbE9S2fOS9xWnzpfv9J27pujmCdcF/
         8iJnHGqLELREaxwD8KqtfQuuc3GHfrU0Ivhr/QoIXNjfHMTHcY7B+y15WU+siIJNdE
         Vbjm6dsaK6C71jybGtONrHYQxZSp5a2p6JzvabrhSGwDK1yjoHIzrSM8S8JmowjrJJ
         6u3Eyw64fffKzufj55kOqhWRPf727TTH4tHW2+wV/qVz0okZm8pO/oABMJl2zJ4TU5
         ye/B5PHnsoOGQ==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id n13so190570uap.9;
        Wed, 28 Aug 2019 09:43:57 -0700 (PDT)
X-Gm-Message-State: APjAAAU2tF1dDZrUlqRpfGR/N0sZBH/9erH5BFtw1/65AtYI6pIMlJWX
        e5oQXoOQriw1u8wz8rlNZ4ccwAIUNrHDfW3GnZc=
X-Google-Smtp-Source: APXvYqyvhbTL1chF5Rs/VNuz8fUNUTah+WXWqsLx0PVfEeqgD/rRLDRYEZjhet+JqmEDTXLfIz88NdTZYD+lbygKahQ=
X-Received: by 2002:ab0:32d8:: with SMTP id f24mr2537777uao.121.1567010636117;
 Wed, 28 Aug 2019 09:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190821070205.8297-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190821070205.8297-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:43:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARu+9pdGsTh2tzMvopXXpBYC_BA0y+aQyjfP9nhKtqGDw@mail.gmail.com>
Message-ID: <CAK7LNARu+9pdGsTh2tzMvopXXpBYC_BA0y+aQyjfP9nhKtqGDw@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: pkg: clean up package files/dirs from the top Makefile
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 21, 2019 at 4:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I am not a big fan of the $(objtree)/ hack for clean-files/clean-dirs.
>
> These are created in the top of $(objtree), so let's clean them up
> from the top Makefile.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
>  Makefile                 | 6 ++++--
>  scripts/Makefile         | 2 +-
>  scripts/package/Makefile | 9 ---------
>  3 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5d202ad1481a..e88d4fcd5e87 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1389,12 +1389,14 @@ CLEAN_FILES += modules.builtin.modinfo
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_DIRS  += include/config include/generated          \
> -                 arch/$(SRCARCH)/include/generated .tmp_objdiff
> +                 arch/$(SRCARCH)/include/generated .tmp_objdiff \
> +                 debian/ snap/ tar-install/
>  MRPROPER_FILES += .config .config.old .version \
>                   Module.symvers \
>                   signing_key.pem signing_key.priv signing_key.x509     \
>                   x509.genkey extra_certificates signing_key.x509.keyid \
> -                 signing_key.x509.signer vmlinux-gdb.py
> +                 signing_key.x509.signer vmlinux-gdb.py \
> +                 *.spec
>
>  # Directories & files removed with 'make distclean'
>  DISTCLEAN_DIRS  +=
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 16bcb8087899..c42891e10ba3 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -36,4 +36,4 @@ subdir-$(CONFIG_MODVERSIONS) += genksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) += selinux
>
>  # Let clean descend into subdirs
> -subdir-        += basic dtc gdb kconfig mod package
> +subdir-        += basic dtc gdb kconfig mod
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index ca7f46b562a4..a2d8830f54be 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -65,8 +65,6 @@ binrpm-pkg: FORCE
>         +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>
> -clean-files += $(objtree)/*.spec
> -
>  deb-pkg: FORCE
>         $(MAKE) clean
>         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> @@ -82,8 +80,6 @@ bindeb-pkg: FORCE
>  intdeb-pkg: FORCE
>         +$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
>
> -clean-dirs += $(objtree)/debian/
> -
>  # snap-pkg
>  # ---------------------------------------------------------------------------
>  snap-pkg: FORCE
> @@ -98,17 +94,12 @@ snap-pkg: FORCE
>         cd $(objtree)/snap && \
>         snapcraft --target-arch=$(UTS_MACHINE)
>
> -clean-dirs += $(objtree)/snap/
> -
>  # tarball targets
>  # ---------------------------------------------------------------------------
>  tar%pkg: FORCE
>         $(MAKE) -f $(srctree)/Makefile
>         +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
>
> -clean-dirs += $(objtree)/tar-install/
> -
> -
>  # perf-pkg - generate a source tarball with perf source
>  # ---------------------------------------------------------------------------
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
