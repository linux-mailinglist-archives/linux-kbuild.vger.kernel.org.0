Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B904243E340
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 16:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhJ1ORP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 10:17:15 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53011 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230258AbhJ1ORP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 10:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635430488; x=1666966488;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bMUYINU1qv85LuldYKLFMYVsWuEupSSSUwCLfiLT3L0=;
  b=xzRQQfvmtRIZ4IOJFvjc8NCk+eblgEe00IaNgDo/py3p4uc2IrVEVhB8
   yH3HmLq2fvFqaQMqSkdpgCdcNu0guP03nLvpqQETI+SU0oDSq8HRQKIth
   kkgVJz9WOs7yzdCXZnpiOPsu39xrF2GG+fz3bWt8n+Z43RKwi7EYWCy6S
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2021 07:14:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 07:14:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 07:14:47 -0700
Received: from [10.110.38.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 28 Oct 2021
 07:14:47 -0700
Subject: Re: Introduce "make debugconfig"
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <962c0565-89a3-c6d2-37e0-a93c8c753d57@quicinc.com>
 <CAK7LNAQX2GiUB04fOm7p=F+H5p9XFQjt9hEPSZS4JR+FZK6PZg@mail.gmail.com>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <1e21fddd-cdb9-a986-ae53-6e1a288b817e@quicinc.com>
Date:   Thu, 28 Oct 2021 10:14:45 -0400
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

Masahiro, I am afraid I don't follow here. I meant that in order for
"make help" to show things like:

debug.config - Enable Kconfig items for running kernel for general debugging

It needs to modify scripts/kconfig/Makefile or use a arch-specific
Makefile like kvm_guest.config. Do you mean you would prefer the latter?
