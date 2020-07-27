Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F17C22E4FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jul 2020 06:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgG0Ek4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 00:40:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:50404 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgG0Ek4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 00:40:56 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 06R4eQkn029350
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2020 13:40:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 06R4eQkn029350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595824828;
        bh=G5fCLeqZRaNtLoH99PG0OOZ+umhkBfg0HGL41BmhhXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RuWT9q82BFrbjrjjwgIlK+lGa6eeCjsupD1vhk7v7kCrPAH29IMlUP6kaibW/QqLY
         dDBTy0spLby+zgCA0E4cromkvutSv+v8aGU9dH3sTXkJj0pggBUb25iTViSt3/TyoD
         0KoEM/DcqHFHfprA3e5BYYg3L6qi2U8J9etJ0ElLG1XMsT5RfaE7BT8Z3lHfGh8Ohg
         Fwdbj3+XeTyFcolIaXAmG8RVQAATh2BPEHzFeiyDz6SgzhwBm+H6CVAhIGfWvG7QQV
         DKsKPV4tOVI4JhScxWw5uhjAtM1205UPNxOWqs2hm/KF6Q8DvclweQme7VGCcDSy/6
         sIvRIVBSCfulA==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id p25so7615195vsg.4
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2020 21:40:26 -0700 (PDT)
X-Gm-Message-State: AOAM533cel3e8b+jtmpV8qm7DIJPwST3Rpa1gYrE4xEGfC18EBNIjSRY
        K76Q3vg9daOr5Fd78r9LjAWFHi832f2WH5aRWSw=
X-Google-Smtp-Source: ABdhPJyYAFo9JIMTnXu7Rv2DvQRE0XoQn4u7j6NriTNaOEhaRPyVCcHWbqeg2FqcaRPIiCVeLXiv9MmZgaHYexzSyTI=
X-Received: by 2002:a67:de09:: with SMTP id q9mr14973116vsk.179.1595824825404;
 Sun, 26 Jul 2020 21:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726214419.3362-1-wsa@kernel.org>
In-Reply-To: <20200726214419.3362-1-wsa@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 27 Jul 2020 13:39:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShZUwgvDccDqpA44Rc4XkqHQuY4CDbg0msg8PO5YgjKg@mail.gmail.com>
Message-ID: <CAK7LNAShZUwgvDccDqpA44Rc4XkqHQuY4CDbg0msg8PO5YgjKg@mail.gmail.com>
Subject: Re: [PATCH] modpost: explain why we can't use strsep
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 27, 2020 at 6:44 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> Mention why we open-code strsep, so it is clear that it is intentional.
>
> Fixes: 736bb11898ef ("modpost: remove use of non-standard strsep() in HOSTCC code")


Applied, but this Fixes tag looks questionable to me
because this patch is just adding a comment.




> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  scripts/mod/modpost.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 45f2ab2ec2d4..69341b36f271 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -144,6 +144,7 @@ char *get_line(char **stringp)
>         if (!orig || *orig == '\0')
>                 return NULL;
>
> +       /* don't use strsep here, it is not available everywhere */
>         next = strchr(orig, '\n');
>         if (next)
>                 *next++ = '\0';
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
