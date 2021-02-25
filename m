Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CFC32588A
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 22:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhBYVV3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 16:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBYVV2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 16:21:28 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25071C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 13:20:48 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id a62so3680677vsa.10
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 13:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUceZmmKYCe4uDA9d20KnAAQBmJ4YXvutrC3PPx43P8=;
        b=Ybk2+KhD4c1QmBDd+iixdlOR1rWo5nPl0N9OiNXNvfnFJzSlwLuua/YFUZYdyAf5gc
         M/IpCobY8mrDbsmniuWiSBllijkzgpF3vLD4w7osUXj7BQoZ1UBec+Jk8B2fOMvLrHs2
         Vuhs9FliN6uMQpc/kvTC5+61qJ76pDVihAJSCtoHF4esstPzQsH1LwsQj7BfWixyXS55
         T/JGr4DvjCpNNxBgJq9L0vzOorQceIwOwXGgxOMIIGu2aswNJJMONNVEqync+co+ZVme
         X39ZBml+LNdhrvSJM1pT7Wo67ROYjNDd3n4pFZZ5c2yyX1gMqLXZms6PhP/3dyzVpoLa
         WpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUceZmmKYCe4uDA9d20KnAAQBmJ4YXvutrC3PPx43P8=;
        b=KRlmaSZegRFbv3l6mJCLu1BErvvtgAFsIHg5vCu3z2N3s8H85QTzxH1ONQaqZUA9rJ
         UIWpLO2m0tAUH5vyt/1geZPXfVfwMloiA6H2z+vKHglPZItsHG6EX9/jcjktKrAxDhK5
         cyB8f3rJECiWu+KdJVzaUJQl+DmQ6cVQiyE4ZVqQzohNdio1+TgaZO0QAzCUMYuTAYI5
         +2pJAwRtiwcCJDXzhITez6h5G/VocDg1+eIwi4figLStgzDFiTXar4Ir7qrBpYQAzgdH
         UOy9atroT7B6HOkGDLwg6387LXO2RmMzJETq0wGOSn1dXruv2ESoOb9ZNKPJKUlB30Cc
         f03w==
X-Gm-Message-State: AOAM532PzpqziNYRAs9SIFxvbUEC9PGKcgOC8t8COI7JysgjfqVxoSaO
        CxL806FtZb43hQdiGYXnDjSYHh88gv5BWwPGgf8M23AoZz4sYw==
X-Google-Smtp-Source: ABdhPJxeJGk6HPFwtxDCROMX4fbc8cnR5030vIugXV33z9HggjcMQHUrBLFNXxcVP9JmyaM3kayGSggnLwqFNtAtz34=
X-Received: by 2002:a67:1e87:: with SMTP id e129mr3132335vse.23.1614288046904;
 Thu, 25 Feb 2021 13:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20210225160247.2959903-5-masahiroy@kernel.org>
 <202102260245.2UUwdoDK-lkp@intel.com> <CAK7LNAQ4gpD=wuASq42r+MznVeFo8wz0m=YMzmBLL67fdtOFpw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ4gpD=wuASq42r+MznVeFo8wz0m=YMzmBLL67fdtOFpw@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 25 Feb 2021 13:20:35 -0800
Message-ID: <CABCJKucvBBgi8zXe12+rCkv0p0ozpBGr5=9Q139k8EErMYUBwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: re-implement CONFIG_TRIM_UNUSED_KSYMS to make
 it work in one-pass
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kernel test robot <lkp@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kbuild-all@lists.01.org, Christoph Hellwig <hch@lst.de>,
        Jessica Yu <jeyu@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Thu, Feb 25, 2021 at 12:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Feb 26, 2021 at 3:47 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Masahiro,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on next-20210225]
> > [cannot apply to kbuild/for-next asm-generic/master arm64/for-next/core m68k/for-next openrisc/for-next hp-parisc/for-next arc/for-next uclinux-h8/h8300-next nios2/for-linus v5.11]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-build-speed-improvment-of-CONFIG_TRIM_UNUSED_KSYMS/20210226-000929
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 29c395c77a9a514c5857c45ceae2665e9bd99ac7
> > config: powerpc-mpc8313_rdb_defconfig (attached as .config)
> > compiler: powerpc-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/014940331790a8cd9bee92c7201494ec3217201e
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Masahiro-Yamada/kbuild-build-speed-improvment-of-CONFIG_TRIM_UNUSED_KSYMS/20210226-000929
> >         git checkout 014940331790a8cd9bee92c7201494ec3217201e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> scripts/module.lds.S:7:5: warning: "CONFIG_TRIM_UNUSED_KSYMS" is not defined, evaluates to 0 [-Wundef]
>
> Thanks. This should be #ifdef, of course.

I applied this series and changed these from #if to #ifdef, but I
still see the following build error with TRIM_UNUSED_KSYMS +
OF_UNITTEST:

In file included from drivers/of/unittest-data/testcases.dtb.S:1:
../include/asm-generic/vmlinux.lds.h:54:10: fatal error:
'generated/keep-ksyms.h' file not found
#include <generated/keep-ksyms.h>
         ^~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

This is with x86_64_defconfig and scripts/config -e OF -e OF_UNITTEST
-e TRIM_UNUSED_KSYMS.

Sami
