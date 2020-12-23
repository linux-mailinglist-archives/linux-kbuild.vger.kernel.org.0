Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6ED2E181B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 05:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgLWEZi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 23:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLWEZh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 23:25:37 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD27C0613D3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 20:24:57 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id u7so8177300vsg.11
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 20:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSxQXiWici7T7FJoSMMenX4o4Aeh76EG6/lB1DVtUdU=;
        b=XrkdlpdVuq2Hl9IoP6mm3Mw8BxrI1QW7+MDHjdGQqG16IklI9JlKxmJZx/HQKBnuzK
         zBy5cHJGFYU6aQIQA+4ooaU1zEiGDkH08UfenI/YNt33tTYT6/9oyddVTZsMqOW/uxNP
         qIU0aVhvB2N27Yli7tyEL4qOKJk6NEnXEIAsM3kqm3q8p8UitJ2QXEYjaJfgJpbKP70s
         /W42IlJb25eAsiPOmvKwKRlTc/CNym9GXCMfO1H3oK86N9+6bZlNaXIKjSDUBCLAI0/4
         ZAwUDJqLT4Ok23RDFWGXl++yR8wNptOuTBI4KRbu3Cw5Lr16YlVIvwvDPPieGNB7yNH8
         clfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSxQXiWici7T7FJoSMMenX4o4Aeh76EG6/lB1DVtUdU=;
        b=dHy/ATTelgc80PhsbVC9cggsgke04ZFLXwD7KNifte0kKdqke1vB02AIGNLAmyyiZ6
         tYiKqXL600E5B0OiAY41oFJ3z2tWkGSGgkCVo8QT/nlgatQOtNH9myeYiLEuJBredqXB
         ANscoO19PSzYCjVdXCWig0Hu66Si7kfSGoyPZ5OSXDXEgrFu05OuDIJh78Wz+G9A8Mwe
         EFtOcLA7lCM1EztO0rYSbXAxwAlFGWUW7DrJXlQdkPuQnY3l/eESjRt6kuXpFWrgebz8
         yWBT/3owqWTWYEZdrqNZYeB8iRhqMFi5y1K+gFG9ndHyoG4sDe6tObQsDNcNbynlqoNH
         ZrTg==
X-Gm-Message-State: AOAM531aWmZkXFTqPuEEOttg7/KiuQVc9Ioybp5RdEtl9FI6nsyoqtgJ
        XRTZ9c1eeUS3QYbngdEw3pr8zuf8UthR2ZiubUxAzrcAidk=
X-Google-Smtp-Source: ABdhPJyp5ngR5y1CoirZ9fEcVnJRehott4i4JWaNtpGx0FwtVi/R4nzBGffxl8byGoO7BaFkIzZgB4hh2EpZn7cCxEc=
X-Received: by 2002:a67:32d4:: with SMTP id y203mr17206034vsy.30.1608697496666;
 Tue, 22 Dec 2020 20:24:56 -0800 (PST)
MIME-Version: 1.0
References: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
 <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
From:   John Millikin <jmillikin@gmail.com>
Date:   Wed, 23 Dec 2020 13:24:45 +0900
Message-ID: <CAL1ky9orK39qmvPPk05SoUHWByTwL-kSkgTsbZEvh1vUR4+hXw@mail.gmail.com>
Subject: Re: [PATCH] lib/raid6: Let $(UNROLL) rules work with BSD userland.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 16, 2020 at 2:46 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Does it depend on the awk version?
>
> I tried this in FreeBSD 12.
>
> masahiro@:~ $ cat test.awk
> BEGIN {  print N }
> masahiro@:~ $ awk --version
> awk version 20121220 (FreeBSD)
> masahiro@:~ $ awk -ftest.awk -vN=1
> 1
>
> It worked for me.
>

Yes, it appears to be version dependent. Apologies for the confusion
-- I didn't realize there were multiple dialects of BSD awk.

On FreeBSD and OpenBSD awk works with the existing command. On NetBSD
and macOS awk fails with the following error:

$ touch unroll.awk input.c
$ awk -f./unroll.awk -vN=0 < input.c
awk: can't open file -vN=0
 source line number 1 source file -vN=0
 context is
>>>  <<<
$

My patch lets the $(UNROLL) command support the NetBSD/macOS variant
-- this is needed to support building the Linux kernel on a macOS host
machine.
