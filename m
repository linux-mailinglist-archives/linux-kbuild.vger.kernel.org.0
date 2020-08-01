Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8D7235264
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 14:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgHAMeF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 08:34:05 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44397 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgHAMeE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 08:34:04 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 071CXk9h006581;
        Sat, 1 Aug 2020 21:33:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 071CXk9h006581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596285227;
        bh=L+wjmNkKDft8GKG9TLffZw2+e6y2VA945fN99WOCg5k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QSIXbanbw4HoVNfr4UXFTo03tYgdYRWf9AA16G9OBEfzhYdaSpa5kn9VIXWqQZRay
         D5VVW6o9MLlMBVe7S1d0c7Wa6xNzGA6USl7kMsJ877xSt2iCkFfg5mp1TYmyhOX1ha
         Y8HCAvccOu2gPXCyHt2qx6bCfDXelevv27BZ/42rkBa5x0Ac3vbmIg5giKDWhboS0I
         wOc78Xg0vU5Z1GPUUcoRKzrKjgthSTIEdo/kmerKYyme8uErmXIK8o5CpSxnJ0goDY
         94uTKhOdb+srpwqHqOEhtUVrd66bdKFrPJ7ODzV1MsdLfMTKvUQaHrAzZBjkMZWqNy
         lusGUvRWJQfMQ==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id e20so3219158uav.3;
        Sat, 01 Aug 2020 05:33:46 -0700 (PDT)
X-Gm-Message-State: AOAM531GqUGq41H8oWrf8rHKV0TawWcJkRpqQcywClvE2sFqV7hCbjp6
        aZ+W1XQrB5wpLPXK3SxgjfMgQos70R+dKihBJi0=
X-Google-Smtp-Source: ABdhPJzBsWqcTxd9WXWZUr7YBXQMw70o2ON5ypBMDI6XvCn9Co2N4uE2yk+11RzTLCuS6ikDu4zranuKXhb8p3HrUyk=
X-Received: by 2002:ab0:5b91:: with SMTP id y17mr5816923uae.95.1596285225231;
 Sat, 01 Aug 2020 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200719194602.61387-1-grandmaster@al2klimov.de>
In-Reply-To: <20200719194602.61387-1-grandmaster@al2klimov.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 1 Aug 2020 21:33:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQywudK9hJLeAT+Z3HWt4bgR+Tf3PWWtqkc7LT=eKBMyA@mail.gmail.com>
Message-ID: <CAK7LNAQywudK9hJLeAT+Z3HWt4bgR+Tf3PWWtqkc7LT=eKBMyA@mail.gmail.com>
Subject: Re: [PATCH for v5.9] kbuild: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 20, 2020 at 4:46 AM Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:
>
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
>
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

Applied to linux-kbuild. Thanks.



>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
>
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
>
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
>
>  If you apply the patch, please let me know.
>
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
>
>
>  Documentation/kbuild/Kconfig.recursion-issue-02 |  2 +-
>  Documentation/kbuild/kconfig-language.rst       | 14 +++++++-------
>  Documentation/kbuild/llvm.rst                   |  2 +-
>  scripts/package/mkdebian                        |  2 +-
>  scripts/package/mkspec                          |  2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
> index b9fd56c4b57e..df245fd7670d 100644
> --- a/Documentation/kbuild/Kconfig.recursion-issue-02
> +++ b/Documentation/kbuild/Kconfig.recursion-issue-02
> @@ -42,7 +42,7 @@
>  # "select FW_LOADER" [0], in the end the simple alternative solution to this
>  # problem consisted on matching semantics with newly introduced features.
>  #
> -# [0] http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
> +# [0] https://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
>
>  mainmenu "Simple example to demo cumulative kconfig recursive dependency implication"
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index a1601ec3317b..41bee6a171e3 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -688,10 +688,10 @@ and real world requirements were not well understood. As it stands though
>  only reverse engineering techniques have been used to deduce semantics from
>  variability modeling languages such as Kconfig [3]_.
>
> -.. [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> -.. [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> -.. [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> -.. [3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
> +.. [0] https://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> +.. [1] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> +.. [2] https://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> +.. [3] https://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
>
>  Full SAT solver for Kconfig
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -710,10 +710,10 @@ such efforts somehow on Kconfig. There is enough interest from mentors of
>  existing projects to not only help advise how to integrate this work upstream
>  but also help maintain it long term. Interested developers should visit:
>
> -http://kernelnewbies.org/KernelProjects/kconfig-sat
> +https://kernelnewbies.org/KernelProjects/kconfig-sat
>
> -.. [4] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
> -.. [5] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> +.. [4] https://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
> +.. [5] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
>  .. [6] https://cados.cs.fau.de
>  .. [7] https://vamos.cs.fau.de
>  .. [8] https://undertaker.cs.fau.de
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index c776b6eee969..2aac50b97921 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -76,7 +76,7 @@ Getting Help
>  Getting LLVM
>  -------------
>
> -- http://releases.llvm.org/download.html
> +- https://releases.llvm.org/download.html
>  - https://github.com/llvm/llvm-project
>  - https://llvm.org/docs/GettingStarted.html
>  - https://llvm.org/docs/CMake.html
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index df1adbfb8ead..48fbd3d0284a 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -175,7 +175,7 @@ Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
>  Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
> -Homepage: http://www.kernel.org/
> +Homepage: https://www.kernel.org/
>
>  Package: $packagename
>  Architecture: $debarch
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 8640c278f1aa..7c477ca7dc98 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -46,7 +46,7 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
>         License: GPL
>         Group: System Environment/Kernel
>         Vendor: The Linux Community
> -       URL: http://www.kernel.org
> +       URL: https://www.kernel.org
>  $S     Source: kernel-$__KERNELRELEASE.tar.gz
>         Provides: $PROVIDES
>         %define __spec_install_post /usr/lib/rpm/brp-compress || :
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
