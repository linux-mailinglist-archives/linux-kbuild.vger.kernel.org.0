Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A019D30034A
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 13:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbhAVMfk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 07:35:40 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49386 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbhAVMff (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 07:35:35 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MCYL52136295;
        Fri, 22 Jan 2021 12:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jIuCDq1ZmhYjXckv6wk+/8lC9So5NyF6llF4m0ZdrDA=;
 b=tmNTmEw3nR7FyO7wTWEqF/YOKg4cMNepK0MePmWz78RqgToyEN934UjkvCj9IjOWSvUJ
 Oq1+ApYo83MNH29wHvjFByV20cJeoc9qvZKUshlbD/B93Z8KscCvZgnHqI2S3Fzr0Zli
 OPMpdVJrpgvJgW8zlz08K2pTbfDBoyh+vjQJeirybQlz2j1mZNNGjA3uKZF3fFCrc7zt
 E9IvafZPkt3D/kCLqFRhVRaM/XzVrfzZKbG2/2SjTA/zMGl1Q/IqM2iyC3naqY5qGSfn
 hEY7UFSsl6HcABvWYijrnjZpxVAsJSqayKUSdwO1nKREfQhUTxVPJHgEk308iCUq/gUJ 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 3668qn3tr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 12:34:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MCFruC189345;
        Fri, 22 Jan 2021 12:34:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 3668rgtr7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 12:34:14 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10MCY4A0004548;
        Fri, 22 Jan 2021 12:34:08 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 22 Jan 2021 04:34:04 -0800
Date:   Fri, 22 Jan 2021 15:33:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-ID: <20210122123354.GR2696@kadam>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220069
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220070
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 05:15:56PM +0100, Sedat Dilek wrote:
> On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Good catch, Lukas.
> 
> As a tipp:
> Next time you can pass '--subject-prefix="PATCH next-YYYYMMDD"' when
> doing 'git format-patch ...' (or whatever you use to generate the
> patch).

I've never seen anyone use this prefix before.

What does the date really help?  In staging, we apply everything on top
of staging-next and if it doesn't apply then we don't investigate, we
just say "doesn't apply.  resend if needed".

We may as well just say [PATCH linux-next].  No one is ever going to
look up the date if it doesn't apply to the latest linux-next.

regards,
dan carpenter
