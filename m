Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5147A2FC0A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 21:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbhASUKi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 15:10:38 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:22232 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392182AbhASUJ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 15:09:59 -0500
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Jan 2021 15:09:58 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611086963; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wQthR0ZyWcyEAUlTzMNFc3z3zw4jUtMWz6880r91VxQ=;
 b=EPG38kpNx96Wl01qFkGa55FhOPS+5dU8HP20PVLQb1Qda71Usp5qHu3QS/4OkvMtooBx8mtE
 ofCMirti1ghlQdsLvhagQPxo1qztL5E7ykq/BQ00dJUhxm4rQnIhh7uYIxTeCfs20Vi7Uz2b
 uMyoOXmo+5eUYKinMDVVFg2UcyU=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60073af175e5c01cbae0059a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Jan 2021 20:02:57
 GMT
Sender: mkalikot=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 382A4C43461; Tue, 19 Jan 2021 20:02:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkalikot)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36CCDC433ED;
        Tue, 19 Jan 2021 20:02:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Jan 2021 12:02:56 -0800
From:   mkalikot@codeaurora.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jeff Johnson <jjohnson@codeaurora.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>,
        Elliot Berman <eberman@quicinc.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
In-Reply-To: <CAK7LNASLQWiSfY_iGs8hv8mo_yQaKXPpKo7u0BxPpANwkRatQA@mail.gmail.com>
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
 <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
 <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com>
 <4c02050c4e95e4cb8cc04282695f8404@codeaurora.org>
 <CAK7LNASLQWiSfY_iGs8hv8mo_yQaKXPpKo7u0BxPpANwkRatQA@mail.gmail.com>
Message-ID: <8ddd0f29e30684ce9fcd2dd19a104bd2@codeaurora.org>
X-Sender: mkalikot@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-01-15 13:53, Masahiro Yamada wrote:
> On Sat, Jan 16, 2021 at 5:15 AM <jjohnson@codeaurora.org> wrote:
>> 
>> On 2021-01-14 17:12, Masahiro Yamada wrote:
>> > On Fri, Jan 15, 2021 at 6:50 AM Jeff Johnson <jjohnson@codeaurora.org>
>> > wrote:
>> >>
>> >> From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>> >>
>> >> Modules with a large number of compilation units may be
>> >> exceeding AR and LD command argument list. Handle this gracefully by
>> >> writing the long argument list in a file. The command line options
>> >> read from file are inserted in place of the original @file option.
>> >>
>> >> The usage is well documented at
>> >> https://www.gnu.org/software/make/manual/html_node/File-Function.html
>> >>
>> >> Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>> >> Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
>> >> ---
>> >
>> >
>> >
>> >
>> > First, is this a real problem?
>> > If so, which module is exceeding the command line limit?
>> 
>> On 2021-01-14 17:12, Masahiro Yamada wrote:
>> > First, is this a real problem?
>> > If so, which module is exceeding the command line limit?
>> 
>> Mahesh & I appreciate all of the feedback.
>> 
>> The issue is seen in an Android environment with an out-of-tree
>> driver. The combination of long path names and a large number
>> of source files is leading to the issue.
>> 
>> Since Mahesh & I are not Kbuild gurus, is there an alternative
>> solution to this issue?
>> 
>> Jeff
> 
> 
> I see.
> 
> The support for out-of-tree modules
> is not nice in this regard, but fixing it
> would need many changes.
> 

Agree with that. I checked the same after your first comment on this 
thread.
It needs changes in multiple layers of makefiles.

> 
> The long-term solution might be to upstream your driver,
> but it might not be possible.
> 
> 
> 
> 
> 
> 
> One cheesy workaround might be to point the module path
> via a symbolic link.
> 
> 
> Let's say your module is located in a very deep
> directory,
> /home/foo/long/long/.../path/to/your/module
> 
> 
>  make M=/home/foo/long/long/.../path/to/your/module modules
> 
> would fail due to the too long command line.
> 
> 
> 
> 
> First, create a symbolic link as follows:
> 
>  ln -s /home/foo/long/long/.../path/to/your/module mod_dir
> 
> 
> Then, pass the symbolic link to M= option.
> 
>  make M=mod_dir modules

Thanks for the suggestion. Earlier, we have used a similar workaround
of using relative path instead of absolute to reduce the command line
length.


What's your input on the following approach where we link object
files in different stages to reduce the command line length.


./Makefile

  # foo.c is combined and final module.

  obj-m = fooa.o foob.o fooc.o

  # link already combined object files
  fooc-y := fooa.o foob.o

  # combine into different groups
  fooa-y := foo1.o foo2.o
  foob-y := foo3.o foo4.o

  ....


Note: We need to add MODULE_LICENSE in every group.


make -C ../linux-kbuild M=/local/mnt2/workspace/dev/foo modules

   CC [M]  /local/mnt2/workspace/dev/foo/foo1.o
   CC [M]  /local/mnt2/workspace/dev/foo/foo2.o
   LD [M]  /local/mnt2/workspace/dev/foo/fooa.o
   CC [M]  /local/mnt2/workspace/dev/foo/foo3.o
   CC [M]  /local/mnt2/workspace/dev/foo/foo4.o
   LD [M]  /local/mnt2/workspace/dev/foo/foob.o
   LD [M]  /local/mnt2/workspace/dev/foo/fooc.o
   MODPOST /local/mnt2/workspace/dev/foo/Module.symvers
   CC [M]  /local/mnt2/workspace/dev/foo/fooa.mod.o
   LD [M]  /local/mnt2/workspace/dev/foo/fooa.ko
   CC [M]  /local/mnt2/workspace/dev/foo/foob.mod.o
   LD [M]  /local/mnt2/workspace/dev/foo/foob.ko
   CC [M]  /local/mnt2/workspace/dev/foo/fooc.mod.o
   LD [M]  /local/mnt2/workspace/dev/foo/fooc.ko


