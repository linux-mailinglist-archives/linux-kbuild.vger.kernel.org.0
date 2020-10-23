Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88711296E0D
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Oct 2020 13:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463266AbgJWL54 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Oct 2020 07:57:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43448 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S463255AbgJWL5y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Oct 2020 07:57:54 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09NBXL5L143516;
        Fri, 23 Oct 2020 07:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=n4tnJxvfTW0oJFfhDlOKMXdZwKcOKgxdp3PFV/BHuCw=;
 b=h66UMP+mM6etFu/peg8BpF9/mIuqlKw2dFkEKu38tYsHbXQFCV3vGCdBtjOgnpu/iICm
 2I/TRATZNcD0OUfuK2IA6+z6Ph/N0FioRurpsmyLh2ulw3F6q7Ly5119f3IByLqeTdWo
 Qd2Jo0g1fwNCcslpEYicmYJzCvJUB2OT503x+rvP0o5hS28/jrSHp53xZ+l3pP3b0KSK
 M6//AQwWY3BMYMi9JBjFXMusuwzvNL3KLJWrPyCg6TblBzHCCmI5UJEAMva6VcSKFF18
 9O573sSlxGN3tMxnqDukHVIEus21w5ZKjMG7ynTmW5qzj/HRMeKkkTH6uQJqDS1U/LvA cA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34bcaprcwh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 07:57:41 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NBvejX008099;
        Fri, 23 Oct 2020 11:57:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03fra.de.ibm.com with ESMTP id 347r87udf8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 11:57:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09NBvbMa27263452
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:57:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5F0A852051;
        Fri, 23 Oct 2020 11:57:37 +0000 (GMT)
Received: from localhost (unknown [9.145.183.202])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id EDA8152052;
        Fri, 23 Oct 2020 11:57:36 +0000 (GMT)
Date:   Fri, 23 Oct 2020 13:57:35 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] add option to save vmlinux link map
Message-ID: <cover.thread-ba6b03.your-ad-here.call-01603453670-ext-0242@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-23_04:2020-10-23,2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=2
 mlxlogscore=967 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230082
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linker -Map option allows to save detailed link map which provides far
more information then the objdump tool might extract.

Discarded input sections
 .text.__s390_indirect_jump_r14
                0x0000000000000000        0xc arch/s390/kernel/process.o

Detailed information on sections, objects and symbols.
.init.data      0x0000000001276000    0x671f0
 *(SORT_BY_NAME(___kentry+*))
 *(.init.data init.data.*)
 .init.data     0x0000000001276000     0x31b8 init/main.o
                0x0000000001276128                late_time_init
                0x00000000012781b8                boot_command_line
 .init.data     0x00000000012791b8       0x60 init/do_mounts.o
 .init.data     0x0000000001279218        0x4 init/do_mounts_rd.o
                0x0000000001279218                rd_image_start
 *fill*         0x000000000127921c        0x4
 .init.data     0x0000000001279220       0x18 init/do_mounts_initrd.o
                0x0000000001279228                phys_initrd_start
                0x0000000001279230                phys_initrd_size

It helps to bring the light on linker decisions and debug linker scripts.
 FILL mask 0xff
                0x000000000082f000                . = ALIGN (0x1000)
 *fill*         0x000000000082e3fa      0xc06 ff
                0x000000000082f000                _end = .

Resulting vmlinux.map is currently 8.8M for s390.
And 48K for the decompressor's arch/s390/boot/compressed/vmlinux.map

- First patch introduces CONFIG_SAVE_LINK_MAP option, which enables
  link map and is arch independent.
- Second patch is s390 specific and additionally enables decompressor's
  link map saving if CONFIG_SAVE_LINK_MAP is enabled.

It is probably better if both changes would go via kbuild tree.

Vasily Gorbik (2):
  kbuild: add config option to save link map file(s)
  s390/decompressor: support link map saving

 .gitignore                         |  1 +
 Makefile                           |  6 +++++-
 arch/s390/boot/compressed/Makefile |  4 +++-
 lib/Kconfig.debug                  | 13 +++++++++++++
 4 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.25.4
