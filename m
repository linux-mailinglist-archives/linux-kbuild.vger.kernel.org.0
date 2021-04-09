Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68D7359D7B
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 13:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhDILbn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 07:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDILbn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 07:31:43 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDBDC061760;
        Fri,  9 Apr 2021 04:31:30 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a11so3476728ioo.0;
        Fri, 09 Apr 2021 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=4AaNtzCcNTMLVbnvD/41s53XfL4pmpuX/bq2Hn2SJ2c=;
        b=vbG1LAP7hGQXHDBtDrRyZ9kHpnUOwcJ72/8mBIR71lDFi+4DxHwzLMQfhsYp+Eevd2
         aD2/8t8T0Ev77cHwogUqG72r1pyjT1CuxgEU7M5QdP44g3pN+l5cksAnYXgY/0LS7WlN
         DAKw8/h+YtyYR2x79a+vONHrhc1loX5Psrj5sUQ2WBMtcOO+WEjoc50jlZKJDHpvDJCE
         puwkNGOOROGcJ/R3GruRrLUfVCpMN1C0ZjktA6ix3Spm/r9KMS9vywxWYZHXae6gVb6z
         BMFmSDEniVv5fqeY/0MfPMr/1/pHrfzASzwrvPpq6/KcUiWTC0XTDytSvQUUYwV/3GeO
         +cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=4AaNtzCcNTMLVbnvD/41s53XfL4pmpuX/bq2Hn2SJ2c=;
        b=M261BKbVgI5RGfpMz2ab5oAfblBb4MbtM0Mz8e9l9Ao6/OCePtjC5D9Ivzh8o9CjQx
         FFe3aVEWTyevCmog76dhVtC/hK8I2kreo8Hc5BQT5/dwf9TNfU4fNSuEqukxCZfCxBQk
         swOjM3g//bfxbc4w/47Gs/sEU1HOVxSxaFNGPMtHLKN4VATgP6mbFqSatKe5Dxo3Y1/U
         dibXHKStkp/E9zkah2qMztdbFeKHy+UpqgyEFQk45O0+SX3mxtPmOm0wMhemWSJYL6mZ
         v8FM73vDScHYU7qm8MA4zGhT9yxFVX6Qsh0OLLs846GUplZ1VSIpoiAm/27atL8kfoAG
         JIWQ==
X-Gm-Message-State: AOAM530uJWxSXGciqpwOWdM7ng3K7j8O9P2PaMFZ+2Qb/7KO5wQHRxQ3
        xxcs/cGkgX1Nk1nq/JEqe9tSjNhb4FKQypcNZ/o=
X-Google-Smtp-Source: ABdhPJzcADcBmqte+6MPur7P/QbOkys4CxXpLFoBwZrwtjWdPC72Pb6S/3M+wZllmSloRCrxd5OLXjG/+lTfwANdVPE=
X-Received: by 2002:a05:6638:35ab:: with SMTP id v43mr13973395jal.65.1617967890055;
 Fri, 09 Apr 2021 04:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com> <20210409111033.2465074-1-lucjan.lucjanov@gmail.com>
In-Reply-To: <20210409111033.2465074-1-lucjan.lucjanov@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 9 Apr 2021 13:31:07 +0200
Message-ID: <CA+icZUWbYd3z-+FDoXGx5UQcY4R1BuBn5V=o0d06=XADOZD8gQ@mail.gmail.com>
Subject: Re: Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, oleksandr@natalenko.name
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 9, 2021 at 1:10 PM Piotr Gorski <lucjan.lucjanov@gmail.com> wrote:
>
> I originally posted the patch in a different form [1] even before Masahiro's changes.
> I've been testing this solution since December last year and posted it in March this year,
> after I made sure everything was working fine. This patch was tested by Oleksandr and he also didn't report any objections. [2]
>
> Masahiro notified me about the planned changes [3] and asked me to resend this patch, adjusted to those changes, which I did.
>
> My current logs:
>
> lucjan@archlinux ~ $ zgrep CONFIG_DEBUG_INFO /proc/config.gz
> CONFIG_DEBUG_INFO=y
> # CONFIG_DEBUG_INFO_REDUCED is not set
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_DEBUG_INFO_DWARF4=y
> CONFIG_DEBUG_INFO_BTF=y
> CONFIG_DEBUG_INFO_BTF_MODULES=y
> lucjan@archlinux ~ $ zgrep CONFIG_MODULE_COMPRESS_ZSTD /proc/config.gz
> CONFIG_MODULE_COMPRESS_ZSTD=y
> CONFIG_MODULE_COMPRESS_ZSTD_LEVEL=19
>
> Pay no attention to CONFIG_MODULE_COMPRESS_ZSTD_LEVEL as this is not in the upstream, it's an additional patch I use.
>
> The only difference - I don't use clang. Maybe those who use will comment on this.
> I relied on the opinions of Oleksander and a dozen other users who reported no errors in using zstd module compression.
>
> [1] https://marc.info/?l=linux-kbuild&m=161710402402989&w=2
>
> [2] https://marc.info/?l=linux-kbuild&m=161710503403517&w=2
>
> [3] https://marc.info/?l=linux-kbuild&m=161780602730829&w=2

I am a big fan of ZSTD and have it as default in all available Linux
Kconfigs and Debian's initramfs-tools.
So, I am highly interested in getting this fixed.

Unfortunately, I have thrown away my yesterday's Clang-LTO build and
switched to Clang-CFI with builddeb - should do handle the same way.

I see three iwlwifi.ko (as an example):

$ LC_ALL=C ll drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
-rw-r--r-- 1 dileks dileks 8.2M Apr  9 11:07
drivers/net/wireless/intel/iwlwifi/iwlwifi.ko

$ file drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
drivers/net/wireless/intel/iwlwifi/iwlwifi.ko: ELF 64-bit LSB
relocatable, x86-64, version 1 (SYSV),
BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, with
debug_info, not stripped

That iwlwifi.ko with debug-info is optimized when moving to
debian/linux-image-dbg directory:

$ LC_ALL=C ll debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
-rw-r--r-- 1 dileks dileks 7.9M Apr  9 11:18
debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko

$ file debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko:
ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV),
BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, with
debug_info, not stripped

And think it's shrunk down and included debian/linux-image directory:

$ LC_ALL=C ll debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
-rw-r--r-- 1 dileks dileks 694K Apr  9 11:18
debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko

$ file debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko:
ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV),
BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, not stripped

I speculate both iwlwifi.ko below debian directory should be ZSTD-compressed.
Fact is the one with debug-info is done correctly.
Might be builddeb script needs a special treatment.

- Sedat -
