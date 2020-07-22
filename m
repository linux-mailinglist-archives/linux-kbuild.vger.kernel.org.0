Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFA7228ED3
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 05:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbgGVD5E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jul 2020 23:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731886AbgGVD5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jul 2020 23:57:04 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE054C061794;
        Tue, 21 Jul 2020 20:57:03 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k5so470043pjg.3;
        Tue, 21 Jul 2020 20:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ejoo3rO99IZBQPRKW1OTgn8zf/3hAJuMMg27TmWfP+Q=;
        b=VXVhWK8MlscmTy1bvIXvmKuFGU44qSqaAtvdMosv9fuyjE2YXLfjBezi75DjdgNsI6
         WetaYfdjiLVp+vV7tL135FtWDYArPWzyoRuYPS44KnuP8JCwAwZ8nJx6mKdsGcmjFN4O
         UdkHFqQ74wK3M6V2WZi7iKlzKXXXBmyBR8MujScSCmAuBO4CTBw6eJ0+KGgZCpmT/5Eb
         mFzXvIR/so+VjJbj5nVz+DoxYKffQKoBmq/MSu9pHRzD3o3y9BBC4ZmEJy5Lvp1U9l8z
         Q+ShxUIx22H7nCkH3yCHWO8EU+hta5wyCOcUImjBbvx5+r+PSnNMPkk+pwiNClDgM5u6
         Zwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ejoo3rO99IZBQPRKW1OTgn8zf/3hAJuMMg27TmWfP+Q=;
        b=IYi7eIDcoLAAFmRuUl2GWIkkbXS5tkN3Pd/9AyKbe8bqed58miNghYAjtaRvInZ2TK
         jvBWiLqbMtN6o0aBgLPc3Jd388AfNLFIdiUZiFGJIW4yCnOzZbQ+YKfWfn6fV9sK1cP6
         x77za2B8yg59nVG/OfjAW7m89UDEbndzDjvELWpjpaYzl7uOkSddUAWkfpY5L7br1Hzt
         cwVppYwcb1i1b8zKD7ROkcHxLrY/lPUxVBM1mlCbM6qgY/UqWp7kWavdYdt5plSES1iW
         MrIZbjV+Tmyldaoe6nanA4NfcDDeEKxl6+81jqBh2mEexf0shHN6cS+T+bPpbvRJVLtp
         wREA==
X-Gm-Message-State: AOAM532G3fbOEw6kET9eRvfzbWOdrA56qIc3GImDIO39EZ/9krXaw+U9
        ze54LJCwApJfFr7aDNbEpsONwkAMKFo4wTB++L2auw==
X-Google-Smtp-Source: ABdhPJzsrWI6yfXZXfqTDdc6Eemz6SwGqaWtrigchgHMM/oN4Qj11ro+26f0+OFV8IV1aztKYu4E5wJ36htkctlhZ90=
X-Received: by 2002:a17:902:8ecb:: with SMTP id x11mr19444104plo.123.1595390223558;
 Tue, 21 Jul 2020 20:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200722004707.779601-1-masahiroy@kernel.org>
In-Reply-To: <20200722004707.779601-1-masahiroy@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Tue, 21 Jul 2020 20:56:52 -0700
Message-ID: <CAMo8BfJv38cPOAOOMGn8R7-CtBy2BCbMRkMAeXNZ=A4YbtTPbw@mail.gmail.com>
Subject: Re: [PATCH] xtensa: add boot subdirectories build artifacts to 'targets'
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 21, 2020 at 5:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Xtensa always rebuilds the following even if nothing in the source code
> has been changed. Passing V=2 shows the reason.
>
>   AS      arch/xtensa/boot/boot-elf/bootstrap.o - due to bootstrap.o not in $(targets)
>   LDS     arch/xtensa/boot/boot-elf/boot.lds - due to boot.lds not in $(targets)
>
> They are built by if_changed(_dep). Add them to 'targets' so .*.cmd files
> are included.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/boot/boot-elf/Makefile     | 1 +
>  arch/xtensa/boot/boot-redboot/Makefile | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
