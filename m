Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A472F5AE2
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 07:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbhANGrI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 01:47:08 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:40344 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbhANGrH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 01:47:07 -0500
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10E6k9iY030196
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 15:46:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10E6k9iY030196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610606770;
        bh=mHLFT+IWUwYHCskgaX6531aL8n+iS0aGqgnIuuCIBjU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HWB9uKvzuYFUbFJjdW1XcPvAt0qwCHnQMxKtjbupqE25njCc0vQyaEGFWCneCgfNw
         zj258MOnSSED4sqzTWyqV9+ShufgDS9o3z4IAS+v7f8QroiZEudSQd1FybfXMK9bs8
         czDaRbKBCM0Xgjbb7rtNxR3EHC+AZR9FzfTk26XFQD77lxHuKeW8Wy5DqzS+hkh6TB
         WXYECOUCZaOxNmgTR2CCM0pF+IK7cF3F6GHL0q20rWumQVnHYObKWN6hRB5F0utpiy
         2FiWjnsJC5U0MWtJQRpN8EKHNRrQj8lj+1859nVVx50db2JKnIb9o7J3vTT+cEH/Yd
         liqyilM3iSQtQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id ce17so404362pjb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 22:46:09 -0800 (PST)
X-Gm-Message-State: AOAM532LMwgp0GAE65cHnSAsrnT/6UBuig9IPGwERHSxXq5RGBBTRxx7
        /YgIrcIdmy89z56f6Qz6sHZp5LBYYg+eVnDCJmo=
X-Google-Smtp-Source: ABdhPJxdjdjl5mtc4WHdiuwnGK7szhVsmeanNYmGhvJqIhdXdRRW7katuxGKHPOU5ym84VgMIX+8gFpKUCeYEr2PHuM=
X-Received: by 2002:a17:902:a5c5:b029:de:30b0:f1d with SMTP id
 t5-20020a170902a5c5b02900de30b00f1dmr6281657plq.1.1610606769169; Wed, 13 Jan
 2021 22:46:09 -0800 (PST)
MIME-Version: 1.0
References: <17c5b8c7-80c4-c2b4-6eaf-704bfabb0a3c@linux.com>
In-Reply-To: <17c5b8c7-80c4-c2b4-6eaf-704bfabb0a3c@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 14 Jan 2021 15:45:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+cFYf8TETRYnVdMUQ=_s3XauEv3K_q6sath1NtOWhiw@mail.gmail.com>
Message-ID: <CAK7LNAQ+cFYf8TETRYnVdMUQ=_s3XauEv3K_q6sath1NtOWhiw@mail.gmail.com>
Subject: Re: What CONFIG_ option enables compilation of *.o file?
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 10, 2021 at 3:21 AM Denis Efremov <efremov@linux.com> wrote:
>
> Hi,
>
> Is there a general way to get information about what CONFIG_ options
> enable compilation of *.o (*.[ch]) file? Maybe with kconfig command or from
> some generated files?


As far as I know, there is no tool or kconfig command to know
what CONFIG option enables which object.

I also check Makefiles as you did below.




This is my workflow.

I have my own utility functions in ~/.bashrc

kgrep - grep only Kconfig files
mgrep - grep only Makefiles

function kgrep()
{
        find . -name .repo -prune -o -name .git -prune -o -type f \
        \( -name 'Kconfig*' -o -name 'Config.in' \) \
        -print0 | xargs -0 grep --color -n "$@"
}

function mgrep()
{
        find . -name .repo -prune -o -name .git -prune -o -type f \
        \( -name 'Makefile*' -o -name 'Kbuild*' -o -name "*.mk" \) \
        -print0 | xargs -0 grep --color -n "$@"
}


Then, I get this:

masahiro@grover:~/ref/linux-next$ mgrep floppy.o
./drivers/block/Makefile:14:obj-$(CONFIG_BLK_DEV_FD) += floppy.o
./drivers/ide/Makefile:92: ide-gd_mod-y += ide-floppy.o ide-floppy_ioctl.o



Maybe, there is a better way...




> I mean, to get information that, for example:
> 1) driver/block/floppy.o depends on CONFIG_BLK_DEV_FD
>
> From driver/block/Makefile:
>         obj-$(CONFIG_BLK_DEV_FD)        += floppy.o
>
> 2) kernel/trace/trace_selftest_dynamic.o depends on CONFIG_FTRACE_SELFTEST
>
> From kernel/trace/Makefile:
>         ifdef CONFIG_FTRACE_SELFTEST
>         obj-y += trace_selftest_dynamic.o
>         endif
>
> 3) kernel/trace/trace_irqsoff.o depends on either CONFIG_IRQSOFF_TRACER
>    or CONFIG_PREEMPT_TRACER
>
> From kernel/trace/Makefile:
>         obj-$(CONFIG_IRQSOFF_TRACER) += trace_irqsoff.o
>         obj-$(CONFIG_PREEMPT_TRACER) += trace_irqsoff.o
>
> 4) drivers/dax/bus.o depends on CONFIG_DAX
>
> From drivers/dax/Makefile:
>         obj-$(CONFIG_DAX) += dax.o
>         dax-y += bus.o
>
> 5) drivers/soc/bcm/brcmstb/common.o depends on CONFIG_SOC_BRCMSTB
>
> From drivers/Makefile:
>         obj-y                           += soc/
> From drivers/soc/Makefile:
>         obj-y                           += bcm/
> From drivers/soc/bcm/Makefile:
>         obj-$(CONFIG_SOC_BRCMSTB)       += brcmstb/
> From drivers/soc/bcm/brcmstb/Makefile
>         obj-y += common.o
>
> Thanks,
> Denis
>


-- 
Best Regards
Masahiro Yamada
