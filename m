Return-Path: <linux-kbuild+bounces-1636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A098AC8D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 11:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145A41F213AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E47053E22;
	Mon, 22 Apr 2024 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fFbAFvsc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D734CB55
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713777935; cv=none; b=jcpem5twjkmIHgjscPB25JA0jiVfYmaPC2zLA/S2+hzYdpWC63W/O39UL7wjQk5qNw9XRfCVI/AsZOOyUWz3zn3iGXvdnQJCKtHqQfuXRcbhuZfUcus4xXiF5YaeYyEHe/gQfveiQWGWAS50YmVOpQ/ABuKic6WWT0+Qts72b4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713777935; c=relaxed/simple;
	bh=ai0TIxFPUA7yDusKEeqx+wCCsytS9lSgEp4Uj433C4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cv7xeqRfLf+bwkdieo0+6WgipXwWys5HOhOSAQHRytmf8xGQw9I6FlsdvcZOo1vye4YTzdHwOw0qgi5hOOAaeUawU7+XUAHbD2LFA749GBEfL2rJnbhBO+36hnq8LR7EX7yPiTBv4GykCFDRcRnRnk5NA9SDCePuj5uwKKjGkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fFbAFvsc; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43M8j8Zh021812;
	Mon, 22 Apr 2024 09:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=B/1R3BDsUWSWrHRk5ONjcQs624uvh4a5/7/pNUu6NHs=;
 b=fFbAFvsc5WHFsr+wvSFZ0No05RZARmco/nGfUYi4rmrD/hC5f6RaZirI1LLSxw0VJ5TC
 6ay3phmu0qhC+20eEvq2RMWvkrUU9SrCs4rmCOa7RBqDyVCJuAdMqohVkRU3HPjiBfUy
 iKdeNKo1NO3fro3kMYu8/aCB1R4slvp2iOtwIzLEaqGsWqe9zLVzb0c0oEPEyvokDx2o
 p3GvRzDohtmeCV5Cl0pgKUWRcpETmI8dvJR7V0dcitJERQwP/BvlmudzqV+cGZLwNqe2
 kZdEVRmKwaIZXg1xNdZJjxKfRmW6Ht3wby5j8nO72yHBEREeDkDWRjF8r5ahlVp6FN/t ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnmnmg2eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 09:25:00 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43M9P0v4015918;
	Mon, 22 Apr 2024 09:25:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnmnmg2em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 09:24:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43M8UQuw028341;
	Mon, 22 Apr 2024 09:24:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr26dka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 09:24:59 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43M9Or6949480140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 09:24:56 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D568020043;
	Mon, 22 Apr 2024 09:24:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C33132004B;
	Mon, 22 Apr 2024 09:24:50 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.199.155.138])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 09:24:50 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        peterz@infradead.org, naveen.n.rao@linux.ibm.com, jpoimboe@kernel.org,
        nathan@kernel.org, nicolas@fjasle.eu, masahiroy@kernel.org,
        mahesh@linux.ibm.com, mingo@kernel.org, sv@linux.ibm.com
Subject: [RFC PATCH 1/2] objtool: Run objtool only if either of the config options are selected
Date: Mon, 22 Apr 2024 14:52:05 +0530
Message-ID: <20240422092206.147078-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fzf2Jo60bTZd2ku216xMzzgsGbT6QqtZ
X-Proofpoint-ORIG-GUID: CjYEUheLCKz2t7BjvDtd25YRQLzOxBWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_07,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404220038

Currently, when objtool is enabled and none of the supported options
are triggered, kernel build errors out with the below error:
error: objtool: At least one command required.

To address this, ensure that objtool is run only when either of the
config options are selected.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 scripts/Makefile.lib | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3179747cbd2c..c65bb0fbd136 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -286,7 +286,10 @@ objtool-args = $(objtool-args-y)					\
 
 delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
 
+ifneq ($(objtool-args-y),)
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
+endif
+
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
 endif # CONFIG_OBJTOOL
-- 
2.34.1


