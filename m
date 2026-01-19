Return-Path: <linux-kbuild+bounces-10673-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33722D39F2A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7280300C9A8
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF512C027E;
	Mon, 19 Jan 2026 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="V8u3V/i/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E029C35A;
	Mon, 19 Jan 2026 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805926; cv=none; b=ANs3M2YNRaNuvy1gI+ghYd8+pvcc4T1dBJNU7k+OUCdSgVBJQXo8pYj7gcwT0t97t1+AFrp943h2hL4EmF2394dNGWzA1bJ1xHb1GCB52j1bIkp9igetykcC8binOr7jvEvxZnqPOUOh9APAiub/5s15SqncvE89Jf/4SxJwFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805926; c=relaxed/simple;
	bh=sGGM3/iexVBG0T3zFbYZ0fbn9ZW+ALJBOqQIesCrr3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DsSugF4gLuS3cEaCWHEepy0XKIkeP9SoAxJsZ04T6b937G9KUo62jDw2p+hjWaCeEdFSBcVXy1h0hwC14EUWC5tYkL71L8vLRGirKirZOR80aReLI2536LVXLYFrh5WR0Ku+gqQvDE4ov9Tuggu3gmNCNhyQauRHTXMmb29eEYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=V8u3V/i/; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 0823D200A7;
	Mon, 19 Jan 2026 07:48:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 686821F88B3;
	Mon, 19 Jan 2026 07:48:44 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Xr7KlrjxQNTl; Mon, 19 Jan 2026 07:48:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 658641FA449;
	Mon, 19 Jan 2026 07:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 658641FA449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805323;
	bh=K79EnArxBk2VhPXNV5Mm8HKCwabAMkBLykFETdOgQKI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=V8u3V/i/2WefVxRGWsf6llP1I/7p0Eh8UYnP0DndyGpFZnA92ics70N0JA5StMcQL
	 ztaGqu518j+LPGWV/DfuZ+d33KLpNa32IphP10uhKTp/via13dkvlh/5FSpOCWsLxD
	 /2p9mWqRmb59m9vN0CQEjgf6gfjjetbsyatMrWpXRqjIqfPweFNyIPTWnnA1mKYr67
	 9EMI0SiObaRY9T5NdOlsK/6CjjrSXAnBxylpfV4o7Ixc2byeXlHjDaaoE9PiRMhs+N
	 /EDh/whm2U7yKjbFSyHarmBpJaHFiqVNQhzgNbRW2UGTpkvfLEUh6snxTy09sNzcqi
	 y1kvtqUqctDyQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0m9D8YCtqcsG; Mon, 19 Jan 2026 07:48:43 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 13EDA1F88B3;
	Mon, 19 Jan 2026 07:48:43 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 01/14] tools/sbom: integrate tool in make process
Date: Mon, 19 Jan 2026 07:47:18 +0100
Message-Id: <20260119064731.23879-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064731.23879-1-luis.augenstein@tngtech.com>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add CONFIG_SBOM option and integrate SBOM tool into the kernel build
process.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .gitignore          |   1 +
 MAINTAINERS         |   6 ++
 Makefile            |   8 +-
 lib/Kconfig.debug   |   9 ++
 tools/Makefile      |   3 +-
 tools/sbom/Makefile |  32 +++++++
 tools/sbom/README   | 208 ++++++++++++++++++++++++++++++++++++++++++++
 tools/sbom/sbom.py  |  16 ++++
 8 files changed, 281 insertions(+), 2 deletions(-)
 create mode 100644 tools/sbom/Makefile
 create mode 100644 tools/sbom/README
 create mode 100644 tools/sbom/sbom.py

diff --git a/.gitignore b/.gitignore
index 3a7241c94..f3372f15e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,6 +48,7 @@
 *.s
 *.so
 *.so.dbg
+*.spdx.json
 *.su
 *.symtypes
 *.tab.[ch]
diff --git a/MAINTAINERS b/MAINTAINERS
index f1b020588..03d7d93d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23365,6 +23365,12 @@ R:	Marc Murphy <marc.murphy@sancloud.com>
 S:	Supported
 F:	arch/arm/boot/dts/ti/omap/am335x-sancloud*
=20
+SBOM
+M:	Luis Augenstein <luis.augenstein@tngtech.com>
+M:	Maximilian Huber <maximilian.huber@tngtech.com>
+S:	Maintained
+F:	tools/sbom/
+
 SC1200 WDT DRIVER
 M:	Zwane Mwaikambo <zwanem@gmail.com>
 S:	Maintained
diff --git a/Makefile b/Makefile
index 9d3812526..22bfe5cea 100644
--- a/Makefile
+++ b/Makefile
@@ -1457,6 +1457,12 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
=20
+ifdef CONFIG_SBOM
+all: tools/sbom
+tools/sbom: $(notdir $(KBUILD_IMAGE)) modules
+	$(Q)$(MAKE) O=3D$(abspath $(objtree)) subdir=3Dtools -C $(srctree)/tool=
s/ sbom
+endif
+
 # The tools build system is not a part of Kbuild and tends to introduce
 # its own unique issues. If you need to integrate a new tool into Kbuild=
,
 # please consider locating that tool outside the tools/ tree and using t=
he
@@ -1612,7 +1618,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+	       .builtin-dtbs-list .builtin-dtb.S sbom-*.spdx.json
=20
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES +=3D include/config include/generated          \
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939fd..9d03ef854 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -563,6 +563,15 @@ config OBJTOOL_WERROR
=20
 	  If unsure, say Y.
=20
+config SBOM
+	bool "Generate Software Bill of Materials"
+	help
+	  If enabled, the kernel build will generate SPDX SBOM documents
+	  describing all source files, and build artifacts involved in the buil=
d.
+	  The SBOM documents are generated in SPDX 3.0.1 format and saved to th=
e build output
+	  directory after the build completes.
+	  For more information, see tools/sbom/README
+
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION && UNWINDER_FRAME_POINTER
diff --git a/tools/Makefile b/tools/Makefile
index cb40961a7..7b4b1c96d 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -27,6 +27,7 @@ help:
 	@echo '  nolibc                 - nolibc headers testing and installati=
on'
 	@echo '  objtool                - an ELF object analysis tool'
 	@echo '  perf                   - Linux performance measurement and ana=
lysis tool'
+	@echo '  sbom                   - SBOM generation tool'
 	@echo '  selftests              - various kernel selftests'
 	@echo '  sched_ext              - sched_ext example schedulers'
 	@echo '  bootconfig             - boot config tool'
@@ -70,7 +71,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
=20
-counter dma firewire hv guest bootconfig spi usb virtio mm bpf iio gpio =
objtool leds wmi firmware debugging tracing: FORCE
+counter dma firewire hv guest bootconfig spi usb virtio mm bpf iio gpio =
objtool leds wmi firmware debugging tracing sbom: FORCE
 	$(call descend,$@)
=20
 bpf/%: FORCE
diff --git a/tools/sbom/Makefile b/tools/sbom/Makefile
new file mode 100644
index 000000000..5b80b455c
--- /dev/null
+++ b/tools/sbom/Makefile
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+srctree :=3D $(abspath ../../..)
+
+SBOM_SOURCE_FILE :=3D $(objtree)/sbom-source.spdx.json
+SBOM_BUILD_FILE :=3D $(objtree)/sbom-build.spdx.json
+SBOM_OUTPUT_FILE :=3D $(objtree)/sbom-output.spdx.json
+SBOM_ROOTS_FILE :=3D $(objtree)/sbom-roots.txt
+
+
+ifeq ($(srctree),$(objtree))
+    SBOM_TARGETS :=3D $(SBOM_SOURCE_FILE) $(SBOM_BUILD_FILE) $(SBOM_OUTP=
UT_FILE)
+else
+    SBOM_TARGETS :=3D $(SBOM_BUILD_FILE) $(SBOM_OUTPUT_FILE)
+endif
+
+sbom: $(SBOM_TARGETS)
+
+$(SBOM_TARGETS) &:
+	@echo "  GEN     $(notdir $(SBOM_TARGETS))"
+
+	@printf "%s\n" "$(KBUILD_IMAGE)" > $(SBOM_ROOTS_FILE)
+	@if [ -f $(objtree)/modules.order ]; then \
+		sed 's/\.o$$/.ko/' $(objtree)/modules.order >> $(SBOM_ROOTS_FILE); \
+	fi
+
+	@python3 sbom.py
+
+	@rm $(SBOM_ROOTS_FILE)
+
+.PHONY: sbom
diff --git a/tools/sbom/README b/tools/sbom/README
new file mode 100644
index 000000000..5d157a1f9
--- /dev/null
+++ b/tools/sbom/README
@@ -0,0 +1,208 @@
+<!--
+SPDX-License-Identifier: GPL-2.0-only OR MIT
+Copyright (C) 2025 TNG Technology Consulting GmbH
+-->
+
+KernelSbom
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+------------
+
+The kernel `CONFIG_SBOM` option enables the KernelSbom tool,
+a Python script `sbom.py` that runs during the kernel build process
+after all build outputs have been generated.
+KernelSbom analyzes every file involved in the build and produces
+Software Bill of Materials (SBOM) documents in SPDX 3.0.1 format.
+The generated SBOM documents capture:
+- **Final output artifacts**, typically the kernel image and modules
+- **All source files** that contributed to the build with metadata
+  and licensing information
+- **Details of the build process**, including intermediate artifacts
+  and the build commands linking source files to the final output
+  artifacts
+
+KernelSbom is originally developed in the
+[KernelSbom repository](https://github.com/TNG/KernelSbom).
+
+Requirements
+------------
+
+Python 3.10 or later. No libraries or other dependencies are required.
+
+Basic Usage
+-----------
+
+Enable the `CONFIG_SBOM` option and start a kernel build.
+For example:
+
+    $ make defconfig O=3Dkernel_build
+    $ scripts/config --file kernel_build/.config --enable SBOM
+    $ make O=3Dkernel_build -j$(nproc)
+
+After all build outputs have been generated, KernelSbom produces three
+SPDX documents in the root directory of the object tree:
+
+- `sbom-source.spdx.json`
+  Describes all source files involved in the build and
+  associates each file with its corresponding license expression.
+
+- `sbom-output.spdx.json`
+  Captures all final build outputs (kernel image and `.ko` module files)
+  and includes build metadata such as environment variables and
+  a hash of the `.config` file used for the build.
+
+- `sbom-build.spdx.json`
+  Imports files from the source and output documents and describes every
+  intermediate build artifact. For each artifact, it records the exact
+  build command used and establishes the relationship between
+  input files and generated outputs.
+
+When enabling the KernelSbom tool, it is recommended to perform
+out-of-tree builds using `O=3D<objtree>`. KernelSbom classifies files as
+source files when they are located in the source tree and not in the
+object tree. For in-tree builds, where the source and object trees are
+the same directory, this distinction can no longer be made reliably.
+In that case, KernelSbom does not generate a dedicated source SBOM.
+Instead, source files are included in the build SBOM.
+
+Standalone Usage
+----------------
+
+KernelSbom can also be used as a standalone script to generate
+SPDX documents for specific build outputs. For example, after a
+successful x86 kernel build, KernelSbom can generate SPDX documents
+for the `bzImage` kernel image:
+
+    $ SRCARCH=3Dx86 python3 tools/sbom/sbom.py \
+        --src-tree . \
+        --obj-tree ./kernel_build \
+        --roots arch/x86/boot/bzImage \
+        --generate-spdx \
+        --generate-used-files \
+        --prettify-json \
+        --debug
+
+Note that when KernelSbom is invoked outside of the `make` process,
+the environment variables used during compilation are not available and
+therefore cannot be included in the generated SPDX documents. It is
+recommended to set at least the `SRCARCH` environment variable to the
+architecture for which the build was performed.
+
+For a full list of command-line options, run:
+
+    $ python3 tools/sbom/sbom.py --help
+
+Output Format
+-------------
+
+KernelSbom generates documents conforming to the
+[SPDX 3.0.1 specification](https://spdx.github.io/spdx-spec/v3.0.1/)
+serialized as JSON-LD.
+
+To reduce file size, the output documents use the JSON-LD `@context`
+to define custom prefixes for `spdxId` values. While this is compliant
+with the SPDX specification, only a limited number of tools in the
+current SPDX ecosystem support custom JSON-LD contexts. To use such
+tools with the generated documents, the custom JSON-LD context must
+be expanded before providing the documents.
+See https://lists.spdx.org/g/Spdx-tech/message/6064 for more information=
.
+
+How it Works
+------------
+
+KernelSbom operates in two major phases:
+1. **Generate the cmd graph**, an acyclic directed dependency graph.
+2. **Generate SPDX documents** based on the cmd graph.
+
+KernelSbom begins from the root artifacts specified by the user, e.g.,
+`arch/x86/boot/bzImage`. For each root artifact, it collects all
+dependencies required to build that artifact. The dependencies come
+from multiple sources:
+
+- **`.cmd` files**: The primary source is the `.cmd` file of the
+  generated artifact, e.g., `arch/x86/boot/.bzImage.cmd`. These files
+  contain the exact command used to build the artifact and often include
+  an explicit list of input dependencies. By parsing the `.cmd` file,
+  the full list of dependencies can be obtained.
+
+- **`.incbin` statements**: The second source are include binary
+  `.incbin` statements in `.S` assembly files.
+
+- **Hardcoded dependencies**: Unfortunately, not all build dependencies
+  can be found via `.cmd` files and `.incbin` statements. Some build
+  dependencies are directly defined in Makefiles or Kbuild files.
+  Parsing these files is considered too complex for the scope of this
+  project. Instead, the remaining gaps of the graph are filled using a
+  list of manually defined dependencies, see
+  `sbom/cmd_graph/hardcoded_dependencies.py`. This list is known to be
+  incomplete. However, analysis of the cmd graph indicates a ~99%
+  completeness. For more information about the completeness analysis,
+  see [KernelSbom #95](https://github.com/TNG/KernelSbom/issues/95).
+
+Given the list of dependency files, KernelSbom recursively processes
+each file, expanding the dependency chain all the way to the version
+controlled source files. The result is a complete dependency graph
+where nodes represent files, and edges represent "file A was used to
+build file B" relationships.
+
+Using the cmd graph, KernelSbom produces three SPDX documents.
+For every file in the graph, KernelSbom:
+
+- Parses `SPDX-License-Identifier` headers,
+- Computes file hashes,
+- Estimates the file type based on extension and path,
+- Records build relationships between files.
+
+Each root output file is additionally associated with an SPDX Package
+element that captures version information, license data, and copyright.
+
+Advanced Usage
+--------------
+
+Including Kernel Modules
+------------------------
+
+The list of all `.ko` kernel modules produced during a build can be
+extracted from the `modules.order` file within the object tree.
+For example:
+
+    $ echo "arch/x86/boot/bzImage" > sbom-roots.txt
+    $ sed 's/\.o$/.ko/' ./kernel_build/modules.order >> sbom-roots.txt
+
+Then use the generated roots file:
+
+    $ SRCARCH=3Dx86 python3 tools/sbom/sbom.py \
+        --src-tree . \
+        --obj-tree ./kernel_build \
+        --roots-file sbom-roots.txt \
+        --generate-spdx
+
+
+Equal Source and Object Trees
+------------------------------
+
+When the source tree and object tree are identical (for example, when
+building in-tree), source files can no longer be reliably distinguished
+from generated files.
+In this scenario, KernelSbom does not produce a dedicated
+`sbom-source.spdx.json` document. Instead, both source files and build
+artifacts are included together in `sbom-build.spdx.json`, and
+`sbom.used-files.txt` lists all files referenced in the build document.
+
+Unknown Build Commands
+----------------------
+
+Because the kernel supports a wide range of configurations and versions,
+KernelSbom may encounter build commands in `.cmd` files that it does
+not yet support. By default, KernelSbom will fail if an unknown build
+command is encountered.
+
+If you still wish to generate SPDX documents despite unsupported
+commands, you can use the `--do-not-fail-on-unknown-build-command`
+option. KernelSbom will continue and produce the documents, although
+the resulting SBOM will be incomplete.
+
+This option should only be used when the missing portion of the
+dependency graph is small and an incomplete SBOM is acceptable for
+your use case.
diff --git a/tools/sbom/sbom.py b/tools/sbom/sbom.py
new file mode 100644
index 000000000..9c2e4c7f1
--- /dev/null
+++ b/tools/sbom/sbom.py
@@ -0,0 +1,16 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+"""
+Compute software bill of materials in SPDX format describing a kernel bu=
ild.
+"""
+
+
+def main():
+    pass
+
+
+# Call main method
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.34.1


