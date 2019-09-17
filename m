Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32880B5599
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2019 20:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfIQSsw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Sep 2019 14:48:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbfIQSsw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Sep 2019 14:48:52 -0400
Received: from linux-8ccs (unknown [193.86.95.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B10E920578;
        Tue, 17 Sep 2019 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568746131;
        bh=bNhraFRpJyiHFQp0JOLJ83CT9R3UVWD/HUhL/tUIzWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dw1tt82qFDWdJRdFUKn2zjJVTzCZPxSkowNqN71cB0E8qBkynO4mwAqi2h6fB8y7S
         3+RqeR0exvJQZt6gebzj3wEmNGcWuGj69zr/PDsW5nPMl/7csG6xtDwlq7qvhdsfI7
         xOTyLshTk5gAXbLGV4BOL1/KcnIi6yoAGFJwhIF8=
Date:   Tue, 17 Sep 2019 20:48:44 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthias Maennich <maennich@google.com>,
        gregkh@linuxfoundation.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
Message-ID: <20190917184844.GA15149@linux-8ccs>
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
 <20190917150902.GA4116@linux-8ccs>
 <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
 <20190917180136.GA10376@linux-8ccs>
 <20190917181636.7sngz5lrldx34rth@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190917181636.7sngz5lrldx34rth@willie-the-truck>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Will Deacon [17/09/19 19:16 +0100]:
>Hi Jessica,
>
>On Tue, Sep 17, 2019 at 08:01:36PM +0200, Jessica Yu wrote:
>> Yikes, I did not catch Stephen Rothwell's email about pausing the
>> linux-next releases from Sept 5 until Sept 30
>> (https://lore.kernel.org/linux-next/20190904233443.3f73c46b@canb.auug.org.au/).
>>
>> The modules-next namespace patches have been in since last Tuesday,
>> and my original plan was for them to catch at least a week of
>> linux-next time before sending the pull request. :-/ But that did not
>> happen due to the above.
>>
>> So Linus, in light of the above realization, I'd say at this time - I
>> will still formally send a pull request with the merge conflicts
>> resolved with either solution #2 or #3, but merge at your own
>> discretion, it's fine to delay to the following release if you're
>> uncomfortable.
>
>FWIW, when I've run into unexpected merge conflicts with other trees in the
>past, I've found that it's usually sufficient just to include the resolution
>as an inline diff in the pull request, rather than try to munge the tree
>with merges or rebases.  Linus is pretty good at figuring it out, and with a
>resolution to compare with, the damage is limited. The downside of the merge
>is that it's fiddly to extract the changes and see what's actually being
>pulled.
>
>Also, it's not like the kbuild stuff has been in -next for ages, so this
>would've been a late and messy conflict regardless.

Hi Will!

Thanks a lot for the advice :-) The inline diff sounds like a good
idea. This is I believe only the second tree conflict I've encountered
so far so the tips are much appreciated.

Jessica
