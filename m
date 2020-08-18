Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3D3248B62
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 18:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgHRQU2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 12:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgHRQU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 12:20:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9753FC061389;
        Tue, 18 Aug 2020 09:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=4H0TL3UakH2JUbmlW0JzdQvhUAQHmi+ChGY1XsWrTIc=; b=g2SmK++anMxFszA+Wfz8OLiHIW
        BnTZzqB/iU5WxQ0LtRKgQEXw1AT+3+z1BQ+Olf3CkyFupEPAurf8x+lP9ds1MOgjlTBVxz5HzjHkQ
        5VB5ea5FYptKnQl28zwpRn+oIfbYt0EOiePQibnV3JvmqkSQObUuJi4almAAyfPfVK82PSLeGKZh2
        xA9k8mNDARVSxz61nzCXG96+LAYHwdIOYDIQQV539xKDgxlWESMMtBVYcd7p25rTealbx8HVvDMw7
        ToZG3P7rfM1/O+B0WKyfuCmNSXRtNfphrLihadmFud3p2S5EhvbCZyIQQK/GI2n/fBqt75pCBiNSs
        /HsOQA0w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k84LW-0007XQ-Fj; Tue, 18 Aug 2020 16:20:23 +0000
Subject: Re: Kernel build system broken in 5.8?
To:     Martin Burnicki <martin.burnicki@meinberg.de>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <1c4d1da4-36a9-c83b-1a8a-95334aa62ce3@meinberg.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <124fa2c7-ce60-2739-7208-e5e325d66a40@infradead.org>
Date:   Tue, 18 Aug 2020 09:20:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c4d1da4-36a9-c83b-1a8a-95334aa62ce3@meinberg.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[adding kbuild list and maintainer]

On 8/18/20 9:09 AM, Martin Burnicki wrote:
> Hi,
> 
> I'm the maintainer of a driver package for some PCI cards (GPS receiver
> cards, etc.). A read-only git repo of the driver package can be found here:
> https://git.meinbergglobal.com/mbgtools-lx.git
> 
> The kernel driver from that package is compiled as out-of-tree module,
> and runs fine on kernels 2.6, 3.x, 4.x, and 5.x up to 5.7, actually
> 5.7.15 on Ubuntu.
> 
> However, if I try this on kernel 5.8.1, I get strange errors related to
> autoconf.h, which make it impossible to compile or install the kernel
> module.
> 
> I usually build the kernel module as standard user, and only install the
> new module as root, e.g.:
> 
>   git checkout devel   # The 'devel' branch is appropriate for testing
>   cd mbgclock          # the subdirectory of the kernel module
>   git clean -fd; make  # or make V=1 for verbose output
>   sudo make install
> 
> Also, I was under the impression that the kernel source tree should be
> read-only, and kept clean, but this doesn't seem to be the case anymore.
> 
> 
> For example:
> 
> On Ubuntu 19.10 with kernel 5.8.1-050801-generic from
> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.8.1/
> 
> 'make' completes without error, even if run as normal user without write
> permissions in the kernel source tree.
> 
> 'sudo insmod ./mbgclock.ko' loads the module successfully, and the PCI
> card can be accessed as usually, e.g. using the 'mbgstatus' program, so
> the compiled kernel module  is OK.
> 
> BUT: Once I run 'sudo make install', which calls the kernel build system
> to make 'modules_install', I immediately get an error:
> 
> -------------------------------------------------------------------------
> Calling kernel build system to make "modules_install"
> make[1]: Entering directory '/usr/src/linux-headers-5.8.1-050801-generic'
> 
>   ERROR: Kernel configuration is invalid.
>          include/generated/autoconf.h or include/config/auto.conf are
> missing.
>          Run 'make oldconfig && make prepare' on kernel src to fix it.
> 
> make[1]: *** [Makefile:719: include/config/auto.conf] Error 1
> make[1]: Leaving directory '/usr/src/linux-headers-5.8.1-050801-generic'
> make: *** [/home/martin/projects/mbgtools-lx/mbgclock/../Makefile:834:
> install_module] Error 2
> -------------------------------------------------------------------------
> 
> And once this has happened, this problem persists, i.e., if I run the
> same commands
> 
>   git clean -fd; make
> 
> once more, as normal user as mentioned above, I get the error above
> every time.
> 
> Also, If I initially try to build the kernel kernel module as root, with
> 'sudo':
> 
>   git clean -fd; sudo make
> 
> I immediately get this error, and the module is not built. Only after I
> have re-installed the kernel headers package, I can compile the module
> again.
> 
> 
> A diff between the kernel header files before and after the kernel build
> system has been messed up shows that the following files have changed:
> 
> include/generated/autoconf.h
> scripts/basic/.fixdep.cmd
> scripts/basic/fixdep
> scripts/kconfig/.conf.o.cmd
> scripts/kconfig/.confdata.o.cmd
> scripts/kconfig/.expr.o.cmd
> scripts/kconfig/.lexer.lex.c.cmd
> scripts/kconfig/conf.o
> scripts/kconfig/confdata.o
> scripts/kconfig/expr.o
> scripts/kconfig/lexer.lex.c
> scripts/kconfig/parser.tab.c
> 
> Specifically, autoconf.h has been deleted even though some script
> obviously still requires that the file is available.
> 
> 
> With openSUSE Leap 15.2 and kernel 5.8.1 from
> https://download.opensuse.org/repositories/Kernel:/stable/standard/
> 
> I've encountered similar problems because include/generated/autoconf.h
> is not even available after installation of the kernel headers package.
> 
> Only on Arch Linux with kernel 5.8.1-arch1-1 I can build and install the
> module as root or standard user, as it was possible with earlier kernel
> versions.
> 
> Can someone please shed some light on what's going on here?
> 
> 
> Thanks,
> 
> Martin
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
