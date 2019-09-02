Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE00A59DA
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2019 16:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731754AbfIBOxo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Sep 2019 10:53:44 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1833 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbfIBOxo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Sep 2019 10:53:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6d2cf90000>; Mon, 02 Sep 2019 07:53:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 02 Sep 2019 07:53:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 02 Sep 2019 07:53:43 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Sep
 2019 14:53:41 +0000
Subject: Re: [PATCH 1/1] merge_config.sh: ignore unwanted grep errors
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@collabora.com>, linux-tegra <linux-tegra@vger.kernel.org>
References: <4f92e9b3a88e60c8b5962504d77bc596442b0a40.1567023309.git.guillaume.tucker@collabora.com>
 <b1dc3c40-b658-211e-811c-e13083303d48@collabora.com>
 <a302a6fe-8f22-9ae6-559f-5b2ad13d5b05@nvidia.com>
 <b4631303-37b8-2bc8-8e97-59f8b50ac60f@collabora.com>
 <cb711681-40fb-80df-e471-565b542b5197@nvidia.com>
 <4dcc3258-8909-e2de-2836-378e8e39594a@collabora.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ff9dccb2-9a4f-0995-0a0c-926b5c97862e@nvidia.com>
Date:   Mon, 2 Sep 2019 15:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4dcc3258-8909-e2de-2836-378e8e39594a@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567436025; bh=OkexGM5xemAX9H3ESyyZFeoAzdSRDHH/2cRQBgeHtmo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iQ5scq2FohC4wCdG3AgYyYNSsY/EG4FDvK2GTleD/WymLr22Bi+E0ouSJ+Vdy3ZWu
         RvkXl6bnUhcTRHn/pIG7ppg0POnMqP9U+6++JiDFq+7pKahsEiQKVchTinIVRBsQ/l
         lX0q6UpKbo2DOD03IdStkNVRkFTnzE060Jgp4xGZIyVSvCk2BUyZkls5QFe0Mkg4BQ
         7x4BZDztwimSOThURhfTFNR9lNfZtqRQ2R3NYizbTliyl3lxWKImDxtFM+BYylYglt
         y3qmK3yPDobHwvzedCWdrYo+ET3+PFrLGFwzBFVwuYkZo3A/uxFrQrZJ4NORUdXNGK
         A/ckh+A4kFnYQ==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 02/09/2019 15:49, Guillaume Tucker wrote:
> On 02/09/2019 15:32, Jon Hunter wrote:
>>
>> On 02/09/2019 15:26, Guillaume Tucker wrote:
>>> On 02/09/2019 15:21, Jon Hunter wrote:
>>>>
>>>> On 02/09/2019 15:14, Guillaume Tucker wrote:
>>>>> + Jon Hunter who hit a similar issue
>>>>
>>>> Thanks for adding me.
>>>>
>>>>> On 28/08/2019 21:19, Guillaume Tucker wrote:
>>>>>> The merge_config.sh script verifies that all the config options have
>>>>>> their expected value in the resulting file and prints any issues as
>>>>>> warnings.  These checks aren't intended to be treated as errors given
>>>>>> the current implementation.  However, since "set -e" was added, if the
>>>>>> grep command to look for a config option does not find it the script
>>>>>> will then abort prematurely.
>>>>>>
>>>>>> Handle the case where the grep exit status is non-zero by setting
>>>>>> ACTUAL_VAL to an empty string to restore previous functionality.
>>>>>>
>>>>>> Fixes: cdfca821571d ("merge_config.sh: Check error codes from make")
>>>>>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>>>>>> ---
>>>>>>  scripts/kconfig/merge_config.sh | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
>>>>>> index d924c51d28b7..d673268d414b 100755
>>>>>> --- a/scripts/kconfig/merge_config.sh
>>>>>> +++ b/scripts/kconfig/merge_config.sh
>>>>>> @@ -177,7 +177,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>>>>>>  for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>>>>>>  
>>>>>>  	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
>>>>>> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
>>>>>> +	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || echo)
>>>>
>>>> Shouldn't this just be 'true' instead of 'echo'?
>>>
>>> I just explained why I used "echo" on your thread.  Essentially,
>>> I think both can be used but "echo" made more sense to me because
>>> the script is then using the output string from the command
>>> rather than the exit status.
>>
>> Yes just saw that. However, I don't think that using 'echo' is
>> necessary. The grep command does not output anything and so the variable
>> will essentially be an empty string, we just need to ensure that no
>> error is returned from the command. In cases such as these I always use
>> 'true' in conjunction with grep.
> 
> Sure, that makes sense too.  Your solution is arguably a bit
> simpler so I agree it would be better to use "true" here.
> 
> I can submit a v2 with "true" if that helps, unless you prefer to
> send your version of the fix yourself?

Seeing as you have already created the patch, please go ahead and send.

Thanks
Jon

-- 
nvpublic
