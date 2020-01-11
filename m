Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C03DB137C16
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 08:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgAKH0y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 02:26:54 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19034 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAKH0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:26:53 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00B7Qkqn019522;
        Sat, 11 Jan 2020 16:26:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00B7Qkqn019522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578727606;
        bh=Oez0PWkvJzbirGu9XUv5GpDknxpE3iT4wQ/WGTnEZGk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OU9VyRCAg63hXHlPj7fZjZnHsl+P3BkEMahAtPeWhzL/R1IZjBlQ3QagqhAqCUise
         fWCzryK8QNRlChSpBKzL4Nk5LfV4rw4+opIGEQzjBcC8umw4Lvtt8Hb7gKz4CTlsc6
         CH4LtfhzkL96GlvoAq1UCkLGHPfbomOAc1ot1qAtna8iJFBTzIMuvhyNSxWFd14xTw
         WmgckwYMpRzwIOcsZrNTpI8ztFSh5N6id6Yet/YUrkKh7wendZVsL6QegPA9ivjk8G
         1emxX8rvyi7xqCCLT9lgRy2uBz0G6VROMn/UsS1G/Q3o+FxX5W5X2FvIpw9bM4VmSm
         yWLUWJ73+GmFA==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id n27so2772127vsa.0;
        Fri, 10 Jan 2020 23:26:46 -0800 (PST)
X-Gm-Message-State: APjAAAWJ5Q36dKZEV6EETNc7Efe6JYEgNKZLiMEOIQSr4TIDO1dqy9Mf
        K7QocBnfX2oAKqi+AMQGSjh8MUevkf1t0AIMP+g=
X-Google-Smtp-Source: APXvYqySGvEmaVJEV6CA9jXihO26Mjnu9i7UKdrtysB9lRCJ4u643fD/6pElVAeDnNEu2QzhOVz4inVeQ+YeDU8+D9Y=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr1343996vsh.179.1578727605332;
 Fri, 10 Jan 2020 23:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20200104153651.2258-1-masahiroy@kernel.org> <20200106.133336.719905028750983361.davem@redhat.com>
In-Reply-To: <20200106.133336.719905028750983361.davem@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 16:26:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGJvim3Mfp3LqLd2kKR-HLM0vwwx81fSAQtWZHuqYsFw@mail.gmail.com>
Message-ID: <CAK7LNASGJvim3Mfp3LqLd2kKR-HLM0vwwx81fSAQtWZHuqYsFw@mail.gmail.com>
Subject: Re: [PATCH] modpost: assume STT_SPARC_REGISTER is defined
To:     David Miller <davem@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, bcollins@debian.org,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 7, 2020 at 6:33 AM David Miller <davem@redhat.com> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
> Date: Sun,  5 Jan 2020 00:36:51 +0900
>
> > Commit 8d5290149ee1 ("[SPARC]: Deal with glibc changing macro names in
> > modpost.c") was more than 14 years ago. STT_SPARC_REGISTER is hopefully
> > defined in elf.h of recent C libraries.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: David S. Miller <davem@davemloft.net>
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
