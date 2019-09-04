Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F6DA8766
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 21:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfIDNuf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 09:50:35 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:24473 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729640AbfIDNuf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 09:50:35 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x84DoVE1017006
        for <linux-kbuild@vger.kernel.org>; Wed, 4 Sep 2019 22:50:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x84DoVE1017006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567605032;
        bh=3DGfm7fRAH2kk95iDMfzzW4rQMkVTVTZLOYs/kMsCvg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lIbVhb8YNzx8eVgnNyXK5H8n+4vtjBRoRSpoIL3k0JDgJjzYDNZa4tIRMMW6PsWUW
         VqoEJ/4hpB6i3rv1oYthCcThvt/L0ZFjW+IyXCuFK9viR5e18gY5jw53U8wqiUkdS1
         dF0dLw0tbg4blMVx7c5PNBfzhoJzKHGERyY+p/iDTlQ8eD04GT828mba/wDFd6/d5Z
         rZfuks/Opirg9dzFzLNAR6hWUsloZYsQEhKgpJuuB8CTzWfwOO9CM35EWpy3z82lUs
         TABcuZIKBJay7RxHXptCEFLZtlCdWx0jt4quHY3FmYeifnX0ulkcjn6tFL4wtX/x9r
         E8hNoZVDxpeLA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id z14so8203969vsz.13
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Sep 2019 06:50:32 -0700 (PDT)
X-Gm-Message-State: APjAAAVqF0Hbe8/878qSt850nH+4N/UK7Si7RnVHratCUt7ZPeApZI9b
        fzJXUos+H6Yt7m6G6WrKO+nn0r0d/4PG7FyunPM=
X-Google-Smtp-Source: APXvYqwby6/KKzeErkk68kQI54nKyR1CRqW2DHJXmZvKANDQUBN14shqL6nXh531VTsJO7wkKsM4Qvu6klxY05TzkJQ=
X-Received: by 2002:a67:eb18:: with SMTP id a24mr2968268vso.155.1567605031160;
 Wed, 04 Sep 2019 06:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <201909041423.tfn4I8cY%lkp@intel.com>
In-Reply-To: <201909041423.tfn4I8cY%lkp@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 22:49:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATG_rtO-QUPTWoEJr0pU+d0MW4TFUk9roFu6hfa0DerHw@mail.gmail.com>
Message-ID: <CAK7LNATG_rtO-QUPTWoEJr0pU+d0MW4TFUk9roFu6hfa0DerHw@mail.gmail.com>
Subject: Re: [kbuild:kbuild 51/57] scripts/mkuboot.sh: 20: scripts/mkuboot.sh:
 -path:: not found
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 4, 2019 at 3:01 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   10dd50d6bdbada801cc8da64558e77b683fa17e2
> commit: 1d99a66e29e339196aecd3acd6d8b6acd38bb8a6 [51/57] kbuild: add $(BASH) to run scripts with bash-extension
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 1d99a66e29e339196aecd3acd6d8b6acd38bb8a6
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> scripts/mkuboot.sh: 20: scripts/mkuboot.sh: -path:: not found

Thanks.

I squashed this.


index 3ce4dd578370..528bd73d530a 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -160,7 +160,7 @@ targets += vmlinux.lzo.itb
 quiet_cmd_itb-image = ITB     $@
       cmd_itb-image = \
                env PATH="$(objtree)/scripts/dtc:$(PATH)" \
-               $(CONFIG_SHELL) $(MKIMAGE) \
+               $(BASH) $(MKIMAGE) \
                -D "-I dts -O dtb -p 500 \
                        --include $(objtree)/arch/mips \
                        --warning no-unit_address_vs_reg" \


-- 
Best Regards
Masahiro Yamada
