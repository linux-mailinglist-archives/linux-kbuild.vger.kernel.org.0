Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B486E36B697
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 18:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhDZQR0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 12:17:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13458 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbhDZQRZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 12:17:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619453804; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fnSv2x/M6lmyI3dMHHLz1XBQjVyPXD5z6FVrB+7BHQ0=; b=jNyDNFwhKXnPhExcMIPScXnuqQawv43gNnaqkUFWY0rnfLIYXbgjiZfdpn255NZDWNpaXdJg
 a650WBFx+LJ1EKNXGfvjzpQ0ghBBXxBkbJt4z3vcXtj32HC8/qvA1Cn+drfK2weQlzhdnrnm
 NMhE9h3ST+pxhWZFapcBdKuMkik=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6086e75b2cc44d3aea10338a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 16:16:27
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28F95C43217; Mon, 26 Apr 2021 16:16:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.119.201] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 227E4C433D3;
        Mon, 26 Apr 2021 16:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 227E4C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [RESEND v2] Kbuild: Update config_data.gz only if KCONFIG_CONFIG
 materially changed
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
References: <1619197235-13860-1-git-send-email-eberman@codeaurora.org>
 <CAK7LNASzP-pMu7Yd6nkoV_mxOUeouYNLW_xZUy94E_WCdjJ5PA@mail.gmail.com>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <42674c78-28d7-35b5-5e01-07dec7eed938@codeaurora.org>
Date:   Mon, 26 Apr 2021 09:16:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASzP-pMu7Yd6nkoV_mxOUeouYNLW_xZUy94E_WCdjJ5PA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 4/24/2021 11:50 PM, Masahiro Yamada wrote:
> On Sat, Apr 24, 2021 at 2:02 AM Elliot Berman <eberman@codeaurora.org> wrote:
> 
> 
> Sorry for the delay.

No problem!

> 
> This patch is over-engineering.

I thought so, too.

> 
> I will apply this.
> https://patchwork.kernel.org/project/linux-kbuild/patch/20210425062407.1183801-5-masahiroy@kernel.org/
> 
> The 'cmp' command is not expensive.
> md5sum is unneeded.

Thanks!

> 
>> If you update the timestamp of KCONFIG_CONFIG without actually changing
>> anything, config_data.gz is re-generated and causes vmlinux to re-link.
>> When Link Time Optimization is enabled, unnecessary re-linking of
>> vmlinux is highly desirable since it adds several minutes to build time.
>>
>> Avoid touching config_data.gz by using a script to compare the existing
>> config_data.gz, KCONFIG_CONFIG, or script itself to update only if any
>> is mismatched.  The script follows gen_kheaders.sh approach for
>> determing in update is needed. The script intentionally avoids
>> re-compressing KCONFIG_CONFIG.
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
>> Changes in v2:
>>   - Use md5 checksum to compare .config instead of gzip'ing again
>>
>> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
>> ---
>>   kernel/.gitignore         |  1 +
>>   kernel/Makefile           |  4 +++-
>>   kernel/gen_config_data.sh | 31 +++++++++++++++++++++++++++++++
>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>   create mode 100755 kernel/gen_config_data.sh
>>
>> diff --git a/kernel/.gitignore b/kernel/.gitignore
>> index 78701ea..a191136 100644
>> --- a/kernel/.gitignore
>> +++ b/kernel/.gitignore
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> +config_data.gz.md5
>>   kheaders.md5
>>   timeconst.h
>>   hz.bc
>> diff --git a/kernel/Makefile b/kernel/Makefile
>> index 320f1f3..0784bf3d 100644
>> --- a/kernel/Makefile
>> +++ b/kernel/Makefile
>> @@ -139,8 +139,10 @@ obj-$(CONFIG_SCF_TORTURE_TEST) += scftorture.o
>>   $(obj)/configs.o: $(obj)/config_data.gz
>>
>>   targets += config_data.gz
>> +quiet_cmd_genicfg = CHK     $(obj)/config_data.gz
>> +      cmd_genicfg = $(CONFIG_SHELL) $(srctree)/kernel/gen_config_data.sh $@ $<
>>   $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
>> -       $(call if_changed,gzip)
>> +       $(call cmd,genicfg)
>>
>>   $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
>>
>> diff --git a/kernel/gen_config_data.sh b/kernel/gen_config_data.sh
>> new file mode 100755
>> index 00000000..e9ff193
>> --- /dev/null
>> +++ b/kernel/gen_config_data.sh
>> @@ -0,0 +1,31 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +# This script generates a compressed version of .config, if its checksum has changed
>> +set -e
>> +
>> +this_file="$(readlink -f "$0")"
>> +outfile=$1
>> +infile=$2
>> +
>> +config_md5="$(md5sum $infile | cut -d ' ' -f1)"
>> +# Any changes to this script will also cause a rebuild of config_data.
>> +this_file_md5="$(md5sum $sfile | cut -d ' ' -f1)"
>> +if [ -f $outfile ]; then outfile_md5="$(md5sum $outfile | cut -d ' ' -f1)"; fi
>> +
>> +if [ -f $outfile.md5 ] &&
>> +       [ "$(head -n 1 $outfile.md5)" = "$config_md5" ] &&
>> +       [ "$(head -n 2 $outfile.md5 | tail -n 1)" = "$this_file_md5" ] &&
>> +       [ "$(tail -n 1 $outfile.md5)" = "$outfile_md5" ]; then
>> +               exit
>> +fi
>> +
>> +if [ "${quiet}" != "silent_" ]; then
>> +       echo "  GEN     $outfile"
>> +fi
>> +
>> +${KGZIP} -c -n -f -9 $infile > $outfile
>> +
>> +echo "$config_md5" > $outfile.md5
>> +echo "$this_file_md5" >> $outfile.md5
>> +echo "$(md5sum $outfile | cut -d ' ' -f1)" >> $outfile.md5
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
> 
> 
