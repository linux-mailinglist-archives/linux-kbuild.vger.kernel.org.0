Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D6155D423
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbiF0MvN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jun 2022 08:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbiF0MvM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jun 2022 08:51:12 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BE5B09;
        Mon, 27 Jun 2022 05:51:11 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCeK61017364;
        Mon, 27 Jun 2022 12:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=53afysDds1K74axxeupPt1cGAxGKDsRUO8JcgSuHvQI=;
 b=VzCwSL/OhT0oKFNq7anNiZTRnYxDSsKDLNoZoX7QBT0+JQ/2efgmBdkrLn4kXGYqv9vD
 WS/P2OSTVgoJZkfkx+ONok/guSY8PHpQcX3UvKJiwtyM/5Ldc4/cSHyHcNUzlpjFaqBc
 uA2zAghac+1HPbFzQenpQBCKS4MDs31o0DMIIpSLmuqPTV+x8GooxWx8Rh4MSnCSjFMi
 EdbGTcBjDwT8UXKcUwrLfTJtRA+Ek/oU9Z8foXvSi/4BflRNhZ7ZslKh01KqT/Qqzwzs
 Wktmt5CKY5k0ZsJ6aXA/nTRrUMgiNfhfeYeiFtpxqL4o8KIUAKHcYiFGL1nCCWp98ILb kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyc051f0u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:50:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RCngAQ026244;
        Mon, 27 Jun 2022 12:50:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyc051f0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:50:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RCoZWR004121;
        Mon, 27 Jun 2022 12:50:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04ams.nl.ibm.com with ESMTP id 3gwt08txh1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:50:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RCntZY20644130
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jun 2022 12:49:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF3C0A4065;
        Mon, 27 Jun 2022 12:50:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 788B8A405B;
        Mon, 27 Jun 2022 12:50:52 +0000 (GMT)
Received: from localhost (unknown [9.171.41.134])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 27 Jun 2022 12:50:52 +0000 (GMT)
Date:   Mon, 27 Jun 2022 14:50:51 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: s390/nospec: add an option to use thunk-extern
Message-ID: <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c2TEVjgToZ1Gdl0cWmT6rfz0mSHhv7_x
X-Proofpoint-ORIG-GUID: esUrb2bllpocmQqAJPstuq2RTYHUtlrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=881
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270055
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Joe,

sorry for late reply.

> I couldn't find the upstream patch post for 1d2ad084800e ("s390/nospec:
> add an option to use thunk-extern"), so replying off-list here.  Feel
> free to cc the appropriate list.
> 
> Regarding this change, as I understand it, when CONFIG_EXPOLINE_EXTERN=y
> out-of-tree kernel modules will need to link against
> arch/s390x/lib/expoline.o, right?
> 
> And if so, shouldn't the top level 'prepare_modules' target create
> expoline.o for this purpose?

Thanks for bringing this up. I definitely missed out-of-tree kernel modules
build case without a prebuilt kernel. On the other hand this post-linking
trick is a rip off from powerpc:

KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o

So, now I wonder why powerpc doesn't have crtsavres.o in 'prepare_modules'.

Anyhow, below is couple of patches to consider. The first one is
meant to be backportable, as the second one requires 4efd417f298b.

I had to move expoline.S to a separate directory to be able to call into
its Makefile for 'prepare_modules' and avoid warnings for other targets
defined in the same Makefile. Not sure if there are better kbuild tricks
I could use. Another option I thought about is to keep expoline.S where
it is and add a condition into that Makefile:
expoline_prepare: prepare0
	$(Q)$(MAKE) $(build)=arch/s390/lib expoline_prepare=1 arch/s390/lib/expoline.o

arch/s390/lib/Makefile:
# first target defined
obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
ifndef expoline_prepare
# ...other targets...

Vasily Gorbik (2):
  s390/nospec: build expoline.o for modules_prepare target
  s390/nospec: remove unneeded header includes

 arch/s390/Makefile                      | 8 +++++++-
 arch/s390/include/asm/nospec-insn.h     | 2 --
 arch/s390/lib/Makefile                  | 3 ++-
 arch/s390/lib/expoline/Makefile         | 3 +++
 arch/s390/lib/{ => expoline}/expoline.S | 0
 5 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/s390/lib/expoline/Makefile
 rename arch/s390/lib/{ => expoline}/expoline.S (100%)

-- 
2.35.1
