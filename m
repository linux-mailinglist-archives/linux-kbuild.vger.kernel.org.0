Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6879034719C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 07:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhCXG3C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 02:29:02 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:36485 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhCXG2e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 02:28:34 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12O6SF2Y021933;
        Wed, 24 Mar 2021 15:28:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12O6SF2Y021933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616567296;
        bh=MpFvCRYoenu2OQWQCuu1YENNRzvcSrbyI7aw7UAmxW4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bQ2LpycnMVnx7XkKkfJD6gASsdqXaqI1ovIVIUIV8+WQjAaoqqKCDT4GSCs44zca+
         FZ87Y1+SET88Wc6BJ5YyLyRbfb0jHu2ZPiUQmb/Mmq00ofq8WjPbP9V0oltmuYFHK+
         Xynl3oEtEhX4Ud4FdzrALKThRNC8DbUE5kj0k7a6dibwmQ9UXKREGKgN8N/d/DPUCv
         1jUUy/8Aqeqs8g6g32Grhals/70r9J5qhvLdyZ5n6gQ3RgF51RKvWAcj2RKM0fs6nJ
         2HhNcP7oc/z+vMYIsZXSZPQBeipn5xxypbhi9CGxD525Gh3QcF4I8w/cVl60bFIPst
         CAYJTUK0QZtDw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id v186so13951206pgv.7;
        Tue, 23 Mar 2021 23:28:16 -0700 (PDT)
X-Gm-Message-State: AOAM530/b4NVlcq0hMDp2e844boOjogmhHP7/l7rcL5GW73MwNFAIZ4J
        M1FgyS+CPEWqqWfz1DY670gwuP8DSKllDfAoDVc=
X-Google-Smtp-Source: ABdhPJydOLP1zGgE/BRmqJEf7gpvza0Dm4vJCq/f6k+bH7jUnOURyRApmIOEdHEDcbiGCwem5Gixz4ZYCIYh3q1KHR8=
X-Received: by 2002:aa7:8814:0:b029:21d:d2ce:7be with SMTP id
 c20-20020aa788140000b029021dd2ce07bemr1716215pfo.80.1616567295504; Tue, 23
 Mar 2021 23:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <1614608540-1025-1-git-send-email-jshriram@codeaurora.org>
 <CAK7LNARjxtyiBAfejQKePp-f=MTpA2PjAEedsHyCjHx6_eoJqA@mail.gmail.com> <b1fb2334-a85e-c299-3439-b70e9cb63454@codeaurora.org>
In-Reply-To: <b1fb2334-a85e-c299-3439-b70e9cb63454@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Mar 2021 15:27:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATedZeZxoO_bdtfRdXZVFM_7FhX7okca5ZR4zwTc_bKvQ@mail.gmail.com>
Message-ID: <CAK7LNATedZeZxoO_bdtfRdXZVFM_7FhX7okca5ZR4zwTc_bKvQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: Fix incremental build header re-generation
To:     Jeevan Shriram <jshriram@codeaurora.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 18, 2021 at 11:55 AM Jeevan Shriram <jshriram@codeaurora.org> wrote:
>
>
> On 3/1/2021 7:36 PM, Masahiro Yamada wrote:
> > On Mon, Mar 1, 2021 at 11:23 PM Jeevan Shriram <jshriram@codeaurora.org> wrote:
> >> compile.h and autoconf.h are ignored when checking headers sha as they
> >> are always re-generated for every kernel compilation. However,
> >> these two headers are packaged into kheaders tar. During incremental
> >> compilation of kernel, kheaders tar file is always generated and re-packaged
> >> irrespective of the changes in headers.
> >
> > I do not see this problem.
> > Could you describe the steps to reproduce it, please?
> >
> Without making any changes in the kernel or it's headers, re-compile the kernel. i.e.,incremental kernel build without any changes.
> I have added following log in gen_kheaders.sh script for confirming the hash differences.


Of course they are different because you are comparing
the hashes of two different files.



>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index b7425a0..ee542a0 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -40,6 +40,10 @@ obj_files_md5="$(find $dir_list -name "*.h"                     |
>   # Any changes to this script will also cause a rebuild of the archive.
>   this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
>   if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
> +
> +echo "Old Tar file $tarfile_md5"


This is the hash of kernel/kheaders_data.tar.xz


> +echo "New Tar file hash $this_file_md5"


This is the hash of kernel/gen_kheaders.sh




> +
>   if [ -f kernel/kheaders.md5 ] &&
>          [ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
>          [ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
>
> log output :
> 89306 19:29:02.109961   CHK     kernel/kheaders_data.tar.xz
> 89307 19:29:02.109971 Old Tar file 2aa6990e4183c31a862951f4bcac037e
> 89308 19:29:02.109982 New Tar file hash ecf84e700c7cacfe8b35a0905859582d


I do not understand what your claim is.



CHK     kernel/kheaders_data.tar.xz

is displayed when it is checking the hash in order to
determine if the tarball should be updated.


GEN     kernel/kheaders_data.tar.xz

is displayed when the tarball is really updated.





[Incremental build with no change]


masahiro@oscar:~/ref/linux$ make -j24
  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
Kernel: arch/x86/boot/bzImage is ready  (#2)


[Touch one header and rebuild]

masahiro@oscar:~/ref/linux$ touch include/uapi/drm/exynos_drm.h
masahiro@oscar:~/ref/linux$ make -j24
  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
  GEN     kernel/kheaders_data.tar.xz
  CC      kernel/kheaders.o
  AR      kernel/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
  SORTTAB vmlinux
  SYSMAP  System.map
  MODPOST Module.symvers
  CC      arch/x86/boot/version.o
  VOFFSET arch/x86/boot/compressed/../voffset.h
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/misc.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#3)







> >> Change-Id: I7a64faebb81df44c32230b0fea1d6df09d7ce66f
> >> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> >> ---
> >>   kernel/gen_kheaders.sh | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> >> index c1510f0..5499f72 100755
> >> --- a/kernel/gen_kheaders.sh
> >> +++ b/kernel/gen_kheaders.sh
> >> @@ -51,8 +51,7 @@ this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
> >>   if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
> >>   if [ -f kernel/kheaders.md5 ] &&
> >>          [ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
> >> -       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
> >> -       [ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
> >> +       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ]; then
> >>                  exit
> >>   fi
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >
--
Best Regards
Masahiro Yamada
