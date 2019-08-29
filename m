Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B338A26EA
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 21:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbfH2TEL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 15:04:11 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18257 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbfH2TEK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 15:04:10 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x7TJ3pH3029664
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Aug 2019 04:03:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x7TJ3pH3029664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567105432;
        bh=//QB/ISYotWUpH09mHlT1Q93K803lTGEm4gx+HIWRyw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rsBNU4+UQ2MdfIWWKdzsZP48nJ7qqeumphaGvYknr7rL31T4Vr2vDZTwguexw2G9E
         jtK7yayzSqGcSXVIiQ38KSUpvw/YhM+VBYjF8WlofEaypO12XZj3LSvht6ttclIitC
         eUx9mmr7klYeGrhTU0up0t9rrLGR7526CKuui3mDu5kFD1MPaqXIvs0YhqjmI17AD3
         NfUA73G2j7Rby86i8+zAZj+yOkRb3cxJOx9dye88yOVAIv+axjfv8D7QSdEJII+J70
         VCbn46+JadAf1I9EXT4U0ehD5iqZuI9gI2RJn7eXk3h3j44K9hnLhF7umdLlcWb9kt
         PuAtuLjRdEGMg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id g11so1536648uak.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2019 12:03:52 -0700 (PDT)
X-Gm-Message-State: APjAAAW76l2gZbY9lzOoHQ74eNHPxmxR2Q86wumQNJUiWdiVx7dSpE1s
        X29TK1cCF2OFdxINYvHwFWgkTVTAOfjIlRCsxpI=
X-Google-Smtp-Source: APXvYqzv8CXtpjcJKP0iDU38kF99puBBgCldp533Gq5m+6eH+hPndxr0WVLauzuLtIx9JbXWq2NxoDAwxaL34f3OvLk=
X-Received: by 2002:a9f:31cb:: with SMTP id w11mr5715254uad.40.1567105430665;
 Thu, 29 Aug 2019 12:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <201908300201.6bXAplRQ%lkp@intel.com>
In-Reply-To: <201908300201.6bXAplRQ%lkp@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 30 Aug 2019 04:03:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTXaMbjLxfNjikRDWUCa4DRotnCizUNm7gZ8k1P1E1tA@mail.gmail.com>
Message-ID: <CAK7LNAQTXaMbjLxfNjikRDWUCa4DRotnCizUNm7gZ8k1P1E1tA@mail.gmail.com>
Subject: Re: [kbuild:kbuild 48/54] arch/powerpc/kernel/prom_init_check.sh: 36:
 arch/powerpc/kernel/prom_init_check.sh: Syntax error: "(" unexpected
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 30, 2019 at 3:47 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   d24121b576497d25a5b53fa78e6789ce8ca413cc
> commit: 51af17b8434f10a5881fc6fde4fa2c41df59c287 [48/54] kbuild: add $(BASH) to run scripts with bash-extension
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 51af17b8434f10a5881fc6fde4fa2c41df59c287
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/kernel/prom_init_check.sh: 36: arch/powerpc/kernel/prom_init_check.sh: Syntax error: "(" unexpected

I will remove 'function' to fix this.

Thanks.


> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
