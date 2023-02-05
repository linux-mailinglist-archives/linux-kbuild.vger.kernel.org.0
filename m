Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FA968ADF3
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Feb 2023 02:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjBEBgA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 20:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjBEBf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 20:35:59 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2277D23DB6
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Feb 2023 17:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=IwELQq+u55+D3EFvij7/3Egp7EtXodznpG+Iv+sxei8=; b=uX9MJcpeKwFhTkM119uoroA8Iv
        vyKEQS7SOMmSNNMxChhOzOM9rhrDjlj8tuW9hQwW//kgZswtij9P1eFIXdQ7seLRw76cGozpeRE2e
        t6NAJeFvoRBEbzEeFKh82WdDwaYu9uhh0prJLlkCoCz1zxzopNJvmZTIvNu8Leo5B1Q2oA1GtvnC1
        KTD4OD0oSsDUO2gtgnZ/LZNe0MwZpchPEd/gYAvd7QCgyl7S1aJ3Z9JxhEKKzfgZ5Zwo2QfNW/Guf
        0f9bEZFjq8l9zTJgJqpxLoIdtrf2lMeR0BlJUwHauHiaA3hJYaWvlbLhZPTJJPKpwqaQ9ih30Ie1u
        aIh+jpuQ==;
Received: from [2601:1c2:d00:6a60::9526]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pOTwh-005p7l-Bc; Sun, 05 Feb 2023 01:35:55 +0000
Message-ID: <4e96046c-96f8-d5ae-3143-00a0bba6b9b9@infradead.org>
Date:   Sat, 4 Feb 2023 17:35:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: PPC64 TOC. warnings
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
 <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2/4/23 09:40, Masahiro Yamada wrote:
> On Sun, Feb 5, 2023 at 2:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> I'm seeing thousands of these warnings:
>> (gcc 12.2.0)
>>
>>
>> ./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
>>     7 | #define __KSYM_TOC. 1
>>       |         ^~~~~~~~~~
>>
>> In file included from ../include/asm-generic/export.h:57,
>>                  from ./arch/powerpc/include/generated/asm/export.h:1,
>>                  from ../arch/powerpc/kernel/misc.S:17:
>> ./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
>>     7 | #define __KSYM_TOC. 1
>>       |         ^~~~~~~~~~
>>
>>
>> Can anything be done about them?
>>
>> Thanks.
>> --
>> ~Randy
> 
> 
> 
> Hmm, I just thought this issue was fixed by
> commit 29500f15b54b63ad0ea60b58e85144262bd24df2
> 
> 
> 
> Does this happen only for GCC 12?
> 
> Does the following patch fix the issue?
> (I did not test it.)
> 
> 

I have been running build tests all day (have probably done around 500 builds)
and I'm not seeing the build problem now. I don't know why not or what changed.

I have not applied the patch below. I'm just trying to reproduce the problem
and cannot do so. (Bad me: I had 3 build failures earlier but I didn't save the
failing .config files! I didn't think that it would be so difficult to reproduce.)

Thanks for your help.

> 
> 
> 
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 12bcfae940ee..70d4ab3621f6 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -54,7 +54,7 @@ EOT
>  } | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
>  # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
>  # point addresses.
> -sed -e 's/^\.//' |
> +sed -e 's/^\.//g' |
>  sort -u |
>  # Ignore __this_module. It's not an exported symbol, and will be resolved
>  # when the final .ko's are linked.


-- 
~Randy
