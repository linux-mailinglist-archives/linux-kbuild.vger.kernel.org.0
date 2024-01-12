Return-Path: <linux-kbuild+bounces-527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23482BF9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 13:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EFE1B223B6
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AA467E90;
	Fri, 12 Jan 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XM6uPadc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5B2628C;
	Fri, 12 Jan 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40CC6fOQ003010;
	Fri, 12 Jan 2024 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=66LdFZreVqMtSudFje/nZyapLdRBndBormF4G6m3pEs=;
 b=XM6uPadcEn0BRrH7oJaN/iiho5r0UC/XPtERRSe+joLCEERz1iWQOhRfhJljRUiNvDmO
 6QSxa4fO3v1l2FP08ensTp0dybLrUAF6+o52rXo0RTeDuRqWUv77oS+efEXg2kgmN7Gk
 /jl7+pOG06YLOUk5NAcIUQF6pYe6elY6cmFQpNvOMn5yqztVFrznVtPIiQK3hvHv/Lhi
 ytq5xM2o1WsAdXW5+fxJD7SxoT3pdkhjHnhhU2kYVyM/PTUEHqkj97UctgdRsRL/3q8E
 WyuyikO6eEY3FZ1zHdZLUWE9p/YoIF4yQ+85w2V7drTU2j5JMQ6IlxUCqydQrTRv7/aO OQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vk54xr04b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 12:09:22 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40CC8aQq006761;
	Fri, 12 Jan 2024 12:09:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur8eqtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 12:09:17 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40CC9GBu022549;
	Fri, 12 Jan 2024 12:09:16 GMT
Received: from localhost.localdomain (dhcp-10-175-45-196.vpn.oracle.com [10.175.45.196])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3vfur8eqsr-1;
	Fri, 12 Jan 2024 12:09:16 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] docs: media: rename gen_rst -> cmd_parse_headers
Date: Fri, 12 Jan 2024 13:09:10 +0100
Message-Id: <20240112120910.3751062-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-12_04,2024-01-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401120095
X-Proofpoint-GUID: y8sSyB0j_Klh2XoXp6Ofm70SAXwcLbTW
X-Proofpoint-ORIG-GUID: y8sSyB0j_Klh2XoXp6Ofm70SAXwcLbTW

All other commands in the kernel use the format "cmd_" followed by some
variation of the program name. This is also the format documented in
Documentation/kbuild/makefiles.rst.

Therefore, rename "gen_rst" to "cmd_parse_headers".

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/userspace-api/media/Makefile | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 3d8aaf5c253b..bfb90fa2b3fc 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -12,38 +12,38 @@ FILES = ca.h.rst dmx.h.rst frontend.h.rst net.h.rst \
 
 TARGETS := $(addprefix $(BUILDDIR)/, $(FILES))
 
-gen_rst = \
+cmd_parse_headers = \
 	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
-quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
+quiet_cmd_parse_headers = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
-silent_gen_rst = ${gen_rst}
+silent_cmd_parse_headers = ${cmd_parse_headers}
 
 $(BUILDDIR)/ca.h.rst: ${UAPI}/dvb/ca.h ${PARSER} $(SRC_DIR)/ca.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/dmx.h.rst: ${UAPI}/dvb/dmx.h ${PARSER} $(SRC_DIR)/dmx.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/frontend.h.rst: ${UAPI}/dvb/frontend.h ${PARSER} $(SRC_DIR)/frontend.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/net.h.rst: ${UAPI}/dvb/net.h ${PARSER} $(SRC_DIR)/net.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/videodev2.h.rst: ${UAPI}/videodev2.h ${PARSER} $(SRC_DIR)/videodev2.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/media.h.rst: ${UAPI}/media.h ${PARSER} $(SRC_DIR)/media.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/cec.h.rst: ${UAPI}/cec.h ${PARSER} $(SRC_DIR)/cec.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exceptions
-	@$($(quiet)gen_rst)
+	@$($(quiet)cmd_parse_headers)
 
 # Media build rules
 
-- 
2.34.1


