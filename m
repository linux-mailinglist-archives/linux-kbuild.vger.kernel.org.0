Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD80203719
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2020 14:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgFVMpD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jun 2020 08:45:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4626 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727940AbgFVMpD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 08:45:03 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05MCWhka016981;
        Mon, 22 Jun 2020 08:44:15 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31t02g1xnb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 08:44:14 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MCa44q018692;
        Mon, 22 Jun 2020 12:44:10 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma02wdc.us.ibm.com with ESMTP id 31sa38qj93-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 12:44:09 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05MCi74722675964
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Jun 2020 12:44:08 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 243D813604F;
        Mon, 22 Jun 2020 12:44:09 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5BF58136060;
        Mon, 22 Jun 2020 12:44:08 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 22 Jun 2020 12:44:08 +0000 (GMT)
From:   Dov Murik <dovmurik@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Dov Murik <dovmurik@linux.vnet.ibm.com>
Subject: [PATCH] docs: kbuild: fix ReST formatting
Date:   Mon, 22 Jun 2020 12:43:43 +0000
Message-Id: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-22_07:2020-06-22,2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1011 cotscore=-2147483648 mlxscore=0
 bulkscore=0 mlxlogscore=986 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220094
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to
*.rst") missed a ReST header and a verbatim file content area.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 Documentation/kbuild/modules.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a45cccff467d..85ccc878895e 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -182,7 +182,8 @@ module 8123.ko, which is built from the following files::
 	8123_pci.c
 	8123_bin.o_shipped	<= Binary blob
 
---- 3.1 Shared Makefile
+3.1 Shared Makefile
+-------------------
 
 	An external module always includes a wrapper makefile that
 	supports building the module using "make" with no arguments.
@@ -470,9 +471,9 @@ build.
 
 	The syntax of the Module.symvers file is::
 
-	<CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
+		<CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
 
-	0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
+		0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
 
 	The fields are separated by tabs and values may be empty (e.g.
 	if no namespace is defined for an exported symbol).

base-commit: b103c607654e55dcb1da40557628a2044b72c936
-- 
2.20.1

