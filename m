Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637A68C351
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 23:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfHMVLJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 17:11:09 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37308 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfHMVLJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 17:11:09 -0400
Received: by mail-qt1-f196.google.com with SMTP id y26so107918873qto.4;
        Tue, 13 Aug 2019 14:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pp5eRf0N+uQmDSXZwy17OtD2z4+QtcsTwk0l8jXpzlE=;
        b=LXl1lwQ6JaVOI+6IlYrNlT1R8NiTuLuolPv0Stlvbb/oFnKPf5hRCTgwOop3VpOY9e
         HoI6Ia3XGIr/f3q/LBh4QQ2EuBTRwnJ9Wq1h4F+NXeMu/r7rS3qqpM48keZzeS6I/yD7
         K8ieakJ0vn6OU2y6Eu32mCwLFL21DQ2EV5+dE8Mc2MIGe0WpI0Q7LBF1gS1hdWihfnOA
         0J8Qi7rEWzXP7kQf0WZxtUJXqWajOFr/1+6C4WU1as9dzCcdtXZzBOTJUl/OirbyQQmQ
         7lA+sAJ6Bzy64D92LPfGn+W4J8uOq2Mh+3vZh34PacjO4Pu/e7eeKNLRMVjm+8nMv+xt
         h7cQ==
X-Gm-Message-State: APjAAAWb/NwTX+AgHo9fDdknndRNeiIRcmHVn1hnK/86pH0a5UXrcz8Q
        S1Q1x+860bh9U8mbZGC6qLwgFxvCya0=
X-Google-Smtp-Source: APXvYqyY49VX1crEC35QrQwqIV5HCWNM6+CaBwgTvdTWc4SOk/E4KMpdaZ2sEyDMsrtNJFkTvZ26WQ==
X-Received: by 2002:a0c:d1d3:: with SMTP id k19mr218548qvh.6.1565730668288;
        Tue, 13 Aug 2019 14:11:08 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id o43sm15220237qto.63.2019.08.13.14.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2019 14:11:07 -0700 (PDT)
Subject: Re: [PATCH v5] modpost: check for static EXPORT_SYMBOL* functions
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190714152817.24693-1-efremov@linux.com>
 <20190801060657.5932-1-efremov@linux.com>
 <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
 <CAK7LNAQG7DM_2+JJ+bJdre12HcbZY7zGfHk3AU66S0ESjxMbnA@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <4473cefb-9099-114c-2d7d-7714738b01a1@linux.com>
Date:   Wed, 14 Aug 2019 00:11:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQG7DM_2+JJ+bJdre12HcbZY7zGfHk3AU66S0ESjxMbnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 13.08.2019 19:07, Masahiro Yamada wrote:
> Hi Denis,
>
> I squashed the following fix-up.
> 
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3e6d36ddfcdf..2773f9f9bae2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2386,6 +2386,7 @@ static void read_dump(const char *fname,
> unsigned int kernel)
>                 s = sym_add_exported(symname, mod, export_no(export));
>                 s->kernel    = kernel;
>                 s->preloaded = 1;
> +               s->is_static = 0;
>                 sym_update_crc(symname, mod, crc, export_no(export));
>         }
>         release_file(file, size);

Hi!

Thank you very much indeed.

Best regards,
Denis
