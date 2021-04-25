Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7DD36A530
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 08:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhDYGwa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 02:52:30 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35774 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhDYGwa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 02:52:30 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 13P6pQtJ032069;
        Sun, 25 Apr 2021 15:51:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 13P6pQtJ032069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619333486;
        bh=fq6uHIb/cJJkatsYaLvMlRRVoSgUHXQ2F7URKcyCYjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L8oOh+l2R57U8EvoUxdxOP1jL/V7bhwvwgTBZsw8TqQBRKqEIeLRuf6kpicwXM6hk
         jr5QZsVNTNiDJTpuKtEKVFwUu6xGoTidIH3uZGAoHJlsGrx9XC5HnBqpo1EEfhuRAV
         u0o49Md09faWBYo6seI7mHNkUHqXAbAH63aZzS8ruRj30HpF2luoebqFxYV8CmxkEK
         2EJ4IMQ9TcPOGhl/TcmTUpuc77IH1gqdNerM5Vo0NkADKUA6NRgcVSVymlx1p6lcOe
         yzTcl6qZSs7njObCLn9LSSu6v1Pq0/W+sbA4PoaU/C5S/PIUSj4h963eUSH8oNxo2X
         A8xyHOzFN8YHQ==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id q2so4911324pfk.9;
        Sat, 24 Apr 2021 23:51:26 -0700 (PDT)
X-Gm-Message-State: AOAM533btbpLNKFPjbzcf9ZCqCWAoy9OKHwQQYYVVgxaDasb7OU8Jc8z
        60A51+1Efwe4MDz+bWapxo4zGrHqExsS9OnQLvA=
X-Google-Smtp-Source: ABdhPJwpLR6KMjuHnzWWb8gOxPWTrqkWjgtYZanY5FL55ShVD9qK4YevqIB/DEvejH6hDbGZ8R67vfNfIOsiMi6Aygo=
X-Received: by 2002:a63:e044:: with SMTP id n4mr11493369pgj.47.1619333485813;
 Sat, 24 Apr 2021 23:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <1619197235-13860-1-git-send-email-eberman@codeaurora.org>
In-Reply-To: <1619197235-13860-1-git-send-email-eberman@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 25 Apr 2021 15:50:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzP-pMu7Yd6nkoV_mxOUeouYNLW_xZUy94E_WCdjJ5PA@mail.gmail.com>
Message-ID: <CAK7LNASzP-pMu7Yd6nkoV_mxOUeouYNLW_xZUy94E_WCdjJ5PA@mail.gmail.com>
Subject: Re: [RESEND v2] Kbuild: Update config_data.gz only if KCONFIG_CONFIG
 materially changed
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 24, 2021 at 2:02 AM Elliot Berman <eberman@codeaurora.org> wrote:


Sorry for the delay.

This patch is over-engineering.

I will apply this.
https://patchwork.kernel.org/project/linux-kbuild/patch/20210425062407.1183801-5-masahiroy@kernel.org/

The 'cmp' command is not expensive.
md5sum is unneeded.





> If you update the timestamp of KCONFIG_CONFIG without actually changing
> anything, config_data.gz is re-generated and causes vmlinux to re-link.
> When Link Time Optimization is enabled, unnecessary re-linking of
> vmlinux is highly desirable since it adds several minutes to build time.
>
> Avoid touching config_data.gz by using a script to compare the existing
> config_data.gz, KCONFIG_CONFIG, or script itself to update only if any
> is mismatched.  The script follows gen_kheaders.sh approach for
> determing in update is needed. The script intentionally avoids
> re-compressing KCONFIG_CONFIG.
>
> The .config can be touched, for instance, by a build script which
> installs the default defconfig and then applies a defconfig fragment on
> top.
>
> For a simple example on my x86 machine, I modified x86 default defconfig to set
> CONFIG_IKCONFIG=y and run:
>   make -j50 defconfig tiny.config vmlinux
>   make -j50 defconfig tiny.config vmlinux
> With this patch, vmlinux is not re-built as a result of config_data.gz
> change.
>
> Changes in v2:
>  - Use md5 checksum to compare .config instead of gzip'ing again
>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  kernel/.gitignore         |  1 +
>  kernel/Makefile           |  4 +++-
>  kernel/gen_config_data.sh | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100755 kernel/gen_config_data.sh
>
> diff --git a/kernel/.gitignore b/kernel/.gitignore
> index 78701ea..a191136 100644
> --- a/kernel/.gitignore
> +++ b/kernel/.gitignore
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config_data.gz.md5
>  kheaders.md5
>  timeconst.h
>  hz.bc
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 320f1f3..0784bf3d 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -139,8 +139,10 @@ obj-$(CONFIG_SCF_TORTURE_TEST) += scftorture.o
>  $(obj)/configs.o: $(obj)/config_data.gz
>
>  targets += config_data.gz
> +quiet_cmd_genicfg = CHK     $(obj)/config_data.gz
> +      cmd_genicfg = $(CONFIG_SHELL) $(srctree)/kernel/gen_config_data.sh $@ $<
>  $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
> -       $(call if_changed,gzip)
> +       $(call cmd,genicfg)
>
>  $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
>
> diff --git a/kernel/gen_config_data.sh b/kernel/gen_config_data.sh
> new file mode 100755
> index 00000000..e9ff193
> --- /dev/null
> +++ b/kernel/gen_config_data.sh
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# This script generates a compressed version of .config, if its checksum has changed
> +set -e
> +
> +this_file="$(readlink -f "$0")"
> +outfile=$1
> +infile=$2
> +
> +config_md5="$(md5sum $infile | cut -d ' ' -f1)"
> +# Any changes to this script will also cause a rebuild of config_data.
> +this_file_md5="$(md5sum $sfile | cut -d ' ' -f1)"
> +if [ -f $outfile ]; then outfile_md5="$(md5sum $outfile | cut -d ' ' -f1)"; fi
> +
> +if [ -f $outfile.md5 ] &&
> +       [ "$(head -n 1 $outfile.md5)" = "$config_md5" ] &&
> +       [ "$(head -n 2 $outfile.md5 | tail -n 1)" = "$this_file_md5" ] &&
> +       [ "$(tail -n 1 $outfile.md5)" = "$outfile_md5" ]; then
> +               exit
> +fi
> +
> +if [ "${quiet}" != "silent_" ]; then
> +       echo "  GEN     $outfile"
> +fi
> +
> +${KGZIP} -c -n -f -9 $infile > $outfile
> +
> +echo "$config_md5" > $outfile.md5
> +echo "$this_file_md5" >> $outfile.md5
> +echo "$(md5sum $outfile | cut -d ' ' -f1)" >> $outfile.md5
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
