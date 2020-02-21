Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38B71682E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 17:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgBUQMy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 11:12:54 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:23356 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727699AbgBUQMu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 11:12:50 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01LG8Jq3004904;
        Fri, 21 Feb 2020 17:12:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=wyYPOWWqvxMyA8yamheASFhaGWBZka72p0D7m+Jb2mg=;
 b=gWdQ+kfFBGDIppLada7F/MEuu11knMSdCm8gz4zAoLIUbfoFkzVfd967I3O/PaLlgv6K
 UQtfetHL45aCBScZXvsh1BrxOzoHT3h4s+X/sqpY64dp0x4mhjpO16bzC0i79NxEVWe4
 d2FNpQrqy+wCAPdvn2GwVwwYN/7zR6r1JPv/xCu5VrQaWzf0Biufyv4F+V0Hg5y6hO89
 TSE1vDZKfcjJaiBHoyeA40xzc2txzB4ombldfJh30+CtfUbyt4Yej0R+8u+W7asNQlDz
 1028S5A3gGcTl8WzTwZYSuoarUMUpoU25zqyUeL+WsNCaR1etXNNQw7Xte5DC01tyox5 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub0g625-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Feb 2020 17:12:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 075AE100034;
        Fri, 21 Feb 2020 17:12:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E53742BE24A;
        Fri, 21 Feb 2020 17:12:19 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Feb 2020 17:12:19
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
Subject: [RFC PATCH v2 0/4] 
Date:   Fri, 21 Feb 2020 17:12:13 +0100
Message-ID: <20200221161217.20069-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-21_05:2020-02-21,2020-02-21 signatures=0
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

A file (dtb-build.txt) containing a string with build information (e.g.,
From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020) is generated by
"gen_dtb_build_info.sh" script. 

This file has to be included manually in each dts file that would like to use 
this build information.

of/fdt.c is modified to printout "build-info" property during Kernel boot and 
scripts/Makefile.lib is modified to call "gen_dtb_build_info.sh" script.

Patch 1 & 2 script and of/fdt.c updates
Patch 3 is an example of use in stm32mp157c-dk2.dts file.
Patch 4 is a tentative to make it automatic (not yet 100% functional).

regards
Alex

Changes since v1;
 - Remove modification in dtc (no more -B option)
 - Generate a file containing build info which is directly included in dts
   file.


Regards
Alex

Alexandre Torgue (4):
  scripts: Add script to generate dtb build information
  of: fdt: print dtb build information
  ARM: dts: stm32: Add dtb build information entry for stm32mp157c-dk2
  script: make automatic dtb build info generation

 arch/arm/boot/dts/stm32mp157c-dk2.dts |  1 +
 drivers/of/fdt.c                      |  9 +++++++++
 scripts/Makefile.lib                  |  3 +++
 scripts/gen_dtb_build_info.sh         | 12 ++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100755 scripts/gen_dtb_build_info.sh

-- 
2.17.1

