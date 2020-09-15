Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CD2269E18
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 07:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgIOF4d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 01:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOF4c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 01:56:32 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44142C06174A;
        Mon, 14 Sep 2020 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=XopghBkiIkALc4F4StyEg2dPR762PyTYGTf5QcJJ0QE=; b=qdzo6so6ksSv1X3NiYDaAvOkB+
        EpbEp9+7kwUvgLgeQr/n26llOYEYiZAAAmFzcE0gOQZv9W3ZF6yYEz8fZeiE7U+LrT/uxn/rDkMvT
        zP9rkg6pQ78HMrxYm7pwP+8iM0/8lPf+cp96q5xSyFEo8O6dX+HEQJk6Oq8hkWCc/fYw0zso5VDRY
        Zl3zK0wKEJnPH9ZZ28B/3YbY97ncOLoZVPQ3BTLWZ+Bg60qw7VDqS1bXs1QK1nmLQic6yfbxIW8P1
        cEmEkUJRWLbJ979wj3XJYc4S6Mos/roy/DGQu4D2+/VWMK8A3I5drhLD4jSFLtlrQ4Vh7nrGzX7OB
        0zRHYS1w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kI3x6-0004ND-4f; Tue, 15 Sep 2020 05:56:28 +0000
Subject: Re: xconfig is broken again on Qt5
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
 <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
 <20200915074126.36a24f0e@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fba403b3-75b5-5e97-a2d5-784fd7f10f1f@infradead.org>
Date:   Mon, 14 Sep 2020 22:56:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915074126.36a24f0e@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/14/20 10:41 PM, Mauro Carvalho Chehab wrote:
> Em Tue, 15 Sep 2020 00:25:07 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
> 
>> On Sun, Sep 13, 2020 at 10:21 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>>>
>>> I hate to say it, but xconfig got broken again.
>>>
>>> After commit 68fd110b3e7e2 ("kconfig: qconf: remove redundant help in the info view")
>>> help description disappered completely from xconfig (both normal and split mode)
>>>
>>> I reverted this and next commit to get this back.
>>>
>>> I have a feeling that there were several bugs introduced to xconfig recently
>>> due to attempt to support both Qt4 and Qt5. Maybe we should only support one version?  
>>
>>
>> xconfig was originally written for Qt3, and
>> got broken in many ways after being converted to Qt5.
>> (commit 8328447af88eaab1d thru b4ff1de3b8381a4)
>>
>> That is my gut feeling.
>>
>> So, xconfig carried broken code everywhere
>> for many years.
>>
>> I think supporting both Qt4 and Qt5
>> is doable, but testing both versions is tedious.
>> I'd like to want to drop Qt4 support in the future but
>> not in this development cycle because there are still
>> some people using Qt4.
> 
> My 2 cents here: I ported Kaffeine from Qt4 to Qt5. When I did that,
> I tried to make it compatible with both, but that was not easy. So,
> it now supports only Qt5. Ok, Kaffeine uses a lot of different APIs.
> 
> It is probably doable to keep xconfig compatible with both Qt4 and
> Qt5, but not sure if it is worth the efforts, as Qt5 was released 
> at the end of 2012. So, I guess that all distros should have Qt5
> packages, even the LTS ones.
> 
>> Recently I changed xconfig a lot because I noticed
>> various bugs, and also needed to simplify the code
>> for better maintainability.
>>
>>
>> Sorry for the pain, but we need to change the code
>> to make it stable and maintainable.
>>
>> For the reported issue,
>> does this work for you?
>> https://patchwork.kernel.org/patch/11774055/
>>
>>
>>> I tried gconfig even thinking maybe nobody uses xconfig these days
>>> but gconfig seems to lack search function.  
>>
>> gconfig is not well maintained either.
>>
>> I think it should be converted from gtk+2 to gtk+3
>> and I know various bugs that need fixing
>> (but I have not been able to find time to work on it...)
> 
> Such conversion can also be painful. I also did two such
> conversions for other media packages (Camorama and ZBar). Also,
> gtk4 is close to be released:
> 
> 	https://www.phoronix.com/scan.php?page=news_item&px=GTK-3.99.1-Released
> 
> Porting from gtk+3 to gtk4 is also painful. I tried to prepare
> Camorama (which currently supports both gtk+2 and gtk+3) for gtk4, 
> but one of the fundamental features needed for it to work was dropped
> (a way to write video images inside a widget). Last time I checked,
> there were no obvious replacement for it (didn't check 3.99 yet).
> 
> Maybe the main point here is if we should keep maintaining two
> GUI frontends.


I can't recall (m)any gconfig users.
And it is missing some critical features IMO, like Search.


-- 
~Randy

