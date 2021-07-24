Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C023D47FD
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jul 2021 15:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbhGXNQs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Jul 2021 09:16:48 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25818 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhGXNQr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jul 2021 09:16:47 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 16ODv3mR024200;
        Sat, 24 Jul 2021 22:57:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 16ODv3mR024200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627135023;
        bh=5Fd9mgowz8MQq9+S1QewgO/orsIjlDdROruWKnyaeKA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UyU2SQTWcpXI8AqB9/TChquwpSL9QhvidZBsygdi5+P1hitlBSUUx060ewDgdrJrt
         7K5i529sV1SfcH8wo+HK286zDFzW7H9R0jfSNOjQBoD4FPB2ggy7hRS53/Oo/qQouq
         Kzhkeb4rYQyXCW3ogG3PGatfJJSXXH3ZlkfEF1AdZr2CekSw0yghAZFn1yoXoydh/0
         M4+N+ILTaAFo+7TeFadkFPYE1alArvZyiOV2B+QnqdsXWzJqv5MOSf9hod22QhN7vA
         EJ0AnhOnfLGFg0VjO18Q70N2GbcWHqEbrpL4yao0BRJPCJyvvVse81uDqvNhiJp+uS
         mDRPMFfhf/mzQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id gv20-20020a17090b11d4b0290173b9578f1cso8720497pjb.0;
        Sat, 24 Jul 2021 06:57:03 -0700 (PDT)
X-Gm-Message-State: AOAM531bbQEnfTS9+StVXw1ikWYiR4uinV9l7hiaOvBSgcYnhjJEPfib
        BmDVnlV8ryWYAge7/b3buGXfdC6uPhy8COOGqi0=
X-Google-Smtp-Source: ABdhPJypFVhXUmcK6NaqNSTcMh6J7snzxpTL9S8iZmi5FPCeSZgY5i0RjNTlkleNJMFtKMFTIYQFGpoKxC6ZZ8zvpmU=
X-Received: by 2002:a65:609a:: with SMTP id t26mr9689022pgu.175.1627135022647;
 Sat, 24 Jul 2021 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201202151238.3776616-1-maennich@google.com> <CAF2Aj3jS6+RN5mEeF+65MRsyMR9BMecMmxwr3sfjwd64zA6Acw@mail.gmail.com>
 <CAF2Aj3hWWoQvezD4Ma01LrhUwGLobNk40H9ArvjT5+XeNE3vMw@mail.gmail.com>
In-Reply-To: <CAF2Aj3hWWoQvezD4Ma01LrhUwGLobNk40H9ArvjT5+XeNE3vMw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 24 Jul 2021 22:56:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRc4kJ9vvC1Y6xt88t8w-qKjdZMg_tK+9nZqHqa4bX_g@mail.gmail.com>
Message-ID: <CAK7LNATRc4kJ9vvC1Y6xt88t8w-qKjdZMg_tK+9nZqHqa4bX_g@mail.gmail.com>
Subject: Re: [PATCH] scripts: merge_config: add strict mode to fail upon any redefinition
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Matthias Maennich <maennich@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 22, 2021 at 7:13 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Masahiro,
>
> On Fri, 21 May 2021 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
>>
>> On Wed, 2 Dec 2020 at 15:13, Matthias Maennich <maennich@google.com> wrote:
>>>
>>> When merging configuration fragments, it might be of interest to
>>> identify mismatches (redefinitions) programmatically. Hence add the
>>> option -s (strict mode) to instruct merge_config.sh to bail out in
>>> case any redefinition has been detected.
>>>
>>> With strict mode, warnings are emitted as before, but the script
>>> terminates with rc=1. If -y is set to define "builtin having
>>> precedence over modules", fragments are still allowed to set =m (while
>>> the base config has =y). Strict mode will tolerate that as demotions
>>> from =y to =m are ignored when setting -y.
>>>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Signed-off-by: Matthias Maennich <maennich@google.com>
>>> ---
>>>  scripts/kconfig/merge_config.sh | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>
>>
>> Reviewed-by: Lee Jones <lee.jones@linaro.org>
>
>
> Any idea what's holding this up please?

Simply because I hate this script.


merge_config.sh itself is a bad hack.
I do not like to extend it further.

Not only this one.
I saw more people with
"hey, I came up with a new option for merge_config.sh"
to do whatever they like to do.

However, it might be too late anyway.

So, I can merge this patch if people believe
it is useful.

-- 
Best Regards
Masahiro Yamada
