Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B724A168306
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 17:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbgBUQOu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 11:14:50 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:9560 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729454AbgBUQOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 11:14:50 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01LGE9ZJ009872;
        Fri, 21 Feb 2020 17:14:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=j0cy0mKA7cM8Tk6Z9M9zdWvIoHNs4Pm0R3aUHtmCHIs=;
 b=Y2zDz/hsRrUDG815gVDc1oEZ8UmjKwq9y+nocwidSm+jGXAmlrXRPQKP3u5Fqz0eKtZ1
 kFSmzIASg8pgLFehDf2/NpiSxvIh8K95JsjR7xRA/Uu1RPtgVH4VRSNtigVVE0c+Zkqa
 v0XPiPVVvfLqUI/kv8Ikm4illMval7rbA+qi8vndSUi2riaIjAoZAdytnwUPRVnhu2sK
 5Vci8VOIPZS8vjVyWW9VoQijdzNtk9JKfZQHxKgz+/fy2W1Qy3rtxQfxVlj3ZS9BOvID
 oRfoO/pPLH7pJQafI22gjJKq6gYoqlBMaexIhwWyachx4E0XCZCGVEP0hlDFgEJlQZgg aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub0g6bu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Feb 2020 17:14:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5570710003A;
        Fri, 21 Feb 2020 17:14:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 477C62BE258;
        Fri, 21 Feb 2020 17:14:23 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb 2020 17:14:22
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
Subject: [RFC PATCH v2 4/4] script: make automatic dtb build info generation
Date:   Fri, 21 Feb 2020 17:14:18 +0100
Message-ID: <20200221161418.20225-5-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221161418.20225-1-alexandre.torgue@st.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-21_05:2020-02-21,2020-02-21 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
build. It allows to get build information (date, source version, ...)
for each device tree without modify them manually.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a5af84ef4ffc..f084e78267b2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -289,6 +289,7 @@ quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(DTB_GEN_INFO) $(src) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+	$(DTB_GEN_INFO) $(src) $(dtc-tmp) ; \
 	$(DTC) -O $(2) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
index 0cd8bd98e410..72f31e386787 100755
--- a/scripts/gen_dtb_build_info.sh
+++ b/scripts/gen_dtb_build_info.sh
@@ -6,5 +6,7 @@ set -o nounset
 DTB_DIR=$1
 DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
 DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
+DTS_FILE=$2
 
-printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
+printf "$DTB_INFO" > "arch/arm/boot/dts/dtb-build.txt"
+echo "&{/} {build-info = /incbin/(\"dtb-build.txt\");};" >> $DTS_FILE
-- 
2.17.1

