Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B4F3FA592
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 14:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhH1L7n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 07:59:43 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50630 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234099AbhH1L7m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 07:59:42 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17SBwHK3032141;
        Sat, 28 Aug 2021 20:58:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17SBwHK3032141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630151898;
        bh=DJwBTSB1Ga58CQUosYCACjgumTXwfvbyeghgs73ref0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uHW7FDheehL5Cx41btKsNreWaqR2KA6q8ZT8DhB6xuHb7MeL27EGC7CFHTakSPqgf
         5pOrSWX7W0OsRTrQAB80FEdpcZrtyycBHSa7QNJON/2pjERK7by1RJIrzL6mHYgcVI
         ognwGP9SOwZOFNR8mWK3D0W6yvuqiDyAykCmhGqz79ZfHW/4TmvJNfXKVOufrqdUt8
         lcCXS72vw7jADde/yxxLbBdYC0/FuamLjI1Jya6QaXLtpmE8B0TfFTUeM0TNesR/Y3
         Sb8Bt9Ur8JdS9+rHmyrr70T5AJI3ZSYbFF7upyRzVnT4n+j2zHjpwQV6z/kEKVpcMJ
         QqTrGXoYAVRSg==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id y23so8515321pgi.7;
        Sat, 28 Aug 2021 04:58:18 -0700 (PDT)
X-Gm-Message-State: AOAM533yLVrzuwiF1juMGuvOcoGxZRjDLxhEzkltBgSDB6Gop0lqSdnb
        msTi9kS+SqaeiCjAL8FNNa87A1xzNZB04KCrvPc=
X-Google-Smtp-Source: ABdhPJwRhQVqNucYoJyrYOLZIrND7BVSRg4eIVaV65pJokYN0dLEGCI72Yt3W4EyAcgNCd/cn2z00JY6WZZ46ZCZkIU=
X-Received: by 2002:a62:f243:0:b0:3fb:b8bd:e9d9 with SMTP id
 y3-20020a62f243000000b003fbb8bde9d9mr859828pfl.63.1630151897130; Sat, 28 Aug
 2021 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210819005744.644908-1-masahiroy@kernel.org> <20210819005744.644908-10-masahiroy@kernel.org>
 <202108182337.25ECD5503B@keescook>
In-Reply-To: <202108182337.25ECD5503B@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Aug 2021 20:57:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyNAu6sa-TT9JXy=BXr5d2Q5K-sp-mVXXtJDuJyi6_bA@mail.gmail.com>
Message-ID: <CAK7LNATyNAu6sa-TT9JXy=BXr5d2Q5K-sp-mVXXtJDuJyi6_bA@mail.gmail.com>
Subject: Re: [PATCH 09/13] kbuild: do not create built-in.a.symversions or lib.a.symversions
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 3:41 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Aug 19, 2021 at 09:57:40AM +0900, Masahiro Yamada wrote:
> > Merge all *.o.symversions in scripts/link-vmlinux.sh instead of
> > merging them in the unit of built-in.a or lib.a.
> >
> > This is a preparation for further code cleanups.
>
> Looks good, though I wonder about this becoming serialized during the
> link phase rather than doing the work per-target. I mean, it always had
> to collect them all during the link phase (with "cat"), but before it
> wasn't running $(AR) serially to do it.
>
> I'll ponder how this might be made a little more parallel. But for now:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> -Kees
>


I measured the cost of merging all the *.symversions.

For a typical use-case
(x86_64 defconfig + CONFIG_LTO_CLANG_THIN + CONFIG_MODVERSIONS),
my shell script took about 0.40 msec
for merging all the individual *.symversions files.

Most of the cost of 0.40 msec came from the 'cat' command.
The 'cat' command is kind of slow when you concatenate
a large number of files.

I implemented the equivalent functionality with a perl script,
which worked in only 0.04 msec.

I think 0.04 msec should be acceptable cost because
this commit eliminates all the intermediate built-in.a.symversions
and lib.a.symversions, saving disk space.

I also tried allyesconfig + CONFIG_LTO_CLANG_THIN + CONFIG_MODVERSIONS
(the heaviest load), but the result is similar.

This is because most of EXPORT_SYMBOL's come from the core part of
the kernel, and enabling drivers as built-in does not give much impact, I think.

So, I will plan to submit v2 with perl implementation.


The detailed test code is as follows:








masahiro@oscar:~/workspace/linux-kbuild$ cat scripts/merge-symvers.sh
#!/bin/sh

append_symversion()
{
        if [ -f ${1}.symversions ]; then
                cat ${1}.symversions >> .tmp_symversions.lds
        fi
}

# If CONFIG_LTO_CLANG is selected, collect generated symbol versions into
# .tmp_symversions.lds
gen_symversions()
{
        rm -f .tmp_symversions.lds

        for a in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
                case $a in
                *.a)
                        for o in $(${AR} t ${a}); do
                                append_symversion ${o}
                        done
                        ;;
                *)
                        append_symversion ${a}
                        ;;
                esac
        done
}

gen_symversions



masahiro@oscar:~/workspace/linux-kbuild$ cat scripts/merge-symvers.pl
#!/usr/bin/env perl
# SPDX-License-Identifier: GPL-2.0-only

use autodie;
use strict;
use warnings;
use Getopt::Long 'GetOptions';

my $ar;
my $output;

GetOptions(
        'a|ar=s' => \$ar,
        'o|output=s'  => \$output,
);

# Collect all objects
my @objects;

foreach (@ARGV) {
        if (/\.o$/) {
                # Some objects (head-y) are linked to vmlinux directly.
                push(@objects, $_);
        } elsif (/\.a$/) {
                # Most of built-in objects are contained in built-in.a or lib.a.
                # Use 'ar -t' to get the list of the contained objects.
                $_ = `$ar -t $_`;
                push(@objects, split(/\n/));
        } else {
                die "$_: unknown file type\n";
        }
}

open(my $out_fh, '>', "$output");

foreach (@objects) {
        # The symbol CRCs for foo/bar/baz.o is output to
foo/bar/baz.o.symversions
        s/(.*)/$1.symversions/;

        if (! -e $_) {
                # .symversions does not exist if the object does not contain
                # EXPORT_SYMBOL at all. Skip it.
                next;
        }

        open(my $in_fh, '<', "$_");
        # Concatenate all the existing *.symversions files.
        print $out_fh do { local $/; <$in_fh> };
        close $in_fh;
}

close $out_fh;



masahiro@oscar:~/workspace/linux-kbuild$ git diff
diff --git a/Makefile b/Makefile
index 3ef3685b7e4a..5b8fe617769a 100644
--- a/Makefile
+++ b/Makefile
@@ -1175,6 +1175,14 @@ vmlinux: scripts/link-vmlinux.sh
autoksyms_recursive $(vmlinux-deps) FORCE

 targets := vmlinux

+PHONY += merge-symvers-by-shell merge-symvers-by-perl
+
+merge-symvers-by-shell:
+       time sh scripts/merge-symvers.sh
+
+merge-symvers-by-perl:
+       time perl scripts/merge-symvers.pl -a $(AR) -o
.tmp_symversions.lds $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
+
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps) $(subdir-modorder)): descend ;




masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1 defconfig
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
masahiro@oscar:~/workspace/linux-kbuild$ ./scripts/config  -d
LTO_NONE -e LTO_CLANG_THIN -e MODVERSIONS
masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1  -s -j24
arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing


masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1   merge-symvers-by-shell
time sh scripts/merge-symvers.sh
0.40user 0.08system 0:00.47elapsed 101%CPU (0avgtext+0avgdata 7156maxresident)k
0inputs+896outputs (0major+90678minor)pagefaults 0swaps


masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1   merge-symvers-by-perl
time perl scripts/merge-symvers.pl -a llvm-ar -o .tmp_symversions.lds
arch/x86/kernel/head_64.o arch/x86/kernel/head64.o
arch/x86/kernel/ebda.o arch/x86/kernel/platform-quirks.o
init/built-in.a usr/built-in.a arch/x86/built-in.a kernel/built-in.a
certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a
security/built-in.a crypto/built-in.a block/built-in.a lib/built-in.a
arch/x86/lib/built-in.a  lib/lib.a  arch/x86/lib/lib.a
drivers/built-in.a sound/built-in.a net/built-in.a virt/built-in.a
arch/x86/pci/built-in.a arch/x86/power/built-in.a
0.04user 0.02system 0:00.06elapsed 101%CPU (0avgtext+0avgdata 10100maxresident)k
0inputs+896outputs (0major+8590minor)pagefaults 0swaps


masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1   allyesconfig
#
# configuration written to .config
#
masahiro@oscar:~/workspace/linux-kbuild$ ./scripts/config  -d
LTO_NONE -e LTO_CLANG_THIN
masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1  -s -j24
  [ snip ]

masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1   merge-symvers-by-shell
time sh scripts/merge-symvers.sh
0.41user 0.09system 0:00.50elapsed 101%CPU (0avgtext+0avgdata 7172maxresident)k
0inputs+896outputs (0major+91425minor)pagefaults 0swaps

masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1   merge-symvers-by-perl
time perl scripts/merge-symvers.pl -a llvm-ar -o .tmp_symversions.lds
arch/x86/kernel/head_64.o arch/x86/kernel/head64.o
arch/x86/kernel/ebda.o arch/x86/kernel/platform-quirks.o
init/built-in.a usr/built-in.a arch/x86/built-in.a kernel/built-in.a
certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a
security/built-in.a crypto/built-in.a block/built-in.a lib/built-in.a
arch/x86/lib/built-in.a  lib/lib.a  arch/x86/lib/lib.a
drivers/built-in.a sound/built-in.a samples/built-in.a net/built-in.a
virt/built-in.a arch/x86/pci/built-in.a arch/x86/power/built-in.a
arch/x86/video/built-in.a
0.08user 0.02system 0:00.11elapsed 100%CPU (0avgtext+0avgdata 15984maxresident)k
0inputs+896outputs (0major+11506minor)pagefaults 0swaps





-- 
Best Regards
Masahiro Yamada
