Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F492607C4
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 02:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgIHApi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Sep 2020 20:45:38 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62288 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgIHAph (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Sep 2020 20:45:37 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0880jGAo010660;
        Tue, 8 Sep 2020 09:45:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0880jGAo010660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599525916;
        bh=r2g24b5Z4gKGlSBUVj0Rg4mdr3x5OYX9n9TvGXbat7Q=;
        h=From:Date:Subject:To:Cc:From;
        b=vbppcsrU4rMb/quTXV/X2jAFgeIBJjhS0u3s31f8pMMGVBikYN0gy8BzsaFG6phF0
         EVAGHH3M89XapHxUz6QiSD87UuSYf2Xw/A+90tTcrX82RRS8oR8TUxeeA22DUH9vtQ
         xmPRrD1dsdiEaeZd1FHCG4H7R9BuWelsWg7lzpiAE1kkqbof73DFfIqgfTnejC7sx0
         U/b9pGd5raiDtzzPsHzU3/Bxbmf0rVRI6paGA1wECze29smhQNJW/qj9RVy+Po6ISi
         DjfJAZ3Cyyesxa6IqL9LOjzQJzXaPkRp+XPzYT8S1OXXetkhURSIGL+J9ZBRoNtSAE
         shp0L+L6DQmdA==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id a9so4165496pjg.1;
        Mon, 07 Sep 2020 17:45:16 -0700 (PDT)
X-Gm-Message-State: AOAM531l9hFD0CaYRR2TmHic90IG5UtJ5XqCCRGFGPZRx0Olf5xid+9W
        ZS4cNCuplEo3qA6qEFvNb64/AArAQlbesHarJ04=
X-Google-Smtp-Source: ABdhPJzFVgghbu9O6YGw2YRgfDVwziZW47i/OFI3CzACRPTNRQgXHu+8e5fnAmRck81BBgxMlOZB7iCBAhBS/MwYBM4=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr1619629pjb.87.1599525915813;
 Mon, 07 Sep 2020 17:45:15 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 8 Sep 2020 09:44:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
Message-ID: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
Subject: Please revert kbuild commit for today's linux-next
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Stephen,


As 0-day bot detected, the following commit
in my kbuild tree turned out to be problematic.

commit 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5 (origin/kbuild, kbuild)
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri Sep 4 22:31:21 2020 +0900

    kbuild: preprocess module linker script



Could you revert it for now?


I will consider how to fix it.


-- 
Best Regards
Masahiro Yamada
