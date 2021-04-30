Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343D936F5C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Apr 2021 08:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhD3Gkc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Apr 2021 02:40:32 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:19693 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhD3Gkc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Apr 2021 02:40:32 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619764777; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bVm8aeh/RhVR+0lCg2A9CegWl8+Z/njjNXJhRMkx4BsdaZKye/ULvbqoCHBkdpD9eI
    SOEy8M9tWBFcRS6byzbMHiAOi8Z/oSiaB7+447y3tOuay5jU/RHrVPqflzSHtNYzKAFu
    KfSFzdn3Noh/dBIlGtEUdQLulKTT3nOHvZ3MhFL1HxohXDrZtU5HDy/pXJIiN7NS/P11
    MksOvgmAcPkMz/2cbajVCett/uVqqs2r9A0pr7NYrQzZ2CosrG+jF9sFDjnLDDP02Lie
    stLkG8Tf2SH8EhRNJCHQC1cFYcyjlNlMgymvWJaNKXe8UspocFmTL69TLfLQ7fjY2+En
    mttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619764777;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=6z6l9+rojPJlZtid+Fe8AU76hH1sc4rG7fZbTRHV48w=;
    b=JilQsVn8WE+2yytr725uF6gw9hzqROzu0VokNeG8McFt8c6/JySHZ7cywDkD+RIKvH
    oBjiS2yoGDNZ4fCDI6HIy1F3QhoynSLjC69x2A/7agw2LDsSH/DJf3l2oEZdFwPzR608
    nEYqHzE1RDwpWX6yBgRsA+bpulOBOHFhY+GwotXdX/f3aEacThvGmoOkYXJ5ccpiSc1+
    PO7wmYED1U9qcJf9nq++XjipU1cRkAVqMRVdev2wO9I0c+uj2YGo/VPy9cWkN15aSbvI
    hqBcnyz4N737aaxGXzqFImpp4kF4N9KX5R1RcfYHPrxWmym0Q4c97IKvsZ/ydha1dIwl
    hjPg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619764777;
    s=strato-dkim-0002; d=schoebel-theuer.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=6z6l9+rojPJlZtid+Fe8AU76hH1sc4rG7fZbTRHV48w=;
    b=BGRTb0gZLsxDJXWwHaMo38ytNFGAmOBE2h9QgLmzBykqTtQGWXN/TA8rgLOBTMWxrX
    sYZku2a+bR8aOObXTpdlT3LD6QNEjJOCndEib5jT+2Jxehgn4rIwOzJzNdWDhy63rqJ6
    Krv4Htb8aow6EtZSstRbtG0zXP4EAa3HHwVpZy6lAxPdb4guLtBzIN2Dv7A2NVKgMzfC
    ajoFr7aoW/tzMdCKN69Q4L50F46yQRGqKfs6xwHbviYXnenG0+hqU4hXZU6uJoMF9yaD
    9q/5Sow8Lo/aDRk1PJZgdduetc+1Ejsi1aJrKTPOxveB4AB/eOennUvXQa3Cz0qvXdsu
    6Vpg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OH8QVVOrc/CP6za/qRmbF3BWedPGA1vjs2e0bDjfg8OiOrPJifeRMRhMYPeob5ctvy+gxYZSw1A="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.112]
    by smtp.strato.de (RZmta 47.25.2 DYNA|AUTH)
    with ESMTPSA id g052f6x3U6daAev
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 30 Apr 2021 08:39:36 +0200 (CEST)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Kajetan Puchalski <mrkajetanp@gmail.com>, mceier+kernel@gmail.com
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Schoebel-Theuer <tst@schoebel-theuer.de>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
From:   Thomas Schoebel-Theuer <tst@schoebel-theuer.de>
Message-ID: <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
Date:   Fri, 30 Apr 2021 08:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <878s51e3jc.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 29/04/2021 13:25, Kajetan Puchalski wrote:
>
> Mariusz Ceier <mceier+kernel@gmail.com> writes:
>
>> Rust compiler license doesn't require for people to give back to the
>> community - corporation can create their own version of rust compiler
>> adding some proprietary extensions, develop drivers with it and even
>> if the drivers code will be GPL'd they won't be buildable by anyone
>> but that corporation.
>
> Could you explain exactly what the issue you see there is?


Kajetan and others, this is an interesting discussion for me. Let us 
compare the kernel-specific scope with general OpenSource community and 
industry scope.

Industry (where I am working) often requires a "second source" to avoid 
the so-called "vendor lock-in", which is the key point of this part of 
the discussion.

As soon as Copyleft is involved, the requirement of "second source" is 
_permanently_ met: anyone may fork it at any time, creating another 
source, (theoretically) avoiding a dead end eternally. Lock-in is 
prevented at license level.

IMO this is a _requirement_ for Linux, otherwise its "business model" 
wouldn't work in the long term (decades as is always necessary for basic 
infrastructure / system software).

If the requirement "second source" (by either way) is not met by Rust at 
the moment, this needs to be fixed first.

Other limitations like "development resources" might lead to similar 
effects than lock-in. I am seeing the latter nearly every workday. 
Software becomes "unmanageable" due to factors like technical debts / 
resource restrictions / etc. Typical main reasons are almost always at a 
_social_ / _human_ level, while purely technical reasons are playing 
only a secondary role.

This is the link to what Greg said earlier in this discussion: 
development resources and their _dedication_ (e.g. maintenance vs 
creation of "new" things) is the absolute key.

Would Rust improve this problem area _provably_ by at least 30% ?

I am insisting on a _quantifiable_ 30% improvement because this is the 
"magic theshold" in industry after which the motto "never change a 
running system" can be overcome from an investment perspective, and also 
from a risk perspective.

After this, another dimension is kicking in: maturity.

You always need to invest a high effort for achieving "sufficient 
maturity". According to the Pareto principle, maintenance is typically 
around 70% to 90% of total cost for key infrastructure.

In my working area where end-to-end SLAs of >99.98% have to met, the 
Pareto ratio may be even higher.

Pareto's law, as well as Zipf's law, are more or less observational 
"natural laws" holding for almost _any_ complex / dynamic system. Even 
if you try to improve such universal laws, e.g. by investing a lot of 
effort / resources / money into maintenance reduction techniques, you 
typically end up at a similar _total_ effort for maintenance (including 
the extra effort for reduction of "ordinary" maintenance) than before.

Otherwise, you would have found a way for bypassing natural laws like 
the observed Pareto law. Even billions of years of biological evolution 
on this earth weren't able to change this universal law in statistical 
average (in global scale). Otherwise we couldn't observe it anymore.

Even if you could improve the Pareto ratio, my experience is that upper 
management will kick in and raise the SLA level so  that Pareto holds 
again ;)

So I'm sceptical that new technologies like Rust will change fundamental 
laws, e.g. with respect to relative maintenance efforts.

However, what _could_ be theoretically possible: _productivity_ gains, 
improving both development of "new" things as well as "maintenance" 
efforts, in total by more than 30% (but not the Pareto ratio between them).

So the question is: can Rust _provably_ lead to *quantifiable* total 
productivity gains of at least 30% ?

If this would be the case, any business case needs further alternatives. 
So it needs to be compared at least with alternative B: what would be 
the effort and the productivity gain when introducing similar technology 
non-disruptively into the current development ecosystem?

Even if this A-B comparison would lead to a conclusion that 30% cannot 
be met by a new and partly disruptive technology like Rust, the 
discussion can be fruitful. There is always a chance to introduce some 
parts of a new technology into a well-proven and mature "old" technology 
non-disruptively.

Cheers,

Thomas

