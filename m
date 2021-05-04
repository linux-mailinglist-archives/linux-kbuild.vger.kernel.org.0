Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6544E372752
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 10:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhEDIkL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 04:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhEDIkJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 04:40:09 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A920C061574;
        Tue,  4 May 2021 01:38:44 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id t94so11139478ybi.3;
        Tue, 04 May 2021 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
        b=heYaieXDiOzidFq+kRcjvjjBmYI/4xzMD4IZ1Yw76TNQUNkDgLOIYrp8Bys7niIi+O
         jvSzvlHAX5/hbPR7mdg8Mr3KtVFEXJixdX0zDUsRdWPm2M6sI96KtXYPzM4z98Sk6HbK
         IclA9mcqDUz7trpk3h4rJfxcBfa44/1jzoziaYOQVlXYek/pEzc7jPCbtcmkJIT+9VUH
         WT0HpfKiSiMrkqlHze4lvrBlnkSpkcOokMm27Bo95W5SsjuKtg5kMxCDmKeB7yAkY8kq
         yjjrUt79LeHM1TFBZ+4oGyOBeB8Esqx0U2hDdis4OHVxSJOXEo006EcEEdIvOFlYc3Lc
         5pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
        b=Z9W6+OddH8BApb3IJtaohFCJLKUh7gCBG1KlSf6uu9aPwuY3E2eXzc5JX49z9VNMA3
         zAZAqDcSUIQqA/T3IsVggsD2+ECaBmoGOzIBYF4cfGuQLYAVKwiYqK028nd7wSG26GYk
         +AuZjID8nY1nvnTowfwEFF9pf4TALOR/tvvAp/6xQLKBXBuWx413F97tFEydzpxQHoYu
         /Ej4pnDvb3Jve4pKWbYm8BQUzRyusYna1kUimHD1gXztat/7hijkJpQpEDp+jmigKWbe
         L3lvYUizxszA3TMrIru6rhpzU7HIzAQp5sqW9p1HgwhzIlq631PElvDdHUvrDRbyW+b5
         txrA==
X-Gm-Message-State: AOAM531hnSkCsyak6833FdGjM+oAEcET6ekGKWPT4Bx0B2dc1NlrhzRh
        /IvIr7g1oqM5mxXQmA3Ol2HeU0R50JoJLMgyVYSLDLrnZdSWo9p1
X-Google-Smtp-Source: ABdhPJwgJRTy4oD3Q4bEwMIiI0PESgNj4LF3XmVCbNwY/lWmcIYnmds0Q6QwiZMB0/f4EUTpPAx1ux8l25XkeS6oEUM=
X-Received: by 2002:a25:880f:: with SMTP id c15mr31896545ybl.247.1620117523381;
 Tue, 04 May 2021 01:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com> <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
In-Reply-To: <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 4 May 2021 10:38:32 +0200
Message-ID: <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Joe Perches <joe@perches.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 4, 2021 at 9:57 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Some of us are a bit stuck as either customer refuses to upgrade
> their build infrastructure or has paid for some old but safety
> blessed version of gcc. These often lag years behind the recent
> gcc releases :(

In those scenarios, why do you need to build mainline? Aren't your
customers using longterm or frozen kernels? If they are paying for
certified GCC images, aren't they already paying for supported kernel
images from some vendor too?

I understand where you are coming from -- I have also dealt with
projects/machines running ancient, unsupported software/toolchains for
various reasons; but nobody expected upstream (and in particular the
mainline kernel source) to support them. In the cases I experienced,
those use cases require not touching anything at all, and when the
time came of doing so, everything would be updated at once,
re-certified/validated as needed and frozen again.

Cheers,
Miguel
