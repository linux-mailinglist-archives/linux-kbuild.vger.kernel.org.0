Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA51349818
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 18:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYRdu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 13:33:50 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36146 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCYRdo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 13:33:44 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 12PHXQ5q026115;
        Fri, 26 Mar 2021 02:33:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 12PHXQ5q026115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616693607;
        bh=68tUh9PJpU/8+TqriEVVDbQ9FSkE/5YIvRFSY62KdKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m4gbwUjWbWspFFJ24fIKpw5/kKv5GbZysiyh++QgahV81HyB5/EnNw+UjiVwYTGFO
         pG27nr5gtyBM1VAPW4n7ZpSGHd4TJzUR7Ikt2tF01+lg/7hTy5nkkxxhjGEX2wA1lm
         vEfMAfzuQDUaluYaZxNxemRWNUJcboiL8a7lX/Lpkt5c3qsXlPMVlcHuPLwiw7kacD
         t7FvQinBfiAfe9gGR9PVRniEr6T89wP/fRun7IKojL0WVtA1rPUl0qUaieNDHrfSI6
         LMS7pPOYxRc1e4/iANmybaEHP0vqUDbsRT6/CheHZ7HSFNuwOetLmUUTrm0Qh5t1D6
         Rf6/OFplOTHSg==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id i22so2517169pgl.4;
        Thu, 25 Mar 2021 10:33:26 -0700 (PDT)
X-Gm-Message-State: AOAM531q3oIEQupQrc7frA06SRZAqMdkUR+qk7en1WSR8eOYu81VN7iv
        balYl7WgN+kue91F6fN+pQgHAh+JPsQB1oIJ9s4=
X-Google-Smtp-Source: ABdhPJxbZfEX9vIMdcyW23sMrMktsbD0MG81+m5RQ/q0dveDBM5doq0V9JivggmV/psnyAhwuZqMEKpjobeF3F3p8H8=
X-Received: by 2002:aa7:956d:0:b029:1f1:5ba6:2a58 with SMTP id
 x13-20020aa7956d0000b02901f15ba62a58mr9210950pfq.63.1616693605945; Thu, 25
 Mar 2021 10:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210319143231.25500-1-olaf@aepfle.de> <20210325121606.6a2e4e00.olaf@aepfle.de>
 <CAK7LNARPs97+eQKMop9cYCs=D4Kwsf_5pq-614OUxT2iZptueg@mail.gmail.com> <20210325180735.1f0238f1.olaf@aepfle.de>
In-Reply-To: <20210325180735.1f0238f1.olaf@aepfle.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Mar 2021 02:32:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATaDL0h6wA16jNBCg=zg8XL2zSSPLyvq6mriLDTjO0LMQ@mail.gmail.com>
Message-ID: <CAK7LNATaDL0h6wA16jNBCg=zg8XL2zSSPLyvq6mriLDTjO0LMQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enforce -Werror=unused-result
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 26, 2021 at 2:07 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Am Fri, 26 Mar 2021 01:55:41 +0900
> schrieb Masahiro Yamada <masahiroy@kernel.org>:
>
> > What about  drivers/net/ethernet/lantiq_etop.c  ?
>
> Nothing complained about it. I guess there is a build-bot for alpha, but none for mips.
>
> > I got a lot of complaints in the last trial.
>
> Why did you get complains, instead of me?
>
>
> What is the "must" in "__must_check" worth if it is not enforced...
>
> Olaf


In hindsight, __must_check may not be a perfect name.

Miguel suggested __nodiscard to get along with:
https://en.cppreference.com/w/c/language/attributes/nodiscard

It is not enforcing. Just a compiler warning.


-- 
Best Regards
Masahiro Yamada
