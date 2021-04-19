Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97071363B36
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 08:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhDSGBf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 02:01:35 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:18709 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhDSGBf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 02:01:35 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13J60gHB015612;
        Mon, 19 Apr 2021 15:00:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13J60gHB015612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618812043;
        bh=Aq+CLQHErqS0qSnS3CeRhrNuIOmnm6kkOiOEbFvKoGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n73AH71m8kB4wSIdSf9MekTgRi4PAozUxYn/u0D6U15v2ogWc8VaGVo+pGEHdHFUn
         mDYqSIcWt8ULo4lQHRM6NH3/1LQ2dIoeSiMZkJX5lk2kjE1n+afcC6UUhkpJAkBWxo
         X/XWO6pguNvKGoSkS7DIk2WKkJjsmR0IOPErbmeW8kyEUAiRPQeUEebG8BbZ8TlnBy
         vyRngAHmZt4ohUHNKaTb511Mms1tETZzbN5xm4Uk2iIXfDMcOzBetWXR6gRQUD6YNs
         104QvP3Js3GFacfvNHNZB7lIdGOMNYpO/bCdw6KGAUfCU8JQmbxu/VDVuHTvBbHmaf
         3vCzGGEAx41Uw==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id e2so12788592plh.8;
        Sun, 18 Apr 2021 23:00:42 -0700 (PDT)
X-Gm-Message-State: AOAM531SbDZkZ+lI9lPAjpuOb23UMBcVITHbLv7PrxV1r49V6gN4URiX
        GKzHI9IVZefLk7Hxxx5Hf3pYGOoOybMSi5lKguo=
X-Google-Smtp-Source: ABdhPJwMfM4HKnsqxXeT6sAL0wEfuYa3EcinBU+F9/nVneI7SY7U/LrQp0oTjvmB/OAqs2rRBPsiuCF4GQswJ52lnUs=
X-Received: by 2002:a17:90b:1955:: with SMTP id nk21mr23455094pjb.198.1618812040338;
 Sun, 18 Apr 2021 23:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210417145037.349822-1-masahiroy@kernel.org>
In-Reply-To: <20210417145037.349822-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 19 Apr 2021 15:00:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8pBRZ27k1uqO_mC=cpv=0NxzFiRCgnLo63AtjguSTAQ@mail.gmail.com>
Message-ID: <CAK7LNAT8pBRZ27k1uqO_mC=cpv=0NxzFiRCgnLo63AtjguSTAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: remove unused PACKAGE definition
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 11:51 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 3b9fa0931dd8 ("[PATCH] Kconfig i18n support") added this code,
> and then commit ("kconfig: drop localization support") removed the
> i18n support entirely.
>
> Remove the left-over.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Both applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
