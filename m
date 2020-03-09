Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EDA17E97D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2020 21:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCIT7v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Mar 2020 15:59:51 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40889 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCIT7v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Mar 2020 15:59:51 -0400
Received: by mail-pj1-f67.google.com with SMTP id gv19so361164pjb.5
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2020 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ApMKbaT9NZPQVt7nAnTk1K0Wu/E7soJBK3O0vo/SsBI=;
        b=uj+iurUiPPTN/m54RipwDMNCj/ZFTmGmma6tPr5qy7yx1JDe4cH79ULnBnxcPRP/Og
         md7ebg2FJ3cuwjmQnhIv/Chm5i/pDlsGyeVR/4cdgUCTieZxNTxNmWMsYwjopfyj6ukm
         5XnHYgJImG3HTdcqFvQBSgkkfk6IEyD8n3dASgh82mxq0nvLjbn3MID0aa1BJ36a+wR8
         3y48DGUq1LGF7/F1MQzpoj4YhaL3FU3CcUdUfzYn0etFpnwLELdAZLIuHxtNLeI6Lt+W
         KvfbiPZDedzFXvWTY6P2iynfn7wTplBQF+jr0/9/1suEtOx/DaBB/vIbhMGG11HxHPHh
         wJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApMKbaT9NZPQVt7nAnTk1K0Wu/E7soJBK3O0vo/SsBI=;
        b=kVAnlT/TZuH7ruLG0PUcSXxxOfvrhT3pxg6f8XhcTvntkUMW6hsudx1Jox22cHwpkR
         NH63/NZ/4LFjeiDexcAMxJhDjugE6O6UJenSsHTOh19hmDIV2KEFkkZHIWdeUByB2I8D
         3EmkmmtrSbX0i0epQjU2OfHtBd9ezMiyCEZSXvktXyFtTs1uPCZ1NAPNr0i7vz5MMlrB
         ED+FfYfHmnueqUVakPoWG4hofUo7OUPpm3oeBSsBm6lrYT6XfjjojDsWOfNuj4PI2u2I
         9ir09BRNNq/b4L5LJ6xhoG9FI+ABdZrsbfv4jsY+J1ZQdzLnyuCQqaQX8nxIA7q5mKn3
         rP8w==
X-Gm-Message-State: ANhLgQ01+SCAcfh6WSc+avGJLBuuL5PPwDiozV6QBDWbJF5awS7RC1+Y
        hAMs7uROvmWBXxdvxHHFw+hriqJDytUOciWmfgYMHQ==
X-Google-Smtp-Source: ADFU+vtsf1Md+4e2wEt1Zur/kdkx9d2TXsNK4tOYi8XXqHW1aWgk1gYEWEd7EcK3brqq+XCwbnqL8TPLWTz3MXfesjU=
X-Received: by 2002:a17:90a:1f8d:: with SMTP id x13mr999711pja.27.1583783989605;
 Mon, 09 Mar 2020 12:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200309023910.25370-1-masahiroy@kernel.org> <202003091801.6KQQKZ1Y%lkp@intel.com>
In-Reply-To: <202003091801.6KQQKZ1Y%lkp@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Mar 2020 12:59:37 -0700
Message-ID: <CAKwvOdksxVa=NGtyT3hsuHg6SJG4CbNWAepf+dxwVDC1+36zyw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: link lib-y objects to vmlinux forcibly when CONFIG_MODULES=y
To:     "David S. Miller" <davem@davemloft.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        =?UTF-8?B?Ru+/ve+/ve+/vW5nLXJ177+977+977+9IFPvv73vv73vv71uZw==?= 
        <maskray@google.com>, Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 9, 2020 at 3:55 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on linux/master linus/master v5.6-rc5 next-20200306]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-link-lib-y-objects-to-vmlinux-forcibly-when-CONFIG_MODULES-y/20200309-115312
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: sparc-defconfig (attached as .config)
> compiler: sparc-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=sparc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/sparc/lib/strlen.o: In function `strlen':
> >> (.text+0x0): multiple definition of `strlen'
>    lib/string.o:string.c:(.text+0x2b0): first defined here

So this looks like a bug in 32b Sparc, that we should fix first.

arch/sparc/lib/strlen.S provides a definition of strlen, but it does
not define the preprocessor token __HAVE_ARCH_STRLEN to avoid multiple
definitions from producing a link error.

Or rather, __HAVE_ARCH_STRLEN is provided in include/asm/string_64.h,
but not for 32b sparc.  arch/sparc/strlen.o is unconditionally
required in lib-y in arch/sparc/lib/Makefile.

Either:
1. arch/sparc/lib/strlen.S supports 32b sparc, then __HAVE_ARCH_STRLEN
and a forward declaration of strlen should be provided in
arch/sparc/include/asm/string.h rather than
arch/sparc/include/asm/string_64.h, or...
2. arch/sparc/lib/strlen.S does not support 32b sparc, then the
inclusion of strlen.o in arch/sparc/lib/Makefile should be predicated
on CONFIG_SPARC64.

+ Dave who maybe can provide guidance on how to proceed?  The use of
the BRANCH32 macro in arch/sparc/lib/strlen.S seems to have different
definitions based on CONFIG_SPARC64 vs CONFIG_SPARC32, which makes me
thing it's case 1 above, but I'm not familiar with Sparc assembly to
be confident.
-- 
Thanks,
~Nick Desaulniers
