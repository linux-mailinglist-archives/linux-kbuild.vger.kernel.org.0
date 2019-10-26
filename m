Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFEDE581F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2019 04:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfJZCpN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 22:45:13 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:30686 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfJZCpN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 22:45:13 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x9Q2j7Wd016227;
        Sat, 26 Oct 2019 11:45:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x9Q2j7Wd016227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572057909;
        bh=p6qLAzNpJ2BXT5FgLPJbkoq6tPlPN1k7CK1Pf/WIvaM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tm5ICo56IWu8jA2mDAEcCQWoA8fYaXL6u8J8TjqYRzuHUCeQb6vUHDlWBC1xw+5Hl
         bWNkR3IC/CFZBLwIqKLCqb1c0FAPRycD/quXeXiYOmmktR0QkzOU+8USww7XEVDgNt
         zQDXXxKuYlSM7JhcVhjCTPu1awuPLRKFbGi1wccCJMq/YVyqxkwDcj9hLy01jWBt8I
         wg+g+LGS0qsP0L+7Hasp8/GY0p0cfK4vf1gEodpxjCwX/x6WO4tyuSn2kX2YtaGIav
         6qlMS96iOyBiv0a6wbdxz2NAOwPuRndjM+x0rhDV75heqcadwWRc/7+RnqqLHECT5o
         g/BUuB4f5v8Rw==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id n2so1207056ual.11;
        Fri, 25 Oct 2019 19:45:08 -0700 (PDT)
X-Gm-Message-State: APjAAAWO49XLMBlHinfB6fanW//TC5vWfgfgHx50EziurnysGISBvJKf
        oAJ0ocX5DDoRN5+g2DLRDQ71QFR3DYe7KQa1AVc=
X-Google-Smtp-Source: APXvYqzHnmM+o2h+VSpS3p+gDW6F92xt3/htASY6MaQRu7Bdrw1rFwoZp7eIp8TlBlWoab03Fjc8OcaPxWdgLLbD2JM=
X-Received: by 2002:ab0:59ed:: with SMTP id k42mr3395656uad.25.1572057907389;
 Fri, 25 Oct 2019 19:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025115232.9592-1-geert+renesas@glider.be>
In-Reply-To: <20191025115232.9592-1-geert+renesas@glider.be>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 26 Oct 2019 11:44:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOdvXOCJ6nu96=m6r_HkQAdz7pK6wKyn2r=fYy=gyntg@mail.gmail.com>
Message-ID: <CAK7LNAQOdvXOCJ6nu96=m6r_HkQAdz7pK6wKyn2r=fYy=gyntg@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Wrap long "make help" text lines
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 25, 2019 at 8:52 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Some "make help" text lines extend beyond 80 characters.
> Wrap them before an opening parenthesis, or before 80 characters.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

I applied both to linux-kbuild.

I changed the subject prefix
"kconfig:" to "kbuild:".



> This is v2 of "[PATCH] kconfig: Wrap long "make help" text line for
> xenconfig ".
>
> v2:
>   - Fix more recent offenders.
> ---
>  Documentation/Makefile   | 6 ++++--
>  Makefile                 | 3 ++-
>  scripts/Makefile.package | 3 ++-
>  scripts/kconfig/Makefile | 3 ++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index e145e4db508bc6a4..0c5185187dad0b68 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -128,8 +128,10 @@ dochelp:
>         @echo  '  pdfdocs         - PDF'
>         @echo  '  epubdocs        - EPUB'
>         @echo  '  xmldocs         - XML'
> -       @echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
> -       @echo  '  refcheckdocs    - check for references to non-existing files under Documentation'
> +       @echo  '  linkcheckdocs   - check for broken external links'
> +       @echo  '                    (will connect to external hosts)'
> +       @echo  '  refcheckdocs    - check for references to non-existing files under'
> +       @echo  '                    Documentation'
>         @echo  '  cleandocs       - clean all generated files'
>         @echo
>         @echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
> diff --git a/Makefile b/Makefile
> index 5475cdb6d57d4117..5a1ef8db2cec69f6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1523,7 +1523,8 @@ help:
>         @echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
>         @echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
>         @echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
> -       @echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK (sparse by default)'
> +       @echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK'
> +       @echo  '                       (sparse by default)'
>         @echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>         @echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
>         @echo  '  make W=n   [targets] Enable extra build checks, n=1,2,3 where'
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 56eadcc48d46de54..ee9b368dfcf37736 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -146,7 +146,8 @@ help:
>         @echo '  binrpm-pkg          - Build only the binary kernel RPM package'
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
>         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> -       @echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
> +       @echo '  snap-pkg            - Build only the binary kernel snap package'
> +       @echo '                        (will connect to external hosts)'
>         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ef2f2336c46960df..a7d130b9306e8876 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -137,7 +137,8 @@ help:
>         @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
>         @echo  '                    default value without prompting'
>         @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
> -       @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
> +       @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel'
> +       @echo  '                    support'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
>         @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
