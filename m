Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F28052AC13
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 May 2022 21:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344183AbiEQTka (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 May 2022 15:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245285AbiEQTk3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 May 2022 15:40:29 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A809515A9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652816429; x=1684352429;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fIFNspXr7/fgwU9foboyKcQbFND6JS/YWkVN9xRjLXU=;
  b=S9h0sxli8Ysc5nwU2zD/0F6zOCCRhncaPEfp2giKI1uYbmvtIbh0yJzk
   a7uEMwGZ6sr9T0f+lJIQRQYF+bqts9agOh8HpVUqxXhz78EnFrwwsHWoS
   kUjAvjwh5cALs8MKItYk8Bih1+X6s4mchDAYKx6mlusLb0Zbp2uSUOp7e
   w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 17 May 2022 12:40:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 12:40:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 17 May 2022 12:40:28 -0700
Received: from [10.110.66.23] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 17 May
 2022 12:40:27 -0700
Message-ID: <7b3e919a-4660-e477-b4bd-a92c28b174fb@quicinc.com>
Date:   Tue, 17 May 2022 12:40:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>,
        ALOK JHA <alok08jha@gmail.com>
CC:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        "Kees Cook" <keescook@chromium.org>, <linux-kbuild@vger.kernel.org>
References: <20220517173534.10878-1-alok08jha@gmail.com>
 <20220517114601.55016e298905d6b6aa0fa873@linux-foundation.org>
From:   Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220517114601.55016e298905d6b6aa0fa873@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/17/2022 11:46 AM, Andrew Morton wrote:
> On Tue, 17 May 2022 23:05:34 +0530 ALOK JHA <alok08jha@gmail.com> wrote:
> 
>> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
>>
>> Now that all the fall-through warnings have been addressed in the
>> kernel, enable the fall-through warning globally.
>>
>> Also, update the deprecated.rst file to include implicit fall-through
>> as 'deprecated' so people can be pointed to a single location for
>> justification.
>>
>> ...
>>
>> --- a/Documentation/process/deprecated.rst
>> +++ b/Documentation/process/deprecated.rst
>> @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
>>   lead to a crash, possible overwriting sensitive contents at the end of the
>>   stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
>>   memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
>> +
>> +Implicit switch case fall-through
>> +---------------------------------
>>
>> ...
>>
> 
> Documentation/process/deprecated.rst already has a section "Implicit
> switch case fall-through".  Maybe you're working against an old kernel.
> Please update when resending.
> 

shouldn't we now just be referencing the fallthrough() macro?
