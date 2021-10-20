Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2150D434D7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhJTO0Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhJTO0O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:26:14 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FC3C06161C;
        Wed, 20 Oct 2021 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=dROoQpVDYDo4wlGYertKjZpTFLpSQs/hfUVnYHBw81Q=; b=RADZ2z6+0vhWtDyNbnOpUAx9bw
        DUEOfhX0xtoAkMa01zvUL4PKqFFPC/3cLDINxhlZkn2+HCPkrZyf/QGbU+2PjgUNz6vSmg+RX6KhK
        U3Q0bkImn6gf46TFVMDzGHXDNR9BIfIDdbkemsAUlf2yiN4T6W++ZhwQ1QWZXPTMiK58FDe83jQgy
        JHjl+edgaBqtv4dJIwM6absbaUC6Y0sqcjQSKhsf2nwQO2YG4N+9xmykJqgXnqdQGTn/170iTKGkn
        wdGaJANxWVTPQ9pKzGRNdJm2HKCXzKIcpQd68O9SFotgjQDIpALFRoBeSTrB6FBI3oZgTNG4h3WEX
        rrKE2fKw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mdCVL-004kIA-O5; Wed, 20 Oct 2021 14:23:43 +0000
Subject: Re: linux-next: Tree for Oct 18 ('make' error on ARCH=um)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
References: <20211018203023.036d8362@canb.auug.org.au>
 <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
 <20211019085811.362b4304@canb.auug.org.au>
 <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
 <20211020155627.7d6f6637@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <81c2e5c6-7388-3d1d-87a9-1b000517661b@infradead.org>
Date:   Wed, 20 Oct 2021 07:23:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020155627.7d6f6637@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/19/21 9:56 PM, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Tue, 19 Oct 2021 00:18:44 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> On Mon, Oct 18, 2021 at 11:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> In commit
>>>
>>>    c862c7fee526 ("Kbuild: add Rust support")
>>>
>>> from the rust tree, these bits should probably not be there:
>>>
>>> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>>>   include $(srctree)/scripts/Makefile.clang
>>> -endif
>>
>> So this was on purpose -- we need the Clang flags even in GCC builds
>> for bindgen. But now there is that `$(error ...)` added there :(
>>
>>> Miguel, does that seem reasonable?
>>
>> Of course, for today please feel free to apply your fix (i.e. to put
>> the conditional back to where it was). I will solve it on my side
>> tomorrow.
> 
> Can you please check that this is fixed for you after I do the release
> today?
> 

I will. It's part of my nightly cron job.

-- 
~Randy
