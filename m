Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C440382558
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 09:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235278AbhEQHbC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 03:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:56664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235262AbhEQHbC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 03:31:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F9DC611ED;
        Mon, 17 May 2021 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621236586;
        bh=+yfdlJ6Wicz3yW7oKajBeQncUeT+3DhAWhsuqIxxxGk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XXFvX0vLcFlkf7hxBCi3Ry0DTt8wCaZT4IrN0f10nSNiO0l0dgFoY3a0nIC3cPIhA
         wXINg4KTF5vou8Xke1SSU8ZWG8VhjkGmOqKO/7ybrS20SyXTqn5EE9mRebgOUNlIgi
         /no0vCicWzr9J34Ur05ZOwEOg2/9sGz4MkirRRhZxyOzCay7LeLy1awn3wbSgrT0/C
         Mun71U3pg9ddv7P+DHEcuDt4ndDEQlLWYcNKhvNI32ioSrVCHewn9SJ0vjw9ttxfC1
         cJ8VnWqKg6X9MuqxRwwZJ7S4BH2s6aMlkVvVEm+127kdLUN38Ehtp+7VWiBx57PnpK
         dms/EjL2t5QEQ==
Received: by mail-wm1-f41.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so1542937wmg.3;
        Mon, 17 May 2021 00:29:46 -0700 (PDT)
X-Gm-Message-State: AOAM530dz9Mm/zQqLxj4QoAenlsaLoEWlaBY6HrJIUN12s9iGflLUErB
        LV8RQfxdtCuznxq5msukqvl7oiZtWrZTmG9XkWo=
X-Google-Smtp-Source: ABdhPJxhc4Ni8kBTdWXHrMR/kPMFtfISmVnCO4V5rDqBxV1YWaDDlTlnQVE6IRZHLzi+54j9mgnWrkfmz1RmkEeDThI=
X-Received: by 2002:a1c:9895:: with SMTP id a143mr1119020wme.43.1621236585183;
 Mon, 17 May 2021 00:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210514135752.2910387-1-arnd@kernel.org> <CAK7LNARjwrqja-qsOhTSw7Lje0=U6o7HNEu0ESOkb446TdWYwQ@mail.gmail.com>
In-Reply-To: <CAK7LNARjwrqja-qsOhTSw7Lje0=U6o7HNEu0ESOkb446TdWYwQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 17 May 2021 09:28:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2wJpzro1n-37+bbfOANWbQyyzRHRhPRD5U2UoYWTDY2A@mail.gmail.com>
Message-ID: <CAK8P3a2wJpzro1n-37+bbfOANWbQyyzRHRhPRD5U2UoYWTDY2A@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: shut up uboot mkimage output when building quietly
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 17, 2021 at 9:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, May 14, 2021 at 10:58 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When building with 'make -s', most architectures produce no output
> > at all unless there are warnings. However, on at leat mips and nios2
> > there is output from /usr/bin/mkimage when that is installed:
> >
> >   Image Name:   Linux-5.12.0-next-20210427-00716
> >   Created:      Wed Apr 28 22:03:30 2021
> >   Image Type:   NIOS II Linux Kernel Image (gzip compressed)
> >   Data Size:    2245876 Bytes = 2193.24 KiB = 2.14 MiB
> >   Load Address: d0000000
> >   Entry Point:  d0000000
> >
> > Make these behave like the others and check for the '${quiet}'
> > variable to see if we should redirect the output to /dev/null.
> > Any errors and warnings from mkimage will still be seen as those
> > get sent to stderr.
>
> Thanks for the report, but I rather want to suppress stdout
> in the kbuild core macro.
>
> I wrote this patch.
> https://lore.kernel.org/patchwork/patch/1429409/

Looks good, thank you for taking care of it.

       Arnd
