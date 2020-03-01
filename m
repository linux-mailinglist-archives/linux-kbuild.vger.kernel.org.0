Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C98C174A9F
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Mar 2020 02:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCABEN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Feb 2020 20:04:13 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58052 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCABEN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Feb 2020 20:04:13 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 021145h9004480;
        Sun, 1 Mar 2020 10:04:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 021145h9004480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583024646;
        bh=MSqFcgJbmSE08ec8AxyjPeQKskX4mRh+c7oBtzH2Vrc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PwCVGVXVEKTgsuG7D5/tlT7kyE+kkhRaLUXQ/HNnGGOz/mUNnuyRxYtFum+Wd3JEu
         V4/N5HCxeCCBSUw93akdFXBmA5kPnYPC377woyYimpl6iCNiJlRV8/2bwPl0CSBrcw
         iIG2LN2fLDhFkn2Wl2W1FfihbK2F9NB15dRy80hbDBRrYuts7o8O+dieZdQeQKJmP6
         d/ZxHf1r9JEBxum87L1xHv2Js2jP3bPMY6MHXm9bvMZnxO+SbWqp0Y2zkBAxWdZJ+m
         6jI5qVu3qmg4PDxmYHX4gATaJyKyriUrMqYD9Y0dLJZyXJjhf/qV0xQjVHKE2280lv
         Kqn/L+EAn6ALQ==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id y201so2006501vky.8;
        Sat, 29 Feb 2020 17:04:05 -0800 (PST)
X-Gm-Message-State: ANhLgQ147jqvJwfhGvVPxK/vIcwsq2uW/Md/oY7Fc2YE1azxGTP/lHDM
        VAwJhqLxtN15ds15BzTRr8bWPOb8m/o1sk1qnuE=
X-Google-Smtp-Source: ADFU+vuztPG2oOUZNRaWd8YCFbE7NPYByA0CGxa4wwrfcTmULOMpQO1NoD0HZ00X8nVMR1R6+0leTaA2n/ylFtIz2W0=
X-Received: by 2002:a1f:3f0d:: with SMTP id m13mr4014247vka.96.1583024644419;
 Sat, 29 Feb 2020 17:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20200229160959.871801-1-sz.lin@moxa.com>
In-Reply-To: <20200229160959.871801-1-sz.lin@moxa.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 1 Mar 2020 10:03:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf0L1BCaYKqHPAcWwGqcGJgpAdF-QU7_ZVy4H_ygCtRg@mail.gmail.com>
Message-ID: <CAK7LNAQf0L1BCaYKqHPAcWwGqcGJgpAdF-QU7_ZVy4H_ygCtRg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix inconsistent comment
To:     =?UTF-8?B?U1ogTGluICjmnpfkuIrmmbop?= <sz.lin@moxa.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Kaiden PK Yu <KaidenPK.Yu@moxa.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 1, 2020 at 1:10 AM SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <sz.lin=
@moxa.com> wrote:
>
> The commit 2042b5486bd3 ("kbuild: unset variables in top Makefile
> instead of setting 0") renamed the variable from "config-targets"
> to "config-build", the comment should be consistent accordingly.
>
> Signed-off-by: Kaiden PK Yu (=E4=BD=99=E6=B3=8A=E9=8E=A7) <KaidenPK.Yu@mo=
xa.com>
> Signed-off-by: SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <sz.lin@moxa.com>
> ---


Applied to linux-kbuild.
Thanks.



>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 90ee2a22e88b..01ac935f28bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1805,7 +1805,7 @@ existing-targets :=3D $(wildcard $(sort $(targets))=
)
>
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>
> -endif # config-targets
> +endif # config-build
>  endif # mixed-build
>  endif # need-sub-make
>
> --
> 2.25.1
>


--=20
Best Regards
Masahiro Yamada
