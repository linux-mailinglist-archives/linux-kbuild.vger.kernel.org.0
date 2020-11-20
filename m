Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1AB2BAFC0
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Nov 2020 17:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbgKTQN2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 11:13:28 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48850 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgKTQN2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 11:13:28 -0500
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0AKGDATV012139;
        Sat, 21 Nov 2020 01:13:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0AKGDATV012139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1605888791;
        bh=iU2E8WqK+GYbABrMQGSxjO38FdbIP5ezM11ClAh2md4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y6hpSTcyZQur9J8qBkV94ABkicqMtyfdsa3J1XWe3W6CdonlBM71JzlumpvdvcVWc
         nP1ZGAR6a4hI3246oW+2AABY0w9kNLtYwuOActCIR8ShOO/oFINgZeKRnwAv57cHl8
         vyk5FZOEn7luPaw9GCfGE4S4Xbl9LajHU8AcTeCfx3sZre8cLjy26Fg6DKLF+KO/hw
         4lR64aPl3AE+U4QoZsXw2XtGCE0lIEYLylO8FyIlm/WUHcRSZ4rD9g9RMCBzqzZiWj
         Jd8KtOX0i3RRI4Hlm/pIBOV0dcZBBYDcN97rgEQQ2OhYx/uSlgkrB0t4rKr+yF1zG9
         mRfFtf27Ttx4A==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id 10so8296367pfp.5;
        Fri, 20 Nov 2020 08:13:10 -0800 (PST)
X-Gm-Message-State: AOAM531cJ+wP8OxOXFX1TRu7du13ftxOi6ABuVJzDuPB0hxhQyvk2p4h
        eu9Y1dXWLfAQQ4/183bBJekyh2nl8am7Q3+OUVE=
X-Google-Smtp-Source: ABdhPJxhmT65Kyzw9ITyap9ViNyzzNdTxYz77+nZczLuZhgcEzQaVPH3QmKIeErf3blDFui4aXgctDj1N5hln7e6TDw=
X-Received: by 2002:a63:c00b:: with SMTP id h11mr17167737pgg.7.1605888790218;
 Fri, 20 Nov 2020 08:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20201102120853.96855-1-dzagorui@cisco.com> <1604929732138.17256@cisco.com>
 <1605704642269.72893@cisco.com>
In-Reply-To: <1605704642269.72893@cisco.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 21 Nov 2020 01:12:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQuoNeMTMqCssT8iHQJOfqwt7NTLHow_4ebrxCZoi_KCg@mail.gmail.com>
Message-ID: <CAK7LNAQuoNeMTMqCssT8iHQJOfqwt7NTLHow_4ebrxCZoi_KCg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
To:     "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" 
        <dzagorui@cisco.com>
Cc:     "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 18, 2020 at 10:04 PM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC at Cisco) <dzagorui@cisco.com> wrote:
>
> > ping
>
> Any comments on this ?
>
> Thanks,
> Denys
>


Sorry for the delay. Now applied.




I fixed the first sentence:

Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make
__FILE__ a relative path") commit.

to

Follow-up to commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to
make __FILE__ a relative path").






> Assembler sources also use __FILE__
> macro so this flag should be also apllied to that sources.

I fixed "apllied" to "applied".




Maybe, "that sources" should be "those sources".





--
Best Regards
Masahiro Yamada
