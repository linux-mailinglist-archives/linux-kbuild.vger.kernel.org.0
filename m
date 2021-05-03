Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85B33715C1
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 15:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhECNLn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 09:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbhECNLm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 09:11:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA93C06174A;
        Mon,  3 May 2021 06:10:48 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 130so7406105ybd.10;
        Mon, 03 May 2021 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
        b=lqGGCtzE5m8F9orYtPate6N4BTFbRDldnXzGj2tE87HBcn1BRn7f5XfxsJmYODrxik
         e8EkfaDCxloU/Q9iBapQyXgVjXP0S4DEJ0fXLrl9h3WPztOm88MubRYvbs9d3jfqGqx+
         iy9k59bjEyTqA/JJgPQ3YBDSOg4s+trVOYoxK6J7Lt5Gi2GwquvTtB02IITfC21XkxNA
         lGyAB0OIcRbwh0FVuTlthtGxfWSXpeBK0cMQGMm7c6fDD1CV4+4N2Ay8M/08fvry9jyw
         TF22FDOSLWt3qkPw5KtV5L2sv6tZ8jOFNTAw83cA9C4ThWwXkIpT0aLKrSpPx/QUefiX
         Kbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
        b=LhYwwpp4NP9mwa+00uuD8Ve1i2eGBBYRn/x6HWzhCDS/Hm/wPZbMOHoo1l23QKS5bE
         hW/ngGdnPHi9bcSjq6cCCaUjuKwtAqkw8F96ps6iJvfmDjBzNelBggkB56/WF2k8EJF9
         dqKDlUezpB6ic5EBX5lxIfGR/eRkTa1rfB/oFs9PqUTOaQsInjCCb2VAbe/ldb9F5l7L
         toeXkjmm329Q+Y2Wm0eSgrZqJ177AILZkLVCqATm53JpoWV7YTLYBsZ08Ilh7kvVCTh6
         OtjvPt25wu1cAUnZTyivN1fHfSfkpWvwdFfiLseHuH231sVtSJ5NUrnMPI4slHZ45ZZB
         jVfw==
X-Gm-Message-State: AOAM530TWO8Rm3f9fFUajAf2JMAhvDCFc9JyW1hgkK7ugpZnlTmd3Puq
        3HmGtigkpjeTwVbeEPUq1nGfLaXTx4JZVwGHj3/IMembIh7YvA==
X-Google-Smtp-Source: ABdhPJxvygbDWGxmRr6V8Vm4D83Fq4MRol9PEQb74s8BS9df3UUbSP8yls4vcRx2kU2tZhdFxHQp30hnnaM7RamlTpQ=
X-Received: by 2002:a25:7909:: with SMTP id u9mr25466002ybc.22.1620047448169;
 Mon, 03 May 2021 06:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org> <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org> <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com> <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
In-Reply-To: <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 3 May 2021 15:10:37 +0200
Message-ID: <CANiq72nyvrb6ZrVVeaT9py7D_Sv9q-a1HGYH-hNpqfmcCmb4dg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     David Laight <David.Laight@aculab.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matthew Wilcox <willy@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 2:20 PM David Laight <David.Laight@aculab.com> wrote:
>
> It would be nice to be able to build current kernels (for local
> use) on the 'new' system - but gcc is already too old.

I have seen such environments too... However, for the kernel in
particular, you could install a newer GCC in the 'new' machine (just
for the kernel builds) or do your kernel builds in a different machine
-- a 'new' 'new' one :)

Cheers,
Miguel
