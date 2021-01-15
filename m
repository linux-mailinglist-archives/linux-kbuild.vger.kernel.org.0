Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C9D2F8670
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 21:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387494AbhAOUQZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 15:16:25 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:14037 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730515AbhAOUQY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 15:16:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610741766; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mBXeczvmNbWOnHiothAx6TK2fNcMOH0snmzHQ8eDIS4=;
 b=saagm9h2riIYWuNVO0uYD2B1Pd08pG8Gm2PXAW2Gjvsa5f2wbboc5AgapfbftLTL1TJm3ADh
 UphZAfcCXZw+XjZxl38xYxiwhCFHh96/1S3sadAS53NCv/1+GlIG79+NUqC9Z8Gh3I1BnYdK
 CTWJKLJnemX8/MSHeHoaMFGWOqg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6001f7df21210999ed0f3b6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 20:15:27
 GMT
Sender: jjohnson=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29F1AC43461; Fri, 15 Jan 2021 20:15:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jjohnson)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3950DC433ED;
        Fri, 15 Jan 2021 20:15:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Jan 2021 12:15:26 -0800
From:   jjohnson@codeaurora.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>, eberman@quicinc.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
In-Reply-To: <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com>
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
 <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
 <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com>
Message-ID: <4c02050c4e95e4cb8cc04282695f8404@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-01-14 17:12, Masahiro Yamada wrote:
> On Fri, Jan 15, 2021 at 6:50 AM Jeff Johnson <jjohnson@codeaurora.org> 
> wrote:
>> 
>> From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>> 
>> Modules with a large number of compilation units may be
>> exceeding AR and LD command argument list. Handle this gracefully by
>> writing the long argument list in a file. The command line options
>> read from file are inserted in place of the original @file option.
>> 
>> The usage is well documented at
>> https://www.gnu.org/software/make/manual/html_node/File-Function.html
>> 
>> Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>> Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
>> ---
> 
> 
> 
> 
> First, is this a real problem?
> If so, which module is exceeding the command line limit?

On 2021-01-14 17:12, Masahiro Yamada wrote:
> First, is this a real problem?
> If so, which module is exceeding the command line limit?

Mahesh & I appreciate all of the feedback.

The issue is seen in an Android environment with an out-of-tree
driver. The combination of long path names and a large number
of source files is leading to the issue.

Since Mahesh & I are not Kbuild gurus, is there an alternative
solution to this issue?

Jeff

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
