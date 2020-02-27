Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095981723CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 17:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgB0Qpe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 11:45:34 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:39879 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730245AbgB0Qpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:45:34 -0500
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01RGjHj5018817;
        Fri, 28 Feb 2020 01:45:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01RGjHj5018817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582821918;
        bh=SFw1s2zS0IjJjISQmLxUGN24YaawNrIlTzAN8zWk6yc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pHrjFCewRtvMY7bbl9OpF647nX9RTyHdzhvhKV4DjrqI7jVxULfY6UK/dSIV+E/FE
         wQwq5nxoBbXQpi+KDLcYI0weq48uJLqJDDzwYmQScibfpe8xlOzWB45QGDa6yq6YJ5
         MGbVj80bPcLdTaa7ahGCfPeFwE1Sq4eUw0fpHYkvT3HBvKtN2Wvk4DjqYNeqZvCkjJ
         cKhYymuJY1Wl/Oz2nL38f+nuxlTrp8n6ILHI9QGShJT7Me8Vq6AKklkt9VuikJESDc
         KYXfWFqMsRaBtmU1owhg/LB5A9vQsowXu2COlaORsVXK5wpp5cKuEr8GAedHCrEgmh
         vkbY5OB+yyw7w==
X-Nifty-SrcIP: [209.85.221.179]
Received: by mail-vk1-f179.google.com with SMTP id r5so81897vkf.2;
        Thu, 27 Feb 2020 08:45:18 -0800 (PST)
X-Gm-Message-State: ANhLgQ1UtdG/R/oWJ+W3DMF/QBZM+unzZYwtPjKgVUD2MCyrJU7BX7HV
        J78Uvv2bRJfWWG722oynH/fmpwJro11O9h8WFWk=
X-Google-Smtp-Source: ADFU+vufzGHT4b2Qk1L+M+Qsr4BWBYmkBX9BSlBugK7yH1xAwQBNk/3BRr+hoFehSYOBDdMB1utlLESQ9deo5l2iu20=
X-Received: by 2002:a1f:1bc3:: with SMTP id b186mr54662vkb.96.1582821917207;
 Thu, 27 Feb 2020 08:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20200218100031.10018-1-masahiroy@kernel.org>
In-Reply-To: <20200218100031.10018-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 01:44:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvgJ2tBhM7s-cnpwuy1GZy0kZ96tLETBVuEZSCTCKmcA@mail.gmail.com>
Message-ID: <CAK7LNASvgJ2tBhM7s-cnpwuy1GZy0kZ96tLETBVuEZSCTCKmcA@mail.gmail.com>
Subject: Re: [PATCH] fixdep: remove redundant null character check
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 18, 2020 at 7:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If *q is '\0', the condition (isalnum(*q) || *q == '_') is false anyway.
>
> Ensuring non-zero *q is redundant.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.

>  scripts/basic/fixdep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index ad2041817985..877ca2c88246 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -246,7 +246,7 @@ static void parse_config_file(const char *p)
>                 }
>                 p += 7;
>                 q = p;
> -               while (*q && (isalnum(*q) || *q == '_'))
> +               while (isalnum(*q) || *q == '_')
>                         q++;
>                 if (str_ends_with(p, q - p, "_MODULE"))
>                         r = q - 7;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
