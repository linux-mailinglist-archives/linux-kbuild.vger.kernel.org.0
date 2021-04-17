Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06358363144
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 18:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbhDQQ7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 12:59:37 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60636 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbhDQQ7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 12:59:37 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13HGwo03022630
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Apr 2021 01:58:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13HGwo03022630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618678731;
        bh=tzWFLNopegFaAoXGgW1Wb8Dc/VDceVpv42Uu7Bt5CXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pzDJVPTmvVuA8ZLSjYRalmqaNBUQ5he/SBoWRvmylsEpl5/wbU30vwh98b7lZzTLB
         Dyxq+J7AqFm6rM31OtPRyvRFJ8CuaOhLdCvOyexEIshhjTZ6YbYsaacoI1WhIdZJsm
         FQhWUb9WzUEC73f8AJtQUZ0Pjh3ApkzxJwk6myNxZIlpvSAv7FdTWOB+9+fr2xrqeC
         0ihZ4VcuBkx7Hk9NOTVQjnMyN17tyXCV3T3U946T+hHw//wVINA3b9w5Br+BabWWen
         /5I8/K1PyGle8d9OyGgJaMotFoQ0Hgxage1k1m4+rx6o0Qds3SVZ1DbiLySHohCxc6
         BCdioZR6Q3okw==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so16236154pjv.1
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 09:58:50 -0700 (PDT)
X-Gm-Message-State: AOAM53144a0TUAIL4uIlae6spGp419ERv0PVHR1C4xeTuR5PTFPTeeta
        6TARXhHAhnYYVobIzDCNapp8LIuEsnKEZU7WD1U=
X-Google-Smtp-Source: ABdhPJx6z2Ew/Jsd5nrxcP68tYFu5LrO0rxDXDPAdeA4LDAStDAPc3QHKHr/FVpPXmn83oq42G+bchWbl5f/H1iOhO4=
X-Received: by 2002:a17:902:d2c8:b029:eb:424b:84c with SMTP id
 n8-20020a170902d2c8b02900eb424b084cmr15179492plc.71.1618678730136; Sat, 17
 Apr 2021 09:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210411101422.7092-1-bage@linutronix.de> <20210411101422.7092-7-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-7-bage@linutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Apr 2021 01:58:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx09BznvtC2Yit7YFa8m+80zriGqVV2kSpUORQkms0vQ@mail.gmail.com>
Message-ID: <CAK7LNASx09BznvtC2Yit7YFa8m+80zriGqVV2kSpUORQkms0vQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] kbuild: introduce srcdeb-pkg target
To:     bage@linutronix.de
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 7:14 PM <bage@linutronix.de> wrote:
>
> From: Bastian Germann <bage@linutronix.de>
>
> A Debian source package can be generated only in combination with building
> it afterwards. Introduce a target srcdeb-pkg that generates the source
> package without building it (adding dpkg-buildpackage's -S flag).
>
> Make the former deb-pkg depend on both srcdeb-pkg and bindeb-pkg to retain
> its behavior.
>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  scripts/Makefile.package | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 280f3a2fa334..78a363623c3a 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -69,13 +69,16 @@ binrpm-pkg:
>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>
>  PHONY += deb-pkg
> -deb-pkg:
> +deb-pkg: srcdeb-pkg bindeb-pkg


Does this work reliably with the parallel build option?


While srcdeb-pkg is cleaning the tree,
bindeb-pkg simultaneously builds objects in the tree.





> +
> +PHONY += srcdeb-pkg
> +srcdeb-pkg:
>         $(MAKE) clean
>         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
>         origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
>                 mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
> +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -S -us -uc
>
>  PHONY += bindeb-pkg
>  bindeb-pkg:
> @@ -145,6 +148,7 @@ help:
>         @echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
>         @echo '  binrpm-pkg          - Build only the binary kernel RPM package'
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
> +       @echo '  srcdeb-pkg          - Build only the source kernel deb package'
>         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
>         @echo '  snap-pkg            - Build only the binary kernel snap package'
>         @echo '                        (will connect to external hosts)'
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
