Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12245B54D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2019 20:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfIQSBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Sep 2019 14:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbfIQSBn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Sep 2019 14:01:43 -0400
Received: from linux-8ccs (unknown [193.86.95.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27613206C2;
        Tue, 17 Sep 2019 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568743302;
        bh=mI5SdrtZ/Aok/xl1eNIs2VTy2rz7dWlhBAnfJkTXKuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wvk/HLtX/p/z27ilCrYNn7HL60B/Tnwz9roUXgLha9opPG4eCVCbzHOkoL0GRVLvx
         y/A340QmWlNabDNJ6hpYTqtpOn8JCSZATUUA6K3zca89NA98vTGTv5QapOblS4GRGN
         OjyxArKbO5v8eXjmaFCz3R03pviCbS6zzckMWe08=
Date:   Tue, 17 Sep 2019 20:01:36 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Matthias Maennich <maennich@google.com>,
        Will Deacon <will@kernel.org>, gregkh@linuxfoundation.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
Message-ID: <20190917180136.GA10376@linux-8ccs>
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
 <20190917150902.GA4116@linux-8ccs>
 <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [18/09/19 02:26 +0900]:
>Hi Jessica, Linus,
>
>On Wed, Sep 18, 2019 at 12:09 AM Jessica Yu <jeyu@kernel.org> wrote:
>>
>> +++ Masahiro Yamada [15/09/19 22:27 +0900]:
>> >Hi Linus,
>> >
>> >This is a Kbuild pull request for v5.4-rc1.
>> >I am sending this a bit earlier.
>> >Please pull it in when you open the merge window.
>> >
>> >Thanks.
>>
>> Hi Masahiro, Linus,
>>
>> There is a merge conflict between the kbuild and modules-next tree.
>>
>> Specifically, commits
>>
>>     69a94abb82e ("export.h, genksyms: do not make genksyms calculate CRC of trimmed symbols")
>>
>> and
>>
>>     9b9a3f20cbe ("kbuild: split final module linking out into Makefile.modfinal")
>>
>> from the kbuild tree caused some conflicts in modules-next in
>> include/linux/export.h and scripts/Makefile.modpost. The conflict
>> caused by 69a94abb82e in export.h is *non* trivial whereas the latter
>> commit involving Makefile.modpost is trivial.
>>
>> So there are a few options here..
>>
>> Solution #1: Masahiro pops the topmost 4 commits (down to 69a94abb82e)
>> from kbuild/for-next and I take them resolved through modules-next.
>> This would only leave the trivial conflict in Makefile.modpost left.
>> Send Linus the modules-next tree with a trivial resolution for
>> Makefile.modpost.
>
>
>No. I do not like to do it.
>
>
>Reason 1:
>Commit 69a94abb82e is a bug fix.
>On the other hand, the module name-space is a completely new feature.
>Why must the bug-fix commit rebased on top of the new feature commits?
>
>Reason 2:
>If 69a94abb82e were moved to your branch,
>its commit log would become really strange because the module-next branch
>does not contain 15bfc2348d54

No problem, fair enough points.

>> Solution #2:
>> Matthias Maennich staged a merge resolution from his tree
>> (https://github.com/metti/linux/tree/modules-next_linux-kbuild) so
>> another solution might be that I merge kbuild/for-next into
>> modules-next, take Matthias' (CC'd) conflict resolution including his
>> Signed-off-by, and then take that to Linus.
>
>I do not mind this.  Please feel free to proceed.
>
>
>
>But, if you do not mind, I can propose one more solution.
>
>Solution #3
>
>Linus will pull this Kbuild PR.
>
>Then, Jessica will rebase the module-next branch on the latest Linus tree.
>
>Because nothing in the modules-next branch has been tested in linux-next yet,
>(the patches were queued after -rc8, but there was no linux-next
>release last week)
>there is no strong reason to keep them on v5.3-rc7, right?

Yikes, I did not catch Stephen Rothwell's email about pausing the
linux-next releases from Sept 5 until Sept 30
(https://lore.kernel.org/linux-next/20190904233443.3f73c46b@canb.auug.org.au/).

The modules-next namespace patches have been in since last Tuesday,
and my original plan was for them to catch at least a week of
linux-next time before sending the pull request. :-/ But that did not
happen due to the above.

So Linus, in light of the above realization, I'd say at this time - I
will still formally send a pull request with the merge conflicts
resolved with either solution #2 or #3, but merge at your own
discretion, it's fine to delay to the following release if you're
uncomfortable.

Thanks,

Jessica
