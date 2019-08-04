Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55AD480902
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2019 05:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfHDD6l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Aug 2019 23:58:41 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31490 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfHDD6l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Aug 2019 23:58:41 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x743wOoY028580
        for <linux-kbuild@vger.kernel.org>; Sun, 4 Aug 2019 12:58:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x743wOoY028580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564891105;
        bh=bhJIDkg8SZF1qUGKx+Shp02/owXjZboLm+2ZC005ExA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F9e6xBSA/AKEJ/xobwnNIqzfFBjt5Qjtfccexkn+qkv9cDjdvJOAkqnHeWkeZr9Z3
         6Jmvm3QkEUDeDYvH9pi4og0rmtakLnq1gQTPvt1nB6Ci+Yzydi6mxbeGTJ8ChM7KaY
         O7IHzAVJsgGiqcKU9amwNguJpivvPtZ08lQLYvD6ONyVZ/ln7xsq84j+KZz+2lAtFn
         hBNedpOXHOf5yK0wZMIu4/blSUvVwUZZizD4uFpvB6JuAey6PwSKswofBvuAZGO69C
         b2DN0g0mXiIUMgbjohSdpv88sII62AgEcZDqlzV+zs2C4N9uy59h3eNvq0ZCD9yx6B
         GauQpmKRL3Nhw==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id j8so31078801uan.6
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Aug 2019 20:58:25 -0700 (PDT)
X-Gm-Message-State: APjAAAWj5Oeyla/ZBcNTm98puU7xjMcsmQOfih5ZU3V11yQGni3DSPyR
        CA6Vfuq9pZdidcvtQHtlDkDb+a7+cOhNRUbR1dE=
X-Google-Smtp-Source: APXvYqwq2JrJO+CBlMuI997BSXowy6HZD+kFP57tt1eETStYcurINHwWzi+Eqs+dV7oZL64pmUfDva30lcHdL6n0Td0=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr2865006uao.25.1564891104006;
 Sat, 03 Aug 2019 20:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
In-Reply-To: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 4 Aug 2019 12:57:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Message-ID: <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     Thomas Albers <thomas.gameiro@googlemail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 4, 2019 at 1:44 AM Thomas Albers
<thomas.gameiro@googlemail.com> wrote:
>
> Hello!
>
> When you say "make kernel_menuconfig" in OpenWRT buildroot kernel
> configuration fails, like so:
> $ make kernel_menuconfig
> make[3]: Entering directory
> '/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134'
>   HOSTCC  scripts/kconfig/mconf.o
>   HOSTCC  scripts/kconfig/lxdialog/checklist.o
>   HOSTCC  scripts/kconfig/lxdialog/util.o
>   HOSTCC  scripts/kconfig/lxdialog/inputbox.o
>   HOSTCC  scripts/kconfig/lxdialog/textbox.o
>   HOSTCC  scripts/kconfig/lxdialog/yesno.o
>   HOSTCC  scripts/kconfig/lxdialog/menubox.o
>   HOSTLD  scripts/kconfig/mconf
> /usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
> scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol
> 'keypad'
> /usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
> /lib64/libtinfow.so.6: error adding symbols: DSO missing from command
> line
> collect2: error: ld returned 1 exit status
>
> Steps to reproduce (see
> https://openwrt.org/docs/guide-developer/build-system/use-buildsystem)
> $ git clone https://github.com/openwrt/openwrt.git
> $ make menuconfig
> $ make defconfig
> $ make kernel_menuconfig
>
> It seems that the bug was introduced here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd65465b7016dc6d9fa5c2f39cc706c231c9a089
> when menuconfig no longer used pkg-config to find the ncurses libraries.
> Also see a related bug report from Gentoo: https://bugs.gentoo.org/457530
> and the OpenWRT bug report:
> https://bugs.openwrt.org/index.php?do=details&task_id=2423
>

See line 7-20 of scripts/kconfig/mconf-cfg.sh,
it tries pkg-config first. If pkg-config cannot find ncurses,
it falls back to some hard-coded install paths.

Am I misunderstanding the code?



-- 
Best Regards
Masahiro Yamada
