Return-Path: <linux-kbuild+bounces-10031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC8CAE59A
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Dec 2025 23:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C501306B74D
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Dec 2025 22:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF052FD696;
	Mon,  8 Dec 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyG7XA/W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADF2FC038;
	Mon,  8 Dec 2025 22:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233844; cv=none; b=ZvrdrgLnMzQ4cP8PJ3SpE52BqNaHoplaYhsXMnThHo7Qe6zoCMxBSFtSJoQTQDPvE0hj2Gc9jWhsq2Jjnd1XEdorSkTjxeGipjstk4AhQyVF6WOnm75RwWVIMEoq9dNEn3kOSXR6hJ96zlFMijQAtbMQ7gvvq+MNPgaTtifHOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233844; c=relaxed/simple;
	bh=CfonjFjXObsctsSc24y/BdI66bpo0K+sN2oUZQCLLtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6dW00pO7bwk/Thqsz0ZwZJ+nDJxRvn0XHydtIFBOcMIIMcsZHCxNZYkXBbyWpvNCW7DvXYjopa+whmoal4RYjwnZej3qLyMsmBBHzsrxzMMxiD0jnQWaFb3a1B7CFmii/SijVTU3E4tqJ9fkDaFKEX7JOMiV9SqxY/M1Y+egw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyG7XA/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EE6C4CEF1;
	Mon,  8 Dec 2025 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765233843;
	bh=CfonjFjXObsctsSc24y/BdI66bpo0K+sN2oUZQCLLtI=;
	h=From:To:Cc:Subject:Date:From;
	b=kyG7XA/W0ITT/3SZrNYjA/h6o2OPazttPJEU4oyREDeZEjPfDfckSjJt76hJOAGNJ
	 B2Q2NCdP5I6Mg0sykS0QC/Ctc7GxWOTmqd/jCeCkMgUxD/ceJoIG9pjurZnnJ9dDs2
	 5WC4tjC54BDeOsvBOMfsa1QLSu4tVqQ6u5zryVHzq1mOwnMLyAAuK2zHuaObqn2cR1
	 NWmdlwY3ecHVZIwIyW0S1laviw+SU48UZoXP5CdW7oEGwEEHh38wOBXDhqObYSMq4q
	 VLa7KU42QL07OOEptmEar1m6hg4oSsfKp1Mtw2PaUa32IxvUpijivvG5Jc4b+Z7niF
	 gIL72R3kHT31w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] dt-bindings: kbuild: Support single binding targets
Date: Mon,  8 Dec 2025 16:43:03 -0600
Message-ID: <20251208224304.2907913-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the full 'make dt_binding_check' is slow. A shortcut is to set
DT_SCHEMA_FILES env variable to a substring of DT schema files to test.
It both limits which examples are validated and which schemas are used
to validate the examples. This is a problem because errors from other
schemas are missed. What makes validation slow is checking all examples,
so we really just need a way to test a single example.

Add a %.yaml target to validate the schema and validate the example:

make example-schema.yaml

The behavior for 'make dt_binding_check DT_SCHEMA_FILES=example-schema'
is unchanged. Really it should mirror dtbs_check and validate all the
examples with a subset of schemas, but there are lots of users of
expecting the existing behavior.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile         |  5 ++++-
 .../devicetree/bindings/writing-schema.rst         | 12 ++++++++----
 Makefile                                           | 14 ++++++++++----
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 8d6f85f4455d..1e116425ad70 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -82,5 +82,8 @@ clean-files = $(shell find $(obj) \( -name '*.example.dts' -o \
 dt_compatible_check: $(obj)/processed-schema.json
 	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
 
+PHONY += dt_binding_check_one
+dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked
+
 PHONY += dt_binding_check
-dt_binding_check: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked $(CHK_DT_EXAMPLES)
+dt_binding_check: dt_binding_check_one $(CHK_DT_EXAMPLES)
diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 05c34248e544..2ff5b0565a31 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -214,6 +214,10 @@ binding schema. All of the DT binding documents can be validated using the
 
     make dt_binding_check
 
+Or to validate a single schema and its example::
+
+    make sram/sram.yaml
+
 In order to perform validation of DT source files, use the ``dtbs_check`` target::
 
     make dtbs_check
@@ -226,10 +230,10 @@ It is possible to run both in a single command::
 
     make dt_binding_check dtbs_check
 
-It is also possible to run checks with a subset of matching schema files by
-setting the ``DT_SCHEMA_FILES`` variable to 1 or more specific schema files or
-patterns (partial match of a fixed string). Each file or pattern should be
-separated by ':'.
+It is also possible to combine running the above commands with a subset of
+matching schema files by setting the ``DT_SCHEMA_FILES`` variable to 1 or more
+specific schema files or patterns (partial match of a fixed string). Each file
+or pattern should be separated by ':'.
 
 ::
 
diff --git a/Makefile b/Makefile
index 2f545ec1690f..1ae6b4c51955 100644
--- a/Makefile
+++ b/Makefile
@@ -1506,6 +1506,12 @@ ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
 dtstree := arch/$(SRCARCH)/boot/dts
 endif
 
+dtbindingtree := Documentation/devicetree/bindings
+
+%.yaml: dtbs_prepare
+	$(Q)$(MAKE) $(build)=$(dtbindingtree) \
+		    $(dtbindingtree)/$(patsubst %.yaml,%.example.dtb,$@) dt_binding_check_one
+
 ifneq ($(dtstree),)
 
 %.dtb: dtbs_prepare
@@ -1523,7 +1529,7 @@ dtbs: dtbs_prepare
 # dtbs_install depend on it as dtbs_install may run as root.
 dtbs_prepare: include/config/kernel.release scripts_dtc
 
-ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
+ifneq ($(filter dtbs_check %.yaml, $(MAKECMDGOALS)),)
 export CHECK_DTBS=y
 endif
 
@@ -1556,14 +1562,14 @@ endif
 
 PHONY += dt_binding_check dt_binding_schemas
 dt_binding_check: dt_binding_schemas scripts_dtc
-	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings $@
+	$(Q)$(MAKE) $(build)=$(dtbindingtree) $@
 
 dt_binding_schemas:
-	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
+	$(Q)$(MAKE) $(build)=$(dtbindingtree)
 
 PHONY += dt_compatible_check
 dt_compatible_check: dt_binding_schemas
-	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings $@
+	$(Q)$(MAKE) $(build)=$(dtbindingtree) $@
 
 # ---------------------------------------------------------------------------
 # Modules
-- 
2.51.0


