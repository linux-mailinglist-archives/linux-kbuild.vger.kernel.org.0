Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E9C2DBAD6
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 06:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgLPFrX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 00:47:23 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65226 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgLPFrX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 00:47:23 -0500
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0BG5kREx030336
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 14:46:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BG5kREx030336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608097588;
        bh=3cazoDgT2Kxs/WQ24YsUbH+FfFLyQimJjKtgCWP4NgE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=3APsEeDfnIsE96lUDUpPD2XARCYGkpuhqXb4NwE7HMMD9u8RbciIXy6yzbxucFr2V
         6oXXZaL5oMOro/KYoOIfAWWJvBJoxUaPvAuszDSm0pHgsX/x/zFyMfdGgWIm1sE7IZ
         YyIRxodozCf8LY5+3ZDDbLmDx9lpti0f3PMHxss85Vns+IV7D8SNWANnDFoPxOv3G4
         RMDOAM6YZwKf5/H07/3/0kK3TuVXX0si4l/ABv5vzFGawFz184pocoZMdqVDb1k702
         wzAlWy+XAGsjp6lLNByWXjlcN92e+FxRlEr0M5RfosMNwON2IeL0DkW3AJHsdJFQAZ
         aSRR/V74gTLAQ==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id b5so963544pjl.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Dec 2020 21:46:27 -0800 (PST)
X-Gm-Message-State: AOAM5326zwIP3aSj7fPCnBYWNYJl8HmaO5Cr3Qwr53R9OQICMDw+7Q0T
        IkdyB0vVpJqALHKM7+YQgLqoKL5jNHkMs04ftt0=
X-Google-Smtp-Source: ABdhPJzVG9Yh5qJMcbRw7hNW8+NAHKDoIN0Y9eg+hLR4WWdCCNRayhx7dHEbVPPvFt34ffTvdC2mnyoR9i1JYaEgb54=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr1715217pjb.153.1608097586957;
 Tue, 15 Dec 2020 21:46:26 -0800 (PST)
MIME-Version: 1.0
References: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
In-Reply-To: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 14:45:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
Message-ID: <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
Subject: Re: [PATCH] lib/raid6: Let $(UNROLL) rules work with BSD userland.
To:     John Millikin <jmillikin@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 14, 2020 at 5:21 PM John Millikin <jmillikin@gmail.com> wrote:
>
> BSD awk is fussy about the order of '-v' and '-f' flags, and it requires
> a space after the flag name. GNU awk is fine with both forms, so the
> definition of 'cmd_unroll' can be trivially tweaked to let the lib/raid6
> Makefile work with either awk.

Does it depend on the awk version?

I tried this in FreeBSD 12.

masahiro@:~ $ cat test.awk
BEGIN {  print N }
masahiro@:~ $ awk --version
awk version 20121220 (FreeBSD)
masahiro@:~ $ awk -ftest.awk -vN=1
1

It worked for me.





> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
>  lib/raid6/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index b4c0df6d706d..c770570bfe4f 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -48,7 +48,7 @@ endif
>  endif
>
>  quiet_cmd_unroll = UNROLL  $@
> -      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
> +      cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
>
>  targets += int1.c int2.c int4.c int8.c int16.c int32.c
>  $(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
> --
> 2.24.3 (Apple Git-128)



-- 
Best Regards
Masahiro Yamada
