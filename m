Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA5E43E25E
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 15:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhJ1NfU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 09:35:20 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25235 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230017AbhJ1NfU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 09:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635427973; x=1666963973;
  h=to:cc:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=9TsYvEwcIfA8bgN64rkLfWRSFHsVk2LbPCCy1OTa3ME=;
  b=oLRCSUnwwDklDFyEuWRXWRsMwsfKxALotbyKgKk8QRszpUHTHgkkExO8
   CmhwycPyKgggt0CGginRNkUJBEk9D2/P4NnpxTQZOeMlqZ+fz3NiXS/Pu
   j3qVVLdnCEBrVkJkF7MfA9DBRVqz5Zfef0e6RklnI0uM8w2ogYFh2u5cu
   Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2021 06:32:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 06:32:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 06:32:53 -0700
Received: from [10.110.38.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 28 Oct 2021
 06:32:52 -0700
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From:   Qian Cai <quic_qiancai@quicinc.com>
Subject: Introduce "make debugconfig"
Message-ID: <962c0565-89a3-c6d2-37e0-a93c8c753d57@quicinc.com>
Date:   Thu, 28 Oct 2021 09:32:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi there, some general debugging features like kmemleak, KASAN, lockdep,

UBSAN etc help fix many viruses like a microscope. On the other hand, those
 features are scatter around and mixed up with more situational debugging
 options making them difficult to consume properly.



Since I have been deal with those options on a daily basis for the last

a few years and accumulated the knowledge of their pros and cons, I am

thinking about to create an initial "make debugconfig" target, so that
it could amplify the general debugging/testing efforts and help
establish sensitive default values for those options across the broad.


The idea is to have a debugconfig inside kernel/configs/ and update
scripts/kconfig/Makefile and Documentation/admin-guide/README.rst
accordingly. I am still trying to figure out a few implementation
details like how to convert an existing .config to debugconfig, but want
to gather some feedback before I dive in too deep.
