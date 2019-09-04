Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1117A7B37
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 08:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfIDGJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 02:09:51 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61649 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDGJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 02:09:50 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x8469Y6w030586
        for <linux-kbuild@vger.kernel.org>; Wed, 4 Sep 2019 15:09:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x8469Y6w030586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567577375;
        bh=14PiglnL04CmX9XWisgHhcgPoDDpc/qv2Emm5eGa3O0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vvq06yle0qtc7TrqcQjdT8X5lWHFM+tGIF2A5+2ljqY+UKvwJjCD2kKwOhF+ghleW
         sGMUD8qbm0CHAFW2pnavVJ2uL/UugjBcTf7jX0dYCooOcgTBexBB3obRddanlSa+Vg
         0Thv5lknWpvrwWrqdPeoK1o1n+FzfT7OYhUD9h4ICJdrAWvbnRpG04R9YbSsEiXRuJ
         Wf2Fk8QtHtS8Lg5DAFtLYpD8mJHPcfptyt327lYqXoo9R4NrBXSMqhQmuuxrGw4keI
         egnnGSuHnml/e6RgFXESh8QGL55YG66pRvHavdJ0BRDgZOBtizejEED9gbIQsdTa8U
         7F9e5o9zH0Odw==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id y62so12994768vsb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 23:09:35 -0700 (PDT)
X-Gm-Message-State: APjAAAVuCt0xUV/JB+KbUh8wxmTHdNaeMWfNs8SEzyUV0IWLka+BFher
        4epGKLrg1Mmar0sfJ1mt18RfAP8NOc12sEOXh68=
X-Google-Smtp-Source: APXvYqxhJx1gYw7id45ECk78jS4pnMXWhXxs9IxKKhfIJE0D3EmckavhDo/gl8v234FNcRJY0ZXvxiZmUTZ8b4h0jyY=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr20741944vsq.179.1567577374137;
 Tue, 03 Sep 2019 23:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <201909041423.tfn4I8cY%lkp@intel.com>
In-Reply-To: <201909041423.tfn4I8cY%lkp@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 15:08:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUnkc2qimXzLuyk74NLyx6bCkgr49p3m-Cjbe8eg6-Hw@mail.gmail.com>
Message-ID: <CAK7LNARUnkc2qimXzLuyk74NLyx6bCkgr49p3m-Cjbe8eg6-Hw@mail.gmail.com>
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


I will fix it up as follows. Thanks.

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 41c50f9461e5..2d72327417a9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -374,7 +374,7 @@ UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
 UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'

 quiet_cmd_uimage = UIMAGE  $@
-      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
+      cmd_uimage = $(BASE) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
                        -C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
                        -T $(UIMAGE_TYPE) \
                        -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \




-- 
Best Regards
Masahiro Yamada
