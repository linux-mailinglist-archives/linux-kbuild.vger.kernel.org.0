Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2376532D890
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 18:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239267AbhCDRZk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 12:25:40 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62467 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239270AbhCDRZe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 12:25:34 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 124HOfuh025391;
        Fri, 5 Mar 2021 02:24:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 124HOfuh025391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614878682;
        bh=mH77c3uCs2Oa4931LLCRe0DKKGZoiw45kjLV/2Rm9TQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TCG6Yq6GhZj9b2FWRqK43nagOgRfrJ4kO13obLagiZMw4a4kU0BxifTmq5zpmLKNk
         WsB464WeZDUbeZjhOdAZrEwINt1AItuC/jF6bwgKdWDvuQAX8KAdQfktWZg6Ybchk9
         laMnhAiOo7IJSYvDqcmohQiJOpS/PIJ32EtLKVxCmQW/cOUR4/hxLuXRz12w+Pdkhp
         mm9MjbbHmcP+yKq9iDTttDe2zAy1V6kePurZryQjIWEWQ00FG+xa6i3HQiOwiqiUGz
         0WusAepr/7dgAFEaGpjjEACYmp6BNedWueooPKEDjAkvQtRFOfyAwSC2xTp98V2JZ7
         O7xmV6fARIstA==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id s16so16521590plr.9;
        Thu, 04 Mar 2021 09:24:42 -0800 (PST)
X-Gm-Message-State: AOAM531PwthnxxdG0JmQ8M6Cb2s7KT00cng93jIWYBUlBjqaMIwielnQ
        +PwTOYcp5yBxsBXbgaZuo4gM6n02VvEFuRit4Jo=
X-Google-Smtp-Source: ABdhPJxnIzlps3JGsu1ohACE3In8kpfFOXaGZCpfKV7VTFjK/2ZnHNKfjnP2tPbcZ4XGXyszzsz3Fnow0Py5cbmO9P0=
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id
 g7-20020a1709028687b02900e1601ebd29mr4822528plo.47.1614878681465; Thu, 04 Mar
 2021 09:24:41 -0800 (PST)
MIME-Version: 1.0
References: <42e0adf2-dbf5-9c1b-a18d-05bf5f1960a1@arm.com>
In-Reply-To: <42e0adf2-dbf5-9c1b-a18d-05bf5f1960a1@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 02:24:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASX-Rx_fxcuqQ_vFHQwQ+RJq9XCW9_dL=jFCuoEJ0vF3Q@mail.gmail.com>
Message-ID: <CAK7LNASX-Rx_fxcuqQ_vFHQwQ+RJq9XCW9_dL=jFCuoEJ0vF3Q@mail.gmail.com>
Subject: Re: Possible regression due to 269a535ca931 "modpost: generate
 vmlinux.symvers and reuse it for the second modpost"
To:     Vladimir Murzin <vladimir.murzin@arm.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 1:21 AM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
[  snip long description ]

>
> Does that make sense? What I'm missing?
>
> P.S.
> I've also checked v5.12-rc1 and see the same symptoms

Since you ran "make allnoconfig",
the module feature was disabled.
(CONFIG_MODULES=n)

That is why you cannot build external modules.



> Cheers
> Vladimir




--
Best Regards
Masahiro Yamada
