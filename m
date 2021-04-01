Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A11350BF1
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Apr 2021 03:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhDAB0n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 21:26:43 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:35542 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230248AbhDAB0S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 21:26:18 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 1311E1CV005431
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 18:26:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=V5LJ0YNCsfWCWPJH8+kVWfkYyUBDFwMKYKFBYp2yjgo=;
 b=EB+HBNtagXW/gGPb4l2s1GcGDG3ZlDt+PZqDnTudFDWoKY9iOxYxZRY8uZRUYp9hnfF6
 hWZfvoF7ARxGu4Zh4Tna5csRkFd+QTcxHPKCI8+9PIxNvh++YR6hxQmIwytBkY6zYqMm
 rNefIuFVG1ozqMBopfZaXnpnwAw1ZUeJm5Y= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0089730.ppops.net with ESMTP id 37n28a8kyn-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 18:26:17 -0700
Received: from intmgw002.25.frc3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 31 Mar 2021 18:24:11 -0700
Received: by devbig003.ftw2.facebook.com (Postfix, from userid 128203)
        id C0540EB0C1B; Wed, 31 Mar 2021 18:24:06 -0700 (PDT)
From:   Yonghong Song <yhs@fb.com>
To:     <linux-kbuild@vger.kernel.org>
CC:     Alexei Starovoitov <ast@kernel.org>,
        Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        <bpf@vger.kernel.org>, <kernel-team@fb.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH kbuild v3 0/2] add an elfnote with type BUILD_COMPILER_LTO_INFO
Date:   Wed, 31 Mar 2021 18:24:06 -0700
Message-ID: <20210401012406.1800957-1-yhs@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: M-l0HuossMOVgtgid0V8-IYgF6M-rcrs
X-Proofpoint-ORIG-GUID: M-l0HuossMOVgtgid0V8-IYgF6M-rcrs
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_11:2021-03-31,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1015
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=329 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010006
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, clang LTO built vmlinux won't work with pahole.
LTO introduced cross-cu dwarf tag references and broke
current pahole model which handles one cu as a time.
The solution is to merge all cu's as one pahole cu as in [1].
We would like to do this merging only if cross-cu dwarf
references happens. The LTO build mode is a pretty good
indication for that.

In earlier version of this patch ([2]), clang flag
-grecord-gcc-switches is proposed to add to compilation flags
so pahole could detect "-flto" and then merging cu's.
This will increate the binary size of 1% without LTO though.

Arnaldo suggested to use a note to indicate the vmlinux
is built with LTO. Such a cheap way to get whether the vmlinux
is built with LTO or not helps pahole but is also useful
for tracing as LTO may inline/delete/demote global functions,
promote static functions, etc.

This patch set added an elfnote with type BUILD_COMPILER_LTO_INFO.
The owner of the note is "Linux". Patch #1 did some refactoring
and Patch #2 added the elfnote with BUILD_COMPILER_LTO_INFO to
indicate whether vmlinux is built with LTO or not.

 [1] https://lore.kernel.org/bpf/20210325065316.3121287-1-yhs@fb.com/
 [2] https://lore.kernel.org/bpf/20210331001623.2778934-1-yhs@fb.com/

Yonghong Song (2):
  kbuild: move LINUX_ELFNOTE_BUILD_SALT to elfnote.h
  kbuild: add an elfnote with type BUILD_COMPILER_LTO_INFO

 include/linux/build-salt.h | 2 --
 include/linux/compiler.h   | 8 ++++++++
 include/linux/elfnote.h    | 6 ++++++
 init/version.c             | 2 ++
 scripts/mod/modpost.c      | 1 +
 5 files changed, 17 insertions(+), 2 deletions(-)

--=20
2.30.2

