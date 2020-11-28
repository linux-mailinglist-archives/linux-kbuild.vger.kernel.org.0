Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25012C7589
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388005AbgK1VtS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732358AbgK1SPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 13:15:38 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E07C0254A6;
        Sat, 28 Nov 2020 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ubev1giHn2jmSzhtp/f94pjbxFaoCeWhmi4D5S6DRMQ=; b=kCmw1AxLSz9zAUV1hx0lxMwV1K
        iHNuj/MU6Bqv/Rdf7HMk9MrKt3TjRtiRFu4DLkMgrYriTq0mvSfQBCT0dHzN3bple/c8tlOdVLjHc
        UsVmctYTXxoPhP2N4b2ENuThOCVoN6iA0n4PJvijUiSwN98mADc/8pHk9g795HJTfE+XiXzEzWCyU
        GELAuFvNBcyDSnCPsrzAVXb5iZeDMbTeyee5P2DD1312mI/qq0cZNXTXgBUZBaW8xf+yeAMYSY+w3
        hcRx08LtEqG1kTGw9DIt+yDDfeDiY/plD9d6BlIrkTucYEnLAfGepv2jbVpLiRfTKE2mUzS0tj2qT
        Y0QUyrag==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kj3Wq-0005cP-OY; Sat, 28 Nov 2020 16:56:57 +0000
Subject: Re: [PATCH 7/7] kbuild: doc: document subdir-y syntax
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201123045403.63402-1-masahiroy@kernel.org>
 <20201123045403.63402-7-masahiroy@kernel.org>
 <5c40293a-a24a-2c85-e7ef-a08a8c732d19@infradead.org>
 <CAK7LNASZKsfyj9K_QxLoHZkSpfHvUHwgm5pwq=DJUnMCdczjPw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f69d022b-a3a6-03e6-5ece-d5e6bd6d7035@infradead.org>
Date:   Sat, 28 Nov 2020 08:56:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASZKsfyj9K_QxLoHZkSpfHvUHwgm5pwq=DJUnMCdczjPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/28/20 12:58 AM, Masahiro Yamada wrote:
> On Tue, Nov 24, 2020 at 3:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 11/22/20 8:54 PM, Masahiro Yamada wrote:
>>> There is no explanation about subdir-y.
>>>
>>> Let's document it.
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>> ---
>>>
>>>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> +
>>> +     Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
>>> +     syntax is always used for directories.
>>> +
>>
>> Just curious:  Is a trailing slash allowed here?  say for consistency?
> 
> 
> If you use a trailing slash for the subdir-y syntax,
> it will still work.
> 
> 
> Only the problem I see is that the build log will look clumsy
> due to the double slashes "//".
> 

Yes, that does look odd.

> For example, if you change scripts/Makefile as follows:
> 

...

> The build log will look like follows:
> 
> 
> masahiro@grover:~/workspace/linux$ make allmodconfig; make scripts
> #
> # configuration written to .config
> #
>   SYNC    include/config/auto.conf
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.[ch]
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTLD  scripts/dtc/dtc
>   HOSTCXX scripts/gcc-plugins//latent_entropy_plugin.so
>   GENSEED scripts/gcc-plugins//randomize_layout_seed.h
>   HOSTCXX scripts/gcc-plugins//randomize_layout_plugin.so
>   HOSTCXX scripts/gcc-plugins//stackleak_plugin.so
>   HOSTCC  scripts/genksyms//genksyms.o
>   YACC    scripts/genksyms//parse.tab.[ch]
>   HOSTCC  scripts/genksyms//parse.tab.o
>   LEX     scripts/genksyms//lex.lex.c
>   HOSTCC  scripts/genksyms//lex.lex.o
>   HOSTLD  scripts/genksyms//genksyms
>   HOSTCC  scripts/selinux//genheaders/genheaders
>   HOSTCC  scripts/selinux//mdp/mdp
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/sorttable
>   HOSTCC  scripts/asn1_compiler
>   HOSTCC  scripts/extract-cert
>   HOSTCC  scripts/bin2c
>   HOSTCC  scripts/recordmcount
>   HOSTCC  scripts/sign-file
>   HOSTCC  scripts/insert-sys-cert
> 
> 
> 
> 
> I can fix Kbuild to avoid "//", but I do not want to support two ways.
> 
> So, I'd recommend not to add the trailing slash to subdir-y.
OK, I agree. Thanks.

-- 
~Randy

