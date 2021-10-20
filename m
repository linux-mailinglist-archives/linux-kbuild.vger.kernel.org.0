Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78F2434DF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhJTOkJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhJTOkI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:40:08 -0400
Received: from out1.mail.ruhr-uni-bochum.de (out1.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:3595])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68114C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 07:37:54 -0700 (PDT)
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HZCrc2xddz8SHy;
        Wed, 20 Oct 2021 16:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634740672; bh=ae8LLdTV3S4AcpEQCsErYmAnd2x43rLESqcIv4iImhs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aqiDD7iZ6093VMs5jFG73Wy52OavuP3vdxdoIwvjk5yDUxgsSgxLPcPQn+dZnQF2n
         PXi+XXvRkxFwvP9d8XlPUVS0PWsCzErsiUIwbDxfQNxSqjuJshD4svq5L2tK9ReS78
         kQvg66awLULHgR0vAZqDbgTqlS02o3rWcZPZHemk=
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HZCrc1xPVz8SHW;
        Wed, 20 Oct 2021 16:37:52 +0200 (CEST)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=134.147.42.236
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HZCrb5PcSz8SGF;
        Wed, 20 Oct 2021 16:37:51 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx1.mail.ruhr-uni-bochum.de
Received: from [10.150.66.4] (nb02.ig09.ruhr-uni-bochum.de [10.150.66.4])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HZCrb1CXkzDgym;
        Wed, 20 Oct 2021 16:37:51 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <e397cd12-e9dc-a305-49b9-f5c6ac3ae10f@rub.de>
Date:   Wed, 20 Oct 2021 16:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
Content-Language: en-US
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     linux-kbuild@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
 <boris.20211020141745@codesynthesis.com>
From:   Thorsten Berger <thorsten.berger@rub.de>
In-Reply-To: <boris.20211020141745@codesynthesis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20.10.2021 14:25, Boris Kolpackov wrote:
> Thorsten Berger <thorsten.berger@rub.de> writes:
>
>> New UI extensions are made to xconfig with panes and buttons to allow users
>> to express new desired target options, calculate fixes, and apply any of
>> found solutions.
>>
>> [...]
>>
>> You can see a YouTube video demonstrating this work [2].
> While the demo looks impressive, I wonder if you ran into many cases
> where the number of solution and/or the number of fixes in a solution
> is large (and therefore would be hard for a human to make a decision
> about)?
>
> My closest experience with something like this is aptitude and the
> few times I tried to use it to solve package dependency issues were
> futile because of that (i.e., large number of alternative solutions
> and large number of changes in each solution).
Thanks! BTW, I've opened a new thread, since the emails with the main 
patches didn't go through before (were too large) -- perhaps you can 
switch to that one.

For the user interface, we limit the number of fixes shown to three, 
which in our experience is a good compromise. A fix can require changing 
multiple symbols. However, it's not too many usually. Take a look at 
Fig. 5 in [0], which shows results from our large-scale experiments. For 
the probably most common case of asking for changing 1 symbol (conflict 
size of 1 on the x-axis) that the user wants to enable/disable, the 
median fix size is relatively small. So it should be easy for a user to 
understand most of the fixes. However, in many cases it might not even 
be necessary to understand the changes, or at least see which symbols 
would be changed, then the user can apply the fix.

Note that in Fig. 5 in [0], these statistics are even before Patrick 
Franz has done some rewriting of some internals, which lead to better 
numbers.

Best, Thorsten

[0] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf

