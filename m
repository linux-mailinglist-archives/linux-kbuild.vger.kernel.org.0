Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA738358E54
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 22:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhDHU1c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 16:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhDHU1c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 16:27:32 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33721C061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 13:27:19 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id j26so3588580iog.13
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 13:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=VwARmvk0f+MDXW9goAj0x9TdAHKCo5czEXWS2XohFuA=;
        b=kzGGEgZQvNfjli1oNzaXGJ8PN9RNrs0iwky6k24Xkrd2Sacl/1eQ+f56QX6otWd3YM
         ncZXLUSuuAq9J8QMc3a3Bt3G+Z4wByXX+hB8wCZH2isyKuppvIE50m27oyhTOWcjf3oS
         E0WcHhH14ligIo0EmEoOknNU49hn9OfZLISTebAhgMCFGAwjhX8D54kMch3rLiSqjhxM
         rsxHJYtYljC4AJHIenQI0i/vpaaBwPTk3WeyFcUjMGQDKQ7yCSyganNf/dfYtmqweN9n
         P/Q8g1CMOyXcDU66OdM8a4RfOafqHmrRT3blG3+696Mt/HPdQjddmHw1BD39/S8llqpr
         T7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=VwARmvk0f+MDXW9goAj0x9TdAHKCo5czEXWS2XohFuA=;
        b=lITazWkhZfym1RXsunSEuA9w5+1jx7e+W8et9yFr0U0AGJYTwP88lWO741k68GBwi6
         M9zWqxw00rZtjHwf3TheXg2DeJdHMYY0wgrX70iMv9heDqjTx+lmgCgiD1kldR2FIAas
         H3aW8VYQwhSnTLeA1dd2KlLVcGe1HyJzzvwsN4oszAmNMU4QaHqXj8kJvrcqOAn4PYAH
         Zyoa9OvbhFGgQ6KanKrYoz+YKEUJHH6InVkp1cNGbKejJAuNIO+c1RYj6py77lcaQR8v
         i2dEj3j5lsAO/UcZOsZZW4zYQVle9Y9yOKQcMy/MAKmCUTYEv5axcUMG+5x5BR1z8s+d
         GBkg==
X-Gm-Message-State: AOAM530jaEF7/QCkUcloa7DoEwSPWl2YyoSwgcAc+Han1RboSPOPC1jq
        C6Zx2HGd5judth+QykVa3WOLr1gAZtn6H4qnT0flLLys2O3rJQ==
X-Google-Smtp-Source: ABdhPJw8J6Vto4/4aO+HZsloiyDoNMpIqYao0rU/XLppr6jdifcQEDtTida/flJ0CYjfu97hJJWAkS4CL7Gw73aVN6Q=
X-Received: by 2002:a05:6638:1388:: with SMTP id w8mr10713865jad.30.1617913638469;
 Thu, 08 Apr 2021 13:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
 <CA+icZUV+XTopAuqvP8fVDNFy+ReQRg4B-ZopBiiso=4HhO+Y4g@mail.gmail.com>
In-Reply-To: <CA+icZUV+XTopAuqvP8fVDNFy+ReQRg4B-ZopBiiso=4HhO+Y4g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 8 Apr 2021 22:26:55 +0200
Message-ID: <CA+icZUXpuCowJ_xLTwA1_S91sPnC2WEhmDbUVG8ppP7dwartaQ@mail.gmail.com>
Subject: Re: kbuild: add support for zstd compressed modules
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 8, 2021 at 9:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Apr 8, 2021 at 9:04 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi,
> >
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
> >
> > Thanks.
> >
>
> Additional information:
>
> $ LC_ALL=C ll drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> -rw-r--r-- 1 dileks dileks 8.2M Apr  8 19:22
> drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> $ file drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> drivers/net/wireless/intel/iwlwifi/iwlwifi.ko: ELF 64-bit LSB
> relocatable, x86-64, version 1 (SYSV),
> BuildID[sha1]=bfb188058d16a7cb7d579f68edcd1fff2a4d45d7, with
> debug_info, not stripped
>
> $ LC_ALL=C ll debian/linux-image/lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
> -rw-r--r-- 1 dileks dileks 2.3M Apr  8 19:29
> debian/linux-image/lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
>
> Looks like the kernel-module with debug_info gets ZTSD compressed.
>

Maybe drop `--rm` in scripts/Makefile.modinst:

+quiet_cmd_zstd = ZSTD    $@
+      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<

$ zstd --help | grep '\-\-rm'
--rm    : remove source file(s) after successful de/compression

...untested.
( None of the other compressors do a removal. )

- Sedat -
