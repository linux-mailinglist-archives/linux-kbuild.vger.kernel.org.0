Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26DE65950
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 16:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfGKOrf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 10:47:35 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30926 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfGKOrf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 10:47:35 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6BElTGQ004614;
        Thu, 11 Jul 2019 23:47:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6BElTGQ004614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562856450;
        bh=EwkM6hP5mYLjLP96oegoqHkOffiCdJOnzuhs8GEmfIo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vYH5WqfMtr5ADdkJ79DfEPGlslaZKJ3GkAXoH65HBoG2+CKf69K17AyvjxeqvVd6q
         IBxkK6KG6WGei5L4a98XyebK68VAwketoC9BJ30tPDuTArKKxp4cn4vL7SCG4nf62L
         CbM0d3eQ+tY1WzEqxx3CGD/uix9cJcLTM/3xIiLGU3oqwLFnvri3msnWz6RIHEghZJ
         yQsFxnkDRAGrd5nEqcgVWTV0OmrUzVE4vcCB12wjrGcI1ODGLrWEeKgR99GhBm77dv
         uApBdtZ0zSCXQxP5FqNjeCHw+hc18MHgK4pfINhbpI0dgE9H4VbFkxzXUG57aIvYyh
         mqkf9D9cSQNkg==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id v20so2599569uao.3;
        Thu, 11 Jul 2019 07:47:30 -0700 (PDT)
X-Gm-Message-State: APjAAAV6OwiQ4bqU++U1XGR/Gujca/JGFoAXC+VnFchOvGffhi3cgyFW
        /8L/fHPUrcc/SvOSGzefwJmWKHRn4ftvtrRU45I=
X-Google-Smtp-Source: APXvYqwZKRsLLNVmj7zagM2M+/wzYdGAtQbSqkzrXuXovtdPjFBX1Q6tlUpaGalbVaPcpmlOTtOp8uikr8GOkx3vLms=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr4826461uaf.95.1562856449235;
 Thu, 11 Jul 2019 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
 <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com> <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 11 Jul 2019 23:46:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDkPSzA3A6DDYvg3QLHWrkAs8-iWDp44opqtmW10QVvQ@mail.gmail.com>
Message-ID: <CAK7LNAQDkPSzA3A6DDYvg3QLHWrkAs8-iWDp44opqtmW10QVvQ@mail.gmail.com>
Subject: Re: [PATCH v4] builddeb: generate multi-arch friendly linux-libc-dev package
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

On Tue, Jul 9, 2019 at 4:44 PM Cedric Hombourger
<Cedric_Hombourger@mentor.com> wrote:
>
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly using Debian's tuple from
> dpkg-architecture (stored in debian/arch).
>
> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> ---
>  scripts/package/builddeb | 5 +++++
>  scripts/package/mkdebian | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b03dd56a4782..d5d33bcba1fb 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -132,6 +132,11 @@ fi
>  if [ "$ARCH" != "um" ]; then
>         $MAKE -f $srctree/Makefile headers_check
>         $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       # move asm headers to /usr/include/<libc-machine>/asm to match the structure
> +       # used by Debian-based distros (to support multi-arch)
> +       host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
> +       mkdir $libc_headers_dir/usr/include/$host_arch
> +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
>  fi


I just wondered whether there is something better than $(cat debian/arch),
but maybe not.

OK, I am ready to pick it up for 5.3-rc1.

With Ben's Ack, I would be able to proceed with more confident.





>  # Install the maintainer scripts
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 8351584cb24e..e0750b70453f 100755
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
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
