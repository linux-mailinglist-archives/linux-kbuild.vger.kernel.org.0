Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34926312957
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 04:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBHD2x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Feb 2021 22:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBHD2w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Feb 2021 22:28:52 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877F9C06174A
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Feb 2021 19:28:12 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id q5so11459331ilc.10
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Feb 2021 19:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=WcDuOh+01nddxn86eEPRgU3ujSfVFFeih6iyUi7wvPk=;
        b=XjbWn+ux7zHyoSRt1u0p/r7pduyOt5kEzFqbc4n6rBojyCXjosEtSOFVSNOFZVS6Wy
         Mof5yGPdfP9P+vvKUonZrmICDRUGVn7YbaTJbw1+fU6XhH1a5rOF8QoEUDAOs4wMZdas
         zsAwftQ+hVnERM01Dq6OLvkPdz1ZvHoS6e2sqc8uLdapV46a/AcczEG9y2R9+yGRxFau
         L1kD8sKvIgwH1iMTHVw+6ldtPMCXluU3/M6U8ngw9h2TVJIY13lAw8qxVAZD4fpYN8OK
         yTndba4zMNwmFaOyCtyCAnFGRCtxq9Qk3n5wiQdzyJwsmnm4tnc1G5iAgk4g8lcLI19u
         7p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=WcDuOh+01nddxn86eEPRgU3ujSfVFFeih6iyUi7wvPk=;
        b=r7x32A43uipdJh34/SBYiRtL0AJjfOxVX/OW7cm4eYt+aqtG/bzbHwz12wFp5OldkK
         LOF3ZTYmnfhT3qLd5epBz4ztNXtc8oHOiTjrUJMgAmCNAipsFScQzwFY0d4+rzilSa07
         boHerIiNN4U2zDtr9ChM+9Y9cG5/vMs38MReWEQ1kQ/i+u83V6TYkIcobh85jM58L2J8
         ttXMayZ4F0lCuMFazm/HpwFcY9FgvkH3BhE9V2/BpSFOGGSDlNfBSF8UzFDHEVyCO+1v
         GlNmAitbDj31m1JA3l1zrBHogaFU2au2p2z48+6xCTUwdwqYkvqeJ6zDGtcCe2QKvwQK
         LhUg==
X-Gm-Message-State: AOAM532TnPCjEOjMQNwRzjnq+cmMhZFqW4Jrhc21BV1+UTiZe0SEgpPN
        OjVqR3xzghMhVrWxrlzRgkrsst6Hnnwa/EwsY2I=
X-Google-Smtp-Source: ABdhPJyL3yGGKKoNOfaBY5xt0GnALbvBq/IPGVUf+f1udf6dOQaxBWgnF5oH/CYWvVxfx5whc1u90Pd/h4DCwsgC/RM=
X-Received: by 2002:a05:6e02:d0:: with SMTP id r16mr13785660ilq.112.1612754891311;
 Sun, 07 Feb 2021 19:28:11 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 8 Feb 2021 04:28:00 +0100
Message-ID: <CA+icZUW5=1sTpo5XinSrjD5_J6o0QmoR5RsPUcnQXxdhcZdv1A@mail.gmail.com>
Subject: [PATCH] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ Please CC me directly ]

Hi Sasha,

I like that patch from [1].

What was the Linux-source base?

Searching in Linux v5.11-rc7:

$ git grep -E 'LINUX_VERSION_CODE >> (16|8)'
drivers/net/ethernet/mellanox/mlx5/core/main.c:
(u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >>
8) & 0xff),
drivers/scsi/gdth.c:        osv.version = (u8)(LINUX_VERSION_CODE >> 16);
drivers/scsi/gdth.c:        osv.subversion = (u8)(LINUX_VERSION_CODE >> 8);
drivers/usb/core/hcd.c:#define KERNEL_REL
bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
drivers/usb/core/hcd.c:#define KERNEL_VER
bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_REL
bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_VER
bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
include/linux/usb/composite.h:  bcdDevice =
bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
include/linux/usb/composite.h:  bcdDevice |=
bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
kernel/sys.c:           v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;

So, drivers/scsi/gdth.c file is missing in your list of file:

 Makefile                                       | 5 ++++-
 drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
 drivers/usb/core/hcd.c                         | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
 include/linux/usb/composite.h                  | 4 ++--
 kernel/sys.c                                   | 2 +-
 6 files changed, 13 insertions(+), 10 deletions(-)

Thanks.

Regards,
- Sedat -

[1] https://marc.info/?l=linux-kbuild&m=161271450004520&w=2
