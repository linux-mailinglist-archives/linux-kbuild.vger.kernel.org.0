Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED3D301426
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 10:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbhAWJW6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Jan 2021 04:22:58 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41332 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbhAWJWH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jan 2021 04:22:07 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10N9J5jq111878;
        Sat, 23 Jan 2021 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Dteca2DTJ/B6Y4PJ3HpK/3HkLckJdMVpe5yJfeyUSXQ=;
 b=IuTJuHM4XxMVMLad4MfzUE5s6yjg/Y8brW8kDEr/nwzIr3kSi7+rTGqrr1A3ZW8ABDuI
 tqkfaRqI+Df/6EQ7aPr5T+3NzkuWRcGMzXXCDY6waaA2WOzOi1Salkg0RJqSs/Cu6vZ6
 ZIG6s3q/Rw6XXWqIc93pwJlhwtBfAa9MWCgpgZ4+Ws9LbdY3A69N9C+AFiX5piXs1S8w
 qA1L1S9IoX4gciqgGZ4NeHZFoG1cDbwGSV5E37CnEwnxqPzTCR6haIMWwCH9dk1Wjtle
 84MW+iOHgAhfAphPIC834jc3kFHjc1ze/jLsYVx20H92NJ2S90tM2yHQ/QY1qw5AvuyE iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 3689aa8scp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 23 Jan 2021 09:21:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10N9KC5N071471;
        Sat, 23 Jan 2021 09:21:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 368bm0xwyg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 23 Jan 2021 09:21:08 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10N9L18T024281;
        Sat, 23 Jan 2021 09:21:03 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 23 Jan 2021 01:21:00 -0800
Date:   Sat, 23 Jan 2021 12:20:51 +0300
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
Message-ID: <20210123092051.GT2696@kadam>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
 <20210122123354.GR2696@kadam>
 <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101230053
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101230053
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In networking then they want you to say which tree it applies to, but
it's not as simple as saying "net" vs "net-next".  If it's a bugfix then
you should write that against "net" but if it's a clean up or a fix to a
recent change then it should be written against "net-next".

Also linux-next is not necessarily the same thing as net-next.
Networking patches should be written against either net or net-next, not
linux-next.

BPF tried to implement similar rules to they're not big enough to impose
their own rules.  It's quite a big headache to try to figure out which
tree to use if you're like me and have no clue about bpf.

Anyway, the point of the net vs net-next is that devs are supposed to
figure out the exact tree and they're supposed to only write net-next if
it doesn't apply to net.

It's not clear to me the value of putting linux-next in the subject.
Doesn't everyone develop against the latest devel tree?  Certainly I
can't imagine any maintainers doing extra work to try figure out the
date of the linux-next release.  Surely, they just say "Doesn't apply to
foo-tree.  Resend if necessary."  That's the fastest and easiest
response when patches don't apply.

regards,
dan carpente
