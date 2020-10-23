Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43183296E0A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Oct 2020 13:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463257AbgJWL5y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Oct 2020 07:57:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14170 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2409403AbgJWL5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Oct 2020 07:57:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09NBVwDt013591;
        Fri, 23 Oct 2020 07:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=d2KlYU6cPzpYXNGWOxxfZILRbEZAbRMnACZPiwWQW50=;
 b=gqFuJvNbgXhxkuhnsfsKcSd7/el1tLXHX1ORprJkn8WAwNCvac9ZNA161bZmoyymuVu9
 O6EW3HdWQ7J3fmxmpcE784+VyE5V/hEAAiLtOuHJAKjPEKqw6JDL1ChCotF43X9yjkfv
 rILil+8G6f85ttRrydHcS0wFh+QgkC/eAp4GQ+FIV6yMOgrcF2siniG9thHRIFzzjYs6
 1rGEBA5qGWECk+Bgm6xMSbeLOeT2sh4jxr32827YhRg5J+QkgkEnPBum6gRUgRzgnv5D
 wThpRug2kK/EPfxEvukMLqEDbvucEs9/lO422Q/3T6uHH9DnAdLiQg2gX+cRBW9kdnI2 Zg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34buh5n9dj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 07:57:47 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NBlsPp032418;
        Fri, 23 Oct 2020 11:57:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma06fra.de.ibm.com with ESMTP id 347qvhbde4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 11:57:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09NBvhiU26345964
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:57:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CF7D4C046;
        Fri, 23 Oct 2020 11:57:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D4FB94C050;
        Fri, 23 Oct 2020 11:57:42 +0000 (GMT)
Received: from localhost (unknown [9.145.183.202])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 23 Oct 2020 11:57:42 +0000 (GMT)
Date:   Fri, 23 Oct 2020 13:57:41 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] s390/decompressor: support link map saving
Message-ID: <patch-2.thread-ba6b03.git-ba6b036ed181.your-ad-here.call-01603453670-ext-0242@work.hours>
References: <cover.thread-ba6b03.your-ad-here.call-01603453670-ext-0242@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-ba6b03.your-ad-here.call-01603453670-ext-0242@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-23_04:2020-10-23,2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=2
 adultscore=0 mlxlogscore=828 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230078
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Produce arch/s390/boot/compressed/vmlinux.map link map for the
decompressor, when CONFIG_SAVE_LINK_MAP option is enabled.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 arch/s390/boot/compressed/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/s390/boot/compressed/Makefile b/arch/s390/boot/compressed/Makefile
index b235ed95a3d8..859a5c7c9ca7 100644
--- a/arch/s390/boot/compressed/Makefile
+++ b/arch/s390/boot/compressed/Makefile
@@ -21,7 +21,9 @@ OBJCOPYFLAGS :=
 
 OBJECTS := $(addprefix $(obj)/,$(obj-y))
 
-LDFLAGS_vmlinux := --oformat $(LD_BFD) -e startup -T
+clean-files += vmlinux.map
+
+LDFLAGS_vmlinux := --oformat $(LD_BFD) -e startup $(if $(CONFIG_SAVE_LINK_MAP),-Map=$(obj)/vmlinux.map) -T
 $(obj)/vmlinux: $(obj)/vmlinux.lds $(objtree)/arch/s390/boot/startup.a $(OBJECTS) FORCE
 	$(call if_changed,ld)
 
-- 
2.25.4
