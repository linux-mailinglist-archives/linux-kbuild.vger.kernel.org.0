Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCEB44CB71
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Nov 2021 22:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbhKJVzO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 16:55:14 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35297 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233525AbhKJVzN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 16:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636581146; x=1668117146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3SNXZTJ0GHuCJlx2SPujbV+SZMgoaE8yCZJSZ3OBM/0=;
  b=qh0GzapovqK4YQdweavxJLYfNpxMpNAo7uQ44G9JGQnQWZ21Ckn2MxuU
   NTbRpxE5Riz7y0QFTGzz9k3t+R6uGYnDVRHhzKnkHWVNmSZDIo6btxjuW
   rw37jODAYEgCG8bwDMBt5+KoXhiNxHqJ5iB1Hr+HO5QOGb3wTEvtvczXe
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Nov 2021 13:52:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 13:52:23 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 10 Nov 2021 13:52:23 -0800
Received: from qian-HP-Z2-SFF-G5-Workstation (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 10 Nov 2021 13:52:22 -0800
Date:   Wed, 10 Nov 2021 16:52:19 -0500
From:   Qian Cai <quic_qiancai@quicinc.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] configs: Introduce debug.config for CI-like setup
Message-ID: <YYw/E1hIQWfWJD3I@qian-HP-Z2-SFF-G5-Workstation>
References: <20211104161504.11806-1-quic_qiancai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211104161504.11806-1-quic_qiancai@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 04, 2021 at 12:15:04PM -0400, Qian Cai wrote:
> Some general debugging features like kmemleak, KASAN, lockdep, UBSAN etc
> help fix many viruses like a microscope. On the other hand, those features
> are scatter around and mixed up with more situational debugging options
> making them difficult to consume properly. This cold help amplify the
> general debugging/testing efforts and help establish sensitive default
> values for those options across the broad.
> 
> The config is based on years' experiences running daily CI inside the
> largest enterprise Linux distro company to seek regressions on
> linux-next builds on different bare-metal and virtual platforms. It can be
> used for example,
> 
> $ make ARCH=arm64 defconfig debug.config

Andrew, can you take a look at this patch?
