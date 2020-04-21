Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786AA1B1DB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 06:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgDUExK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 00:53:10 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52276 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgDUExK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 00:53:10 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 03L4qpuO010727;
        Tue, 21 Apr 2020 13:52:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 03L4qpuO010727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587444772;
        bh=/bMQlShw8uk7wtf7csiuF+GhrxiF4rVo+x6bc8t2/pE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZHInWwaFV6Ppb5RJptyXg2Hjwhhcv/Ew7dIOaejliN5o945L/GOphVXlnBGkuk8Lf
         PNMpNUHKpy71O2JbSaYT6WRdhMHOY2QIwBfipvcS559mOb3YVNVIQ0j8xjuvLKIuv0
         +xF2yDcKyT97aKRHZWB3u0DLDY52hsANzuyQM08w/DOg0WOZUKQbif81cSYc6/Y5oi
         fRWn6AOCN5nDOgmEpy0PQHM0WFamJdZCxWJAOepjD2O0hm6JjvgITU41MG6O/7b6hm
         ngZIoo3NN7cYgVqWkDCZme0DIFMZnxHvxsjDDWd2VbZNO/vkyz2+3ZjlTRKIJl5SI5
         EBhdW6Com/TYw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id t189so7647841vst.7;
        Mon, 20 Apr 2020 21:52:51 -0700 (PDT)
X-Gm-Message-State: AGi0Pubbchpf06LVzeQxceYemKD235cfWahVfDn5jqkNYQsyD+X+/Yr/
        qbqSqNEhPOx/X0S0siBZQJRfmn7b1lRyC1a4jqI=
X-Google-Smtp-Source: APiQypK5llLv7LJrjEM3PXYVXtnIpMbDbXFW38yPuWSVyr/Dlk13SYDsY48W+fB8TZ7RTuAWTfCi+VnAHLy7xjr+UOU=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr11315926vso.215.1587444770520;
 Mon, 20 Apr 2020 21:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org> <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
 <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
In-Reply-To: <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 21 Apr 2020 13:52:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPdSDGX32wXM8MPAQjOwky9qWX2sAo4SWZEcWP5RdTOg@mail.gmail.com>
Message-ID: <CAK7LNAQPdSDGX32wXM8MPAQjOwky9qWX2sAo4SWZEcWP5RdTOg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: ensure mrproper removes arch/$(SUBARCH)/include/generated/
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Vitor,


On Tue, Apr 21, 2020 at 7:27 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>

> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
>
> Was actually Reported-by Theodore Ts'o <tytso@mit.edu>
> https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ

OK, please add his tag, then.


>
> Can I add suggested-by Masahiro Yamada <masahiroy@kernel.org> ?

Please feel free to do so.




-- 
Best Regards
Masahiro Yamada
