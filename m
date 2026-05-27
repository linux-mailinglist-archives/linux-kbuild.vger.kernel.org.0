Return-Path: <linux-kbuild+bounces-13377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHmyFUJHF2qS/QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13377-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:34:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30A5E98D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 373343054F56
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004A0384256;
	Wed, 27 May 2026 19:33:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E837F8D6;
	Wed, 27 May 2026 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910389; cv=none; b=cgXL5d0mcENbY1tz4WNUk8FTlzyDE/IAHdpWfjyYiesmU4tfIpJuUiY95nClxGvr/WbWB9iNcsXosfFxH6aA8bCkpxCvKpDln7KOcRCRdnxOjuxYMJmhmNZ8nW+oHyUnsE1Jx3YD4Z9vh8iICpWUaSu/NsnpAwmCdhSUGHZlURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910389; c=relaxed/simple;
	bh=f3/39FnMLR2Chp0PQHielqmkDB/i1woXojJGa+wOJF0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcakiZuSY8+ezk5TO6EioI07usCooxhe0skXSxGGla79fMeIlGKBpYXAoAK7vjFHKWpbnsUJGyk35uF1odBN5fV1D/KWqSRR2z/Yb6ARPCOXb2Wlw3wmziI5FDijToDoL3QV71tvqur+qEArTD6fBppkkUdpjILN7EwMsm8Ugu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wSJza-000000003j8-2orD;
	Wed, 27 May 2026 19:32:38 +0000
Date: Wed, 27 May 2026 20:32:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 4/4] dt-bindings: add self-test fixtures for style checker
Message-ID: <80fec5d2cfcdee0f9c5e2d4921ebbd4115d392b7.1779908995.git.daniel@makrotopia.org>
References: <cover.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779908995.git.daniel@makrotopia.org>
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13377-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[makrotopia.org];
	FREEMAIL_TO(0.00)[kernel.org,realtek.com,linux.intel.com,suse.com,linaro.org,quicinc.com,oss.qualcomm.com,gmail.com,suse.de,amd.com,baylibre.com,makrotopia.org,garyguo.net,weissschuh.net,intel.com,roeck-us.net,wp.pl,bur.io,google.com,lwn.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DE30A5E98D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide good/ and bad/ DTS and YAML fixtures plus a small runner that
feeds them to dt-check-style and diffs the output against expected
text files. Wired into a new top-level dt_style_selftest make target
so the suite can be exercised independently of the full tree.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5:
 - add fixtures covering the parser fixes in 1/4
   (yaml-unit-addr-prefix, yaml-unclosed-comment,
   yaml-multi-close, yaml-label-in-string, yaml-tricky-parsing)
 - move SPDX header in the three .dts fixtures to a
   "// SPDX-..." comment on line 1 (checkpatch)

v4:
 - run.sh: replace the bash-only "<()" process substitution with a
   POSIX temp-file plus stdin diff, so the runner works when /bin/sh
   is dash
 - run.sh: check dt-check-style's exit status -- good/ fixtures must
   exit 0, bad/ fixtures must exit 1 -- instead of discarding it with
   "|| true"
 - add fixtures for the checker fixes in this revision:
   good/dts-cont-align.dts (tab-and-space aligned multi-line
   property), bad/yaml-digit-node-order.yaml (digit-leading node
   names), bad/yaml-trailing-comment.yaml (trailing // and /* */
   comments) and bad/yaml-value-ws-multiline.yaml (multi-line cell
   array)
 - update bad/yaml-value-ws.yaml (and its expected output) to
   exercise the reworked value-whitespace rule

v3:
 - append a trailing newline to every expected/*.txt fixture (Rob)
 - restore the trailing whitespace inside yaml-trailing-ws.yaml
   that had been silently stripped during re-application, so the
   selftest actually exercises the trailing-whitespace rule

v2:
 - new patch (Krzysztof: "would be happy to see at least a few test
   cases for it")

 Makefile                                      |  6 ++
 .../dtc/dt-style-selftest/bad/dts-spaces.dts  | 12 ++++
 .../bad/yaml-child-addr-order.yaml            | 41 +++++++++++
 .../bad/yaml-child-name-order.yaml            | 37 ++++++++++
 .../bad/yaml-cont-align.yaml                  | 30 ++++++++
 .../bad/yaml-digit-node-order.yaml            | 37 ++++++++++
 .../dt-style-selftest/bad/yaml-hex-case.yaml  | 29 ++++++++
 .../bad/yaml-indent-strict.yaml               | 29 ++++++++
 .../bad/yaml-label-in-string.yaml             | 30 ++++++++
 .../bad/yaml-line-length.yaml                 | 29 ++++++++
 .../bad/yaml-mixed-indent.yaml                | 29 ++++++++
 .../bad/yaml-multi-close.yaml                 | 35 +++++++++
 .../bad/yaml-node-close.yaml                  | 31 ++++++++
 .../bad/yaml-prop-order.yaml                  | 29 ++++++++
 .../bad/yaml-prop-pairing.yaml                | 33 +++++++++
 .../bad/yaml-required-blank.yaml              | 33 +++++++++
 .../dtc/dt-style-selftest/bad/yaml-tab.yaml   | 29 ++++++++
 .../bad/yaml-trailing-comment.yaml            | 26 +++++++
 .../bad/yaml-trailing-ws.yaml                 | 29 ++++++++
 .../bad/yaml-unclosed-comment.yaml            | 30 ++++++++
 .../bad/yaml-unit-addr-prefix.yaml            | 29 ++++++++
 .../dt-style-selftest/bad/yaml-unit-addr.yaml | 29 ++++++++
 .../bad/yaml-unused-label.yaml                | 29 ++++++++
 .../bad/yaml-value-ws-multiline.yaml          | 27 +++++++
 .../dt-style-selftest/bad/yaml-value-ws.yaml  | 29 ++++++++
 .../expected/dts-spaces.dts.txt               |  2 +
 .../expected/yaml-child-addr-order.yaml.txt   |  2 +
 .../expected/yaml-child-name-order.yaml.txt   |  2 +
 .../expected/yaml-cont-align.yaml.txt         |  2 +
 .../expected/yaml-digit-node-order.yaml.txt   |  2 +
 .../expected/yaml-hex-case.yaml.txt           |  2 +
 .../expected/yaml-indent-strict.yaml.txt      |  2 +
 .../expected/yaml-label-in-string.yaml.txt    |  2 +
 .../expected/yaml-line-length.yaml.txt        |  2 +
 .../expected/yaml-mixed-indent.yaml.txt       |  3 +
 .../expected/yaml-multi-close.yaml.txt        |  3 +
 .../expected/yaml-node-close.yaml.txt         |  2 +
 .../expected/yaml-prop-order.yaml.txt         |  2 +
 .../expected/yaml-prop-pairing.yaml.txt       |  3 +
 .../expected/yaml-required-blank.yaml.txt     |  3 +
 .../expected/yaml-tab.yaml.txt                |  2 +
 .../expected/yaml-trailing-comment.yaml.txt   |  2 +
 .../expected/yaml-trailing-ws.yaml.txt        |  2 +
 .../expected/yaml-unclosed-comment.yaml.txt   |  2 +
 .../expected/yaml-unit-addr-prefix.yaml.txt   |  2 +
 .../expected/yaml-unit-addr.yaml.txt          |  2 +
 .../expected/yaml-unused-label.yaml.txt       |  2 +
 .../expected/yaml-value-ws-multiline.yaml.txt |  2 +
 .../expected/yaml-value-ws.yaml.txt           |  2 +
 .../dt-style-selftest/good/dts-cont-align.dts | 26 +++++++
 .../dtc/dt-style-selftest/good/dts-tab.dts    | 29 ++++++++
 .../dt-style-selftest/good/yaml-4space.yaml   | 41 +++++++++++
 .../good/yaml-tricky-parsing.yaml             | 57 +++++++++++++++
 scripts/dtc/dt-style-selftest/run.sh          | 71 +++++++++++++++++++
 54 files changed, 1003 insertions(+)
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-tab.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
 create mode 100755 scripts/dtc/dt-style-selftest/run.sh

diff --git a/Makefile b/Makefile
index d59f703f9797..e0b83e6832a7 100644
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
@@ -1666,6 +1667,10 @@ PHONY += dt_compatible_check
 dt_compatible_check: dt_binding_schemas
 	$(Q)$(MAKE) $(build)=$(dtbindingtree) $@
 
+PHONY += dt_style_selftest
+dt_style_selftest:
+	$(Q)$(srctree)/scripts/dtc/dt-style-selftest/run.sh
+
 # ---------------------------------------------------------------------------
 # Modules
 
@@ -1869,6 +1874,7 @@ help:
 		echo '  dtbs_install       - Install dtbs to $(INSTALL_DTBS_PATH)'; \
 		echo '  dt_binding_check   - Validate device tree binding documents and examples'; \
 		echo '  dt_binding_schemas - Build processed device tree binding schemas'; \
+		echo '  dt_style_selftest  - Run dt-check-style fixture tests'; \
 		echo '  dtbs_check         - Validate device tree source files';\
 		echo '')
 
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts b/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
new file mode 100644
index 000000000000..9dad22adce51
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
new file mode 100644
index 000000000000..44a9d25e5ba0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-digit-node-order.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with digit-leading nodes out of address order
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-digit-node-order
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@0 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        3d-engine@20 {
+            compatible = "example,3d-engine";
+            reg = <0x20 0x4>;
+        };
+
+        1wire@10 {
+            compatible = "example,1wire";
+            reg = <0x10 0x4>;
+        };
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
new file mode 100644
index 000000000000..ba512869b702
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-label-in-string.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture where a label is only "referenced" inside a string
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-label-in-string
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
+    foo: device@1000 {
+        compatible = "example,test-label-in-string";
+        reg = <0x1000 0x100>;
+        info = "see &foo for details";
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
new file mode 100644
index 000000000000..4d9fa27b50a2
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-multi-close.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with two closing braces on one line
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-multi-close
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
+            compatible = "example,test-multi-close";
+            reg = <0x100 0x10>;
+        }; };
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
new file mode 100644
index 000000000000..2368ada8106f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-trailing-comment.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with properties out of order behind trailing comments
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-trailing-comment
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@0 {  /* the device node */
+        reg = <0x0 0x4>;  /* registers */
+        compatible = "example,test-trailing-comment";  // misplaced
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
new file mode 100644
index 000000000000..63c1c08712a5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-unclosed-comment.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with an unclosed /* block comment
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-unclosed-comment
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
+    /* this comment never closes
+    device@1000 {
+        compatible = "example,test-unclosed-comment";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
new file mode 100644
index 000000000000..9b3fe508c5fd
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-unit-addr-prefix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with 0x-prefixed unit address
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-unit-addr-prefix
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
+    memory@0x1000 {
+        compatible = "example,test-unit-addr-prefix";
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
new file mode 100644
index 000000000000..504bf0931c27
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-value-ws-multiline.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with extra whitespace in a multi-line cell array
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-value-ws-multiline
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@0 {
+        compatible = "example,test-value-ws-multiline";
+        reg = < 0x0 0x4
+              0x8 0xc>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
new file mode 100644
index 000000000000..342ab9f399f1
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
+        reg = < 0x1000 0x100 >;
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
new file mode 100644
index 000000000000..070025c4568c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-spaces.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
new file mode 100644
index 000000000000..f0db79a0018b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-child-addr-order.yaml:37: example 0 [child-address-order] child node @100 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
new file mode 100644
index 000000000000..bb434b126191
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-child-name-order.yaml:34: example 0 [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
new file mode 100644
index 000000000000..b5576dd0f6b1
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under "<" or \")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt
new file mode 100644
index 000000000000..6de275e2dcb5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-digit-node-order.yaml:33: example 0 [child-address-order] child node @10 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
new file mode 100644
index 000000000000..6600f7cd1ba5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-hex-case.yaml:28: example 0 [hex-case] hex literal '0xABCD' must be lowercase
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
new file mode 100644
index 000000000000..5ef290d3a847
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-indent-strict.yaml:26: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt
new file mode 100644
index 000000000000..05da06f81364
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-label-in-string.yaml:26: example 0 [unused-labels] label 'foo' defined but never &-referenced
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
new file mode 100644
index 000000000000..89b36360caa4
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-line-length.yaml:27: example 0 [line-length] line exceeds 80 columns (81)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
new file mode 100644
index 000000000000..c989f8f19853
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -0,0 +1,3 @@
+# mode=relaxed
+bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
+bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-dts] tab character not allowed in DTS example
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
new file mode 100644
index 000000000000..637d0f8ea103
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/yaml-multi-close.yaml:35: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
+bad/yaml-multi-close.yaml:35: example 0 [node-close-alone] closing brace must be on its own line
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
new file mode 100644
index 000000000000..ee894747b5b9
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-node-close.yaml:30: example 0 [node-close-alone] closing brace must be on its own line
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
new file mode 100644
index 000000000000..578df7209170
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-prop-order.yaml:28: example 0 [property-order] property 'compatible' out of canonical order (should sort before 'reg')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
new file mode 100644
index 000000000000..e6e21349a939
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/yaml-prop-pairing.yaml:30: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
+bad/yaml-prop-pairing.yaml:32: example 0 [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
new file mode 100644
index 000000000000..04ea0bacdcb9
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/yaml-required-blank.yaml:29: example 0 [required-blank-lines] "status" must be preceded by a blank line
+bad/yaml-required-blank.yaml:30: example 0 [required-blank-lines] child node must be preceded by a blank line
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
new file mode 100644
index 000000000000..9e83246fbaa1
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/yaml-tab.yaml:28: example 0 [tab-in-dts] tab character not allowed in DTS example
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt
new file mode 100644
index 000000000000..69dbb1d03239
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-trailing-comment.yaml:25: example 0 [property-order] property 'compatible' out of canonical order (should sort before 'reg')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
new file mode 100644
index 000000000000..cfdbc8476c73
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/yaml-trailing-ws.yaml:27: example 0 [trailing-whitespace] trailing whitespace
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt
new file mode 100644
index 000000000000..9a30ee7145e6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unclosed-comment.yaml:26: example 0 [unclosed-block-comment] unclosed /* block comment
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt
new file mode 100644
index 000000000000..8dec6c1176b5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unit-addr-prefix.yaml:26: example 0 [unit-address-format] unit address '0x1000' must not have a "0x" prefix
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
new file mode 100644
index 000000000000..b52f0ef20bee
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unit-addr.yaml:26: example 0 [unit-address-format] unit address '01000' has leading zeros
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
new file mode 100644
index 000000000000..4f00202f0902
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-unused-label.yaml:26: example 0 [unused-labels] label 'dev' defined but never &-referenced
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
new file mode 100644
index 000000000000..3df55b1762d0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-value-ws-multiline.yaml:25: example 0 [value-whitespace] extra whitespace inside <...>
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
new file mode 100644
index 000000000000..cbb5f88fe85f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-value-ws.yaml:28: example 0 [value-whitespace] extra whitespace inside <...>
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
new file mode 100644
index 000000000000..36fb4eefcd83
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: tab-indented .dts with a tab-and-space aligned
+ * multi-line property. Continuation lines mix tabs for indent and
+ * spaces for alignment by design; that must not be flagged.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>,
+			     <4 5 6>,
+			     <7 8 9>;
+		pinmux = <
+			 0x01
+			 0x02
+			 >;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-tab.dts b/scripts/dtc/dt-style-selftest/good/dts-tab.dts
new file mode 100644
index 000000000000..ab7b5d1242ba
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-tab.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
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
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
new file mode 100644
index 000000000000..a836d5f36b93
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-good-tricky-parsing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture exercising parser corner cases
+
+description: |
+  Covers patterns that previously broke the classifier:
+    - "/* ... */ code;" with code following the closing of a one-line
+      block comment must still parse the code.
+    - a label on a node whose name starts with a digit (1wire@10).
+    - a multi-line C preprocessor macro using backslash continuations
+      must not be parsed as DTS lines.
+    - a /* comment that opens and closes on the same code line must
+      not leave the parser in block-comment state.
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-tricky-parsing
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
+    #define MY_REG(a, b) \
+        ((a) << 16 |     \
+         (b) << 0)
+
+    one_wire: 1wire@10 {
+        compatible = "example,test-tricky-parsing";
+        reg = <MY_REG(0x10, 0)>;
+        /* inline-closed */ status = "okay";
+    };
+
+    other: device@20 {
+        compatible = "example,test-tricky-parsing";
+        reg = <0x20 0x10>;
+    };
+
+    &one_wire {
+        status = "okay";
+    };
+
+    &other {
+        status = "okay";
+    };
diff --git a/scripts/dtc/dt-style-selftest/run.sh b/scripts/dtc/dt-style-selftest/run.sh
new file mode 100755
index 000000000000..8117dd9be90a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/run.sh
@@ -0,0 +1,71 @@
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
+        out=$(run "$f" "$mode")
+        rc=$?
+        if [ -n "$out" ] || [ "$rc" -ne 0 ]; then
+            echo "FAIL good/$mode: $(basename "$f") (exit $rc, want 0):"
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
+    out=$(run "$f" "$mode")
+    rc=$?
+    # Strip the directory prefix so expected files are portable.
+    out=$(printf '%s\n' "$out" | sed "s|$here/bad/|bad/|g")
+    if [ "$out" != "$body" ] || [ "$rc" -ne 1 ]; then
+        echo "FAIL bad/$mode: $name (exit $rc, want 1):"
+        bf=$(mktemp)
+        printf '%s\n' "$body" > "$bf"
+        printf '%s\n' "$out" | diff -u "$bf" - | sed 's/^/  /'
+        rm -f "$bf"
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

