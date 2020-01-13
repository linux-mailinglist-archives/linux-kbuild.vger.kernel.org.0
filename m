Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1613D1398A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 19:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbgAMSQw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 13:16:52 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:4750 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728760AbgAMSQv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 13:16:51 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00DICkhe015025;
        Mon, 13 Jan 2020 19:16:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WEGaEwx/ta6sY7T0Fd98KdzWPvWPmF9vLPRCHL2k/9I=;
 b=OCTJgx0Tfaj0GjPrU4PzpoUKJq+f9AD5dJ11hx8xMjbCCgJc1+Xzae8q+YhUaLFRsuV2
 9b6RFfWG0grpGsgs3gz9i6jbiECabhOi295sXa3DPeSDLmwwAPO3zTdPgPb3Cy9GMmFy
 tob1X6sR8Swk5Y+tRtVqX/8O4UgXMuf1165oookhx2xvGPdaLlcjoHiVPhnRthLxXbRK
 UTjPht3U9VTA+dMrCdt7135Ro1yFN78GhHtPA8+2M+4K2GCF+N1F6f/rNXrsLdDrnfO3
 Wdz4glfXovHztMfRCFh3FclrABChbfkKQ5f7bOtsucUMyaZ2hCvU1Qinfxwuc70reh60 lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf7fnhg6a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jan 2020 19:16:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3064100038;
        Mon, 13 Jan 2020 19:16:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B06FF2B1881;
        Mon, 13 Jan 2020 19:16:28 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 Jan 2020 19:16:28
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
Subject: [RFC PATCH 0/3] Add device tree build information
Date:   Mon, 13 Jan 2020 19:16:22 +0100
Message-ID: <20200113181625.3130-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-13_06:2020-01-13,2020-01-13 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

The goal of this series is to add device tree build information in dtb.
This information can be dtb build date, where devicetree files come from,
who built the dtb ... Actually, same kind of information that you can find
in the Linux banner which is printout during kernel boot. Having the same
kind of information for device tree is useful for debugging and maintenance.

To achieve that a new option "-B" (using an argument) is added to dtc. 
The argument is a file containing a string with build information
(e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
DTC use it to append dts file with a new string property "Build-info".

of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
last part could be improved for sure).

Regards
Alex

Alexandre Torgue (3):
  dtc: Add dtb build information option
  of: fdt: print dtb build information
  scripts: Use -B dtc option to generate dtb build information.

 drivers/of/fdt.c           |  9 +++++++
 scripts/Makefile.lib       | 11 +++++---
 scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
 scripts/gen_dtb_build_info | 11 ++++++++
 4 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100755 scripts/gen_dtb_build_info

-- 
2.17.1

