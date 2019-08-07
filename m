Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8338468F
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 10:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbfHGIBr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Aug 2019 04:01:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62670 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbfHGIBr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 04:01:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x777xBT5099440
        for <linux-kbuild@vger.kernel.org>; Wed, 7 Aug 2019 04:01:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7swtt6ys-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Aug 2019 04:01:45 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Wed, 7 Aug 2019 09:01:43 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 7 Aug 2019 09:01:41 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7781MrA33096110
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Aug 2019 08:01:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8C3EEA4069;
        Wed,  7 Aug 2019 08:01:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 692F2A405B;
        Wed,  7 Aug 2019 08:01:40 +0000 (GMT)
Received: from localhost (unknown [9.152.212.168])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  7 Aug 2019 08:01:40 +0000 (GMT)
Date:   Wed, 7 Aug 2019 10:01:39 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: add OBJSIZE variable for the size tool
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
 <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 19080708-0008-0000-0000-000003062BED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080708-0009-0000-0000-00004A242D49
Message-Id: <your-ad-here.call-01565164899-ext-1604@work.hours>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=997 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070085
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 07, 2019 at 11:32:04AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
> >
> > Define and export OBJSIZE variable for "size" tool from binutils to be
> > used in architecture specific Makefiles (naming the variable just "SIZE"
> > would be too risky). In particular this tool is useful to perform checks
> > that early boot code is not using bss section (which might have not been
> > zeroed yet or intersects with initrd or other files boot loader might
> > have put right after the linux kernel).
> >
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> 
> I think you want to apply both to the s390 tree. If so,
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> Thanks.

Yes, I would take it via s390 tree. Thank you!

