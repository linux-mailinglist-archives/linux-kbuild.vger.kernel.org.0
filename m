Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C9433FD6F
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 03:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhCRCyf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Mar 2021 22:54:35 -0400
Received: from a0.mail.mailgun.net ([198.61.254.59]:59343 "EHLO
        a0.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhCRCyO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Mar 2021 22:54:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616036054; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rvEYlGo3NsX+a/WR+8ubYVXtB+aRkOP1zhT+T4gQIP0=; b=I6yEho7Q34SecgWT5WADmbaZpgfcCT14/z5JL1dtL7xK+uDLWeK+kHckLI9GVE8Ix7xULI9j
 IW02u6aSR3askl5R111rnPgtCpPQt9ucGXl9tDwA2BdmHdqVNNthmyfSZZV421l4dVJLE1+K
 mDOn2K/zcXBq7qoMj6jrpDu7eag=
X-Mailgun-Sending-Ip: 198.61.254.59
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6052c0cfc32ceb3a91187406 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 02:54:07
 GMT
Sender: jshriram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF32EC43461; Thu, 18 Mar 2021 02:54:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.47.81] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jshriram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0681C433C6;
        Thu, 18 Mar 2021 02:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0681C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jshriram@codeaurora.org
Subject: Re: [PATCH] scripts: Fix incremental build header re-generation
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Trilok Soni <tsoni@codeaurora.org>
References: <1614608540-1025-1-git-send-email-jshriram@codeaurora.org>
 <CAK7LNARjxtyiBAfejQKePp-f=MTpA2PjAEedsHyCjHx6_eoJqA@mail.gmail.com>
From:   Jeevan Shriram <jshriram@codeaurora.org>
Message-ID: <b1fb2334-a85e-c299-3439-b70e9cb63454@codeaurora.org>
Date:   Wed, 17 Mar 2021 19:54:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNARjxtyiBAfejQKePp-f=MTpA2PjAEedsHyCjHx6_eoJqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 3/1/2021 7:36 PM, Masahiro Yamada wrote:
> On Mon, Mar 1, 2021 at 11:23 PM Jeevan Shriram <jshriram@codeaurora.org> wrote:
>> compile.h and autoconf.h are ignored when checking headers sha as they
>> are always re-generated for every kernel compilation. However,
>> these two headers are packaged into kheaders tar. During incremental
>> compilation of kernel, kheaders tar file is always generated and re-packaged
>> irrespective of the changes in headers.
>
> I do not see this problem.
> Could you describe the steps to reproduce it, please?
>
Without making any changes in the kernel or it's headers, re-compile the kernel. i.e.,incremental kernel build without any changes.
I have added following log in gen_kheaders.sh script for confirming the hash differences.

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index b7425a0..ee542a0 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -40,6 +40,10 @@ obj_files_md5="$(find $dir_list -name "*.h"                     |
  # Any changes to this script will also cause a rebuild of the archive.
  this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
  if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
+
+echo "Old Tar file $tarfile_md5"
+echo "New Tar file hash $this_file_md5"
+
  if [ -f kernel/kheaders.md5 ] &&
         [ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
         [ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&

log output :
89306 19:29:02.109961   CHK     kernel/kheaders_data.tar.xz
89307 19:29:02.109971 Old Tar file 2aa6990e4183c31a862951f4bcac037e
89308 19:29:02.109982 New Tar file hash ecf84e700c7cacfe8b35a0905859582d

>> Change-Id: I7a64faebb81df44c32230b0fea1d6df09d7ce66f
>> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
>> ---
>>   kernel/gen_kheaders.sh | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
>> index c1510f0..5499f72 100755
>> --- a/kernel/gen_kheaders.sh
>> +++ b/kernel/gen_kheaders.sh
>> @@ -51,8 +51,7 @@ this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
>>   if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
>>   if [ -f kernel/kheaders.md5 ] &&
>>          [ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
>> -       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
>> -       [ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
>> +       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ]; then
>>                  exit
>>   fi
>>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>
