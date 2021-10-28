Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AE543E498
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 17:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhJ1PKx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 11:10:53 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23293 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230406AbhJ1PKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 11:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635433706; x=1666969706;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=r2jJ6Pq2Q/nOWNxj7qSLhnirObfw699pzs6l+ebzthQ=;
  b=g/sEP9V9TGMGdsoKtK78A6LE7eWUdCUfDpzoV9hhydh6nuU9knUmZ1YB
   S/JhwVbRHoLatV/gKWc1oR9nFNHAcxFvzo1/+wkEIiN40c4Yo0CsLR1mz
   Ho+52WO9P7ZlDEZNQlOkJ5sryvUqHMFesxVm635lVjfSBB/LHUYe6OPXJ
   Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2021 08:08:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:08:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:08:25 -0700
Received: from [10.110.38.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 28 Oct 2021
 08:08:24 -0700
Subject: Re: Introduce "make debugconfig"
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <962c0565-89a3-c6d2-37e0-a93c8c753d57@quicinc.com>
 <CAK7LNAQX2GiUB04fOm7p=F+H5p9XFQjt9hEPSZS4JR+FZK6PZg@mail.gmail.com>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <c142f030-ad2c-8e41-0237-14449f6eb878@quicinc.com>
Date:   Thu, 28 Oct 2021 11:08:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQX2GiUB04fOm7p=F+H5p9XFQjt9hEPSZS4JR+FZK6PZg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/28/21 10:03 AM, Masahiro Yamada wrote:
>> The idea is to have a debugconfig inside kernel/configs/ and update
>> scripts/kconfig/Makefile
> 
> Please do not wire it up to Makefile.

Okay, I guess you mean that like android-base.config, and don't need to
show up in "make help". I am fine with that and that would make things
simplier, and I'll bake a debug.config to kernel/configs for review.
Please let me know if I am missing anything.
