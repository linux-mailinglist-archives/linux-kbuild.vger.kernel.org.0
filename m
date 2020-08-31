Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2F3257ED5
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Aug 2020 18:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgHaQds (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Aug 2020 12:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgHaQdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Aug 2020 12:33:47 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3FBC061573;
        Mon, 31 Aug 2020 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=FgLXQxJ/NDEatUXABHJhKQNrUujDA65Yd4agi39NOzo=; b=LXRzpgPC5zmKZi4+8QM3iTYS4v
        VbjgtqcGXgzTUik1ho68W1JPwfaC+39tsLPrt88oLnjYC0KJPGi123jum5jlbpX0L+Xu4ufl8VyYL
        juB0JI5hdkMUvOc/3xtxo6TlLVJ489aP0yPoUVM44jRnJww/E1x3eKpI7LEuvCN0mbMqaLqGeR98r
        lxklr9IoJ2iqTkbDxm2gBdXZnREwAi7mSOdslHp4x8+iu7kbsEQYhupwnT+zi8Q+64d+aWEVO+vcj
        4mamsP+mic2mxiFfOTa4xlQeoLEroeVnugYrVaPEBgzMxSQ4RJ3xdjrdbSsFojXsJIkDujW42Ok43
        csGJXuVQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCmka-0007TN-Gl; Mon, 31 Aug 2020 16:33:44 +0000
Subject: Re: [PATCH] microblaze: fix kbuild redundant file warning
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>
References: <21eddfa7-2b7c-00c4-ad5b-40878036f987@infradead.org>
 <f7ce291e-47be-549b-7163-0744e7ea35d5@xilinx.com>
 <CAK7LNARfGY_o25mfB-QyQ5ezQW00OMPpbsN+be8LF_mojX39yA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b4e755d2-9508-a1e8-2ee5-6bb080cec2ed@infradead.org>
Date:   Mon, 31 Aug 2020 09:33:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARfGY_o25mfB-QyQ5ezQW00OMPpbsN+be8LF_mojX39yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/31/20 9:22 AM, Masahiro Yamada wrote:
> On Mon, Aug 31, 2020 at 11:01 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>
>> Hi,
>>
>> On 28. 08. 20 20:35, Randy Dunlap wrote:
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Fix build warning since this file is already listed in
>>> include/asm-generic/Kbuild.
>>>
>>> ../scripts/Makefile.asm-generic:25: redundant generic-y found in arch/microblaze/include/asm/Kbuild: hw_irq.h
>>>
>>> Fixes: 7e8f54cd4e26 ("microblaze: Remove empty headers")
>>
>> The patch is fine but this commit is wrong one. At that time
>> asm-generic/Kbuild didn't contain hw_irq.h as mandatory
>>
>> The commit 630f289b7114c0e68519cbd634e2b7ec804ca8c5 added it.
>>
>> Masahiro: Can you please check?
>>
>> Thanks,
>> Michal
> 
> 
> 
> Michal, you are right.
> 
> $ git merge-base 7e8f54cd  630f289
> 7e8f54cd4e2628fada942fe9ba1fc46e99e94218
> 
> 
> 630f289 has 7e8f54cd
> as an ancestor.
> 
> 
> You did not do anything wrong.
> Me neither.
> Both sides submitted correct patches.
> 
> 
> One unfortunate thing occurred
> when 630f289 got in via akpm tree.
> 
> Andrew Morton manages patches by
> quilt instead of git.
> 
> He rebases patches before sending them to
> Linus in the MW, but does not check the
> rebased result.
> 
> 
> You can replace the tag with:
> 
> Fixes: 630f289b7114 ("asm-generic: make more kernel-space headers mandatory")

Thanks to both of you.

I'll resend the patch.

-- 
~Randy

