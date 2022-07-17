Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C39BD577654
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Jul 2022 15:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiGQNL2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jul 2022 09:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiGQNL2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jul 2022 09:11:28 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180A665A7;
        Sun, 17 Jul 2022 06:11:26 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26HC6l3g029380;
        Sun, 17 Jul 2022 13:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ts4Yl/PPKdtVWtNzAeuFDOysnRrXSDU2CQRTsQymGcA=;
 b=KgpHWOU6atCFx1g39a+SVNTWWQ4fPn+mZOQAfSQifGnmBbmI5wlvRkA6kEAMB/srwkXt
 ZyQ29WwppBRkYFh65XlGnKQaeKRDVuhcD9T2LUCv1jSuspeetd/FcoRoBJHft2KvQmYn
 yHGyBb9tyK1R21kIN5gbijBweYLIbbf1knvSH3vhMInhEorSf1y84dS6e2LpkULnmuDV
 ighaNryEz9jMaBl2cmtxTk3dJq2FQwOk8EvY+r+kFm9LY+tgmYppLUXxvLrLRvBX3Gg2
 P7PMshOFsDvjWoG00/qcKdIAmTNXfGBlZ4uX3Xm5xLoqW2gtS0P2vvC9XODwFV/30+oL Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hchwm0x6a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 17 Jul 2022 13:11:13 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26HCxHHP031072;
        Sun, 17 Jul 2022 13:11:13 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hchwm0x5s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 17 Jul 2022 13:11:13 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26HD5Buw019259;
        Sun, 17 Jul 2022 13:11:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03fra.de.ibm.com with ESMTP id 3hbmy8h3en-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 17 Jul 2022 13:11:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26HD9RAH19464614
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 17 Jul 2022 13:09:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 016EFA405B;
        Sun, 17 Jul 2022 13:11:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7EEFFA4054;
        Sun, 17 Jul 2022 13:11:06 +0000 (GMT)
Received: from [9.171.37.89] (unknown [9.171.37.89])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sun, 17 Jul 2022 13:11:06 +0000 (GMT)
Message-ID: <2db2140b-ce07-f066-bcc2-981a53849bbb@linux.ibm.com>
Date:   Sun, 17 Jul 2022 15:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: s390/nospec: add an option to use thunk-extern
Content-Language: en-US
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org, "C. Erastus Toe" <ctoe@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <ad6a926e-eed1-a5e2-9f8b-0ea1599bbaed@redhat.com>
 <CAPQ7N1RFyZRCJZc84UxjSQj44ksa6f6ib5B=dVwoqMU9_=s8QA@mail.gmail.com>
 <e853268a-3e0a-3a88-331b-53c74e8796d6@redhat.com>
From:   Sumanth Korikkar <sumanthk@linux.ibm.com>
In-Reply-To: <e853268a-3e0a-3a88-331b-53c74e8796d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WAQoppZEw_Dg8rTtUh_HTFWJhlMBdgB2
X-Proofpoint-GUID: DjXOoihHmaPcz9im4GJQN65GxsW17nZs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-17_06,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207170064
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Joe,

c4e789572557 ("s390/nospec: build expoline.o for modules_prepare 
target") is now in linux.git.

Note: arch/s390/lib/expoline.o is moved to 
arch/s390/lib/expoline/expoline.o. This means kernel-devel package in 
fedora should also include this updated file path.

Thanks

On 7/1/22 23:39, Joe Lawrence wrote:
> On 7/1/22 5:18 PM, C. Erastus Toe wrote:
>> On Wed, Jun 29, 2022 at 11:16 AM Joe Lawrence <joe.lawrence@redhat.com
>> <mailto:joe.lawrence@redhat.com>> wrote:
>>
>>      On 6/27/22 8:50 AM, Vasily Gorbik wrote:
>>      > Hi Joe,
>>      >
>>      > sorry for late reply.
>>      >
>>      >> I couldn't find the upstream patch post for 1d2ad084800e
>>      ("s390/nospec:
>>      >> add an option to use thunk-extern"), so replying off-list here.  Feel
>>      >> free to cc the appropriate list.
>>      >>
>>      >> Regarding this change, as I understand it, when
>>      CONFIG_EXPOLINE_EXTERN=y
>>      >> out-of-tree kernel modules will need to link against
>>      >> arch/s390x/lib/expoline.o, right?
>>      >>
>>      >> And if so, shouldn't the top level 'prepare_modules' target create
>>      >> expoline.o for this purpose?
>>      >
>>      > Thanks for bringing this up. I definitely missed out-of-tree
>>      kernel modules
>>      > build case without a prebuilt kernel. On the other hand this
>>      post-linking
>>      > trick is a rip off from powerpc:
>>      >
>>      > KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>>      >
>>      > So, now I wonder why powerpc doesn't have crtsavres.o in
>>      'prepare_modules'.
>>      >
>>      > Anyhow, below is couple of patches to consider. The first one is
>>      > meant to be backportable, as the second one requires 4efd417f298b.
>>      >
>>      > I had to move expoline.S to a separate directory to be able to
>>      call into
>>      > its Makefile for 'prepare_modules' and avoid warnings for other
>>      targets
>>      > defined in the same Makefile. Not sure if there are better kbuild
>>      tricks
>>      > I could use. Another option I thought about is to keep expoline.S
>>      where
>>      > it is and add a condition into that Makefile:
>>      > expoline_prepare: prepare0
>>      >       $(Q)$(MAKE) $(build)=arch/s390/lib expoline_prepare=1
>>      arch/s390/lib/expoline.o
>>      >
>>      > arch/s390/lib/Makefile:
>>      > # first target defined
>>      > obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
>>      > ifndef expoline_prepare
>>      > # ...other targets...
>>      >
>>      > Vasily Gorbik (2):
>>      >   s390/nospec: build expoline.o for modules_prepare target
>>      >   s390/nospec: remove unneeded header includes
>>      >
>>      >  arch/s390/Makefile                      | 8 +++++++-
>>      >  arch/s390/include/asm/nospec-insn.h     | 2 --
>>      >  arch/s390/lib/Makefile                  | 3 ++-
>>      >  arch/s390/lib/expoline/Makefile         | 3 +++
>>      >  arch/s390/lib/{ => expoline}/expoline.S | 0
>>      >  5 files changed, 12 insertions(+), 4 deletions(-)
>>      >  create mode 100644 arch/s390/lib/expoline/Makefile
>>      >  rename arch/s390/lib/{ => expoline}/expoline.S (100%)
>>      >
>>
>>      Thanks, Vasily.  We'll test these with OOT and the original gitlab
>>      pipeline where we spotted potential issue with packaging and report
>>      back.
>>
>> Hi,
>>
>> Successfully tested the first patch in a rhel-9 backport. (had to skip
>> the second as it has dependencies on other patches like [1] that
>> deprecated symbols like __LC_BR_R1. Without those, the build resulted in
>> a flood of: depmod: WARNING: <module>.ko needs unknown symbol __LC_BR_R1.)
>>
>> For ("s390/nospec: build expoline.o for modules_prepare target"),
>> Tested-by: C. Erastus Toe <ctoe@redhat.com <mailto:ctoe@redhat.com>>
>>
>> [1] 4efd417f298b ("s390: raise minimum supported machine generation to z10")
>>
> 
> And then for the entire series (tested on top of v5.19-rc4),
> Tested-by: Joe Lawrence <joe.lawrence@redhat.com>
> 

-- 
Sumanth
