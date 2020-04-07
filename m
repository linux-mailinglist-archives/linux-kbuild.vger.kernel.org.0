Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95FBA1A155D
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 20:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgDGS4r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 14:56:47 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23206 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGS4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:56:46 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 037IuaFG023491;
        Wed, 8 Apr 2020 03:56:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 037IuaFG023491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586285797;
        bh=eUeHeZrWUB6gijhp12/6DlDlHlP6yyMhichO0vQ85xA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aL93BQD/KZoYD9HQYMg7ehpbjXwS+cfki6me8I5FVNEZRGGTM9sLCtaXI7qzYlbIq
         a2jH/kwQcEKXndSXqHo80+M1kizQiXxc8FOxZpjm3IVML0JoCspLu2lhIJBHR76Gyz
         KStsmPcYlTJNfDP3mvJCh9GnarZsh5sZfVm5cV8i7iGSTgb79FVmrlKkvp5D4upv1u
         QU6B1g+zECGapWkT4UV81MWP4eUC65ioCrgGACoY9AhUcOAMJ5fDXLIYxhGWqabBkV
         iHUOA7+nBtA0ipBzXlA3jGrSaT1jDnKx5kFAg9RmWzR7m7c/v98qVTubzzGQpDQiFu
         VfLyfP1FfH5SQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id y138so3022154vsy.0;
        Tue, 07 Apr 2020 11:56:36 -0700 (PDT)
X-Gm-Message-State: AGi0PuasuOCgbDyXNoc1zR5ad8COIcslnsyfxj5BxTBb1X8wsFeNmnE4
        yWVrNqG1cNi5/pPTW1c0J2FtoyE9741A5cfo01g=
X-Google-Smtp-Source: APiQypJROhbMEdYOY1X45l9P1b5U7DIrULDPKTPBpMG81lhpKA4Ng+E/BEBL8G5BZBrEEwId3H1obS8TpI6hhs7I+pM=
X-Received: by 2002:a67:6542:: with SMTP id z63mr3209413vsb.179.1586285795522;
 Tue, 07 Apr 2020 11:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
In-Reply-To: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Apr 2020 03:55:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
Message-ID: <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
Subject: Re: kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sedat,

On Mon, Apr 6, 2020 at 7:01 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ Please CC me I am not subscribed to this mailing-list ]
>
> Hi,
>
> I think with your patch in [1] line #56 can go away, too?
>
> [ scripts/mkcompile_h ]
>
> 53 # Generate a temporary compile.h
> 54
> 55 { echo /\* This file is auto generated, version $VERSION \*/
> 56   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi



I think the this inserts a comment line
to make sure compile.h is updated
when any of CONFIG_SMP, CONFIG_PREEMPT, CONFIG_PREEMPT_RT
is changed.

So, this is unrelated to my patch at least.


> Thanks.
>
> Regards,
> - Sedat -
>
> [1] https://patchwork.kernel.org/patch/11473667/



-- 
Best Regards
Masahiro Yamada
