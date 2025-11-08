Return-Path: <linux-kbuild+bounces-9446-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C7C423B1
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 02:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05B274E1247
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 01:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78911EB5C2;
	Sat,  8 Nov 2025 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpJxFDNZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C661A9FBD;
	Sat,  8 Nov 2025 01:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762564656; cv=none; b=or0QjsC2q+ijSqqqTMLyYbUFbt7yKVbIri34aA643ezUZyotT/m2UApUGwj0BMxCJdQpPOtEjdpXGLAoFL58jHGpiGFmK3X3w7e2SaxRw01ka1N0nVJ2Whlmsj6JExkgZ2hvzotCSd1+0e65UP2mGr5wdpkhYNq3u5aVuQtrH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762564656; c=relaxed/simple;
	bh=ofJHIlh4pkyWeQqMOHXdqsVhFSJJOBvBYJc4zlsIYqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DkNZWMhbdIPYpNoPq1zR5ANelZZdpEagjV8wgnh4N+q9H1GSn6XzGahBrWYELAFoZco998md5emMu2ATDo4xADCtNRCeul1t7y4eG57qhHWAt6XW+fE0PpljD7otthYNCnEmIdcHuYa/HXdvzAUVxApa+MkPSQ92AzABgGJFwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpJxFDNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7HBog53658131;
	Sat, 8 Nov 2025 01:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oWOhFS0g4Q1tJoFANI/E8d
	kFHuxYXoEJGzl3o0/c8GE=; b=bpJxFDNZ+JP/50G7HoorJ3ilsFW1SEGwaqv0ca
	+uS8gpVMkS2jIJJiqj+WydDlzTw+HwzteYu7ALmADy9KaHv2+LGUTC3NOj/g84k7
	JsM6krnxtojLVAMI9+0mSUjyRVqR2mZG/ZDOTg/WdEmnus3o8wZzs3fJ+V+NEc1y
	bXjP83q1h2itmsY8qr/ArgqaRHj9Yxd496kL+7KjRZrdZqtsYClhfvfAwduv1gRh
	Mw4l3GONTd2pToVfvxLf0cmt7LbSCB3gSFuFq2MlA/n3deb2x3uhLpraMJ+iAisv
	5EojsKGhyssAESZZK5h93weU/8xHe7hoNDlP4Eo4G+ucwQMg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9my4s1pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 01:17:27 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A81HRvX026818;
	Sat, 8 Nov 2025 01:17:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 4a9t65grx3-1;
	Sat, 08 Nov 2025 01:17:27 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A81HQkF026812;
	Sat, 8 Nov 2025 01:17:26 GMT
Received: from hu-grahamr-lv.qualcomm.com (hu-grahamr-lv.qualcomm.com [10.81.26.100])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 5A81HQcF026811;
	Sat, 08 Nov 2025 01:17:26 +0000
From: Graham Roff <grahamr@qti.qualcomm.com>
Date: Fri, 07 Nov 2025 17:16:34 -0800
Subject: [PATCH] Support conditional deps using "depends on X if Y"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPGZDmkC/x2MUQqAIBAFrxL7neAWSnWViAhdayksNCKI7t7S1
 zAw7z2QKTFl6IoHEl2ceY8iWBbglinOpNiLQ6Urg6itWt0eA8+jwPMp9bSNno6sDAZ0ra5DY2u
 Q+ZEo8P1f98P7fjfmlRJqAAAA
X-Change-ID: 20251106-kconfig_conditional_deps-51f1c903f863
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Graham Roff <grahamr@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762564646; l=5140;
 i=grahamr@qti.qualcomm.com; s=20251107; h=from:subject:message-id;
 bh=ylpCvHWjQa416hD+EocRodRSh+8n7FUnxC4JYjhf/YY=;
 b=+1ngKSrLGfgmSMMCaA/oIEDSbp21MnnhdU7CWaFOASwZw15lR6kHZdfX8cap+BI/R7tFV3pX/
 ESZtNPK/31pDpt/KtHzOTuuQQmNRlAUl9JLrqj5KRRvhE1i+BtmDuZn
X-Developer-Key: i=grahamr@qti.qualcomm.com; a=ed25519;
 pk=p33S3GCPECgmJDBDEtJ/OWLHwPs1vGD4QhZS0FTdjBk=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IqQTsb/g c=1 sm=1 tr=0 ts=690e9a28 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=07d9gI8wAAAA:8 a=dg4UtMH5AAAA:8 a=EUspDBNiAAAA:8 a=DisRCJlzh1ScgluH8AYA:9
 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22 a=byNfn09xH3PuSfgbYLsR:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: k9zfxVyw4-tw6QxVPoRAckQ9llgMSbZ1
X-Proofpoint-GUID: k9zfxVyw4-tw6QxVPoRAckQ9llgMSbZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAwOSBTYWx0ZWRfX1yV85bqfJb2A
 kcbjJ8cv6Cpq73p0U6bS2OTU9j4ZQUxjf2g72Pg4Tv9OOBycdu7bkMTich3WM3KfYJYGgPXyog4
 +U4Ngobosn22TPoGfpa3TvvhKcuXD4kAL+pTQZLVlfoPPnjIwvB145JUHtAsaMJ5iVIZwvLLW6k
 /bd4Ut8tkWtElqg0dpsFarGh3I2Er3jEklSXrFHyyBxAo3DlZ1x8Hw7ihf9kx9AvJbLx1yBq2hM
 FF7TQvKeDFqnyCpHofyQdC8lU1r5fFnYTWiWtwHUptRBNFfVOSuIc5JQ0pe+5AOeevE07T1iFB0
 7UbMj+HzwtWPfypBQXqlOrffTED+WiaymzBjluP1RVqZ1fMX8N62aSKEE99IeOsg85AaGHAVXjU
 /pGVgKlXcvq2OmkIJGSBZcCiPJGkpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080009

From: Nicolas Pitre <nico@fluxnic.net>

Extend the "depends on" syntax to support conditional dependencies
using "depends on X if Y". While functionally equivalent to "depends
on X || (Y == n)", "depends on X if Y" is much more readable and
makes the kconfig language uniform in supporting the "if <expr>"
suffix.

The change is implemented by converting the "X if Y" syntax into the
"X || (Y == n)" syntax during "depends on" token processing.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

[Graham Roff: Rewrote commit message and redid patch for latest kernel]

Signed-off-by: Graham Roff <grahamr@qti.qualcomm.com>
---
This patch updates an earlier one that was not merged to work on 
the latest kernel release.

Link: https://lwn.net/ml/linux-kernel/nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr/#t

Support for this change has been expressed by a number of developers
since the original patch was proposed back in 2020, and has recently
also been raised as a patch to the Zephyr kconfig system.
One specific use is when mapping the Bluetooth specification to Kconfig,
as it explicitly provides dependencies between features as conditional
on other features. Many other cases exist where the "slightly
counterintuitive" (quoted from the Kconfig specification) expression 
"depends on BAR || !BAR" has been used when a proper "if" condition 
would be more readable.

The earlier patch discussion ended without a real conclusion and should
be revisited now.
---
 Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
 scripts/kconfig/lkc.h                     |  2 +-
 scripts/kconfig/menu.c                    | 12 +++++++++++-
 scripts/kconfig/parser.y                  |  6 +++---
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15d7c..61848f999db8 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -118,7 +118,7 @@ applicable everywhere (see syntax).
   This is a shorthand notation for a type definition plus a value.
   Optionally dependencies for this default value can be added with "if".
 
-- dependencies: "depends on" <expr>
+- dependencies: "depends on" <expr> ["if" <expr>]
 
   This defines a dependency for this menu entry. If multiple
   dependencies are defined, they are connected with '&&'. Dependencies
@@ -134,6 +134,16 @@ applicable everywhere (see syntax).
 	bool "foo"
 	default y
 
+  The dependency definition itself may be conditional by appending "if"
+  followed by an expression. If such expression is false (n) then this
+  dependency is ignored. One possible use case is:
+
+    config FOO
+	tristate
+	depends on BAZ if BAZ != n
+
+  meaning that FOO is constrained by the value of BAZ only when it is set.
+
 - reverse dependencies: "select" <symbol> ["if" <expr>]
 
   While normal dependencies reduce the upper limit of a symbol (see
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 56548efc14d7..798985961215 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -82,7 +82,7 @@ void menu_warn(const struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym, enum menu_type type);
-void menu_add_dep(struct expr *dep);
+void menu_add_dep(struct expr *dep, struct expr *cond);
 void menu_add_visibility(struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, const char *prompt,
 				 struct expr *dep);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 0f1a6513987c..b2d8d4e11e07 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -127,8 +127,18 @@ static struct expr *rewrite_m(struct expr *e)
 	return e;
 }
 
-void menu_add_dep(struct expr *dep)
+void menu_add_dep(struct expr *dep, struct expr *cond)
 {
+	if (cond) {
+		/*
+		 * We have "depends on X if Y" and we want:
+		 *	Y != n --> X
+		 *	Y == n --> y
+		 * That simplifies to: (X || (Y == n))
+		 */
+		dep = expr_alloc_or(dep,
+				expr_trans_compare(cond, E_EQUAL, &symbol_no));
+	}
 	current_entry->dep = expr_alloc_and(current_entry->dep, dep);
 }
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 49b79dde1725..6d1bbee38f5d 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -323,7 +323,7 @@ if_entry: T_IF expr T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:if\n", cur_filename, cur_lineno);
 	menu_add_entry(NULL, M_IF);
-	menu_add_dep($2);
+	menu_add_dep($2, NULL);
 	$$ = menu_add_menu();
 };
 
@@ -422,9 +422,9 @@ help: help_start T_HELPTEXT
 
 /* depends option */
 
-depends: T_DEPENDS T_ON expr T_EOL
+depends: T_DEPENDS T_ON expr if_expr T_EOL
 {
-	menu_add_dep($3);
+	menu_add_dep($3, $4);
 	printd(DEBUG_PARSE, "%s:%d:depends on\n", cur_filename, cur_lineno);
 };
 

---
base-commit: a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30
change-id: 20251106-kconfig_conditional_deps-51f1c903f863

Best regards,
-- 
Graham Roff <grahamr@qti.qualcomm.com>


