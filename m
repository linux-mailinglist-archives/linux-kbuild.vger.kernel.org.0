Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABFA3DC94C
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Aug 2021 03:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhHABw2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Jul 2021 21:52:28 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40211 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhHABw2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Jul 2021 21:52:28 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1711puNi002999;
        Sun, 1 Aug 2021 10:51:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1711puNi002999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627782716;
        bh=M5f/2kndTytHogm4WHgQP0Blzx9K5vnQCqPWGcEGwmE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w3FfOnbS+IPxq8HoyJoJ9V8rM0AUOweW9OJ+CFBjeCr61yYvCtz7QZ4NvAviGliK1
         aGgLnYKQtOb2VSNy77TaZUJ1k4AnxNhrPE6whkqluClEv16VuqcfhwxLRUa7vhYfuR
         obLP1nkoIyftp5v6vvFSE+aUCSeqfm3eWA94+0LZVfCwsqvfAhBvmVun/tHvWUZ0cv
         u09M/QU6u/aDfXzI700RUw+8mfXrtxHF3/QBFAEccJih0xITxL4HkjhwlgFZSluwbo
         375YCCuBu7RKKWCEHe/MYY8FTb68XTBQuN67a7EvVNF1k5eMmYMwml1eCuCY5rgYMZ
         DRLPWK3tjFpiw==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id k1so15604903plt.12;
        Sat, 31 Jul 2021 18:51:56 -0700 (PDT)
X-Gm-Message-State: AOAM530Ui5J+Tmqrtm2Q4aa4+6ZoIatRxCqi3gTgE9hcrTwe0CwdX6M7
        G8RL0oZv5C8Wq+EGin5MN6vJevV8/sq31rQzuY8=
X-Google-Smtp-Source: ABdhPJz80HC6FFlYZHaaFK0XdqpPVcMGh4a0lxknOqUcsH4HDxXQQLohYlF+x+T3GgUS6t6+B+v0vOyzTkETBw+WkqU=
X-Received: by 2002:a65:498a:: with SMTP id r10mr1413214pgs.7.1627782715691;
 Sat, 31 Jul 2021 18:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201202151238.3776616-1-maennich@google.com> <CAF2Aj3jS6+RN5mEeF+65MRsyMR9BMecMmxwr3sfjwd64zA6Acw@mail.gmail.com>
 <CAF2Aj3hWWoQvezD4Ma01LrhUwGLobNk40H9ArvjT5+XeNE3vMw@mail.gmail.com>
 <CAK7LNATRc4kJ9vvC1Y6xt88t8w-qKjdZMg_tK+9nZqHqa4bX_g@mail.gmail.com> <CAF2Aj3hS0kxrnf+kePWmYAT3A-+PTVQ7_6yWj1nO8BLjwGZGQg@mail.gmail.com>
In-Reply-To: <CAF2Aj3hS0kxrnf+kePWmYAT3A-+PTVQ7_6yWj1nO8BLjwGZGQg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 1 Aug 2021 10:51:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh1UR0_04FuiTz5U7b4jthdLoP97K=oJ2c=-E0Qiqh5A@mail.gmail.com>
Message-ID: <CAK7LNAQh1UR0_04FuiTz5U7b4jthdLoP97K=oJ2c=-E0Qiqh5A@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 8:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Sat, 24 Jul 2021, 14:57 Masahiro Yamada, <masahiroy@kernel.org> wrote:
>>
>> On Thu, Jul 22, 2021 at 7:13 PM Lee Jones <lee.jones@linaro.org> wrote:
>> >
>> > Masahiro,
>> >
>> > On Fri, 21 May 2021 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
>> >>
>> >> On Wed, 2 Dec 2020 at 15:13, Matthias Maennich <maennich@google.com> wrote:
>> >>>
>> >>> When merging configuration fragments, it might be of interest to
>> >>> identify mismatches (redefinitions) programmatically. Hence add the
>> >>> option -s (strict mode) to instruct merge_config.sh to bail out in
>> >>> case any redefinition has been detected.
>> >>>
>> >>> With strict mode, warnings are emitted as before, but the script
>> >>> terminates with rc=1. If -y is set to define "builtin having
>> >>> precedence over modules", fragments are still allowed to set =m (while
>> >>> the base config has =y). Strict mode will tolerate that as demotions
>> >>> from =y to =m are ignored when setting -y.
>> >>>
>> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> >>> Signed-off-by: Matthias Maennich <maennich@google.com>
>> >>> ---
>> >>>  scripts/kconfig/merge_config.sh | 15 +++++++++++++++
>> >>>  1 file changed, 15 insertions(+)
>> >>
>> >>
>> >> Reviewed-by: Lee Jones <lee.jones@linaro.org>
>> >
>> >
>> > Any idea what's holding this up please?
>>
>> Simply because I hate this script.
>>
>>
>> merge_config.sh itself is a bad hack.
>> I do not like to extend it further.
>
>
> Sorry you feel that way Masahiro.


I do not know why merge_config was implemented as
a separate shell script while all the other
functions were contained in the kconfig binary.

Anyway...


>> Not only this one.
>> I saw more people with
>> "hey, I came up with a new option for merge_config.sh"
>> to do whatever they like to do.
>>
>> However, it might be too late anyway.
>>
>>
>> So, I can merge this patch if people believe
>> it is useful.
>
>
> I know of multiple entities who make good use of the script and this extension.
>
> My vote is to merge it, but ultimately this is your train set.


OK, I decided to not care about it too much.

Now applied to linux-kbuild. Thanks.




-- 
Best Regards
Masahiro Yamada
