Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C786BF34
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 17:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfGQPdw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 11:33:52 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:54082 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfGQPdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:33:51 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6HFT9V7144925;
        Wed, 17 Jul 2019 15:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=YpieagIzClqGep+kYvHHdZfJtmpglYeY9E+VdFYWRP8=;
 b=UtfkndZ3/N+9XdDmFaPTHF1/dTkPgs3CcC5Sf8UudKnGAl7PqkLdnLw8FYJB/m24hO3V
 mMZDAii0Rgppk+KCAsNrpllG4gvSoEG8CcmxBjhMoUGBQqc1FIVrm9tCah5Fd8bvAeID
 mOra7dsF0+vefgw8qkDgxxetG5Mzxbz85tzYJCNPd+YaLHMo/oOP9mbhABDGziRLO76Z
 6xGg+PacyTL3Q/Zelbml2U2FV0nRV/a1J4cG9zPt11Y4/zhojtNmfMXtWFCF+JflI2js
 Q72Wfbgpvd2HJacxIpgKCsWxyJMKnPd8tbBTeUs1uAa2etuiHamCuqHUnPNzFouY4sh7 Pg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2tq6qtur88-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Jul 2019 15:33:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6HFXSFU181798;
        Wed, 17 Jul 2019 15:33:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2tq4dukjev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Jul 2019 15:33:42 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6HFXWrI002643;
        Wed, 17 Jul 2019 15:33:36 GMT
Received: from localhost (/10.159.238.155)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Jul 2019 15:33:31 +0000
Date:   Wed, 17 Jul 2019 08:33:29 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: linux-next: Tree for Jul 17
Message-ID: <20190717153329.GC7116@magnolia>
References: <20190717142922.214d54ec@canb.auug.org.au>
 <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9321 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907170181
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9321 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170180
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 05:30:47PM +0200, Sedat Dilek wrote:
> Hi Steven, Hi Darrick,
> 
> Unfortunately, my build-script is not working anymore.
> 
> I am using builddeb/mkdebian scripts.

Yeah, I accidentally uploaded an internal build patch yesterday which
got sucked into for-next.  It's been fixed in the iomap-for-next tree
and should disappear in Thursday's for-next tree.  Sorry about that. :(

--D

> [ BUILD-LOG ]
> ...
> set -e; mkdir -p include/config/; { echo "5.2.0$(/bin/bash
> ./scripts/setlocalversion .)"; } > include/config/kernel.release.tmp;
> if [ -r include/config/kernel.release ] && cmp -s
> include/config/kernel.release include/config/kernel.release.tmp; then
> rm -f include/config/kernel.release.tmp; else : '  UPD
> include/config/kernel.release'; mv -f
> include/config/kernel.release.tmp include/config/kernel.release; fi
> make -f ./scripts/Makefile.build obj=scripts/package bindeb-pkg
> /bin/bash ./scripts/package/mkdebian
> ./scripts/package/mkdebian: line 149: cd: source/: No such file or directory
> make[1]: *** [scripts/package/Makefile:79: bindeb-pkg] Error 1
> make: *** [Makefile:1442: bindeb-pkg] Error 2
> 
> Investigations revealed hardcoded stuff from the ...
> 
> Merge remote-tracking branch 'iomap/iomap-for-next'
> 
> $ git blame scripts/package/mkdebian | grep 'cd source'
> 87bdff62e470c (Darrick J. Wong    2019-06-27 17:30:15 -0700 149) (cd
> source/ ; stg ser | sed -e '/^-/d' -e 's/^. /  * /g') >>
> debian/changelog
> 
> $ git log --oneline --author="Darrick J. Wong" scripts/package/mkdebian
> 87bdff62e470 mtr: Build script adjustments
> 
> I do not think this was intended?
> 
> Reverting seems to be easy and fix it for me.
> 
> $ git revert --no-edit 87bdff62e470
> Führe Erkennung für ungenaue Umbenennung aus: 100% (2251440/2251440), Fertig.
> [5.2.0-3-amd64-cbl-asmgoto db8ec1968620] Revert "mtr: Build script adjustments"
>  Date: Wed Jul 17 17:27:26 2019 +0200
>  3 files changed, 10 insertions(+), 17 deletions(-)
> 
> Please make it work again for $WORLD.
> 
> Thanks.
> 
> Regards,
> - Sedat -
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scripts/package/mkdebian?h=next-20190717
