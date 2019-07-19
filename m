Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254736D7C8
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 02:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfGSAbQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Jul 2019 20:31:16 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52618 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfGSAbQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:31:16 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6J0TTUE124178;
        Fri, 19 Jul 2019 00:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=J26ID3VhBWbTmSXvBSWz6hrmQIArsBpDq2yhhBCBSO4=;
 b=H6LzqGTGYtOgbnoSkU0/jp5FjIxiUFAl4x+FQqoye7DqLu9BECbRWq8CJYgkcmkMj3/g
 egvRkKHstNfMzr7vpSQ3LifW3hRoOC/9Y+Xj3n8CK28IuvjmZIr9ObCPsB0w5Vb5Q/wf
 OljlALngHdIPn1ww5BPqED5k2ncFMOIx5/AE/11rsFa/rsPrsV93uTmoDTrWL4KX3tLc
 d1X/daxuqYve68QYaiT6InMCCTXNH6KQXGcntQwO0wrhkCCK8v/A24n/DgrkIFn9JNVx
 bHygWTeGXEyZUnyxBa8xc2ZvR9IptY4khxWGQ8+cfrGi1pYH37e9+665BuscbBewvFgK Eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2tq6qu3x23-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Jul 2019 00:30:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6J0NUGE148911;
        Fri, 19 Jul 2019 00:30:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2tsctyksfk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Jul 2019 00:30:55 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6J0Ulch020895;
        Fri, 19 Jul 2019 00:30:47 GMT
Received: from localhost (/10.145.178.44)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Jul 2019 00:30:47 +0000
Date:   Thu, 18 Jul 2019 17:30:45 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719003045.GF692234@magnolia>
References: <20190718133751.3cf036be@canb.auug.org.au>
 <127d228c-322d-6349-382b-d304974df148@infradead.org>
 <20190719100557.3ead3285@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190719100557.3ead3285@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9322 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907190001
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9322 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907190002
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 19, 2019 at 10:05:57AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 18 Jul 2019 10:00:22 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > on x86_64, when CONFIG_BLOCK is not set:
> > 
> >   CC      include/linux/iomap.h.s
> > In file included from <command-line>:0:0:
> > ./../include/linux/iomap.h: In function ‘iomap_sector’:
> > ./../include/linux/iomap.h:76:48: error: ‘SECTOR_SHIFT’ undeclared (first use in this function); did you mean ‘SECTIONS_SHIFT’?
> >   return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
> >                                                 ^~~~~~~~~~~~
> 
> include/linux/iomap.h should only be used when CONFIG_BLOCK is set (if
> you follow the Kconfig trail).  So maybe this header should only be
> compile tested if CONFIG_BLOCK is set.

Yeah, that's basically what Christoph said earlier today.

Granted, nobody replied to my question about where in the kernel would
someone be using iomap to map file offsets to disk locations without
block devices, but ...

... oh, this is some weird "mash all the kernel headers together and see
if they compile" thing, isn't it?  Um, yes, iomap.h should only be
tested if CONFIG_IOMAP=y (which in turn requires CONFIG_BLOCK=y).

--D

> -- 
> Cheers,
> Stephen Rothwell


