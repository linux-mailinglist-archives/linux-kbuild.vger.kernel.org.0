Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE5438D2BB
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 May 2021 03:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhEVBIg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 May 2021 21:08:36 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63775 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhEVBIg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 May 2021 21:08:36 -0400
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 14M16pBN026977;
        Sat, 22 May 2021 10:06:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 14M16pBN026977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621645611;
        bh=OcW/O9TMsS58qq1xo0CibXOknhqMRmePaouu9fMkfY4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uBYt76FfZoy3nH1550IfEZm4dbDF+c3S7AjLvQp6RyLVUgOyz4h3asXfLJ/fwsG9b
         z5VPg92CUT55MMqgYTbRtXfxL8TGSp3IcfPlEYEso+CaATf+rSsf1XLPboLKZbWYkt
         4Xf6s6OPuOUdHHOpRxQ2Y6+WHX6Z7PjFkMQgX7qcsC9T5O4XUuHYxO5jKB2CXLf199
         WQxzi7kSUrMrmzRg3lmO5gL+lbcJP+qWAi+0sZAHUxm6PycvwAWjpbJ/5Aux5Wk4zv
         5DcEFlT+EfWxz1nPq6tr/pm1sQFTUrgbCj2/VMc64i298TgzvTGzjaN+ooRYF2Qi8Z
         EZgR9kLCPeZAQ==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id v14so12824681pgi.6;
        Fri, 21 May 2021 18:06:51 -0700 (PDT)
X-Gm-Message-State: AOAM530nySj/nJGjAiUi2I/WdZFXpKHykvrkyZc2iZ7eT+lAjFGZcjvh
        dE2rqUcP7NwiJv8iT8pB8KDFTFD64FWclDqEtQY=
X-Google-Smtp-Source: ABdhPJzWVZnmJADXK+kym1XqzulWBEP4eh8sZgUOGIIVZKy28OFx9gj/LSu/10rlvB81XB3oTpgeL/yHBzNfGxvf3wM=
X-Received: by 2002:a63:a547:: with SMTP id r7mr1503648pgu.7.1621645610684;
 Fri, 21 May 2021 18:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210319000708.1694662-1-ndesaulniers@google.com>
 <20210323190532.eiqxmskiankf7hn3@archlinux-ax161> <CAF2Aj3i3-bev_iS6OrBUTzt==4d0f7UiTeY1YPur6eKFqToFYQ@mail.gmail.com>
In-Reply-To: <CAF2Aj3i3-bev_iS6OrBUTzt==4d0f7UiTeY1YPur6eKFqToFYQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 May 2021 10:06:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
Message-ID: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: fix GDB warning with CONFIG_RELR
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 21, 2021 at 6:36 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 23 Mar 2021 at 19:06, Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Thu, Mar 18, 2021 at 05:07:06PM -0700, Nick Desaulniers wrote:
>> > GDB produces the following warning when debugging kernels built with
>> > CONFIG_RELR:
>> >
>> > BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'
>> >
>> > when loading a kernel built with CONFIG_RELR into GDB. It can also
>> > prevent debugging symbols using such relocations.
>> >
>> > Peter sugguests:
>> >   [That flag] means that lld will use dynamic tags and section type
>> >   numbers in the OS-specific range rather than the generic range. The
>> >   kernel itself doesn't care about these numbers; it determines the
>> >   location of the RELR section using symbols defined by a linker script.
>> >
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1057
>> > Suggested-by: Peter Collingbourne <pcc@google.com>
>> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>
>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
>
>  Masahiro,
>
> Would you mind sharing your plans for this reviewed patch please?
>


Do you want me to pick up this?

Or, do you think it should be done by the committer of
5cf896fb6be3effd9aea455b22213e27be8bdb1d ?


-- 
Best Regards
Masahiro Yamada
