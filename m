Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2123F8BC4F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbfHMPAs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 11:00:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17930 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbfHMPAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:00:48 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7DF0gdk022551;
        Wed, 14 Aug 2019 00:00:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7DF0gdk022551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565708443;
        bh=Mjjx4/8PAeEqcWQLzksopUXOip0aXuED9Rvck2ZOYcc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h2JlWbMCrc2mnBoUEJ9aTL5DpH85i+UFoEkj99n8/DWA+BlL8ycTu4On5U/P1zk+3
         LlJ0Wh+TY1gJmp2kZDIJmMmC+ZHJZavgJuRfiy2BJNOQTRo8R0cpYEKgIbTGBbaAv9
         YHB4D8L/LySArKZVViQhpK4e+P40z18GQBRKN1RFQfXZaK5G3PDAQROz2KAQqvvRoN
         y7LKJUoMAZalFPp9ch5sGbDkTDH1kZFdiGXHNGe3m+RFqLn0lmJxj19zRMnJYPe7b8
         5/WKYPKOncUqPRpMD8vFB7L83H6vMvdgRIRvHkPsd1nF1dr/whwYwsDn4HF3bPBTk2
         3ZPSAWstAiZcQ==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id b20so6915444vso.1;
        Tue, 13 Aug 2019 08:00:42 -0700 (PDT)
X-Gm-Message-State: APjAAAViFB+Zs3fkgE51iF4P83acbND2hplSjm1u2ADifg00McXGaGrC
        0Fg0ONU5pUV4c0i/MuVYBVpoCLt6ULJhETRmvtw=
X-Google-Smtp-Source: APXvYqxd8r6FpfTDkqIrnk2OegNcibojaLAPxSwEMZ3vJ1oiBbWEfCC3gexdIBCVaK9qhsFk3EIGmE/wLcpypvlrQwE=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr17697475vsr.155.1565708441743;
 Tue, 13 Aug 2019 08:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <201908121448.4D023D7@keescook>
In-Reply-To: <201908121448.4D023D7@keescook>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 14 Aug 2019 00:00:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
Message-ID: <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Parameterize kallsyms generation and correct reporting
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 6:49 AM Kees Cook <keescook@chromium.org> wrote:
>
> When kallsyms generation happens, temporary vmlinux outputs are linked
> but the quiet make output doesn't report it, giving the impression that
> the prior command is taking longer than expected.
>
> Instead, report the KSYM step before the temporary linking. While at it,
> this consolidates the repeated "kallsyms generation step" into a single
> function and removes the existing copy/pasting.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Hmm, I did not notice this.

How about showing the link stage explicitly?
(Is it too verbose?)

  MODINFO modules.builtin.modinfo
  LD      .tmp_vmlinux1
  KSYMS   .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYMS   .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux


If this verbosity is OK,
you can move 'info LD  ${2}' into vmlinux_link()




Anyway, I like the clean-ups in this patch.

This is just my personal preference, but
may I ask two cosmetic changes?

[1] Could you move kallsyms_step()
    between  kallsyms() and mksysmap() ?
    I want to collect function definitions
    to the top of the script.

[2] Could you shorten 'kallsymso_previous'
    to 'kallsymso_prev' ?




-- 
Best Regards
Masahiro Yamada
