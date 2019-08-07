Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8911846BD
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 10:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387562AbfHGIFH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Aug 2019 04:05:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10870 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387546AbfHGIFH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 04:05:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7783GTq111985
        for <linux-kbuild@vger.kernel.org>; Wed, 7 Aug 2019 04:05:06 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7swttb3n-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Aug 2019 04:05:06 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Wed, 7 Aug 2019 08:54:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 7 Aug 2019 08:54:53 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x777sqtm35848414
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Aug 2019 07:54:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C866F4C050;
        Wed,  7 Aug 2019 07:54:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 965B74C046;
        Wed,  7 Aug 2019 07:54:52 +0000 (GMT)
Received: from localhost (unknown [9.152.212.168])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  7 Aug 2019 07:54:52 +0000 (GMT)
Date:   Wed, 7 Aug 2019 09:54:51 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] s390/build: use size command to perform empty .bss
 check
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
 <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
 <CAK7LNATyNWjwVXdbgXt0mL+3R8jTGe_cq1vEW8_VvB250P4bdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATyNWjwVXdbgXt0mL+3R8jTGe_cq1vEW8_VvB250P4bdg@mail.gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 19080707-0008-0000-0000-000003062B61
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080707-0009-0000-0000-00004A242CB1
Message-Id: <your-ad-here.call-01565164491-ext-3516@work.hours>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=993 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070086
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 07, 2019 at 11:33:40AM +0900, Masahiro Yamada wrote:
> On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
> >
> > Currently empty .bss checks performed do not pay attention to "common
> > objects" in object files which end up in .bss section eventually.
> >
> > The "size" tool is a part of binutils and since version 2.18 provides
> > "--common" command line option, which allows to account "common objects"
> > sizes in .bss section size. Utilize "size --common" to perform accurate
> > check that .bss section is unused. Besides that the size tool handles
> > object files without .bss section gracefully and doesn't require
> > additional objdump run.
> >
> > The linux kernel requires binutils 2.20 since 4.13.
> >
> > Kbuild exports OBJSIZE to reference the right size tool.
> >
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> > ---
> >  arch/s390/scripts/Makefile.chkbss | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/s390/scripts/Makefile.chkbss b/arch/s390/scripts/Makefile.chkbss
> > index 884a9caff5fb..ba1d7a8a242f 100644
> > --- a/arch/s390/scripts/Makefile.chkbss
> > +++ b/arch/s390/scripts/Makefile.chkbss
> > @@ -11,8 +11,7 @@ chkbss: $(addprefix $(obj)/, $(chkbss-files))
> >
> >  quiet_cmd_chkbss = CHKBSS  $<
> >        cmd_chkbss = \
> > -       if $(OBJDUMP) -h $< | grep -q "\.bss" && \
> > -          ! $(OBJDUMP) -j .bss -w -h $< | awk 'END { if ($$3) exit 1 }'; then \
> > +       if ! $(OBJSIZE) --common $< | awk 'END { if ($$3) exit 1 }'; then \
> 
> While you are touching this line,
> you may also want to replace 'awk' with $(AWK),
> which is defined in the top-level Makefile.

Indeed, thank you!

