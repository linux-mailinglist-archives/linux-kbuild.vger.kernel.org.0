Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E98BD1398A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 19:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgAMSQu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 13:16:50 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37346 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728714AbgAMSQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 13:16:50 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00DICJLY013375;
        Mon, 13 Jan 2020 19:16:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KK+4RB7FOUhUsITJ0vCpMcOFWa7UxQVHwrmcg/94Bsc=;
 b=Mus7cWI7zodrC3PBcoSDKkY6Z+Kn9YCRTfRcxFHjb08J85qOyq20YL43lPu0iC/Unl7v
 CfKbIeTmk73ax2SKrPOEahZSZse6Thz1ZJCTmstHMdXCSDAIX5Izpv6xEcnCV5oghU06
 VT6e3EdyU9hIeS9Fe6JFnYM7s2e+YI+o+JC/cq9FNpXtkEKANLL2HDB+RB0VeFJKDVPJ
 9dK9mxPWFd8FtZNF9peNZlWTyQZsp4aQufc+y6OQ99jm8WLmhIqYWj+ae0Fr1FCAp5IG
 OmwqhJmxM4t0AhC9DCbRRqlkSVD5AfQMAmefxeZouQro0nG349Nbobo3sd5kU45hDmDB EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf7jp9cj9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jan 2020 19:16:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20C9D10002A;
        Mon, 13 Jan 2020 19:16:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C0C02B772F;
        Mon, 13 Jan 2020 19:16:30 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 Jan 2020 19:16:29
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        <david@gibson.dropbear.id.au>, <sjg@chromium.org>
CC:     <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <devicetree-compiler@vger.kernel.org>
Subject: [RFC PATCH 2/3] of: fdt: print dtb build information
Date:   Mon, 13 Jan 2020 19:16:24 +0100
Message-ID: <20200113181625.3130-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113181625.3130-1-alexandre.torgue@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-13_06:2020-01-13,2020-01-13 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This commit prints out DTB build information (build time, dts source
version used, ...) if "Build-info" property exists in DTB root node.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 2cdf64d2456f..df5f54f9582a 100644
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
+	build_info = of_get_flat_dt_prop(dt_root, "Build-info", NULL);
+	if (build_info)
+		pr_info("%s\n", build_info);
+
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
 
-- 
2.17.1

