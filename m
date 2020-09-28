Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AF927B0D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 17:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgI1PWh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 11:22:37 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30108 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1PWh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 11:22:37 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 08SFMKHH032036;
        Tue, 29 Sep 2020 00:22:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 08SFMKHH032036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601306541;
        bh=l2RYtNJEGv6odDQyTschY6TmnspnCJfqY49homszC6U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FE86Z3Q6tn4sNEGNYqULSJ656AWRuDtfECMj2QX8cqpbyxhwDD7HWHJhivtsPZlBb
         FRZK7ZovlarS6K88e/VmxmXGSsHOzgS/teFL8Scwwm5sLBZUyEQ+gq2eX8HSE7p+qK
         6P04yD/eUziW0HjAAQtbLuXfp5ytUN4iis8RObYk1ldSj0rjKF6J59oBgWC+XGkChQ
         mn0bhLMtrF+oV+fdDfuf7nvxcQzsp5ILfBpEcCIZDhSfFU87suNU/LRKVrvQB15G+w
         FzNKlPUM+E6TqbqIXPmjFGWQhc0T1FI9CY5uHkppcnFC0O6FSVJrx8qWMjgglFabAR
         5yuh164HpuD0g==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id w7so1329593pfi.4;
        Mon, 28 Sep 2020 08:22:20 -0700 (PDT)
X-Gm-Message-State: AOAM530ZX9kYgjKwcwCTjNwI9N6Ho/aNUHgxRPtz9N78mAnDqFBHVELt
        DoBvwZhUBouVm0skfxJ2c5pxnSk+VRi4Q0XiFXc=
X-Google-Smtp-Source: ABdhPJytSLFKpQUh2H9nSbUjJcbjkKrXHlE6Muo8WuwZ+6anEXAl1LeE6iw+6SKQaqCsHHLxJhKKXkky/8yCQKCo/Kk=
X-Received: by 2002:a63:d242:: with SMTP id t2mr1590083pgi.47.1601306539947;
 Mon, 28 Sep 2020 08:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200920222556.10002-1-guillem@hadrons.org>
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 29 Sep 2020 00:21:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_itc2RWzr5b3sSnYmJ9BhcqGyVDYUcF=K9S8RyM=GMA@mail.gmail.com>
Message-ID: <CAK7LNAT_itc2RWzr5b3sSnYmJ9BhcqGyVDYUcF=K9S8RyM=GMA@mail.gmail.com>
Subject: Re: [PATCH 0/7] builddeb: Improve Debian packaging
To:     Guillem Jover <guillem@hadrons.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC Ben)

On Mon, Sep 21, 2020 at 7:48 AM Guillem Jover <guillem@hadrons.org> wrote:
>
> Hi!
>
> This series fixes some packaging issues and brings it closer to
> current standards.


I am not tracking the latest development in the Debian project.

Could you give me a little more context about
what you call "current standards" ?

(It is defined in Debian Policy, or accepted as DEP-*, etc.)

For example, as for "3/7: machine-readable debian/copyright",
it is DEP-5, and can be mentioned in the commit log
for clarification.

What is the rationale for "2/7: debian/upstream/metadata" ?


Ben:
If possible, could you take a look at this series?





> Thanks,
> Guillem
>
> Guillem Jover (7):
>   builddeb: Pass -n to gzip for reproducible packages
>   builddeb: Move upstream repository URL into the upstream metadata file
>   builddeb: Switch to a machine readable copyright file
>   builddeb: Add support for all required debian/rules targets
>   builddeb: Enable rootless builds
>   builddeb: Map rc versions to use an earlier than version scheme
>   builddeb: Try to get the user full name from the GECOS field
>
>  scripts/package/builddeb | 11 ++++++--
>  scripts/package/mkdebian | 59 +++++++++++++++++++++++++++-------------
>  2 files changed, 48 insertions(+), 22 deletions(-)
>
> --
> 2.28.0.297.g1956fa8f8d
>


--
Best Regards

Masahiro Yamada
