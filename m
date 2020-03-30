Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E3E1973B5
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2020 07:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgC3FNG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 01:13:06 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19780 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgC3FNG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 01:13:06 -0400
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02U5D1l9029463;
        Mon, 30 Mar 2020 14:13:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02U5D1l9029463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585545182;
        bh=2O1PRZcRzehItdBq+SOYt2I5sthUecO3gWWhCXTRP/c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P3H751RiC/8MgQANyeKWkHebxbvWFi8Dllsj27ZKgSLKD1roZKGVMMoMPTUJibyJb
         dcN+JfAdF6U1FKsiYUMS98OBOiBzl6DAVK5N+ZtkUe3+pZPZi8jYfSCMZe1sGnwLpc
         bccvt1Qc5zCIo7GWBcVL1fedqxZwEkwxli3/rONlTOVITLPqyZDWyX5t3Kx+fWcL1w
         o9Or8jwD/HqqH/epHzfRssqLoDbH3DJ3y6knSAJNhbLRK68aCC6UBp4EHQ0xFjCkws
         iLxkVYhfXTdUS7t56C6DGWl8mHvIgbksgxhy3KMijtDxB9nP21Gl/2P6yIv1aBqstb
         7anxFwACtKU/A==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id o124so4340806vkc.4;
        Sun, 29 Mar 2020 22:13:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuYrhTi6IoB3r0ZuFaciyCIykcM0vWnfprh0Y+ot1Pf9jcakH+og
        p1hqjtR9U2IYZizvqPpMbk/Um6PCgrZGwwPe2Mk=
X-Google-Smtp-Source: APiQypJcTTfLrz6NE2CFD6TIOP+rr7KaoSnH4ArjXjaCsrK70EkFivm3Wt+pUVnSxQGtA3GXt+L3qFSo3zRkcifs0nU=
X-Received: by 2002:a1f:32cf:: with SMTP id y198mr6252148vky.96.1585545180610;
 Sun, 29 Mar 2020 22:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200329110832.19961-1-masahiroy@kernel.org> <202003292126.5105600A@keescook>
In-Reply-To: <202003292126.5105600A@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 30 Mar 2020 14:12:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhnzxhMMD7b36s8u_DJ+XdU0p4RQpsjYpPxwjTU9P5ew@mail.gmail.com>
Message-ID: <CAK7LNARhnzxhMMD7b36s8u_DJ+XdU0p4RQpsjYpPxwjTU9P5ew@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: drop support for GCC <= 4.7
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On Mon, Mar 30, 2020 at 1:27 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Mar 29, 2020 at 08:08:32PM +0900, Masahiro Yamada wrote:
> > Nobody was opposed to raising minimum GCC version to 4.8 [1]
> > So, we will drop GCC <= 4.7 support sooner or later.
> >
> > We always use C++ compiler for building plugins for GCC >= 4.8.
> >
> > This commit drops the plugin support for GCC <= 4.7 a bit earlier,
> > which allows us to dump lots of code.
> >
> > [1] https://lkml.org/lkml/2020/1/23/545
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for getting this cleaned up! I look forward to the 4.8 version
> bump. :)
>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks for your Ack.
I will queue this up to kbuild tree,
and it will ease more kbuild cleanups.

Thanks.

-- 
Best Regards
Masahiro Yamada
