Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88504758BF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jul 2023 05:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjGSDTp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Jul 2023 23:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGSDTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jul 2023 23:19:44 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B33B1BE9
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jul 2023 20:19:43 -0700 (PDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J38KpG020013;
        Wed, 19 Jul 2023 03:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CQGIimrET/1xx2hXhHhhDvmrIIiQnqNhn/lvaz/EXhE=;
 b=MAQQgNrA7MJdFq/0oT2kwWtWcvNFH9dkldxTYO6MsEhNigRa2CDyezOlpVyg8xKFBuYw
 1o9XAfC7PzVsl49CqLkbEPzxN2TQwGRhoKlyf6V+fkMVlONpaSWGJpkRm2e8GKQ1qApK
 vi5pHGMC5u+h7mU9xAOVm4wFOx198f+EXmHs7yB+OvUvsmU5ErX1yEjM5COkAUi91diV
 HxA3KcAXFIKp2DzghANHCzj4PGbl9NpbvE5DXP1eNwG85CmgRdEwvJpSZvjSLvIfnIgS
 A/vwXtiz4EKbmLuqzYvjR+CxWl3TXq3NBYWLh34zsmRKqoRuujj3AXSuDmXyt9ZVeDNO Tg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rx79b0hkw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 03:19:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36INmJ69029057;
        Wed, 19 Jul 2023 03:19:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
        by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv6smfpw6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 03:19:33 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
        by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36J3JVqs46400142
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jul 2023 03:19:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6AC5B2004B;
        Wed, 19 Jul 2023 03:19:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DFC8720040;
        Wed, 19 Jul 2023 03:19:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Wed, 19 Jul 2023 03:19:30 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.200.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4352E60151;
        Wed, 19 Jul 2023 13:19:25 +1000 (AEST)
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Cc:     Benjamin Gray <bgray@linux.ibm.com>
Subject: [PATCH] gen_compile_commands: add assembly files to compilation database
Date:   Wed, 19 Jul 2023 13:19:12 +1000
Message-ID: <20230719031912.224843-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q6Q9-BPTZa3FzIjGlEs_D4dQOV0WDcAx
X-Proofpoint-ORIG-GUID: q6Q9-BPTZa3FzIjGlEs_D4dQOV0WDcAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_19,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=699 adultscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190027
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Like C source files, tooling can find it useful to have the assembly
source file compilation recorded.

The .S extension appears to used across all architectures.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

For example, I'm prototyping adding ASM support to clangd. It can use
this information to determine the architecture, macros definitions,
include paths, etc. on a per-file basis. I can capture this during
compilation with tools like bear, but given this script exists and the
change is trivial it seems like a good idea to adjust this script too.
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 15ba56527acd..a84cc5737c2c 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -19,7 +19,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
 _FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
+_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.[cS]) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
-- 
2.41.0

