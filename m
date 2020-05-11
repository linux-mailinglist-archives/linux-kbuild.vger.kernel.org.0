Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB7E1CE14D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2020 19:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbgEKRLF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 May 2020 13:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730799AbgEKRLE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 13:11:04 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBADC061A0C;
        Mon, 11 May 2020 10:11:04 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id b71so2478819ilg.8;
        Mon, 11 May 2020 10:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=69MN+IXy+0O8RaerPn0hhER85LhO2N7Xu7vsK1x67Tg=;
        b=cw/yHm9NdbeNOjHr7hrBg1iXLfX1uoHYg9J8A/qrnuskojPb5IaY4M0zXPyI8Poh1i
         6xh/vXVX4dcu1jD9o6FaGX1KbxhDp4pcKiB8CK8+zpz+OkKXcIQGKmCnBsIbTFFmcTUV
         3KVmRh2SPEPjcOBDX0ByP16TUzBEX4aAiwLZFcBC8+XsyYL2s6C9RvoVTgroLiCvOeKj
         OOuktJL2IT8+TVjl+FtgH6NjpsTKc+GVmkJ7Ai+tBPJ59poyNQG0g+ONgT1swr3FPIwn
         X1U1YoqFvLTsSwxQUEF/6+IGapv3c19u5hbGjFdkZY28y7bFFS+QchyvISlwP6FyH1sx
         xohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=69MN+IXy+0O8RaerPn0hhER85LhO2N7Xu7vsK1x67Tg=;
        b=AgsLZqZyr2kTVTTO+UEde6IptkxhiKr/Hsp5e6+djyksiItTvKnGhWyeOHxcPWoaQl
         TsCUCb16WUGRCi71/O6hic3gYJieFiBfPC9B+aag1vZIn0Gniy9mnAGFL5ANMg5j6laD
         EyQAUpy9FeBMYol680j7YubuGyOQHKU8VLohFZo+cZqx8YCN27cMib10LPJjVnFq83gV
         9zs5q2vtn0IQa7sVSZi+J1aOagGXNkQu4fw1DuQxp8CQ+DUGH++OfyyME6LIvEvs/Kcs
         ICXRH45myPPmo/1ixpJS8ReBlePzNvJ2mFo8U1f/BoMek43gzacrJRyEj7dXQ6pja7Yz
         Dh2w==
X-Gm-Message-State: AGi0PuaMxcf43OtEUn86N5yUCLCwZyplhNYCUYw8T9KC0iDEor7Xuz+v
        Hshr3GyOmdcFOd0h1m7oAC9xY5u4dapdY2Cef40=
X-Google-Smtp-Source: APiQypJS8vU2Rk3QzZf/qzhips08XWVSZmv+PVAZzPDqFsGZk3lfbqf8fb6lFNZEbe2LOUDgxEeDRKOfyYejgZOCZ6A=
X-Received: by 2002:a92:4152:: with SMTP id o79mr17908605ila.198.1589217063830;
 Mon, 11 May 2020 10:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200207083550.360461-1-e.velu@criteo.com> <20200211142112.649d7237@endymion>
 <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
In-Reply-To: <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
From:   Erwan Velu <erwanaliasr1@gmail.com>
Date:   Mon, 11 May 2020 19:10:52 +0200
Message-ID: <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
To:     Erwan Velu <e.velu@criteo.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Changbin Du <changbin.du@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        open list <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Jean, I don't see my patches in the 5.7-rc series.
Is there anything wrong with them ?

Le mar. 11 f=C3=A9vr. 2020 =C3=A0 14:31, Erwan Velu <e.velu@criteo.com> a =
=C3=A9crit :
>
> No issue with that.
>
> Thanks for applying.
>
> Erwan,
>
> On 11/02/2020 14:21, Jean Delvare wrote:
> > On Fri,  7 Feb 2020 09:35:47 +0100, Erwan Velu wrote:
> >> Some vendors like HPe or Dell, encode the release version of their BIO=
S
> >> in the "System BIOS {Major|Minor} Release" fields of Type 0.
> >>
> >> This information is used to know which bios release actually runs.
> >> It could be used for some quirks, debugging sessions or inventory task=
s.
> >>
> >> A typical output for a Dell system running the 65.27 bios is :
> >>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
> >>      65.27
> >>      [root@t1700 ~]#
> >>
> >> Servers that have a BMC encode the release version of their firmware i=
n the
> >>   "Embedded Controller Firmware {Major|Minor} Release" fields of Type =
0.
> >>
> >> This information is used to know which BMC release actually runs.
> >> It could be used for some quirks, debugging sessions or inventory task=
s.
> >>
> >> A typical output for a Dell system running the 3.75 bmc release is :
> >>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_relea=
se
> >>      3.75
> >>      [root@t1700 ~]#
> >>
> >> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> >> ---
> >>   drivers/firmware/dmi-id.c       |  6 ++++++
> >>   drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
> >>   include/linux/mod_devicetable.h |  2 ++
> >>   scripts/mod/file2alias.c        |  2 ++
> >>   4 files changed, 40 insertions(+)
> >> (...)
> > Applied, thanks. Note that I went for "efr" as the shortcut string for
> > DMI_EC_FIRMWARE_RELEASE, which was your first choice and has my
> > preference.
> >
