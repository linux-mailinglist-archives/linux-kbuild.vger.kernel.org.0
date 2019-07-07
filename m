Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F416361483
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2019 10:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbfGGI7B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Jul 2019 04:59:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64159 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfGGI7B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jul 2019 04:59:01 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x678wpu4028620;
        Sun, 7 Jul 2019 17:58:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x678wpu4028620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562489932;
        bh=xk4LHRkB8ixAzgbpnPm6KlgGAQsfjqajmImCBvj8dwU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=owwxfN2pm96CrSazFBkehDrBycCUnIAoXNn5ewieSocEquAp8cm673ZPfeFndsJBN
         wIFyAHemJ+2aXjrAIkhCk8axZ+xR9HjhCRCoxRsbCEJzAMnr3eXp50plhVyuwnNwn/
         lW4rfjaq6VH10c4vwWloqIL3ILFI6JEeyJBrSdyh5ZieoRWXkaLGciQflzgdNGD7f7
         OuJKv01NtDG66SC6ZPg7YrZsnlrfglnrUmtTAAscBeUiZtnwrDWaaDVWVxdUodTDZG
         iMdzqL0E7lYB0noqmD/dAjumpSGonVvUTFnKSm+YfBSXO/PVoMIk2jk8je8BDnP1KK
         pZPiU2pgFPqKA==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id k9so6329279vso.5;
        Sun, 07 Jul 2019 01:58:52 -0700 (PDT)
X-Gm-Message-State: APjAAAX6TMnad278fR83YXreac2jvqi33f1+jviREjvNogT10ctU695W
        BTtXFiS85D2+jXA0mAmv9kD7VkvBWuhcGuAt1bA=
X-Google-Smtp-Source: APXvYqzhjGkWPRGcOB3/SYAPlsFcpEdjd+ovGocyDw4MF7azpdjOQRTW2798cFrp/F6f0Y5GvwxGLzPQjR8nNSsTvpA=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr6543185vsl.155.1562489931301;
 Sun, 07 Jul 2019 01:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
 <1562273427-204-1-git-send-email-Cedric_Hombourger@mentor.com> <1562273427-204-2-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <1562273427-204-2-git-send-email-Cedric_Hombourger@mentor.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 7 Jul 2019 17:58:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
Message-ID: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] builddeb: generate multi-arch friendly
 linux-libc-dev package
To:     Cedric Hombourger <Cedric_Hombourger@mentor.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>, isar-users@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 5, 2019 at 5:50 AM Cedric Hombourger
<Cedric_Hombourger@mentor.com> wrote:
>
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly using Debian's tuple from
> dpkg-architecture.
>
> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> ---
>  scripts/package/builddeb | 8 ++++++++
>  scripts/package/mkdebian | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b03dd56a4782..15a034e18c37 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -132,6 +132,14 @@ fi
>  if [ "$ARCH" != "um" ]; then
>         $MAKE -f $srctree/Makefile headers_check
>         $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       if [ -n "$debarch" ]; then
> +               # move asm headers to /usr/include/<libc-machine>/asm to match the structure
> +               # used by Debian-based distros (to support multi-arch) but only if ARCH was
> +               # translated to Debian's (debarch) - this is done by mkdebian
> +               host_arch=$(dpkg-architecture -a$debarch -qDEB_HOST_MULTIARCH)
> +               mkdir $libc_headers_dir/usr/include/$host_arch
> +               mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
> +       fi
>  fi
>
>  # Install the maintainer scripts
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 8351584cb24e..2d670ae2cabc 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -197,6 +197,7 @@ Architecture: $debarch
>  Description: Linux support headers for userspace development
>   This package provides userspaces headers from the Linux kernel.  These headers
>   are used by the installed headers for GNU glibc and other system libraries.
> +Multi-Arch: same
>
>  Package: $dbg_packagename
>  Section: debug
> @@ -212,11 +213,11 @@ cat <<EOF > debian/rules
>  srctree ?= .
>
>  build:
> -       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} debarch=${debarch} \
>         KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile
>
>  binary-arch:
> -       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} debarch=${debarch} \
>         KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg


Is there any smarter way (any command) to get debarch
from the builddeb script?

scripts/package/Makefile passes -a flag, like follows:

dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch)
$(DPKG_FLAGS) -b -nc -uc

So, debarch=${debarch} looks somewhat redundant to me.




-- 
Best Regards
Masahiro Yamada
