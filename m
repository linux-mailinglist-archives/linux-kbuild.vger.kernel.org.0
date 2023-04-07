Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0736DB55F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjDGUgX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjDGUgC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:36:02 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6FCCA08;
        Fri,  7 Apr 2023 13:35:46 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337KZJv0010775;
        Fri, 7 Apr 2023 20:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=RnM21H93KsCfKYDZySXqH9aFxlviESAjiVNz4+3cpTA=;
 b=RPrJDtjxRC/di5+kQ5XwCod2NcCWN/veJ0gIV9Pa6mXN0KrTazVM5xvnFLrSPmLHiQ8h
 mh0FhyVvzlRrFU0tJ9yA3TB3Uop2LS5d2p4zKkJ+fW/msiXwLsSRpIfnuxAZ872Nll0s
 CQ54gIHPRZ5phA2+Oh6mnqILEcuZDRahWrK+xZrvWmLRTbgkHnc6oaD2887OUzSlWOeR
 lFTC6qbNTaylR9ov8j2QlV8opRwF8Iibw9uCtd/XzeI57j4QnQync0T7rQmjlImwL0W6
 zld3uYEUnDfUjfZXCVRMV4y/8a4x5/msZOnMFQYLh93TYK4rQ35Wrqrj1ACl5N/M7qbu ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psv4dm47x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 20:35:19 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 337KZI46014700
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Apr 2023 20:35:18 GMT
Received: from hu-johmoo-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 7 Apr 2023 13:35:17 -0700
From:   John Moon <quic_johmoo@quicinc.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Nicolas Schier" <nicolas@fjasle.eu>
CC:     John Moon <quic_johmoo@quicinc.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Matthias Maennich <maennich@google.com>,
        Giuliano Procida <gprocida@google.com>,
        <kernel-team@android.com>, <libabigail@sourceware.org>,
        Jordan Crouse <jorcrous@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        "Guru Das Srinagesh" <quic_gurus@quicinc.com>
Subject: [PATCH v5 0/2] Validating UAPI backwards compatibility
Date:   Fri, 7 Apr 2023 13:34:54 -0700
Message-ID: <20230407203456.27141-1-quic_johmoo@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nmIcOJr4FzDw2GJLhfO-FOoFk4ib5q4w
X-Proofpoint-ORIG-GUID: nmIcOJr4FzDw2GJLhfO-FOoFk4ib5q4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_13,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=954 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070184
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel community has rigorously enforced a policy of backwards
compatibility in its UAPI headers for a long time. This has allowed user
applications to enjoy stability across kernel upgrades without
recompiling. Our goal is to add tooling and documentation to help kernel
developers maintain this stability.

We see in the kernel documentation:
"Kernel headers are backwards compatible, but not forwards compatible.
This means that a program built against a C library using older kernel
headers should run on a newer kernel (although it may not have access
to new features), but a program built against newer kernel headers may
not work on an older kernel."[1]

How does the kernel community enforce this guarantee? As we understand it,
it's enforced with thorough code review and testing. Is there any tooling
outside of this being used to help the process?

Also, could documentation on UAPI maintenance (from a developer's point
of view) be expanded? Internally, we have a set of guidelines for our
kernel developers regarding UAPI compatibility techniques. If there's
interest in supplying a document on this topic with the kernel, we'd be
happy to submit a draft detailing what we have so far as a jumping off
point.

In terms of tooling, I've attached a shell script we've been using
internally to validate backwards compatibility of our UAPI headers. The
script uses libabigail's[2] tool abidiff[3] to compare a modified
header's ABI before and after a patch is applied. If an existing UAPI is
modified, the script exits non-zero. We use this script in our
continuous integration system to block changes that fail the check.

It generates output like this when a backwards-incompatible change is made
to a UAPI header:

!!! ABI differences detected in include/uapi/linux/bpf.h from HEAD~1 -> HEAD !!!

    [C] 'struct bpf_insn' changed:
      type size hasn't changed
      1 data member change:
        type of '__s32 imm' changed:
          typedef name changed from __s32 to __u32 at int-ll64.h:27:1
          underlying type 'int' changed:
            type name changed from 'int' to 'unsigned int'
            type size hasn't changed

We wanted to share this script with the community and hopefully also
receive general feedback when it comes to tooling/policy surrounding this
issue. Our hope is that the script will help kernel UAPI authors maintain
good discipline and avoid breaking userspace.

In v5, we've made a few code quality improvements based on review
feedback. Thanks!

[1] Documentation/kbuild/headers_install.rst
[2] https://sourceware.org/libabigail/manual/libabigail-overview.html
[3] https://sourceware.org/libabigail/manual/abidiff.html

P.S. While at Qualcomm, Jordan Crouse <jorcrous@amazon.com> authored the
original version of the UAPI checker script. Thanks Jordan!<Paste>

John Moon (2):
  check-uapi: Introduce check-uapi.sh
  docs: dev-tools: Add UAPI checker documentation

 Documentation/dev-tools/checkuapi.rst | 480 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 scripts/check-uapi.sh                 | 489 ++++++++++++++++++++++++++
 3 files changed, 970 insertions(+)
 create mode 100644 Documentation/dev-tools/checkuapi.rst
 create mode 100755 scripts/check-uapi.sh


base-commit: f2afccfefe7be1f7346564fe619277110d341f9b
--
2.17.1

