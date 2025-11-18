Return-Path: <linux-kbuild+bounces-9672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83BC6B45F
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 19:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 998962922F
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 18:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1D62D7387;
	Tue, 18 Nov 2025 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3dcFiCA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294926ED55;
	Tue, 18 Nov 2025 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491659; cv=none; b=gWpq0vrVcDaIG8ghXaHF/LuFplfSu9nxGdfMLPu63vSYLm4rJUQhhNyGbGD8kTTCd9AdMvc019k+nMM0WPAQ5nLbjMG8nkVsM8rOuIjy7sohlmF8rgVTasIms55OAsgHiUbc/GcWygbrwwethfwg1tfobNCq2QFXvNEPpAeQjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491659; c=relaxed/simple;
	bh=dI557IzjBg+aoll10VbJtzW5WvO7r6LnJ1ovtwntK0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sm/pjQBLguurRsteFtiY7KRwMlmqOf0XgvsUpRcOxLUdTFAVlRS2l0NdbwQnV9QKVhZK2rm33ZQKlC0P2hej1Ettnkybu3R8qal+FHlbUfhYw5byY/45NMremdLtHY6Il0I7oH1b4KCSPFwGe5AlLpSammPeG18QS4O03+G5Tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3dcFiCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG58Of3412655;
	Tue, 18 Nov 2025 18:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6T5FxOXCUR6OFi3n2m/sEy
	WvWB+9syMTR8R3bFDNJ1o=; b=j3dcFiCAYY+/VuRofrwRaNfo8tfWS2cxY/bZs1
	/fBeZ2W92cU9p1KkW6UQngoHl/rYqTRDFy0LfRwGI2GeeaWRJ/bQUwtj0Spt+H21
	KONqL8YRFY6uxczzY4yQtJ1UNJbAwZnZKEqwBCMaifozFy5kauOObEENDG5E8Edg
	6ij7kiq9SlPk+Ds+pZFWfBQxro8Ji8KFdMEp/wBX2jNXKDrkr/ScAgjbxECGqTQB
	/SqwkngSAjcjWqOv8+mrfDFjIC7uF80ka+a74iItlolb9pZM3v18E3uZzosARNBa
	AYFaeyXa7eoHtnrV11Hpzn1o/5ThDXPEaphvdFFww5mhF0Dg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v0hsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:47:13 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIIlCsx030829;
	Tue, 18 Nov 2025 18:47:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 4ags6133ye-1;
	Tue, 18 Nov 2025 18:47:12 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AIIlCZP030824;
	Tue, 18 Nov 2025 18:47:12 GMT
Received: from hu-grahamr-lv.qualcomm.com (hu-grahamr-lv.qualcomm.com [10.81.26.100])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 5AIIlBjZ030815;
	Tue, 18 Nov 2025 18:47:12 +0000
From: Graham Roff <grahamr@qti.qualcomm.com>
Date: Tue, 18 Nov 2025 10:46:51 -0800
Subject: [PATCH v2] Support conditional deps using "depends on X if Y"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABq/HGkC/3WN0Q6CMAxFf4X02ZF1BBSf/A9DyBwbNCKDDYmG8
 O9WEh996c1pek9XiDaQjXBOVgh2oUh+YFCHBEynh9YKaphBSZUjykLcjR8ctTVHQzNf675u7Bh
 Fjg5NKTN3KjLg+hiso9euvlbMHcXZh/f+acHv9ic9/pcuKFBo55TCsrRG3i7TTOn01L3xj0fKA
 6pt2z760K+YxwAAAA==
X-Change-ID: 20251106-kconfig_conditional_deps-51f1c903f863
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Graham Roff <grahamr@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763491631; l=12076;
 i=grahamr@qti.qualcomm.com; s=20251107; h=from:subject:message-id;
 bh=aDiiIghxUKNDDOKqWjgHEApkvh9pq/v9UORIIqWS4os=;
 b=Bnyuq3D50/IfadcK5uuYo4tqn2jCbh4xIh6sYRUyOz4qljhJUesrtlIuRwbr1hZ+PQk3POfaI
 fagZKkJyu6XAa70zvOe2In8r4QUhDmx7RC5bnn7Iw7FHU+KeQF5deRW
X-Developer-Key: i=grahamr@qti.qualcomm.com; a=ed25519;
 pk=p33S3GCPECgmJDBDEtJ/OWLHwPs1vGD4QhZS0FTdjBk=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE1MSBTYWx0ZWRfXzucbzeX6hQ2V
 a7jBaGT8zp3H4JaNguxKTlJMz7SNZz5VZPjVShUhzVpMEdLQC2tVtOP5i8YDP7GSRewxmxqhXUj
 tIKtrBJAD8uQhVnp6A9monTMu2d0oMGPnH6IY2V6Lb7TU8ufMTYTrJcuKNjFPHP6gSu+u6vIUw8
 lzeMt2T9rnVMLf+oJCw//eSrCPQbi9jrO1IonBaixz/xkXNQRj22U3mOtkjyROas96L1iy85NGR
 zp000Mc0PnyjhwNBuphNH4lKvidAMQkTgF8IXKxsJ1OQQICKa95ltl/vbARRbhKHeFTZYaBKofU
 YQrD9HMN8Ei+iflzO5s5rC2RiLBWKsuFpesAn04snlMIoNXECI3IJ08n2SW/T8OsGyZS7iS3F7O
 4UZ301YKk5WyG2ZZd3uTWqy/SyH1RA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691cbf32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dg4UtMH5AAAA:8
 a=4rq6sG36krBe0J94lTMA:9 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22
 a=byNfn09xH3PuSfgbYLsR:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: MVaLpumkf0e3KsXKqXcJzmyW4SGP8RaB
X-Proofpoint-GUID: MVaLpumkf0e3KsXKqXcJzmyW4SGP8RaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180151

From: Nicolas Pitre <nico@fluxnic.net>

Extend the "depends on" syntax to support conditional dependencies
using "depends on X if Y". While functionally equivalent to "depends
on X || (Y == n)", "depends on X if Y" is much more readable and
makes the kconfig language uniform in supporting the "if <expr>"
suffix.
This also improves readability for "optional" dependencies, which
are the subset of conditional dependencies where X is Y.
Previously such optional dependencies had to be expressed as
the counterintuitive "depends on X || !X", now this can be
represented as "depends on X if X".

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
would be more readable. Some examples:

arch/arm64/Kconfig:
  depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
  depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
arch/mips/Kconfig:
  depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
  depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
arch/riscv/Kconfig:
  depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
  depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
arch/x86/Kconfig:
  depends on X86_64 || !SPARSEMEM -->
  depends on X86_64 if SPARSEMEM
drivers/acpi/Kconfig:
  depends on ACPI_WMI || !X86 -->
  depends on ACPI_WMI if X86
drivers/bluetooth/Kconfig:
  depends on USB || !BT_HCIBTUSB_MTK
  depends on USB if BT_HCIBTUSB_MTK
mm/Kconfig:
  depends on !ARM || CPU_CACHE_VIPT -->
  depends on CPU_CACHE_VIPT if ARM
kernel/Kconfig.locks:
  depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
  depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION

The earlier patch discussion ended without a real conclusion and should
be revisited now.
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com
---
 Documentation/kbuild/kconfig-language.rst          | 22 +++++++++++++++---
 scripts/kconfig/lkc.h                              |  2 +-
 scripts/kconfig/menu.c                             | 12 +++++++++-
 scripts/kconfig/parser.y                           |  6 ++---
 scripts/kconfig/tests/conditional_dep/Kconfig      | 27 ++++++++++++++++++++++
 scripts/kconfig/tests/conditional_dep/__init__.py  | 14 +++++++++++
 .../kconfig/tests/conditional_dep/expected_config1 | 10 ++++++++
 .../kconfig/tests/conditional_dep/expected_config2 |  8 +++++++
 .../kconfig/tests/conditional_dep/expected_config3 | 10 ++++++++
 scripts/kconfig/tests/conditional_dep/test_config1 |  4 ++++
 scripts/kconfig/tests/conditional_dep/test_config2 |  7 ++++++
 scripts/kconfig/tests/conditional_dep/test_config3 |  6 +++++
 12 files changed, 120 insertions(+), 8 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15d7c..9ff3e530b2b4 100644
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
+  followed by an expression. For example::
+
+    config FOO
+	tristate
+	depends on BAR if BAZ
+
+  meaning that FOO is constrained by the value of BAR only if BAZ is
+  also set.
+
 - reverse dependencies: "select" <symbol> ["if" <expr>]
 
   While normal dependencies reduce the upper limit of a symbol (see
@@ -602,8 +612,14 @@ Some drivers are able to optionally use a feature from another module
 or build cleanly with that module disabled, but cause a link failure
 when trying to use that loadable module from a built-in driver.
 
-The most common way to express this optional dependency in Kconfig logic
-uses the slightly counterintuitive::
+The recommended way to express this optional dependency in Kconfig logic
+uses the conditional form::
+
+  config FOO
+	tristate "Support for foo hardware"
+	depends on BAR if BAR
+
+This slightly counterintuitive style is also widely used::
 
   config FOO
 	tristate "Support for foo hardware"
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
 
diff --git a/scripts/kconfig/tests/conditional_dep/Kconfig b/scripts/kconfig/tests/conditional_dep/Kconfig
new file mode 100644
index 000000000000..ea2bdef9016c
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/Kconfig
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test Kconfig file for conditional dependencies.
+
+config FOO
+    bool "FOO symbol"
+
+config BAR
+    bool "BAR symbol"
+
+config TEST_BASIC
+    bool "Test basic conditional dependency"
+    depends on FOO if BAR
+    default y
+
+config TEST_COMPLEX
+    bool "Test complex conditional dependency"
+    depends on (FOO && BAR) if (FOO || BAR)
+    default y
+
+config BAZ
+    tristate "BAZ symbol"
+
+config TEST_OPTIONAL
+    tristate "Test simple optional dependency"
+    depends on BAZ if BAZ
+    default y
+
diff --git a/scripts/kconfig/tests/conditional_dep/__init__.py b/scripts/kconfig/tests/conditional_dep/__init__.py
new file mode 100644
index 000000000000..ab16df6487ec
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/__init__.py
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Correctly handle conditional dependencies.
+"""
+
+def test(conf):
+    assert conf.oldconfig('test_config1') == 0
+    assert conf.config_matches('expected_config1')
+
+    assert conf.oldconfig('test_config2') == 0
+    assert conf.config_matches('expected_config2')
+
+    assert conf.oldconfig('test_config3') == 0
+    assert conf.config_matches('expected_config3')
diff --git a/scripts/kconfig/tests/conditional_dep/expected_config1 b/scripts/kconfig/tests/conditional_dep/expected_config1
new file mode 100644
index 000000000000..2ad02aa66b06
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/expected_config1
@@ -0,0 +1,10 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Main menu
+#
+CONFIG_FOO=y
+CONFIG_BAR=y
+CONFIG_TEST_BASIC=y
+CONFIG_TEST_COMPLEX=y
+CONFIG_BAZ=y
+CONFIG_TEST_OPTIONAL=y
diff --git a/scripts/kconfig/tests/conditional_dep/expected_config2 b/scripts/kconfig/tests/conditional_dep/expected_config2
new file mode 100644
index 000000000000..b4b19cf50730
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/expected_config2
@@ -0,0 +1,8 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Main menu
+#
+# CONFIG_FOO is not set
+CONFIG_BAR=y
+CONFIG_BAZ=y
+CONFIG_TEST_OPTIONAL=y
diff --git a/scripts/kconfig/tests/conditional_dep/expected_config3 b/scripts/kconfig/tests/conditional_dep/expected_config3
new file mode 100644
index 000000000000..c788f6c710e1
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/expected_config3
@@ -0,0 +1,10 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Main menu
+#
+# CONFIG_FOO is not set
+# CONFIG_BAR is not set
+CONFIG_TEST_BASIC=y
+CONFIG_TEST_COMPLEX=y
+# CONFIG_BAZ is not set
+CONFIG_TEST_OPTIONAL=y
diff --git a/scripts/kconfig/tests/conditional_dep/test_config1 b/scripts/kconfig/tests/conditional_dep/test_config1
new file mode 100644
index 000000000000..5cc1ecedcba3
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/test_config1
@@ -0,0 +1,4 @@
+# Basic check that everything can be configured if selected.
+CONFIG_FOO=y
+CONFIG_BAR=y
+CONFIG_BAZ=m
diff --git a/scripts/kconfig/tests/conditional_dep/test_config2 b/scripts/kconfig/tests/conditional_dep/test_config2
new file mode 100644
index 000000000000..1175c5307308
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/test_config2
@@ -0,0 +1,7 @@
+# If FOO is not selected, then TEST_BASIC should fail the conditional
+# dependency since BAR is set.
+# TEST_COMPLEX will fail dependency as it depends on both FOO and BAR
+# if either of those is selected.
+CONFIG_FOO=n
+CONFIG_BAR=y
+CONFIG_BAZ=y
diff --git a/scripts/kconfig/tests/conditional_dep/test_config3 b/scripts/kconfig/tests/conditional_dep/test_config3
new file mode 100644
index 000000000000..3815ad744e89
--- /dev/null
+++ b/scripts/kconfig/tests/conditional_dep/test_config3
@@ -0,0 +1,6 @@
+# If FOO is not selected, but BAR is also not selected, then TEST_BASIC 
+# should pass since the dependency on FOO is conditional on BAR.
+# TEST_COMPLEX should be also set since neither FOO nor BAR are selected
+# so it has no dependencies.
+CONFIG_FOO=n
+CONFIG_BAR=n

---
base-commit: a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30
change-id: 20251106-kconfig_conditional_deps-51f1c903f863

Best regards,
-- 
Graham Roff <grahamr@qti.qualcomm.com>


