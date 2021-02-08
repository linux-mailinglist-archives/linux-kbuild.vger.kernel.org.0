Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85B3313EEE
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 20:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhBHT2I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 14:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhBHT11 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 14:27:27 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1730C06178C
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Feb 2021 11:26:46 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id a16so13859221ilq.5
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2021 11:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Yr2IyuG/n1Ni5fOGP39S+RJDcTfQd8NLE76FcbF68Cw=;
        b=MQPtIRs8EyBha6ouQzU6MzRwSDp+rdkUq4yJq87c+wPer4DnPBHrZrgAng23gX/f9t
         yODRZREvZEQt8+uirCsYT8mifIqvR20/6oqTY3CVqHUOjTotfkPuep+LcwIvWUHKQqfy
         ZDfYAI6hLFi9EtATC6OK9Xp4YgJIZuF0nA4xZlg+10fqb22HAGGC1VCzD3fpAXp2AEqf
         acgxsApW2urEKIO2iCTp2RHatpHMrQPTcrSRG2qJkAdR8AVgcan7lV5HcyQB+9d05ef5
         BrYsFgseuwkrUWTmk9WKCC+bzt1rqLhdf+Gp+2uoYkGshgh46FAt2tz0TG0e+HylUyxW
         Lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Yr2IyuG/n1Ni5fOGP39S+RJDcTfQd8NLE76FcbF68Cw=;
        b=E1kk2vNQKv8IHuLjjyE0iMadJu0ddk4T76aJBUZ1YIEO5Yzel0mhzhVgjzTVH8/0oX
         vm4iDfs7xUQf6k1zpTerFnAL2I1GXnxyY51LIps7A9bqqKgJrq4wWqhaAEPfTWeW7BGx
         IFN151F2zHx+cMFaSWD2nT+0zRqNAc1YEVItwW0W/aEIBjTC5G/toN3AW5beqSPnWwXY
         /d/XsUu/vtmo4naP6CEQexWYvcnhszHqStPyukQ4ggnnpOT0u8YZ6AOBSW5wGUAvWic6
         vtceEVuXC+NpnLng+1JEAeUaO8inUG4AxzthHmfAyIpvMEAoDAP6bqrSujSKd4I+SRPD
         KWqg==
X-Gm-Message-State: AOAM533mRDZoNpyFR6v92RTu6H+I/Hxhsq5PabRsie4wbsRfiFUjT2C7
        0w4wCgxim1J4xZJ25lAN93Iv/zLFCbRiC9TUB/sDgxuW5zFOig==
X-Google-Smtp-Source: ABdhPJzOHhMyZWZpm6wED/Evlw8an3vg/X1dyzYpdhIgrTYecZM1//dJfR/dAbL5GzQkhlxUBuBD1f1wA8+wKiTqguk=
X-Received: by 2002:a92:444e:: with SMTP id a14mr16665480ilm.215.1612812406286;
 Mon, 08 Feb 2021 11:26:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUW5=1sTpo5XinSrjD5_J6o0QmoR5RsPUcnQXxdhcZdv1A@mail.gmail.com>
 <20210208181714.GZ4035784@sasha-vm>
In-Reply-To: <20210208181714.GZ4035784@sasha-vm>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 8 Feb 2021 20:26:35 +0100
Message-ID: <CA+icZUWWywP89fxdtgfZu6SZcYvRO-mGk6EiDpXAz_ZxuNWZ7g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 8, 2021 at 7:17 PM Sasha Levin <sashal@kernel.org> wrote:
>
> On Mon, Feb 08, 2021 at 04:28:00AM +0100, Sedat Dilek wrote:
> >[ Please CC me directly ]
> >
> >Hi Sasha,
> >
> >I like that patch from [1].
> >
> >What was the Linux-source base?
> >
> >Searching in Linux v5.11-rc7:
> >
> >$ git grep -E 'LINUX_VERSION_CODE >> (16|8)'
> >drivers/net/ethernet/mellanox/mlx5/core/main.c:
> >(u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >>
> >8) & 0xff),
> >drivers/scsi/gdth.c:        osv.version = (u8)(LINUX_VERSION_CODE >> 16);
> >drivers/scsi/gdth.c:        osv.subversion = (u8)(LINUX_VERSION_CODE >> 8);
> >drivers/usb/core/hcd.c:#define KERNEL_REL
> >bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> >drivers/usb/core/hcd.c:#define KERNEL_VER
> >bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
> >drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_REL
> >bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> >drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_VER
> >bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
> >include/linux/usb/composite.h:  bcdDevice =
> >bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
> >include/linux/usb/composite.h:  bcdDevice |=
> >bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
> >kernel/sys.c:           v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;
> >
> >So, drivers/scsi/gdth.c file is missing in your list of file:
>
> Right. It's on it's way out: 0653c358d2dc ("scsi: Drop gdth driver").
>
> In theory I should have fixed it too, but given that this patch is
> cosmetic I just wanted to avoid unnecessary conflicts for SFR... If it
> doesn't end up being removed we can always fix it up there.
>
>

OK, Thanks - wasn't aware of that scsi/gdth removal.

Feel free to add my:

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -
