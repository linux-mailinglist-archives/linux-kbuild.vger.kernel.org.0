Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44DF06BE7D2
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Mar 2023 12:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjCQLRn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Mar 2023 07:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCQLRm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Mar 2023 07:17:42 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CCD5CEFB;
        Fri, 17 Mar 2023 04:17:41 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HAoWB2005659;
        Fri, 17 Mar 2023 11:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ATFiH+1MM9RiisZf+ez7me+4b+J9EiQMPUBbKAXaiiI=;
 b=m4ZnAn9GIoYmbksDk2Ykcf0hPjz2v7YrD7kMlc0wyHQwC4tLhQ5kxfa3Qr9ytP4MZlpU
 51M5QQdRu8AWWVtkDTvmNfA0xz2P3b1gyIMhIkJxyGHMk5Ldh8Rbmw85lDdLcK9KgN6T
 Ku29ftFSPZUt0KyaOf6r49vySU/E7wXaeckAqyw0lJLVnHHL65ctfLsVS4zipfP1sexB
 ROhZT9CtOGEBJWTRkKU08veNzAVLV6raCNgk1OkmSqw70CQybfslUO/FCVC4IKbxYJ5Z
 JJIgC8nznL66RrVPiGOwwwJjRoBuIIRHs+79aQ1lPlJ3cPpVNPMVDXRlJwBx7iGz15st ug== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcptdgkf5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 11:17:33 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32HAq16F008421;
        Fri, 17 Mar 2023 11:17:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcptdgkek-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 11:17:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32H6UsuL015015;
        Fri, 17 Mar 2023 11:17:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3j37e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 11:17:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32HBHRxb13501138
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Mar 2023 11:17:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 61CE820043;
        Fri, 17 Mar 2023 11:17:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B42DE20040;
        Fri, 17 Mar 2023 11:17:26 +0000 (GMT)
Received: from localhost (unknown [9.171.35.234])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Fri, 17 Mar 2023 11:17:26 +0000 (GMT)
Date:   Fri, 17 Mar 2023 12:17:25 +0100
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] s390/nospec: remove unneeded header includes
Message-ID: <your-ad-here.call-01679051845-ext-2019@work.hours>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
 <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xAl2o_CiUCMSj35vEpV5ZaiO92YBfXqA
X-Proofpoint-ORIG-GUID: wLjZMAwu3OhZLwsbeXpcvEu-Yf5M1g5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxlogscore=856 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170075
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 16, 2023 at 12:14:27PM +0100, Jiri Slaby wrote:
> On 27. 06. 22, 14:50, Vasily Gorbik wrote:
> > With that, expoline.S doesn't require asm-offsets.h and
> > expoline_prepare target dependency could be removed.
> > 
> > +++ b/arch/s390/Makefile
> > @@ -166,7 +166,7 @@ vdso_prepare: prepare0
> >   ifdef CONFIG_EXPOLINE_EXTERN
> >   modules_prepare: expoline_prepare
> > -expoline_prepare: prepare0
> > +expoline_prepare:
> 
> this likely broke s390 build as expolines still depend on
> scripts/basic/fixdep. And build of expolines can now race with fixdep build:
>      make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
>      /bin/sh: line 1: scripts/basic/fixdep: Permission denied
>      make[1]: *** [../scripts/Makefile.build:385:
> arch/s390/lib/expoline/expoline.o] Error 126
>      make: *** [../arch/s390/Makefile:166: expoline_prepare] Error 2
> 
> I returned there:
>   expoline_prepare: prepare0
> and it looks good so far. Maybe even:
>   expoline_prepare: scripts
> would be enough.

Hi Jiri, thanks for looking into this!

Probably even scripts_basic would be enough to add explicit dependency
to fixdep. But I just couldn't reproduce missing scripts/basic/fixdep
neither with modules_prepare nor expoline_prepare targets.

With which specific build command were you able to get those error
messages? I wonder where
        make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
is coming from. Could it be smth like?

make ARCH=s390 CROSS_COMPILE=s390x-12.2.0- -j64 arch/s390/lib/expoline/expoline.o

Playing around with this build target I found it is broken:

  AS      arch/s390/lib/expoline/expoline.o
  AS      arch/s390/lib/expoline/expoline.o
fixdep: error opening file: arch/s390/lib/expoline/.expoline.o.d: No such file or directory
make[3]: *** [scripts/Makefile.build:374: arch/s390/lib/expoline/expoline.o] Error 2
make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
make[2]: *** [scripts/Makefile.build:494: arch/s390/lib/expoline] Error 2
make[1]: *** [scripts/Makefile.build:494: arch/s390/lib] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:2028: .] Error 2

Notice dup AS call, which is probably causing this:
make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'

But that would be a different issue from the one you are trying to fix.
