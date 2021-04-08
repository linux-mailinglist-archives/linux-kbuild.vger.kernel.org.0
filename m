Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABFE358D4C
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 21:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhDHTL7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 15:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbhDHTL6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 15:11:58 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3448BC061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 12:11:47 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d2so2709886ilm.10
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=+WRa88fEXfMFCVHB1rI0+ijYlvCReqoEBmvHkRGNZZk=;
        b=BtufeJ6hHJrCL6BdKyJ1uWpQ4J3exWns/cb0NFHVsMJIfc8CEH+pRvPi83WwyPW/P8
         G4adIQcQnIqrU1rE3Kr+nu+S8rDNmYitMgT/a+5yiRvuIHhJ/Zd4q+OmvTWA5oSTiBBD
         BBIcWFSUzzwIBPwFc0B+aYt74dlgBV1b61Lr1Tmo7k/ySLe0l0GOjHiu4xykO1aZ7Tcw
         XZFQGilPh5S57gYk7lPQpWqXpbUpNJBcEqVg1UWfzlF90sZ/DeGmYvnmyIDY7/rfOQt/
         rQA58wEjowKdoJPIfsKSimQgExMckOpnKKw1U9oW4ik5bq6/TO2+HtdjRQRfcTLH3bhS
         cFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=+WRa88fEXfMFCVHB1rI0+ijYlvCReqoEBmvHkRGNZZk=;
        b=UWokxhuAVl3ngc74VC0OcRVTbhCeeAJG9PtG17gofrifh9sEPWDitmE2n58Omla1Gi
         VsfB27ynF83NwEdKeiogLqRinSUJxdTM8dbpTmxueAKKg0Tnh4O96tnAWyOOqHFU8duo
         999ClqE89Y7pRymEenajLJE9MuLjTeHPHt2ngNaDdJxtVdYbje2KdC5Ixzyz6WhtZywB
         wz8E6Upvnv3BiG884z4f/9lNEf+OcXyuQF6Gva1ZZCs0xHhwjKz+CaSrjgVXjMqQ3JOd
         JcUfYdtaqnlhid2GT/eSHNPN+1HXHiLrFaD7nyCdFrBKCjeaziqOdPcnIEJuNTs777WK
         F+dQ==
X-Gm-Message-State: AOAM533mNtoA1vkOGq71hJW9hEXqTXFK9rArK36vibmqy1FGwsGiHZG1
        h3i4UHDi/Rkv5BVLo+fEk1gsgRLuBHQJqQOxJec=
X-Google-Smtp-Source: ABdhPJzjTofquw8QI5ny1ypmKoyTCEY/2tbqF9gNevOf/+KBJzb73uSVSWtO+Ns8yFDzKsg2eE/aZx1w/4yVyfLDNcA=
X-Received: by 2002:a05:6e02:12cc:: with SMTP id i12mr8575498ilm.10.1617909106468;
 Thu, 08 Apr 2021 12:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
In-Reply-To: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 8 Apr 2021 21:11:23 +0200
Message-ID: <CA+icZUV+XTopAuqvP8fVDNFy+ReQRg4B-ZopBiiso=4HhO+Y4g@mail.gmail.com>
Subject: Re: kbuild: add support for zstd compressed modules
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 8, 2021 at 9:04 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi,
>
> I tried this patch together with my build-script which uses builddeb
> to generate Debian packages.
>
> Currently, I test a setup with Clang-LTO + DWARF-v5 (and BTF).
>
> With this patch I get total strange numbers.
>
> The Kconfig changes to my previous kernel of today:
>
> $ scripts/diffconfig /boot/config-5.12.0-rc6-3-amd64-clang12-lto
> /boot/config-5.12.0-rc6-4-amd64-clang12-lto
> BUILD_SALT "5.12.0-rc6-3-amd64-clang12-lto" -> "5.12.0-rc6-4-amd64-clang12-lto"
> MODULE_COMPRESS_NONE y -> n
> MODULE_COMPRESS_ZSTD n -> y
>
> The generated linux-image Debian package is greater in size than the
> linux-image DEBUG package.
> Normally, this is vice-versa.
>
> With:
>
> $ du -s -m linux-image-5.12.0-rc6-4-amd64-clang12-lto*
> 969     linux-image-5.12.0-rc6-4-amd64-clang12-lto_5.12.0~rc6-4~bullseye+dileks1_amd64.deb
> 97      linux-image-5.12.0-rc6-4-amd64-clang12-lto-dbg_5.12.0~rc6-4~bullseye+dileks1_amd64.deb
> (DEBUG)
>
> Without:
>
> $ du -s -m linux-image-5.12.0-rc6-3-amd64-clang12-lto*
> 60      linux-image-5.12.0-rc6-3-amd64-clang12-lto_5.12.0~rc6-3~bullseye+dileks1_amd64.deb
> 599     linux-image-5.12.0-rc6-3-amd64-clang12-lto-dbg_5.12.0~rc6-3~bullseye+dileks1_amd64.deb
> (DEBUG)
>
> The kernel-modules directory numbers:
>
> With:
>
> # du -s -m /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/
> 999     /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/
>
> Without:
>
> # du -s -m /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/
> 354     /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/
>
> Checking iwlwifi kernel-module:
>
> With:
>
> # find /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/ -name
> 'iwlwifi.ko*' -type f -print | xargs ls -l
> -rw-r--r-- 1 root root 2381066  8. Apr 15:47
> /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
>
> # find /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/ -name
> 'iwlwifi.ko*' -type f -print | xargs du -k
> 2328    /lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
>
> Without:
>
> # find /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/ -name
> 'iwlwifi.ko*' -type f -print | xargs ls -l
> -rw-r--r-- 1 root root 675976  8. Apr 09:35
> /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> # find /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/ -name
> 'iwlwifi.ko*' -type f -print | xargs du -k
> 664     /lib/modules/5.12.0-rc6-3-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> My make invocation looks like this
> (start-build_5.12.0-rc6-4-amd64-clang12-lto.txt with this patch):
>
> dileks     74706   74681  0 15:46 pts/1    00:00:00 /usr/bin/perf_5.10
> stat make V=1 -j4 LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> LOCALVERSION=-4-amd64-clang12-lto KBUILD_BUILD_HOST=iniza
> KBUILD_BUILD_USER=sedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=2021-04-08 bindeb-pkg
> KDEB_PKGVERSION=5.12.0~rc6-4~bullseye+dileks1
>
> Finally:
>
> I can *NOT* boot into the kernel with this patch applied.
>
> Personally, I do disable intentionally:
>
> CONFIG_DEBUG_INFO_COMPRESSED=n
>
> ...and will do independent of this patch:
>
> CONFIG_MODULE_COMPRESS_NONE=n
>
> As all Debian packages - generated by builddeb - are by default
> compressed with XZ.
> Compressing stuff before is counterproductive.
> This strategy generates in total smaller Debian package binaries.
>
> This is my first analysis, I had no deeper look.
>
> If you need further information, please let me know.
>
> Please take a look at this.
>
> Both linux-configs attached.
>
> Thanks.
>

Additional information:

$ LC_ALL=C ll drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
-rw-r--r-- 1 dileks dileks 8.2M Apr  8 19:22
drivers/net/wireless/intel/iwlwifi/iwlwifi.ko

$ file drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
drivers/net/wireless/intel/iwlwifi/iwlwifi.ko: ELF 64-bit LSB
relocatable, x86-64, version 1 (SYSV),
BuildID[sha1]=bfb188058d16a7cb7d579f68edcd1fff2a4d45d7, with
debug_info, not stripped

$ LC_ALL=C ll debian/linux-image/lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst
-rw-r--r-- 1 dileks dileks 2.3M Apr  8 19:29
debian/linux-image/lib/modules/5.12.0-rc6-4-amd64-clang12-lto/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko.zst

Looks like the kernel-module with debug_info gets ZTSD compressed.

- Sedat
