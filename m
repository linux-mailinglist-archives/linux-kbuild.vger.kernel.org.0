Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4A373BAD6
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 16:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjFWOy6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 10:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjFWOy2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 10:54:28 -0400
X-Greylist: delayed 508 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Jun 2023 07:54:20 PDT
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570E52D50;
        Fri, 23 Jun 2023 07:54:20 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 4A26B5200CE;
        Fri, 23 Jun 2023 16:45:50 +0200 (CEST)
Received: from lxhi-065 (10.72.94.1) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.23; Fri, 23 Jun
 2023 16:45:50 +0200
Date:   Fri, 23 Jun 2023 16:45:44 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <n.schier@avm.de>,
        SzuWei Lin <szuweilin@google.com>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arch@vger.kernel.org>, <Matthias.Thomae@de.bosch.com>,
        <yyankovskyi@de.adit-jv.com>, <Dirk.Behme@de.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 3/5] kbuild: rename cmd_{bzip2,lzma,lzo,lz4,xzkern,zstd22}
Message-ID: <20230623144544.GA24871@lxhi-065>
References: <20220109181529.351420-1-masahiroy@kernel.org>
 <20220109181529.351420-3-masahiroy@kernel.org>
 <YdwZe9DHJZUaa6aO@buildd.core.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YdwZe9DHJZUaa6aO@buildd.core.avm.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.72.94.1]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Yamada-san,
Hello Nicolas,
Cc: SzuWei Lin (committer of the patch in AOSP [1])
Cc: Kbuild

On Mon, Jan 10, 2022 at 12:33:15PM +0100, Nicolas Schier wrote:
> On Mon, Jan 10, 2022 at 03:15:27AM +0900, Masahiro Yamada wrote:
> > GZIP-compressed files end with 4 byte data that represents the size
> > of the original input. The decompressors (the self-extracting kernel)
> > exploit it to know the vmlinux size beforehand. To mimic the GZIP's
> > trailer, Kbuild provides cmd_{bzip2,lzma,lzo,lz4,xzkern,zstd22}.
> > Unfortunately these macros are used everywhere despite the appended
> > size data is only useful for the decompressors.
> > 
> > There is no guarantee that such hand-crafted trailers are safely ignored.
> > In fact, the kernel refuses compressed initramdisks with the garbage
> > data. That is why usr/Makefile overrides size_append to make it no-op.
> > 
> > To limit the use of such broken compressed files, this commit renames
> > the existing macros as follows:
> > 
> >   cmd_bzip2   --> cmd_bzip2_with_size
> >   cmd_lzma    --> cmd_lzma_with_size
> >   cmd_lzo     --> cmd_lzo_with_size
> >   cmd_lz4     --> cmd_lz4_with_size
> >   cmd_xzkern  --> cmd_xzkern_with_size
> >   cmd_zstd22  --> cmd_zstd22_with_size
> > 
> > To keep the decompressors working, I updated the following Makefiles
> > accordingly:
> > 
> >   arch/arm/boot/compressed/Makefile
> >   arch/h8300/boot/compressed/Makefile
> >   arch/mips/boot/compressed/Makefile
> >   arch/parisc/boot/compressed/Makefile
> >   arch/s390/boot/compressed/Makefile
> >   arch/sh/boot/compressed/Makefile
> >   arch/x86/boot/compressed/Makefile
> > 
> > I reused the current macro names for the normal usecases; they produce
> > the compressed data in the proper format.
> > 
> > I did not touch the following:
> > 
> >   arch/arc/boot/Makefile
> >   arch/arm64/boot/Makefile
> >   arch/csky/boot/Makefile
> >   arch/mips/boot/Makefile
> >   arch/riscv/boot/Makefile
> >   arch/sh/boot/Makefile
> >   kernel/Makefile
> > 
> > This means those Makefiles will stop appending the size data.
> > 
> > I dropped the 'override size_append' hack from usr/Makefile.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> 
> Reviewed-by: Nicolas Schier <n.schier@avm.de>

If you don't mind, I would like to report another instance of
"/bin/sh: Argument list too long" while building some out-of-tree *ko
in a number of downstream v5.15.78+ kernels containing [1].

For some time now, we've been living with ugly hacks to overcome it.

Fortunately, recent git bisecting efforts apparently reveal that
current v5.17-rc1 commit (and its backports in downstream) look to
act as the culprit (confirmed on several host machines). So, I
started to have some hopes of a long-term solution and hence
sharing the findings as a first step.

I am not entirely clear how to properly trace this behavior, since no
amount of "make V=1/V=2" uncovers more details. Purely by accident, I
looked into the top/htop output (while running the repro) and
noticed several processes doing:

/bin/sh -c dec_size=0; for F in <humongous list of filenames>; do \
  fsize=$(sh /abs/path/to/scripts/file-size.sh $F); \
  dec_size=$(expr $dec_size + $fsize); done; printf "%08x\n" $dec_size \
  | sed 's/\(..\)/\1 /g' | { read ch0 ch1 ch2 ch3; for ch in \
  $ch3 $ch2 $ch1 $ch0; do printf '%s%03o' '\\' $((0x$ch)); done; }

As it was the case in the recent report [2], the above command seems
to require/assume generous amount of space for the shell arguments.

I still haven't compared the exact traces before and after this commit,
to quantify by how much the shell argument list is increased (TODO).

Another aspect is that current commit seems to introduce the
regression in a multi-threaded make only. The issue is apparently
masked by 'make -j1' (TBC), which adds another level of complexity.

Unfortunately, the build use-case is highly tailored to downstream
and is not repeatable against vanilla out of the box.

I will continue to increase my understanding behind what's happening.
In case there are already any suggestions, would appreciate those.

[1] https://android.googlesource.com/kernel/common/+/bc6d3d83539512
    ("UPSTREAM: kbuild: rename cmd_{bzip2,lzma,lzo,lz4,xzkern,zstd22}")

[2] https://lore.kernel.org/linux-kbuild/20230616194505.GA27753@lxhi-065/

-- 
Best regards,
Eugeniu Rosca
