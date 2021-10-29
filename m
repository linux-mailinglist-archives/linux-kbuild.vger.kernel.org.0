Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B99543FDAC
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 15:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhJ2OAI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 10:00:08 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:40508 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229692AbhJ2OAH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 10:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635515859; x=1667051859;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lW6r/IDtPyr5QGSu8TnKRs8EoRIVXuXoQPF0/2HpZDQ=;
  b=PErGa3CL3/Am2bvtKtRUYnsjoavcHWOtYsLUP0XlA+Yh1iFNbOOwDcOe
   F6kYg+u4U0D0i21miYln8qqYmEnPJjTkNxjYG8UczT9smdg5RWGGju/V7
   4EE17ZGF9NmoSSf7pB2swGviYLbii+0bVQpGXIB8R0UlSIae/80/eML0A
   c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 06:57:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 06:57:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 06:57:36 -0700
Received: from [10.110.7.198] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 29 Oct 2021
 06:57:33 -0700
Subject: Re: [PATCH v2] configs: Introduce debug.config for CI-like setup
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20211029034434.24553-1-quic_qiancai@quicinc.com>
 <20211029093115.6ychbe56pnebzi43@maple.lan>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <e0301a5f-a2c7-eedb-90b1-1d6d631fcc47@quicinc.com>
Date:   Fri, 29 Oct 2021 09:57:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029093115.6ychbe56pnebzi43@maple.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/29/21 5:31 AM, Daniel Thompson wrote:
> Does this config need comments at the top of the file describing its 
> "mission"?  Put another way, the comments in the description about
> where these config options come from seem too important leave buried
> in the git history. They are important to understanding what it is
> for.
> 
> I know this the other configs do not have big header comments. However
> the existing configs are closer to self-describing. debug.config simply
> does not explain what the file does in the way xen.config can! People
> will surely want to add their "favourite" debug options[1] and those
> contributors would benefit from clues on what the configs here are
> intended for.

Daniel, (small world, isn't it? Enjoyed your OpenEmbedded lessons in the
past.), That's a good point. I personally got used to "git log". I'll
add some comments there.

>> +# Keep alphabetically sorted.
> 
> This results in 119 line file that is more-or-less impossible to
> comment. It alphabetic really the best way to maintain something
> containing so much subjective judgement?

I thought about ordering those in different subject groups, but then
realized it might be an overkill for an only one-hundred line file. Most
of the options would have a prefix like _LOCKDEP_, _KMEMLEAK_ etc, so
they are subject-related close together even sorted alphabetically. I
don't really have a strong option on this matter though. We could
organize it like in Kconfig sections if people like that way better
although it could have a potential overhead to sync with future
Kconfig.debug in the future as their places and names change from time
to time.

# printk and dmesg options
# Compile-time checks and compiler options
# Generic Kernel Debugging Instruments
# Memory Debugging
# Scheduler Debugging
# Lock Debugging (spinlocks, mutexes, etc...)
# Debug kernel data structures
# RCU Debugging
