Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A42358D50
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 21:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhDHTNi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 15:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHTNi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 15:13:38 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1522FC061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 12:13:27 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id x3so2114719ilg.5
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=X36p+WM9tg1DJ9KBFpQcb899jVYN/GX7IoITXueO4Ko=;
        b=dMe0cn/WHAZAFxMroZfVXsjI4k16vMsXNVtG9j0PL9Q6t/WBpUgIiTaXtB8rcKMkC5
         zMmZiHLe+ZOkPQilI0azAQVTX/tAVhzTC8iwMyGN1yFFTOCzheVvwz2gf6qtlWW7XjQx
         qOYM77muwWNt/IXDlQkWyTE4S4PW36e1+yWUF+yx8bo1TV7ZeiatZZswm1djar/aXQMt
         gln74F714/8W5CQhIGW8hdGvm/TSNVIXPt8E5s6Sdcvcmok5IqpGJl2VVIA9dk0lzZXM
         9/q+HEPPY5f7jpde6mTPgdTcrC77u3IynCUvrfP6H7I9rlAT5Gc1/L3MwslB0mgB0OyI
         +9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=X36p+WM9tg1DJ9KBFpQcb899jVYN/GX7IoITXueO4Ko=;
        b=XOqPBGv04Kzz9fK0b8g9OMMfhX1nxrHDCTaKehlT0h9rMDpVeB5ROTjhh7Lisq2cWO
         Hrfi5Y02dDNO13JlFz2IEOmk3OrMF/v7aDnT+raFU3F2pn98MmIki0/anyvHe1YvnvBX
         WLO2mgD47q+P9NMryqaxd5d/WkOs2Psn4B38HBnvXHkB0Zs964D0D9sVLv0ACi/XmzXi
         8LCESQNDdrt0JnHkmu0nB54VPkxWuO5c6M144wR7ZYFN5Vg3XP6EAIXuzoYu2XjHeIAN
         VERVIY7jrzO6/4Dt9hgGHJC4UoE5ZE3m2FSMShypNkyiWAL7+bTgST1amoUgC9YiYiYp
         YXRQ==
X-Gm-Message-State: AOAM532uJeAdvZ4UkOdT51GhPbnfgzTsSw/X/JD3bC+WUXfY0sqj3UiY
        7b9X7omQBl5YRTcmmaxsiWmoeaHoD0pJpTiRnvQ=
X-Google-Smtp-Source: ABdhPJw/SfYpX/CGCK5AxFbKg3NGdCH0AoB3Xl7AUtqCTx4DKNf1eTj9Wtixq5Mp0dKqTItwPOJetk4oqX5jrW+s1+I=
X-Received: by 2002:a05:6e02:b2e:: with SMTP id e14mr8077467ilu.186.1617909206442;
 Thu, 08 Apr 2021 12:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
 <20210408191012.frtnokhsfbya3e5p@spock.localdomain>
In-Reply-To: <20210408191012.frtnokhsfbya3e5p@spock.localdomain>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 8 Apr 2021 21:13:02 +0200
Message-ID: <CA+icZUVW9zPAhghMOpHoxVU6BWk=75A5-AteBOde6FQ+EJJyvQ@mail.gmail.com>
Subject: Re: kbuild: add support for zstd compressed modules
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 8, 2021 at 9:10 PM Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> Hi.
>
> On Thu, Apr 08, 2021 at 09:04:11PM +0200, Sedat Dilek wrote:
> > I tried this patch together with my build-script which uses builddeb
> > to generate Debian packages.
> >
> > Currently, I test a setup with Clang-LTO + DWARF-v5 (and BTF).
> >
> > With this patch I get total strange numbers.
> >
> > The Kconfig changes to my previous kernel of today:
> >
> > $ scripts/diffconfig /boot/config-5.12.0-rc6-3-amd64-clang12-lto
> > /boot/config-5.12.0-rc6-4-amd64-clang12-lto
> > BUILD_SALT "5.12.0-rc6-3-amd64-clang12-lto" -> "5.12.0-rc6-4-amd64-clang12-lto"
> > MODULE_COMPRESS_NONE y -> n
> > MODULE_COMPRESS_ZSTD n -> y
> >
> > The generated linux-image Debian package is greater in size than the
> > linux-image DEBUG package.
> > Normally, this is vice-versa.
> >
> > With:
> >
> > $ du -s -m linux-image-5.12.0-rc6-4-amd64-clang12-lto*
> > 969     linux-image-5.12.0-rc6-4-amd64-clang12-lto_5.12.0~rc6-4~bullseye+dileks1_amd64.deb
> > 97      linux-image-5.12.0-rc6-4-amd64-clang12-lto-dbg_5.12.0~rc6-4~bullseye+dileks1_amd64.deb
> > (DEBUG)
> >
> > Without:
> >
> > $ du -s -m linux-image-5.12.0-rc6-3-amd64-clang12-lto*
> > 60      linux-image-5.12.0-rc6-3-amd64-clang12-lto_5.12.0~rc6-3~bullseye+dileks1_amd64.deb
> > 599     linux-image-5.12.0-rc6-3-amd64-clang12-lto-dbg_5.12.0~rc6-3~bullseye+dileks1_amd64.deb
> > (DEBUG)
> >
> > The kernel-modules directory numbers:
> >
> > With:
> >
> > # du -s -m /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/
> > 999     /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/
> >
> > Without:
> >
> > # du -s -m /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/
> > 354     /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/
> >
> > Checking iwlwifi kernel-module:
> >
> > With:
> >
> > # find /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/ -name
> > 'iwlwifi.ko*' -type f -print | xargs ls -l
> > -rw-r--r-- 1 root root 2381066  8. Apr 15:47
> > /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
> >
> > # find /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/ -name
> > 'iwlwifi.ko*' -type f -print | xargs du -k
> > 2328    /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
> >
> > Without:
> >
> > # find /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/ -name
> > 'iwlwifi.ko*' -type f -print | xargs ls -l
> > -rw-r--r-- 1 root root 675976  8. Apr 09:35
> > /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> >
> > # find /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/ -name
> > 'iwlwifi.ko*' -type f -print | xargs du -k
> > 664     /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> >
> > My make invocation looks like this
> > (start-build_5.12.0-rc6-4-amd64-clang12-lto.txt with this patch):
> >
> > dileks     74706   74681  0 15:46 pts/1    00:00:00 /usr/bin/perf_5.10
> > stat make V=1 -j4 LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> > LOCALVERSION=-4-amd64-clang12-lto KBUILD_BUILD_HOST=iniza
> > KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > KBUILD_BUILD_TIMESTAMP=2021-04-08 bindeb-pkg
> > KDEB_PKGVERSION=5.12.0~rc6-4~bullseye+dileks1
> >
> > Finally:
> >
> > I can *NOT* boot into the kernel with this patch applied.
> >
> > Personally, I do disable intentionally:
> >
> > CONFIG_DEBUG_INFO_COMPRESSED=n
> >
> > ...and will do independent of this patch:
> >
> > CONFIG_MODULE_COMPRESS_NONE=n
> >
> > As all Debian packages - generated by builddeb - are by default
> > compressed with XZ.
> > Compressing stuff before is counterproductive.
> > This strategy generates in total smaller Debian package binaries.
> >
> > This is my first analysis, I had no deeper look.
> >
> > If you need further information, please let me know.
> >
> > Please take a look at this.
> >
> > Both linux-configs attached.
>
> Erm, isn't it aimed for 5.13 requiring other fresh changes from the
> recent kbuild tree?
>

Sorry, I missed this information:

I have <kbuild.git#kbuild> merged on top of latest Linus Git.

- Sedat -
