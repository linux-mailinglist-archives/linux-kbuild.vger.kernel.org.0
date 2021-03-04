Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200D332D798
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 17:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbhCDQWo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 11:22:44 -0500
Received: from foss.arm.com ([217.140.110.172]:40770 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236824AbhCDQWT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 11:22:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07A91FB;
        Thu,  4 Mar 2021 08:21:33 -0800 (PST)
Received: from [10.57.17.29] (unknown [10.57.17.29])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 641803F766;
        Thu,  4 Mar 2021 08:21:32 -0800 (PST)
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Vladimir Murzin <Vladimir.Murzin@arm.com>, arnd@arndb.de
From:   Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Possible regression due to 269a535ca931 "modpost: generate
 vmlinux.symvers and reuse it for the second modpost"
Message-ID: <42e0adf2-dbf5-9c1b-a18d-05bf5f1960a1@arm.com>
Date:   Thu, 4 Mar 2021 16:21:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Recently, I had to dig awkward build issue for external module (originally with ARCH=arm)
like

MODPOST module/path/Module.symvers
ERROR: modpost: "__put_user_1" [module/path/name.ko] undefined!
ERROR: modpost: "__aeabi_unwind_cpp_pr0" [/module/path/name.ko] undefined!

and it looks like it is happening due to

269a535ca931 "modpost: generate vmlinux.symvers and reuse it for the second modpost"

Here is result of my investigation (with ARCH=arm64)

$ git describe
v5.7-rc5-72-g269a535
# Start with clean build
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 mrproper
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 defconfig
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 -j5 > /dev/null
$ cp vmlinux.symvers vmlinux.symvers.defconfig
$ cp Module.symvers Module.symvers.defconfig
# Alter configuration
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 allnoconfig
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 -j5 > /dev/null
$ cp vmlinux.symvers vmlinux.symvers.allnoconfig
$ cp Module.symvers Module.symvers.allnoconfig
$ diff vmlinux.symvers.defconfig vmlinux.symvers.allnoconfig > /dev/null
$ echo $?
1
$ diff Module.symvers.defconfig Module.symvers.allnoconfig > /dev/null
$ echo $?
0

So, Module.sysver not reflecting changes in configuration, yet IIUC it
it supposed to include vmlinux.symvers

If you are lucky enough with stale Module.symver there is a chance to
fail build of external module in very awkward way

Obviously

$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 mrproper
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 allnoconfig
$ ls *.symvers
vmlinux.symvers

With that external module build would splat

WARNING: Symbol version dump "Module.symvers" is missing.
         Modules may not have dependencies or modversions.

Also, there are several reports on user forums describing
symptoms which could be due to the issue, with workarounds
like "enable random in-tree module" or/and "create empty
Module.symvers"

One commit before 269a535ca931 "modpost: generate vmlinux.symvers and reuse it for the second modpost"

$ git describe
v5.7-rc5-71-gf1005b3
# Start with clean build
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 mrproper
# Build defconfig
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 defconfig
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 -j5 > /dev/null
$ cp Module.symvers Module.symvers.defconfig
# Alter configuration
$ CROSS_COMPILE=make ARCH=arm64 allnoconfig
$ cp Module.symvers Module.symvers.allnoconfig
$ diff Module.symvers.defconfig Module.symvers.allnoconfig > /dev/null
$ echo $?
1

As you can see Module.symvers gets updated

$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 mrproper
$ CROSS_COMPILE=aarch64-none-linux-gnu- make ARCH=arm64 allnoconfig
$ CROSS_COMPILE=make ARCH=arm64 -j5 > /dev/null
$ ls *.symvers
Module.symvers

As you can see Modeule.symver gets created

Does that make sense? What I'm missing?

P.S.
I've also checked v5.12-rc1 and see the same symptoms

Cheers
Vladimir
