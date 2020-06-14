Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEA51F862A
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2020 03:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgFNBv3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Jun 2020 21:51:29 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26397 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgFNBv3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 21:51:29 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05E1ooW0015134;
        Sun, 14 Jun 2020 10:50:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05E1ooW0015134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592099451;
        bh=GQBXDHKG3+vS9ypmfRF2QbuQ9g5OR8ACUKa6sOMPEhA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MUiKpod+J8GKQ9Vhby2Bp/R34t5PGJ2UT1rchgyOwLAkFL/cn6hczn3ijPguE+WZ3
         mvL/2u1YMpn82m2a9gxHD74bFTtN0skWsJuSb0WTE5C+LGT2caVvuHuU7pZ9UmAMvA
         yg/JX5g3oilrmZuaGHZFQHg1m3wwdJMYs2PQuwWa7Cj84EOa4l6lREKtic73NJoyaZ
         UEI7YPV6YHCumqd69mDdXDhl+WRAwdQZIfF7tU+nOjX+JzvRB1CS8ZrrJ+bpPX7CPx
         nV1DEwQbgGEMalggLZ6dbU365tTh5PMxrnlDq1m7XAqz0LMifU+PvARrnv1auRKDSs
         MpoaoSwH7EBBA==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id r1so4501089uam.6;
        Sat, 13 Jun 2020 18:50:51 -0700 (PDT)
X-Gm-Message-State: AOAM533uumdH1unKovZLxF8/4g0dXKl2xfdWsibAU2KaUStHlc0p5syx
        Z+AzbeELdXrO9KGJhLSjv5WLg7oR6FbwjHG+QZg=
X-Google-Smtp-Source: ABdhPJzDZICKzSOdJGg5+sZdTV3oSuKdI+CB+jQCnfg0ayk9ISuG0RRMYEh7pwsjcC0snS22F9GMPYJ0TMuNooi+pz0=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr15381305uae.121.1592099450258;
 Sat, 13 Jun 2020 18:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
 <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
In-Reply-To: <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 14 Jun 2020 10:50:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpHO0SiaciFMJ46yZsix7yPn=E5+k8fqBaXHpayR=wxg@mail.gmail.com>
Message-ID: <CAK7LNASpHO0SiaciFMJ46yZsix7yPn=E5+k8fqBaXHpayR=wxg@mail.gmail.com>
Subject: Re: [GIT PULL] more Kbuild updates for v5.8-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Sun, Jun 14, 2020 at 5:43 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Jun 13, 2020 at 10:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> >  - fix build rules in binderfs sample
>
> .. oh, and now that this builds, it also made it obvious that the
> .gitignore file was missing.
>
>           Linus


Thank you for the fixes!


-- 
Best Regards
Masahiro Yamada
