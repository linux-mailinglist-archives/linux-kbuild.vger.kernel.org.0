Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1320353B2C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Apr 2021 06:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhDEEXx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Apr 2021 00:23:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32488 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhDEEXx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Apr 2021 00:23:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617596627; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=P8f56OwRlSED6G6pPMf2wl/BTBj+x3AWzHQn6pYVmDk=; b=vYUfBer2FFJ0xGXrPmI6JCaY88svDhI2oHFwemEfamlhtE1DFI/o932q12x2mIJC38Uc6PoS
 KZVpvMcKhJ6s4OwMAakKfVrF6tRSZ1AbkAllDBft0G2KVm0I5aaeVL1iQwFR69Hu84bMP7nr
 BlxB2+BLm4Q3hCXwxo7gq28dsn4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606a90c6febcffa80f537b9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 04:23:34
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 572BEC43462; Mon,  5 Apr 2021 04:23:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.70] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A0D7C433C6;
        Mon,  5 Apr 2021 04:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1A0D7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH] Kbuild: Update config_data.gz only if KCONFIG_CONFIG
 materially changed
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
References: <1617317072-26770-1-git-send-email-eberman@codeaurora.org>
 <CAK7LNARoXksBwxU_UH92n7mg0XtFKrSBzFRqmWXXnze1dx-B0g@mail.gmail.com>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <b62a8bec-bbae-9164-a9b2-687481e773af@codeaurora.org>
Date:   Sun, 4 Apr 2021 21:23:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARoXksBwxU_UH92n7mg0XtFKrSBzFRqmWXXnze1dx-B0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/2/2021 10:11 PM, Masahiro Yamada wrote:
> On Fri, Apr 2, 2021 at 7:45 AM Elliot Berman <eberman@codeaurora.org> wrote:
>>
>> If you update the timestamp of KCONFIG_CONFIG without actually changing
>> anything, config_data.gz is re-generated and causes vmlinux to re-link.
>> When Link Time Optimization is enabled, unnecessary re-linking of
>> vmlinux is highly desirable since it adds several minutes to build time.
>>
>> Avoid touching config_data.gz by using filechk to compare the existing
>> config_data.gz and update only if it changed.
>>
>> The .config can be touched, for instance, by a build script which
>> installs the default defconfig and then applies a defconfig fragment on
>> top.
>>
>> For a simple example on my x86 machine, I modified x86 default defconfig to set
>> CONFIG_IKCONFIG=y and run:
>>    make -j50 defconfig tiny.config vmlinux
>>    make -j50 defconfig tiny.config vmlinux
>> With this patch, vmlinux is not re-built as a result of config_data.gz
>> change.
>>
>> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
>> ---
>>   kernel/Makefile      | 2 +-
>>   scripts/Makefile.lib | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/Makefile b/kernel/Makefile
>> index 320f1f3..bd4e558 100644
>> --- a/kernel/Makefile
>> +++ b/kernel/Makefile
>> @@ -140,7 +140,7 @@ $(obj)/configs.o: $(obj)/config_data.gz
>>
>>   targets += config_data.gz
>>   $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
>> -       $(call if_changed,gzip)
>> +       $(call filechk,gzip)
> 
> 
> I do not think this is the right approach
> because gzip is executed every time, even
> if the time stamp is not changed.
> 

Since .config is relatively small, gzip was quickly producing the same 
binary in multiple runs on my host. I thought about following 
gen_ikheaders.sh approach of comparing the md5sum, but I felt it was 
more complex than using filechk and re-compressing every time. I'll send 
a v2 tomorrow which follows gen_ikheaders.sh approach.

> 
>>
>>   $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index a4fbaf8..81d3ec1 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -282,6 +282,8 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>>   quiet_cmd_gzip = GZIP    $@
>>         cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>>
>> +filechk_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9
>> +
>>   # DTC
>>   # ---------------------------------------------------------------------------
>>   DTC ?= $(objtree)/scripts/dtc/dtc
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
