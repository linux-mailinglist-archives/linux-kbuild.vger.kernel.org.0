Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1438F762
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 01:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732646AbfHOXFb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 19:05:31 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41521 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbfHOXFb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:05:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so1954327pgg.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 16:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cPt+lD53UMmWuKSJSUmfcWxGBTRSp/XxZ/GGdWGHTvg=;
        b=cPrbVHFEyHC+uvkIilU4GIY9SyYx/S0ZZtKFPQAt4vRxN/T5cNs5cO+Ihx54yxNs9y
         d5hpJS6osCY3OrNh3cPpLfWemfKgqQ6cXt2lKm286OHdPaAPus4hwQc31PT7QFQyJ/f4
         TEZ6ekHrzcQ8HflG8Di+MA1uPRbKplWE/ZSg37dWv5AcLrB4HMXzVQ0VpAyfoLw+z+AV
         610gol6FrJP7CHIZKxfiDv4GKmuTohad7BYwTOEZPRHc+pz36khtHygP/4uzoF/ZXfpL
         LZ0kCaH0bxBa+7ELQz29uwSzs+3PKATciJTbkYv3yk6GUDZs/Z6Yj5ew630EzyMdiuE1
         3cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cPt+lD53UMmWuKSJSUmfcWxGBTRSp/XxZ/GGdWGHTvg=;
        b=mjjqjsqZvlsLECtfPlfPjg+tKpIYTTuY88WzLiySZ+7957HJ1UY4WbmTp2QpyJX9Vu
         PhL7jYKiZGgyYV9dA7udYhO0u5KyVbHGXGPAyF5R/a8mT74klaZTfv/bSmTMkxNmqiz4
         WVyxhYjPQkAwYnGHAf7MlCbFM2tZH+BbPsLSI+f8pLcJRLXXXN1lK0Z42EhTxqQJX/GS
         nQ/Nxf1AAcL4k7Zgny1SRGXUCmCLsxZz00Faz9aOyElshys3SsLeNTcTgKz1V9fXkjAg
         T3bfIV3MdKZUJsr6MA43hpr6O15q3fMfJRQOvl5nIivCzbXqiJcArlCSDmPzvVjNmk17
         o9SA==
X-Gm-Message-State: APjAAAWbpRj3Y396zEFE5522QFCAK+vZM3jFpb7fxu1oyyl3+9pD9aTQ
        QhnL0mKjbUeLPMvWEf6zoRF35qxwTTQNfMSOhqWJGw==
X-Google-Smtp-Source: APXvYqzZ1Dj1S+kEiduAjq/Oq400aLK2gSwv+Mb47pdY97i+JKU/RVJ+Ju3f4ogpqOE2DVajTFA98xhjDfaDMXYNyUk=
X-Received: by 2002:a63:61cd:: with SMTP id v196mr5358843pgb.263.1565910330216;
 Thu, 15 Aug 2019 16:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
 <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
In-Reply-To: <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Aug 2019 16:05:19 -0700
Message-ID: <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 3:59 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> > to just -Wimplicit-fallthrough for clang") for the time being and just
> > rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.
>
> I would avoid applying commits that will have to be reverted just for
> Clang, particularly since it is not fully supported yet.

"not fully supported yet" you say? *drops monocle*
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS?h=v5.3-rc4#n4001
-- 
Thanks,
~Nick Desaulniers
