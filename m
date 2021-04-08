Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F333D358D44
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 21:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDHTKc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 15:10:32 -0400
Received: from vulcan.natalenko.name ([104.207.131.136]:40234 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbhDHTK3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 15:10:29 -0400
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 9B737A209AE;
        Thu,  8 Apr 2021 21:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1617909012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9XnvAi6+CzAf7Vju5t3wia1C2xaJ5Bef7t6qzcyTrQQ=;
        b=Z3F9yami6kIt01DWoBGz09Vh4SLjCiD8A9Gp5hL3HGp5n4Kr9I+HbTa2NhLGYNJA2H+zOf
        KZnkRkIdNVH/9K/F4WXCadYmT8KF34l90o6nLkXkdwW8LehMa0+21xi3KehA9FFWSjVGSP
        X/QycJ1McKtPxXSAXxzmqAXsjIkFeLg=
Date:   Thu, 8 Apr 2021 21:10:12 +0200
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: add support for zstd compressed modules
Message-ID: <20210408191012.frtnokhsfbya3e5p@spock.localdomain>
References: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWVsq-frEbJVOooga_FbEQHSPGdz83OtbFy=RDLEgPdBQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Thu, Apr 08, 2021 at 09:04:11PM +0200, Sedat Dilek wrote:
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

Erm, isn't it aimed for 5.13 requiring other fresh changes from the
recent kbuild tree?

-- 
  Oleksandr Natalenko (post-factum)
