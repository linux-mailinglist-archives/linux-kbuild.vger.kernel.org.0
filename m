Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4361D441B33
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 13:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhKAMfX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 08:35:23 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52835 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232029AbhKAMfW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 08:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635769969; x=1667305969;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=8IVlbd60CPyDWVek2Gr4+wVOTu29dbilRXC6UZZbq6M=;
  b=G1wewsZphSPWpuNPCeCEA6y2DolmNMSyZS5fHedP5B21b6oC7e/zMjaW
   IfI5tuflkaCBVwZjaJfVl3zRUV2dO89xPUTjlvNtfAp69Mzs902kvItJv
   BgpnDU/0RhY6yCCb95frDmOYCU+82wnlsLqeujwsaSWVUiM3N/zI3oedh
   w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Nov 2021 05:32:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 05:32:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 05:32:49 -0700
Received: from [10.110.103.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Mon, 1 Nov 2021
 05:32:48 -0700
Subject: Re: [PATCH v2] configs: Introduce debug.config for CI-like setup
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20211029034434.24553-1-quic_qiancai@quicinc.com>
 <20211029093115.6ychbe56pnebzi43@maple.lan>
 <e0301a5f-a2c7-eedb-90b1-1d6d631fcc47@quicinc.com>
 <20211029161952.u4g7vutcz3qd57lo@maple.lan>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <9b5e6938-9e31-b846-a936-072a34020d87@quicinc.com>
Date:   Mon, 1 Nov 2021 08:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029161952.u4g7vutcz3qd57lo@maple.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/29/21 12:19 PM, Daniel Thompson wrote:
> My feedback came about because, in alphabetic form, it is not easy to
> see which ftrace tracers are enabled (because they are named
> CONFIG_<feature>_TRACER they appear all over the place).

Good point, Daniel. I also think the existing categories could change
but are fairly stable. I'll reorganize them.
