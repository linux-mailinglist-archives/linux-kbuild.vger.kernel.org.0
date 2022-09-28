Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348C95EEA19
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Sep 2022 01:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiI1X0a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Sep 2022 19:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiI1X03 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Sep 2022 19:26:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4E3D8E11
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=j33XqC4nXZ95MCjszFxiWUa5H/zUgwN/RMCjthu9VAA=; b=rEsaKOTqZhdisz9b2OXA6yIf8l
        eHmDS83nIr1WWh2rnxfZgx/m/FWFS1pyFu3vW55Dhpyt75yw2EV8ZVFc7PghgnCrI3r4PLdQZZWEe
        EvdFX6VuxU0bmzl7RXu8lr8K9F9MCziz3pqO8CLMrFrsEFqF/CbfiGkhJF/q8sQ7fJ7Ks0QyD+g8G
        zDmC/GzuI6nlq9ZNtJ6Jiu9QF7t7CjbMmGcgSbjb9IlM3EX8Vchg08sgxcoqv5d658nmC4HsDNPx3
        Cj2C4ZSS7ifaT0LFjvHSNcg38a1gIf9ThejbErOqsWrc5omZpzugZVGhanlON+Zgk8E/MQx2LnO0V
        DgDRmlow==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1odgRa-000eNR-GH; Wed, 28 Sep 2022 23:26:24 +0000
Message-ID: <1823a20c-4d81-514f-aae8-34967fea61a1@infradead.org>
Date:   Wed, 28 Sep 2022 16:26:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] kbuild: rewrite check-local-export in sh/awk
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Owen Rafferty <owen@owenrafferty.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
 <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
 <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
 <e628cb91-0ed8-993e-7904-c7bf010b7462@infradead.org>
 <CAK7LNATche7qAiTROUYsp9h4E6OEbvddYgArkZHx-OHxqqLwVQ@mail.gmail.com>
 <CAK7LNAS3-KoEiwqFTgNa4DPWrBYuPcy7mPpJ-6+dtYsa=bjaNQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAS3-KoEiwqFTgNa4DPWrBYuPcy7mPpJ-6+dtYsa=bjaNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 9/28/22 14:23, Masahiro Yamada wrote:
> On Wed, Sep 28, 2022 at 2:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Wed, Sep 28, 2022 at 7:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Hi,
>>>
>>> On 9/6/22 02:28, Masahiro Yamada wrote:
>>>> On Sun, Sep 4, 2022 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>>>
>>>>> On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>>>>>>
>>>>>> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Please input something in the commit log.
>>>>>
>>>>> I think the benchmark in v2 is worth mentioning
>>>>> because "awk is faster than bash" is one benefit
>>>>> of applying this patch.
>>>>>
>>>>>
>>>>
>>>>
>>>>
>>>> Applied to linux-kbuild. Thanks.
>>>>
>>>>
>>>> (V5 was not delivered to ML somehow,
>>>> but I found it in my mailbox.)
>>>
>>> Yeah, I haven't seen that one either.
>>>
>>> For whatever is in linux-next-20220927, I am seeing something
>>> unpleasant. I'm not positive that it's due to this patch, so I'm
>>> still checking/testing (but I'm about to leave home for awhile so
>>> I wanted to go ahead and let people know about this).
>>>
>>> I do N number of randconfig builds in a script (say 10).
>>> What I am seeing is that when an 'nm' error happens, the
>>> script is Terminated and not continued. E.g., if the error
>>> is on randconfig build #4, builds 5-10 are never started.
>>> The controlling script dies.
>>>
>>
>>
>> Hmm, I have not yet observed such an error.
>>
>> If it happens depending on a particular configuration,
>> please share the .config file.
>>
>>
> 
> 
> Owen provided the following fix-up.
> I see his mail in my mailbox, but not in ML.
> (Does the ML reject mails from non-subscribers?)

It shouldn't. AFAIK it only rejects emails that are too large
(e.g., 100 KB) or HTML email.

> diff --git a/scripts/check-local-export b/scripts/check-local-export
> index 0c049ff44aca..f90b5a9c67b3 100755
> --- a/scripts/check-local-export
> +++ b/scripts/check-local-export
> @@ -8,6 +8,7 @@
>  # EXPORT_SYMBOL should be used for global symbols.
> 
>  set -e
> +pid=$$
> 
>  # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
>  # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> @@ -20,7 +21,7 @@ set -e
>  # Then, the following line will be simpler:
>  #   { ${NM} --quiet ${1} || kill 0; } |
> 
> -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
> +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill $pid; } } |
>  ${AWK} -v "file=${1}" '
>  BEGIN {
> 
> 
> 
> 
> I squashed the diff to the original patch.
> Thanks.

That helps quite a bit. Thanks.

-- 
~Randy
