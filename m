Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2C8211422
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 22:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgGAUOa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 16:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAUOa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 16:14:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0DBC08C5C1;
        Wed,  1 Jul 2020 13:14:30 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u185so9430780pfu.1;
        Wed, 01 Jul 2020 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j3XX45xXL2ckQCryqen8G8xqi1VBzikcTk3+0I72HLY=;
        b=Z6vdH9ZkagZcUlBeTb3Wb+OYJP8Of8UMSLBsvIZfVVMyI0fB4CvWQFbRRfqZlt3MZf
         SysGd8bwRPRSMClVpd89Yjmkpu/idYcGibwdQlCb3teJ1lEGS3ip+L5eWB/kQoXjFqkc
         RtIpppZrTJcASvarISUfx4CFSiyTTvVxna7HnJldj5BKcS0vySUv7MneDvF30wdQWKaA
         ks55RgQw/cU7Ue/d9V09C/mLR+UgLf1u4HNeadUYxFkXS82SIsMOio18h9PP6upex+VJ
         TZbQYZOg43ZGOukob8QzLfBOg6MGec1hXR521puYqEBLBREvAgZd/lj/f5uglDFi0wC2
         ceQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3XX45xXL2ckQCryqen8G8xqi1VBzikcTk3+0I72HLY=;
        b=QaC4tsnNQrj95psauleA8DEDEI2Ie8JTGMBwqKgiaVwnqTP52R+E/vWBtTJ9co/Gsa
         PlJSyF3HgPS6nIG0RhHOedol4hEvtdadq0+MAjB6KBGHBTBzsZay9ai8mIdB0lF9tBBV
         Cj3o0Eob+0qszz0hVb3n+QJzUx+LKe2VeuXB6CRHhXlBsZ3OpYFkgrGKTAufwb0xQUya
         1YUlv2Vb0t3xkJrPik9vqHK9tfn1krWe1Ci1awii7ttugzsBCSHlIsHfJ4mYWnmLSn/B
         ESgsjuyKN98k0jc3qMJ2t1V0XdeokDxxB1DxUDq72TsX74KqOvVofpCB3qgYUgfHB+Ut
         I5kw==
X-Gm-Message-State: AOAM532MFPnQj9GgP/D+i9+rC7GF2yx5b/N8pB7obIVElzBKH9o8xpSJ
        xOoG4iXcEV60AbLVoPYr8A998ZrqCfiebMaPPrkk4A==
X-Google-Smtp-Source: ABdhPJwTpVRP0s9Kdt9Cl+CTlfdKHbWBuJdGoK2cC7YIaeI4bE2S1sLDFWylEo6otv0/ysiPMeOeocI+Wb+m9jZ4k/w=
X-Received: by 2002:a62:3645:: with SMTP id d66mr26487346pfa.275.1593634469910;
 Wed, 01 Jul 2020 13:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org>
In-Reply-To: <20200701192936.1397152-1-masahiroy@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Wed, 1 Jul 2020 13:14:18 -0700
Message-ID: <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not export LDFLAGS_vmlinux
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Guan Xuetao <gxt@pku.edu.cn>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:

[...]

> diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> index 12ae1e91cb75..c6538d3321b9 100644
> --- a/arch/xtensa/boot/boot-elf/Makefile
> +++ b/arch/xtensa/boot/boot-elf/Makefile
> @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
>                 $(OBJS) $@
>
>  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> +       $(LD) $(KBUILD_LDFLAGS) \

Can that $(Q) be retained, please?
The rest LGTM.

>                 -T $(obj)/boot.lds \
>                 --build-id=none \
>                 -o $@ $(obj)/Image.o

-- 
Thanks.
-- Max
