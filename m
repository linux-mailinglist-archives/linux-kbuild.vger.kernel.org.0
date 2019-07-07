Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19958613D4
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2019 06:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfGGEcf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Jul 2019 00:32:35 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33599 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfGGEcf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jul 2019 00:32:35 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x674WS6p019077
        for <linux-kbuild@vger.kernel.org>; Sun, 7 Jul 2019 13:32:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x674WS6p019077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562473949;
        bh=d2WpF0m+UxSjiWZgHNsH+v0Yjf2CVrVX452z+kRAdBE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sR6TGJy2qLx0U8AppecpNQyS340F1fFIPBv6m/DJnzcDHbGdzcsR+ftvz+O3MiDjw
         yeSrHwdZSwFCNj+PAGl97iATs7IepyRla6o9OjnzHdEV43uLovVVPFHU/lvMB9R4Fl
         qgmkVB67HzWGHEOR/g1lQr2Ul0VQeJ9u5i4WSUrQIyeH1T1Xpwe8i1KqwGIfv5tDcn
         Sju2fhktZNV1cGibiSwRHBEGUOWft6QYjRIw4uezfPGnj9N4GhBEGOUHpJ5RA356c3
         RkMWDoLSTCH1EDApoWLHuhmvSdFxls6e+1zo22hs6axlxJ/w+EQWfH5Au30LIvIzg8
         KVmDjItbWJKHw==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id a186so6144604vsd.7
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jul 2019 21:32:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVQYQmR0AkN0jYNii7L5pwFsyZve0CjyO+Mglf6y/O6/j116OtN
        S+1iAIWuTm4HDvj3O8czR7rHhuw8Uud+AOSRLNU=
X-Google-Smtp-Source: APXvYqzLAHACNmIn+X8wIpCghl//ZVA8m0//jXa2zN576ANkVJLV2+cKfbwLaRjnCss7tdT90yNbGBWt3kMZBpW8oHE=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr6209272vsl.155.1562473948334;
 Sat, 06 Jul 2019 21:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <201907071223.jR5IQBkq%lkp@intel.com>
In-Reply-To: <201907071223.jR5IQBkq%lkp@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 7 Jul 2019 13:31:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJaV8VQc4Mq2WhRWHkGMHJ0KX2awFhJiQ_dGFfus3vxQ@mail.gmail.com>
Message-ID: <CAK7LNARJaV8VQc4Mq2WhRWHkGMHJ0KX2awFhJiQ_dGFfus3vxQ@mail.gmail.com>
Subject: Re: [kbuild:kbuild 35/43] cc1: error: invalid --param name
 'asan-instrument-allocas'; did you mean 'asan-instrument-writes'?
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 7, 2019 at 1:01 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   d9a7379becd60f07ff7cbdf4de2d0eedb9995d71
> commit: 319ce90a165fd4e1a5519a9f157da29ba6220bfe [35/43] kbuild: use -E instead of -c for __cc-option
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 319ce90a165fd4e1a5519a9f157da29ba6220bfe
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> cc1: error: invalid --param name 'asan-instrument-allocas'; did you mean 'asan-instrument-writes'?
> >> cc1: error: invalid --param name 'asan-instrument-allocas'; did you mean 'asan-instrument-writes'?
>    make[2]: *** [scripts/mod/empty.o] Error 1
>    make[2]: *** [scripts/mod/devicetable-offsets.s] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [sub-make] Error 2

Ugh, sorry.

I will drop this patch.




> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
