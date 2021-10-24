Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC944438CA4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Oct 2021 01:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhJXXy7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 Oct 2021 19:54:59 -0400
Received: from out1.mail.ruhr-uni-bochum.de ([134.147.53.149]:34436 "EHLO
        out1.mail.ruhr-uni-bochum.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230022AbhJXXyx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Oct 2021 19:54:53 -0400
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4Hcvyk0DBrz8SB0;
        Mon, 25 Oct 2021 01:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1635119550; bh=v3nLSaMKwQv96gq0H1/Y2TXvumS4hOJ1fcAm3catQUA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DVDbhNqzxTpHhMOgT8pPEEfClwiNWEHK5HP7efWqLWM+BEuRt893R/dd/7hVvPr1S
         I3tlsQg/b30DC/J/c6I2zWEJaQ0r9WOJnErmgvgnaAFQRJSaYROgpS8fj3xKp1A/vB
         ED792S9Q52pzn0wVGoE1SbZntoKKIKWW2WtnLxhA=
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4Hcvyj65Qsz8S61;
        Mon, 25 Oct 2021 01:52:29 +0200 (CEST)
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001::8693:2aec
X-Envelope-Sender: <thorsten.berger@rub.de>
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:c:1001::8693:2aec])
        by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4Hcvyj2b7hz8S60;
        Mon, 25 Oct 2021 01:52:29 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx1.mail.ruhr-uni-bochum.de
Received: from [192.168.188.22] (unknown [45.93.106.182])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4Hcvyh4Gb1zDgyV;
        Mon, 25 Oct 2021 01:52:28 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <82bcea90-b71f-05bb-1efc-8fa623d07d96@rub.de>
Date:   Mon, 25 Oct 2021 01:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC v3 03/12] Add picosat.c (2/3)
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <61051172-6078-4920-a335-3ad1c8ab0d1c@rub.de>
 <CAK7LNAR=S0tVNdQXGg+MKMK7vA-YZawhw08QfFwifxEGJRWayA@mail.gmail.com>
From:   Thorsten Berger <thorsten.berger@rub.de>
In-Reply-To: <CAK7LNAR=S0tVNdQXGg+MKMK7vA-YZawhw08QfFwifxEGJRWayA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 24.10.2021 11:05, Masahiro Yamada wrote:
> On Fri, Oct 22, 2021 at 10:38 PM Thorsten Berger <thorsten.berger@rub.de> wrote:
>> The second part of picosat.c
>>
>> ---
>
> Most of the patches in this series are corrupted.
>
> Both 'git am' and 'patch' failed.
>
> masahiro@grover:~/workspace/linux-kbuild$ git am
> ~/Downloads/RFC-v3-03-12-Add-picosat.c-2-3.patch
> Applying: Add picosat.c (2/3)
> error: corrupt patch at line 10
> Patch failed at 0001 Add picosat.c (2/3)
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
>
> $ patch -p1 <  ~/Downloads/RFC-v3-03-12-Add-picosat.c-2-3.patch
> patching file scripts/kconfig/picosat.c
> patch: **** malformed patch at line 82:        {
>
>
>
>
>
> Each line of the diff context should begin with
> a space, '+', or '-'.
>
> But the offending line starts with 0xc2, 0xa0.
> Strange.
>
>
>
> Could you re-check the patch format and resend?
Thanks for working on it!

Sorry for that, we probably made some stupid beginner mistakes. Patrick Franz is looking into it.
> (or can you push your branch to somewhere?)
It's here: https://github.com/delta-one/linux/tree/configfix-next
>
> One more request:
>
> Please tell me which version of picosat
> (http://fmv.jku.at/picosat/) you imported.
Picosat 965
>
> Thanks.

Best, Thorsten

