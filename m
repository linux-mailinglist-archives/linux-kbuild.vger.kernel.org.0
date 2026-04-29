Return-Path: <linux-kbuild+bounces-12932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DbrF9YU8mljnwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12932-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:25:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E43495A8F
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6652F306CC51
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE1532FA2E;
	Wed, 29 Apr 2026 14:21:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7F32B9B6;
	Wed, 29 Apr 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472519; cv=none; b=RsxyZu+0Ir5C2Y9y16iUrb26vy41AvPR6O21dNN7gNFpPQhTAuAle8S+pqGJgUV+DRAdKUkKqN9wQ69xryK/oBz4HI54KnALGyBHmBlEFq1cYYMZga/+KHHx51MamEbVI6kfZPXvDXzOal9yBqZhMhywP3VtOFXad6ILrmLtdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472519; c=relaxed/simple;
	bh=28Q0SiyrrhL+SHF2mxJU9yecoqjBEhvzXU2ByJ5qRLI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbv0aikXLyj6NjigdROH4PjSH3BqaMayP58sPvWiu3FxD7xQtusQGxyKt+s68ioe69kgezufrmeHaIPcDz1+bFOGg30O99z3xcRshNZV0ittW89zCgdm9Mu0UNPQdtpjLQGuE9j3m8SHanQtVoMyJ9SmjQPShKBq+WGjgRkpur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wI5nK-000000002S5-3mLo;
	Wed, 29 Apr 2026 14:21:43 +0000
Date: Wed, 29 Apr 2026 15:21:39 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: add self-test fixtures for style checker
Message-ID: <4b913d4e903c56ac479a4f3715159d63ea5cdcea.1777471439.git.daniel@makrotopia.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777471439.git.daniel@makrotopia.org>
X-Rspamd-Queue-Id: 01E43495A8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12932-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,makrotopia.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	DMARC_NA(0.00)[makrotopia.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.599];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]

Provide good/ and bad/ DTS and YAML fixtures plus a small runner that
feeds them to dt-check-style and diffs the output against expected
text files. Wired into a new top-level dt_style_selftest make target
so the suite can be exercised independently of the full tree.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
 - new patch (Krzysztof: "would be happy to see at least a few test
   cases for it")

 Makefile                                      |  6 ++
 .../dtc/dt-style-selftest/bad/dts-spaces.dts  | 13 ++++
 .../bad/yaml-child-addr-order.yaml            | 41 ++++++++++++
 .../bad/yaml-child-name-order.yaml            | 37 ++++++++++
 .../bad/yaml-cont-align.yaml                  | 30 +++++++++
 .../dt-style-selftest/bad/yaml-hex-case.yaml  | 29 ++++++++
 .../bad/yaml-indent-strict.yaml               | 29 ++++++++
 .../bad/yaml-line-length.yaml                 | 29 ++++++++
 .../bad/yaml-mixed-indent.yaml                | 29 ++++++++
 .../bad/yaml-node-close.yaml                  | 31 +++++++++
 .../bad/yaml-prop-order.yaml                  | 29 ++++++++
 .../bad/yaml-prop-pairing.yaml                | 33 +++++++++
 .../bad/yaml-required-blank.yaml              | 33 +++++++++
 .../dtc/dt-style-selftest/bad/yaml-tab.yaml   | 29 ++++++++
 .../bad/yaml-trailing-ws.yaml                 | 29 ++++++++
 .../dt-style-selftest/bad/yaml-unit-addr.yaml | 29 ++++++++
 .../bad/yaml-unused-label.yaml                | 29 ++++++++
 .../dt-style-selftest/bad/yaml-value-ws.yaml  | 29 ++++++++
 .../expected/dts-spaces.dts.txt               |  2 +
 .../expected/yaml-child-addr-order.yaml.txt   |  2 +
 .../expected/yaml-child-name-order.yaml.txt   |  2 +
 .../expected/yaml-cont-align.yaml.txt         |  2 +
 .../expected/yaml-hex-case.yaml.txt           |  2 +
 .../expected/yaml-indent-strict.yaml.txt      |  2 +
 .../expected/yaml-line-length.yaml.txt        |  2 +
 .../expected/yaml-mixed-indent.yaml.txt       |  3 +
 .../expected/yaml-node-close.yaml.txt         |  2 +
 .../expected/yaml-prop-order.yaml.txt         |  2 +
 .../expected/yaml-prop-pairing.yaml.txt       |  3 +
 .../expected/yaml-required-blank.yaml.txt     |  3 +
 .../expected/yaml-tab.yaml.txt                |  2 +
 .../expected/yaml-trailing-ws.yaml.txt        |  2 +
 .../expected/yaml-unit-addr.yaml.txt          |  2 +
 .../expected/yaml-unused-label.yaml.txt       |  2 +
 .../expected/yaml-value-ws.yaml.txt           |  2 +
 .../dtc/dt-style-selftest/good/dts-tab.dts    | 30 +++++++++
 .../dt-style-selftest/good/yaml-4space.yaml   | 41 ++++++++++++
 scripts/dtc/dt-style-selftest/run.sh          | 67 +++++++++++++++++++
 38 files changed, 689 insertions(+)
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-tab.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
 create mode 100755 scripts/dtc/dt-style-selftest/run.sh

diff --git a/Makefile b/Makefile
index e27c91ea56fc..c5513b573bbd 100644
--- a/Makefile
+++ b/Makefile
@@ -295,6 +295,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
+			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
@@ -1643,6 +1644,10 @@ PHONY += dt_compatible_check
 dt_compatible_check: dt_binding_schemas
 	$(Q)$(MAKE) $(build)=$(dtbindingtree) $@
 
+PHONY += dt_style_selftest
+dt_style_selftest:
+	$(Q)$(srctree)/scripts/dtc/dt-style-selftest/run.sh
+
 # ---------------------------------------------------------------------------
 # Modules
 
@@ -1845,6 +1850,7 @@ help:
 		echo '  dtbs_install       - Install dtbs to $(INSTALL_DTBS_PATH)'; \
 		echo '  dt_binding_check   - Validate device tree binding documents and examples'; \
 		echo '  dt_binding_schemas - Build processed device tree binding schemas'; \
+		echo '  dt_style_selftest  - Run dt-check-style fixture tests'; \
 		echo '  dtbs_check         - Validate device tree source files';\
 		echo '')
 
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts b/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
new file mode 100644
index 000000000000..905a91824a50
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
@@ -0,0 +1,13 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+ *
+ * Test fixture: a .dts using space indent (must use tabs).
+ */
+
+/dts-v1/;
+
+/ {
+    compatible = "example,test-board";
+    #address-cells = <1>;
+    #size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
new file mode 100644
index 000000000000..3df56e69a1ff
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-child-order.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with addressed children out of order
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-child-order
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@10000 {
+        compatible = "simple-bus";
+        reg = <0x10000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        device@200 {
+            compatible = "example,test-child-order";
+            reg = <0x200 0x10>;
+        };
+
+        device@100 {
+            compatible = "example,test-child-order";
+            reg = <0x100 0x10>;
+        };
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
new file mode 100644
index 000000000000..35d85e5573c2
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-child-name-order.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with unaddressed children out of name order
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-child-name-order
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@10000 {
+        compatible = "simple-bus";
+        reg = <0x10000 0x1000>;
+
+        foo {
+            label = "foo";
+        };
+
+        bar {
+            label = "bar";
+        };
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
new file mode 100644
index 000000000000..92778540b056
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-cont-align.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with mis-aligned multi-line property
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-cont-align
+  reg:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-cont-align";
+        reg = <0x1000 0x100>,
+            <0x2000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
new file mode 100644
index 000000000000..b26d1bf58de9
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-hex-case.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with uppercase hex literals
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-hex-case
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-hex-case";
+        reg = <0xABCD 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
new file mode 100644
index 000000000000..bee4cf118d73
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-indent-strict.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture using 2-space indent (rejected by strict mode)
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-indent-strict
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+      compatible = "example,test-indent-strict";
+      reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
new file mode 100644
index 000000000000..64427bf1c385
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-line-length.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture exceeding 80 columns
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-line-length
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
new file mode 100644
index 000000000000..5401d1a423a1
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-mixed-indent.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture mixing tabs and spaces in indent
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-mixed
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+    	   compatible = "example,test-mixed";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
new file mode 100644
index 000000000000..e107659fd9e8
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-node-close.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with closing brace not on its own line
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-node-close
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@10000 {
+        compatible = "simple-bus";
+        reg = <0x10000 0x1000>;
+
+        empty {};
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
new file mode 100644
index 000000000000..75582a3d2f6e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-prop-order.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with reg before compatible
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-prop-order
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+        reg = <0x1000 0x100>;
+        compatible = "example,test-prop-order";
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
new file mode 100644
index 000000000000..767ab21c39f3
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-prop-pairing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture exercising <x>-names and pinctrl-names pairing
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-prop-pairing
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-prop-pairing";
+        reg = <0x1000 0x100>;
+        clock-names = "bus";
+        clocks = <&clk 0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&p0>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
new file mode 100644
index 000000000000..8bb53240cffa
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-required-blank.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture missing required blank lines
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-required-blank
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@10000 {
+        compatible = "simple-bus";
+        reg = <0x10000 0x1000>;
+        status = "okay";
+        child@100 {
+            reg = <0x100>;
+        };
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
new file mode 100644
index 000000000000..487d07ff8cb6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-tab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with a tab in a DTS line
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-tab
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+        compatible = "example,test-tab";
+        reg = <0x1000 0x100>;	/* registers */
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
new file mode 100644
index 000000000000..5c4b4bd833c5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-trailing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with trailing whitespace
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-trailing
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+        compatible = "example,test-trailing";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
new file mode 100644
index 000000000000..93705cd45410
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-unit-addr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with malformed unit address
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-unit-addr
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@01000 {
+        compatible = "example,test-unit-addr";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
new file mode 100644
index 000000000000..28d7176cbf08
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-unused-label.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with an unused label
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-unused-label
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dev: device@1000 {
+        compatible = "example,test-unused-label";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
new file mode 100644
index 000000000000..4360454d19a0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-value-ws.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with extra whitespace inside <...>
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-value-ws
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-value-ws";
+        reg = <0x1000  0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
new file mode 100644
index 000000000000..2e7f9f6b8dce
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-spaces.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
new file mode 100644
index 000000000000..bb56e8868c7f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-child-addr-order.yaml:37: example 0 [child-address-order] child node @100 out of address order
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
new file mode 100644
index 000000000000..1a6a04151eb5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-child-name-order.yaml:34: example 0 [child-name-order] child node 'bar' out of name order
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
new file mode 100644
index 000000000000..4637963b377f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under "<" or \")
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
new file mode 100644
index 000000000000..e9e4585fc10a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-hex-case.yaml:28: example 0 [hex-case] hex literal '0xABCD' must be lowercase
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
new file mode 100644
index 000000000000..495c1c0b2a22
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-indent-strict.yaml:26: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
new file mode 100644
index 000000000000..81a76e47aed5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-line-length.yaml:27: example 0 [line-length] line exceeds 80 columns (81)
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
new file mode 100644
index 000000000000..2ff2ccaed715
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -0,0 +1,3 @@
+# mode=relaxed
+bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
+bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-dts] tab character not allowed in DTS example
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
new file mode 100644
index 000000000000..54e63bc97644
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-node-close.yaml:30: example 0 [node-close-alone] closing brace must be on its own line
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
new file mode 100644
index 000000000000..c8f1669e2ee3
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-prop-order.yaml:28: example 0 [property-order] property 'compatible' out of canonical order (should sort before 'reg')
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
new file mode 100644
index 000000000000..f44ebead0f46
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/yaml-prop-pairing.yaml:30: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
+bad/yaml-prop-pairing.yaml:32: example 0 [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
new file mode 100644
index 000000000000..d79f683713d9
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/yaml-required-blank.yaml:29: example 0 [required-blank-lines] "status" must be preceded by a blank line
+bad/yaml-required-blank.yaml:30: example 0 [required-blank-lines] child node must be preceded by a blank line
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
new file mode 100644
index 000000000000..d63974093946
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/yaml-tab.yaml:28: example 0 [tab-in-dts] tab character not allowed in DTS example
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
new file mode 100644
index 000000000000..35e8d55b3404
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/yaml-trailing-ws.yaml:27: example 0 [trailing-whitespace] trailing whitespace
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
new file mode 100644
index 000000000000..c2841f172862
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unit-addr.yaml:26: example 0 [unit-address-format] unit address '01000' has leading zeros
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
new file mode 100644
index 000000000000..92879c8eb12b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unused-label.yaml:26: example 0 [unused-labels] label 'dev' defined but never &-referenced
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
new file mode 100644
index 000000000000..24a69463fe77
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-value-ws.yaml:28: example 0 [value-whitespace] multiple spaces inside <...>
\ No newline at end of file
diff --git a/scripts/dtc/dt-style-selftest/good/dts-tab.dts b/scripts/dtc/dt-style-selftest/good/dts-tab.dts
new file mode 100644
index 000000000000..14295811c2bc
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-tab.dts
@@ -0,0 +1,30 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+ *
+ * Test fixture: a properly formatted .dts using one-tab indent.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	bus@10000 {
+		compatible = "simple-bus";
+		reg = <0x10000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		device@100 {
+			compatible = "example,test";
+			reg = <0x100 0x10>;
+		};
+
+		device@200 {
+			compatible = "example,test";
+			reg = <0x200 0x10>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
new file mode 100644
index 000000000000..1502f803c24c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-good-4space.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture for dt-check-style
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-4space
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@10000 {
+        compatible = "simple-bus";
+        reg = <0x10000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        device@100 {
+            compatible = "example,test-4space";
+            reg = <0x100 0x10>;
+        };
+
+        device@200 {
+            compatible = "example,test-4space";
+            reg = <0x200 0x10>;
+        };
+    };
diff --git a/scripts/dtc/dt-style-selftest/run.sh b/scripts/dtc/dt-style-selftest/run.sh
new file mode 100755
index 000000000000..821d635ddc15
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/run.sh
@@ -0,0 +1,67 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Run dt-check-style against fixtures under good/ and bad/.
+# good/ files must produce no output and exit 0 in both modes.
+# bad/ files must produce the expected output (in expected/<name>.txt)
+# and exit 1.
+#
+# The mode used for a bad fixture is whichever produces a violation:
+# trailing-whitespace and tab fixtures use the default (relaxed),
+# the rest use --mode=strict. The expected output files name the
+# mode in their first line.
+
+set -u
+
+here=$(cd "$(dirname "$0")" && pwd)
+tool="$here/../dt-check-style"
+fail=0
+
+run() {
+    file=$1
+    mode=$2
+    "$tool" --mode="$mode" "$file" 2>&1
+}
+
+# good/ -- must exit 0 and produce no output in both modes
+for f in "$here"/good/*; do
+    [ -e "$f" ] || continue
+    for mode in relaxed strict; do
+        out=$(run "$f" "$mode") || true
+        if [ -n "$out" ]; then
+            echo "FAIL good/$mode: $(basename "$f"):"
+            echo "$out" | sed 's/^/  /'
+            fail=$((fail + 1))
+        fi
+    done
+done
+
+# bad/ -- must match expected/<name>.txt
+for f in "$here"/bad/*; do
+    [ -e "$f" ] || continue
+    name=$(basename "$f")
+    expected="$here/expected/$name.txt"
+    if [ ! -f "$expected" ]; then
+        echo "FAIL bad: missing $expected"
+        fail=$((fail + 1))
+        continue
+    fi
+    mode=$(head -1 "$expected" | sed 's/^# mode=//')
+    body=$(tail -n +2 "$expected")
+    out=$(run "$f" "$mode") || true
+    # Strip the directory prefix so expected files are portable.
+    out=$(printf '%s\n' "$out" | sed "s|$here/bad/|bad/|g")
+    if [ "$out" != "$body" ]; then
+        echo "FAIL bad/$mode: $name:"
+        diff -u <(printf '%s\n' "$body") <(printf '%s\n' "$out") | \
+            sed 's/^/  /'
+        fail=$((fail + 1))
+    fi
+done
+
+if [ "$fail" -eq 0 ]; then
+    echo "PASS"
+    exit 0
+fi
+echo "FAILED ($fail)"
+exit 1
-- 
2.54.0

