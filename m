Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD6D3109B9
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 12:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhBELAF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 06:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbhBEK5t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 05:57:49 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FC0C061786
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 02:57:08 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id g9so5462021ilc.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 02:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=IV251W//AjH9o0T9QP5zg1g7QdWQe3QcIbrbw0AVt9M=;
        b=qHGUpsN8cgf+y0OLe0E1tZG6IP4vTyzys9ig+bsvIcTGCsp/FrmC77CCYNhPb+tS0P
         9uQx/PNRr2FBcSGwjsL+Az/fD8XyCA4C16B+bNerxZV1JyOzwreKF+ZGO8At/TPmg3Lp
         xg4aMEbLfwMO4BpXuISxNhKxiPZyG1E7aly0tDSxxaUNPm6QicQIrwXeKKRjaxbodM3M
         1wQO0+dIwDFNqmjxgRSPTF4S0RAq9drujTx+BNsSUmRaczIYQpiedYoEKrIK/FkWrPGe
         OeFaIu6rPTzBeFDah8q0FphuRtDJvYSS2QPP+5itREEFKbggKuSpDFyQVJfE2UWYwJQf
         tXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=IV251W//AjH9o0T9QP5zg1g7QdWQe3QcIbrbw0AVt9M=;
        b=C5WR+F1OVSGrYyrwPK5pMeELk3iWZU4FifWhBWeTpZ1ChlSWIUiYRuqxVDCtHJvd8p
         Hweh1XYWRBkzHNH+L2tUU0PNT+dw3IGdAGgppoAsVfHYYyR1HE5uM63vhecmfSQEFrH0
         J8MTn18BT70ZLCRnYgctzRf9WzNGh0b/mJpzoyVnK9VWDhbcjqu3qs6E4SJWkb6i1o72
         fUJElhg7EDtKrakXquTqugHdFnZEHdJDG3yeNOREP1BZCdgunNAUVkXZW1er9q+ODOYk
         AEOSsdLEl9H646aBgFEYyx+52z9VX5s1vkeF/goShJorgMjaDROdgkjO1ib+nqpDorVK
         JTtQ==
X-Gm-Message-State: AOAM531roV1hO37Moece1VjhLwaRrSJPYb7fn6ue/vXyTeB/+3qOyY4V
        Pp6gYuC0RlLQMbX4+/0GnQqiQrUhmBTGM9ia4+g=
X-Google-Smtp-Source: ABdhPJxsQU5ijgkt0TVxL/GRvyi2aTEVfE6YTb9Qwm8wQU2E1Ln1bXQEQ3ewHlaeiMq2mKldY7FO6xysTOEGpJuDuso=
X-Received: by 2002:a92:58ce:: with SMTP id z75mr3474026ilf.209.1612522627089;
 Fri, 05 Feb 2021 02:57:07 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 5 Feb 2021 11:56:55 +0100
Message-ID: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
Subject: Using GNU AS from a selfmade binutils v2.35.2
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro and ClangBuiltLinux folks,

I am trying to use binaries from GNU/binutils v2.35.2 for my
Linux-kernel builds.

Background is I am doing some testing for BTF + pahole with GCC-10 and LLVM-12.

I tried several strategies.

[ STRATEGY #1 - Use a-local-binutils.conf LDCONFIG ]

[ /etc/ld.so.conf.d/a-local-binutils.conf ]

# Selfmade GNU/binutils lib configuration
/opt/binutils/lib
- EOT -

sudo ldconfig
sudo ldconfig -v -p
...shows me above lib path is in the ldconfig-cache.

In my build-script I additionally add:

BINUTILS_BIN_PATH="/opt/binutils/bin"
if [ -d ${BINUTILS_BIN_PATH} ]; then
    export PATH="${BINUTILS_BIN_PATH}:${PATH}"
fi

That's NOT including ld.bfd from /opt/binutils/bin - not including nm,
ar, strip etc.

NOTE: Symlink: lrwxrwxrwx 1 root   root     15  5. Feb 11:10
/opt/binutils -> binutils-2.35.2

[ STRATEGY #2 - Use LD_LIBRARY_PATH ]

From my build-script:

BINUTILS_BIN_PATH="/opt/binutils/bin"
BINUTILS_LIB_PATH="/opt/binutils/lib"
if [ -d ${BINUTILS_BIN_PATH} ] && [ -d ${BINUTILS_LIB_PATH} ]; then
   export PATH="${BINUTILS_BIN_PATH}:${PATH}"
   export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${BINUTILS_LIB_PATH}"
fi

That's not working either.
New PATH and LD_LIBRARY_PATH are set in the user's environment variables.

[ STRATEGY #3 - Use which to get full path to binary ]

### GCC version settings
GCC_MAJOR_VER="10"

### Compiler options
CC_FOR_BUILD="clang"
CXX_FOR_BUILD="clang++"

### Linker options
##LD_FOR_BUILD="ld.bfd"
LD_FOR_BUILD=$(which ld.bfd)

### GNU tools options
# NOTE: Selfmade GNU AS v2.35.2 needs to be symlinked in /usr/bin directory
# XXX: Symlink: /usr/bin/as -> /opt/binutils-2.35.2/bin/as
HOSTAR_FOR_BUILD=$(which ar)
AR_FOR_BUILD=$(which ar)
NM_FOR_BUILD=$(which nm)
STRIP_FOR_BUILD=$(which strip)
OBJCOPY_FOR_BUILD=$(which objcopy)
OBJDUMP_FOR_BUILD=$(which objdump)
READELF_FOR_BUILD=$(which readelf)
GNU_TOOLS_OPTS="HOSTCC=${CC_FOR_BUILD} HOSTCXX=${CXX_FOR_BUILD}
HOSTLD=${LD_FOR_BUILD} HOSTAR=${HOSTAR_FOR_BUILD}"
GNU_TOOLS_OPTS="$GNU_TOOLS_OPTS CC=${CC_FOR_BUILD} LD=${LD_FOR_BUILD}
AR=${AR_FOR_BUILD} NM=${NM_FOR_BUILD} STRIP=${STRIP_FOR_BUILD}"
GNU_TOOLS_OPTS="$GNU_TOOLS_OPTS OBJCOPY=${OBJCOPY_FOR_BUILD}
OBJDUMP=${OBJDUMP_FOR_BUILD} READELF=${READELF_FOR_BUILD}"

That works - means passes all binaries from GNU binutils v2.35.2 to my
make-line.

Please NOTE that I had to symlink GNU AS v2.35.2 as I saw too late I
was using Debian's GNU AS v2.35.1 within my last builds.

AFAICS there is no more AS= assignment in the top-level Makefile.
How can I say: "Please use a different ASsembler?"

[ LDD ]

When I inspect with ldd (here: GNU AS v2.35.2):

# ldd /opt/binutils/bin/as
       linux-vdso.so.1 (0x00007ffc7f4d6000)
       libopcodes-2.35.2.so =>
/opt/binutils-2.35.2/lib/libopcodes-2.35.2.so (0x00007f11f3bcc000)
       libbfd-2.35.2.so => /opt/binutils-2.35.2/lib/libbfd-2.35.2.so
(0x00007f11f3a8b000)
       libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f11f3a44000)
       libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f11f387f000)
       libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f11f3879000)
       /lib64/ld-linux-x86-64.so.2 (0x00007f11f3de3000)

So GNU AS v2.35.2 is loading from the correct places.

Is the symlink in /opt directory a problem?
binutils -> binutils-2.35.2

Can someone comment and give me a hint?

Thanks in advance.

Regards,
- Sedat -
