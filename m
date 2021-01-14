Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D563D2F6D46
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 22:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbhANVde (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 16:33:34 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:17676 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbhANVdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 16:33:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610659992; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JAYLJreecXhADrsU6iYLFJYCQDVwne9fI5khLusCP58=;
 b=EEH69v+zv/0BPMm8sdLC/i2NxtZ1i4bGq9LpRJ7b3o214K6Sw1oumX8DxAVTXAbug3oLspw+
 V8xpfKSkMb8IFLYTWRvVRYesrXqjfGpPeP1Mu9x8doqs4KG/k2GUS1KxsEZd2tipAkoFw+eE
 idvuwvDIIVU9B0exHb6dCWS0CMc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6000b87eaf68fb3b0613ecf3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 21:32:46
 GMT
Sender: jjohnson=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 839D2C43468; Thu, 14 Jan 2021 21:32:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jjohnson)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 258F8C43465;
        Thu, 14 Jan 2021 21:32:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 14 Jan 2021 13:32:45 -0800
From:   jjohnson@codeaurora.org
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     eberman@quicinc.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, mkalikot@codeaurora.org,
        psodagud@quicinc.com,
        ndesaulniers via sendgmr 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] kbuild: handle excessively long argument lists
In-Reply-To: <20210114210733.3490303-1-ndesaulniers@google.com>
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
 <20210114210733.3490303-1-ndesaulniers@google.com>
Message-ID: <eb308cc4f26288ad02290d9656179771@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-01-14 13:07, Nick Desaulniers wrote:
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
>>  scripts/Makefile.build | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 252b7d2..d5ef345 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -425,7 +425,11 @@ $(obj)/lib.a: $(lib-y) FORCE
>>  # module is turned into a multi object module, $^ will contain header 
>> file
>>  # dependencies recorded in the .*.cmd file.
>>  quiet_cmd_link_multi-m = LD [M]  $@
>> -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
>> +      cmd_link_multi-m =					\
>> +	$(file >$@.in,$(filter %.o,$^))				\
>> +	$(LD) $(ld_flags) -r -o $@ @$@.in;			\
>> +	rm -f $@.in
>> +endif
> 
> Was this build tested?
> 
> $ make LLVM=1 LLVM_IAS=1 -j72 defconfig
> scripts/Makefile.build:432: *** extraneous 'endif'.  Stop.
> make: *** [Makefile:535: scripts_basic] Error 2
> 
> (Please cc me on v2)

blush

It was tested on a workspace that also contains the Clang LTO series
https://patchwork.kernel.org/project/linux-kbuild/patch/20201211184633.3213045-3-samitolvanen@google.com/

I messed up when trimming, will update in v2
