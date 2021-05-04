Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57FE372748
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 10:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhEDIdu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 04:33:50 -0400
Received: from imap3.hz.codethink.co.uk ([176.9.8.87]:49130 "EHLO
        imap3.hz.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhEDIdt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 04:33:49 -0400
X-Greylist: delayed 2138 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 May 2021 04:33:48 EDT
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net ([86.16.139.33] helo=[192.168.0.18])
        by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ldpvR-0000zx-0F; Tue, 04 May 2021 08:57:01 +0100
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
Date:   Tue, 4 May 2021 08:56:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 02/05/2021 03:41, Joe Perches wrote:
> On Sat, 2021-05-01 at 17:52 +0200, Miguel Ojeda wrote:
>> On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>
>>> More cleanups will be possible as follow-up patches, but this one must
>>> be agreed and applied to the mainline first.
>>
>> +1 This will allow me to remove the __has_attribute hack in
>> include/linux/compiler_attributes.h.
> 
> Why not raise the minimum gcc compiler version even higher?
> 
> https://gcc.gnu.org/releases.html

Some of us are a bit stuck as either customer refuses to upgrade
their build infrastructure or has paid for some old but safety
blessed version of gcc. These often lag years behind the recent
gcc releases :(


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
