Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A451816830A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 17:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgBUQOl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 11:14:41 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:54935 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727095AbgBUQOk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 11:14:40 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01LGEEKH013470;
        Fri, 21 Feb 2020 17:14:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=84l2b91e/di7VUflYudfHEI8dwDeDuErqQcawADT30M=;
 b=iy9fYeyD4J84NGAZwItOo4iPy9fHwru5Mzt1bG1ActChIhT78uBE1aX9PDjpjpPqb7Di
 sixhgAeW+WQM6ewcozXc7Yh6mt54AQ/oDO3cF64Ic6CZLagfy84PTOmum0bzbrDtxJak
 SErQh6iZNMm/arKDTwrcWFDg4RKhaXu9fqHCnp/wYbYdsJ14fUgdkweApX9SuDu/RcLH
 LchG2ggrKAHxjhtF2L4p4ZW6jtym6WjyD7XOZ3mSz17qcMV5D1KkqO4eg/nX5S205W0O
 I/87+kcBjeyxVKp+ffdutE7qDuwbAeVw5hwT7l+lxuLacXdbC6GYUyuqnHne6KPCXqID 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub1r6du-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Feb 2020 17:14:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 768D0100034;
        Fri, 21 Feb 2020 17:14:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FE552BE259;
        Fri, 21 Feb 2020 17:14:21 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb 2020 17:14:20
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        <david@gibson.dropbear.id.au>, <sjg@chromium.org>
CC:     <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <devicetree-compiler@vger.kernel.org>, Ian Lepore <ian@freebsd.org>
Subject: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
Date:   Fri, 21 Feb 2020 17:14:15 +0100
Message-ID: <20200221161418.20225-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221161418.20225-1-alexandre.torgue@st.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-21_05:2020-02-21,2020-02-21 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This commit adds a new script to create a file (in dts file directory) with
some information (date, Linux version, user). This file could then be used
to populate "build-info" property in every dts file that would use this
build information:

Example:

/ {
	...
	build-info = /incbin/("dtb-build.txt");
	...
};

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bae62549e3d2..a5af84ef4ffc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
+DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+	$(DTB_GEN_INFO) $(src) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -O $(2) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
new file mode 100755
index 000000000000..0cd8bd98e410
--- /dev/null
+++ b/scripts/gen_dtb_build_info.sh
@@ -0,0 +1,10 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -o nounset
+
+DTB_DIR=$1
+DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
+DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
+
+printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
-- 
2.17.1

