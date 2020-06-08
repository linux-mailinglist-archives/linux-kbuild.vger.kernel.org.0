Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A24F1F110B
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 03:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgFHBaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Jun 2020 21:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbgFHBaP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jun 2020 21:30:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3F0C08C5C3;
        Sun,  7 Jun 2020 18:30:15 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 64so948103pfv.11;
        Sun, 07 Jun 2020 18:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YqMDTip8O2bB4WduPS64zt7/d0YFYXeSrLo1mf+ncN0=;
        b=NFphu1AN7oiLsCDH5WWR5hY/miiUfbOF6SfYL30tAAu8bjOatIm73sr/PvepUS3NtA
         5TKujwcccW1RqglAR7kvAsQ1GqMgmqhRCsF3gio/xccvw6A7/3TgbNjJvo7WnupuZTN3
         6htsksRwu6K4SX4nhKtD+W07jeiHQM0C9prrpnfRxPoaFx+RsxPBX9O//iXl6i9y/yuK
         Bddtqq1UVsATiLP4J8UIJULT3BFAyRnhNV09KxamDOn8KmRa3X8q+wMzJCu/8FrZjXBK
         iYScm4R6Gjt1sy1lNlsPJrQyadX9l2uH/H03CbE8j7cnvUu8rX+KbJzvTzn/Fc3L0A15
         lYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YqMDTip8O2bB4WduPS64zt7/d0YFYXeSrLo1mf+ncN0=;
        b=OhT+lthaTVN+Q8AJwj+HAW9KSb5G/ykcRQQl83EatOFqR8/E0GZtJzML+eUyj7K+ji
         q9ul+O9NUzQ/wypsQMiaxc+srgcIXyURFdBLD7CGm7UwlKTQHSYshbx1zxS3TJuBn0m0
         sX0dGFKpyVYQrSHi54fVrdNnDic6txoUp88WYn/jCeX6RQP+MZ0aVeP9cmW5J/hp//Bc
         uO25H2n7chSnmErUSne7jL9rsSyVEYJRt4y4/DA5z1vQwhyL/W2jeJ2vfd29QZhaSNlI
         Xb7p/PwjNMLMMdxXP8eHxpz3zwaD+oodeu1uPwMG8joEhwLGrxrqkCks7PLgDrajk+vk
         rWlw==
X-Gm-Message-State: AOAM533mfVCf8vVQQrtnNq6iVQAUIj26fJc0xwkN3tnoU+O30Liiv8C+
        CQ7f9zmsaWMDbDkA5X8oLYk=
X-Google-Smtp-Source: ABdhPJyx2ve+M3tSV5vKFdvWJ2Nhj/XpAT9Ii2mlLbJGU2Ce1+N807x6MWnE8FaJG1zXrfYLH8Fbcg==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr20026171pfc.287.1591579814794;
        Sun, 07 Jun 2020 18:30:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v129sm5365189pfv.18.2020.06.07.18.30.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jun 2020 18:30:14 -0700 (PDT)
Date:   Sun, 7 Jun 2020 18:30:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
Message-ID: <20200608013012.GA216607@roeck-us.net>
References: <20200514131234.380097-1-efremov@linux.com>
 <20200605073955.6384-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605073955.6384-1-efremov@linux.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
> 
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
> 

When building mips:defconfig, this patch results in:

Building mips:defconfig ... failed
--------------
Error log:
/bin/sh: -n: command not found
make[3]: *** [kernel/config_data.gz] Error 127
make[3]: *** Deleting file 'kernel/config_data.gz'
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [autoksyms_recursive] Error 2
make: *** [__sub-make] Error 2

Reverting this patch fixes the problem. Bisect log is attached.

Guenter

---
# bad: [cf0c97f148e9e50aa5a7ddd1984a604dd2bde4af] Merge tag 'pinctrl-v5.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
# good: [aaa2faab4ed8e5fe0111e04d6e168c028fe2987f] Merge tag 'for-linus-5.8-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux
git bisect start 'HEAD' 'aaa2faab4ed8'
# good: [77f55d1305c11fb729b88f2c3f7881ba0831fa6f] staging: rtl8723bs: Use common packet header constants
git bisect good 77f55d1305c11fb729b88f2c3f7881ba0831fa6f
# bad: [e611c0fe318c6d6827ee2bba660fbc23cf73f7dc] Merge tag 'usb-5.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect bad e611c0fe318c6d6827ee2bba660fbc23cf73f7dc
# bad: [cff11abeca78aa782378401ca2800bd2194aa14e] Merge tag 'kbuild-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
git bisect bad cff11abeca78aa782378401ca2800bd2194aa14e
# good: [2bd81cd04a3f5eb873cc81fa16c469377be3b092] Merge branch 'remotes/lorenzo/pci/vmd'
git bisect good 2bd81cd04a3f5eb873cc81fa16c469377be3b092
# good: [269a535ca931b754a40dda3ab60514e68773c759] modpost: generate vmlinux.symvers and reuse it for the second modpost
git bisect good 269a535ca931b754a40dda3ab60514e68773c759
# good: [e542e0dc3ee3eafc46dd8e3073388079d69cace0] Merge branch 'dmi-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging
git bisect good e542e0dc3ee3eafc46dd8e3073388079d69cace0
# good: [4de7b62936122570408357417f21072e78292926] modpost: remove is_vmlinux() helper
git bisect good 4de7b62936122570408357417f21072e78292926
# good: [1ee18de92927f37e6948d5a6fc73cbf89f806905] Merge tag 'dma-mapping-5.8' of git://git.infradead.org/users/hch/dma-mapping
git bisect good 1ee18de92927f37e6948d5a6fc73cbf89f806905
# bad: [8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294] kbuild: add variables for compression tools
git bisect bad 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
# good: [c0901577e1dcc8d1c0fd1a11c8d571f650df845f] kbuild: doc: rename LDFLAGS to KBUILD_LDFLAGS
git bisect good c0901577e1dcc8d1c0fd1a11c8d571f650df845f
# good: [e0b250b57dcf403529081e5898a9de717f96b76b] Makefile: install modules.builtin even if CONFIG_MODULES=n
git bisect good e0b250b57dcf403529081e5898a9de717f96b76b
# first bad commit: [8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294] kbuild: add variables for compression tools
