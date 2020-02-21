Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E2E1682F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 17:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgBUQMt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 11:12:49 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:63236 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727720AbgBUQMt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 11:12:49 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01LG8Jq2004904;
        Fri, 21 Feb 2020 17:12:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2k+VXll0ozFYAI5ID9m7C2U0U8scssOA0fcMpcXtXIM=;
 b=A5HTjgqGRWomdcxY2wBanohSWzeCO10NSYQVoWnt6pjJGxw6Yvy8y8bpHZLGZtHMniGZ
 SL+MlsQd42epFRUmre2Ni4ftrnzQMgHcDP+imm8Y/DfyHxMSiHDPAZDRYjcRNeKOsr9R
 K/n6uhnf4MoFR8FN5LlTtLgGZZpQg3so7Hv1206LVa4y+owyCYfJ1MwGaf9f+dGz3g1/
 DiblwtCglhy4TrUZzigNd729vl5F7dp0sY0O39ITjLUVFPWqhW7+uY3KY4ZFfFi5wBt5
 cd8SFtbOR/tvgr4bpDuxcUbKRWmdbp1hI9w4c7PPn96nk4jfsqk9JAOSQT84Us0yW04r /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub0g624-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Feb 2020 17:12:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61BEA100038;
        Fri, 21 Feb 2020 17:12:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 486512BE24C;
        Fri, 21 Feb 2020 17:12:21 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb 2020 17:12:20
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
Subject: [RFC PATCH v2 2/4] of: fdt: print dtb build information
Date:   Fri, 21 Feb 2020 17:12:15 +0100
Message-ID: <20200221161217.20069-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221161217.20069-1-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-21_05:2020-02-21,2020-02-21 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This commit prints out DTB build information (build time, dts source
version used, ...) if "Build-info" property exists in DTB root node.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 2cdf64d2456f..aa5989039746 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1224,9 +1224,18 @@ bool __init early_init_dt_scan(void *params)
  */
 void __init unflatten_device_tree(void)
 {
+	const char *build_info;
+	unsigned long dt_root;
+
 	__unflatten_device_tree(initial_boot_params, NULL, &of_root,
 				early_init_dt_alloc_memory_arch, false);
 
+	/* If available, provide dtb build information */
+	dt_root = of_get_flat_dt_root();
+	build_info = of_get_flat_dt_prop(dt_root, "build-info", NULL);
+	if (build_info)
+		pr_info("%s\n", build_info);
+
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
 
-- 
2.17.1

