Return-Path: <linux-kbuild+bounces-2112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0A9068F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8FA2848E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 09:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86048140E2E;
	Thu, 13 Jun 2024 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R82YjmPv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E9C14039E
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271291; cv=none; b=A2XtaG/raXFSQTd8g9X9bpCSRr+PNaErg4hEN/Uu3h4De/kPQfE0HbahV+A2KkQ3xAULohq1I8Tmre5eQ39bnP1+p8r5/y8alNfiZgar6/Zn6Ml9pCh6Do+HCJH6Ob4OryVchds1p/xPfYe6XbCn74+TA3oELQZKf7weCMp3tLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271291; c=relaxed/simple;
	bh=Wk19CPlfuV7oR9ir/74te7+uM1iysqvQXTOBDktBM1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yzi6L9fts2JFIfVnu8KffDziavfKNHjFlEg3qNZrg1KwZcxeBJ3GqyV+hgKAs5KpyCR+IGHVCQjGiv4zmduXNNs0d4f+/lrmdXLQ65hjwPjWOIcKOl0c3BEN1crvu4s/aAQds/qkO6QA+qUiytqokVkkJgD/u153nMqhKkEWcXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R82YjmPv; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-6e40ee57f45so638267a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718271288; x=1718876088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwsSHgS8s2wQj0WzRoqwu97IEcpIHsOcGhEZ3yrM0mk=;
        b=R82YjmPvw8NojL4wTS9+d6oT9nlbTKTLuepWU7/bpi++o7sB7JkuCP5sKdFJM/a/88
         xcyf6OijmM8A3NJy43DWHnWGcZXlerwpR/Ao/OmtIIe1/2e3CKd3lGclzOcXthHu4QKU
         xHq9rBGCEvw5hxxwUs+mhzuaNXKxl9WO4KIuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271288; x=1718876088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwsSHgS8s2wQj0WzRoqwu97IEcpIHsOcGhEZ3yrM0mk=;
        b=YrCYU5OKn+WEHH7bBuLuuMWZB9ApZDps6J0u1b6zJ46bNzgfCdknkJJCcz04/roAj+
         HrKSuJvOhzBhqvBa+D9sK864w/VYZETJb2tH9ZHdATcwaAsuvT1O6GslW2PCGqLj3B/P
         Xa1BHkKZGOb/vH/HSoXLm2uLxQv8vVTRE3y9L8fN+CgoPAEGQhY/olMdFg5PBKfC+3fp
         BxdGg/VpFixcmFH6jRpJEpIX8QRrywa/UobeQt8B9PYLqTnm0CZJgzuU8r+uuUfMEpLW
         H6SbtZqbpDH3lS54FBqf1euoLotKXUj0i6DoXC0/vD/Or5pJOjcELC5rNf2OaahgSMaH
         oMkw==
X-Forwarded-Encrypted: i=1; AJvYcCVEUoL3Tv9gf8thN9LgPSWzlePA/tRXriMRo3DVBlvqwqM353TPSxRnG2GaGpodoZxCeNPDktcAIf5zRE4ELAuQs8FuhVRp6p8UpZPi
X-Gm-Message-State: AOJu0YxnS17TZVfOYnZoc1ibZb5CE3nutai698Dh0+c5cwtO58hn2ddZ
	6CbYcNvovyqx7jm7ONlk2CAIN+UsBUWmG3VmIS52pYvSgthdXOouGCs8QZVXPg==
X-Google-Smtp-Source: AGHT+IEnIOh7DiAESrTJ1kbxGQvP2E7KfH7dzH3UNBD/7cHFjOlB1I94q07CgHTKdnlATWkACJWcVA==
X-Received: by 2002:a05:6a20:6a1d:b0:1b5:a58b:1acd with SMTP id adf61e73a8af0-1b8a9b76456mr5940574637.1.1718271287662;
        Thu, 13 Jun 2024 02:34:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:324e:368c:b7ef:8bd2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e6e42csm9287625ad.73.2024.06.13.02.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:34:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2] scripts/make_fit: Support decomposing DTBs
Date: Thu, 13 Jun 2024 17:34:32 +0800
Message-ID: <20240613093433.131699-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel tree builds some "composite" DTBs, where the final DTB is the
result of applying one or more DTB overlays on top of a base DTB with
fdtoverlay.

The FIT image specification already supports configurations having one
base DTB and overlays applied on top. It is then up to the bootloader to
apply said overlays and either use or pass on the final result. This
allows the FIT image builder to reuse the same FDT images for multiple
configurations, if such cases exist.

The decomposition function depends on the kernel build system, reading
back the .cmd files for the to-be-packaged DTB files to check for the
fdtoverlay command being called. This will not work outside the kernel
tree. The function is off by default to keep compatibility with possible
existing users.

To facilitate the decomposition and keep the code clean, the model and
compatitble string extraction have been moved out of the output_dtb
function. The FDT image description is replaced with the base file name
of the included image.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Replace OrderedDict with standard {} dict
- Change short form command line argument to -D
- Drop [] around "'fdt-{x}\x00' for x in files"
- Add spaces around '+' in slice argument
- Split out DTB parsing into separate function

Simon's reviewed-by was dropped.

This is a feature I alluded to in my replies to Simon's original
submission of the make_fit.py script [1].

This is again made a runtime argument as not all firmware out there
that boot FIT images support applying overlays. Like my previous
submission for disabling compression for included FDT images, the
bootloader found in RK3399 and MT8173 Chromebooks do not support
applying overlays. Another case of this is U-boot shipped by development
board vendors in binary form (without upstream) in an image or in
SPI flash on the board that were built with OF_LIBFDT_OVERLAY=n.
These would fail to boot FIT images with DT overlays. One such
example is my Hummingboard Pulse. In these cases the firmware is
either not upgradable or very hard to upgrade.

I believe there is value in supporting these cases. A common script
shipped with the kernel source that can be shared by distros means
the distro people don't have to reimplement this in their downstream
repos or meta-packages. For ChromeOS this means reducing the amount
of package code we have in shell script.

[1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@google.com/

 scripts/Makefile.lib |  1 +
 scripts/make_fit.py  | 86 ++++++++++++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 22 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f06f6aaf7fc..d78b5d38beaa 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -522,6 +522,7 @@ quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
 		--name '$(UIMAGE_NAME)' \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
+		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 263147df80a4..4a1bb2f55861 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -22,6 +22,11 @@ the entire FIT.
 Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
 zstd algorithms.
 
+Use -D to decompose "composite" DTBs into their base components and
+deduplicate the resulting base DTBs and DTB overlays. This requires the
+DTBs to be sourced from the kernel build directory, as the implementation
+looks at the .cmd files produced by the kernel build.
+
 The resulting FIT can be booted by bootloaders which support FIT, such
 as U-Boot, Linuxboot, Tianocore, etc.
 
@@ -64,6 +69,8 @@ def parse_args():
           help='Specifies the architecture')
     parser.add_argument('-c', '--compress', type=str, default='none',
           help='Specifies the compression')
+    parser.add_argument('-D', '--decompose-dtbs', action='store_true',
+          help='Decompose composite DTBs into base DTB and overlays')
     parser.add_argument('-E', '--external', action='store_true',
           help='Convert the FIT to use external data')
     parser.add_argument('-n', '--name', type=str, required=True,
@@ -140,12 +147,12 @@ def finish_fit(fsw, entries):
     fsw.end_node()
     seq = 0
     with fsw.add_node('configurations'):
-        for model, compat in entries:
+        for model, compat, files in entries:
             seq += 1
             with fsw.add_node(f'conf-{seq}'):
                 fsw.property('compatible', bytes(compat))
                 fsw.property_string('description', model)
-                fsw.property_string('fdt', f'fdt-{seq}')
+                fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
                 fsw.property_string('kernel', 'kernel')
     fsw.end_node()
 
@@ -193,21 +200,9 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fname (str): Filename containing the DTB
         arch: FIT architecture, e.g. 'arm64'
         compress (str): Compressed algorithm, e.g. 'gzip'
-
-    Returns:
-        tuple:
-            str: Model name
-            bytes: Compatible stringlist
     """
     with fsw.add_node(f'fdt-{seq}'):
-        # Get the compatible / model information
-        with open(fname, 'rb') as inf:
-            data = inf.read()
-        fdt = libfdt.FdtRo(data)
-        model = fdt.getprop(0, 'model').as_str()
-        compat = fdt.getprop(0, 'compatible')
-
-        fsw.property_string('description', model)
+        fsw.property_string('description', os.path.basename(fname))
         fsw.property_string('type', 'flat_dt')
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
@@ -215,9 +210,45 @@ def output_dtb(fsw, seq, fname, arch, compress):
         with open(fname, 'rb') as inf:
             compressed = compress_data(inf, compress)
         fsw.property('data', compressed)
-    return model, compat
 
 
+def process_dtb(fname, args):
+    """Process an input DTB, decomposing it if requested and is possible
+
+    Args:
+        fname (str): Filename containing the DTB
+        args (Namespace): Program arguments
+    Returns:
+        tuple:
+            str: Model name string
+            str: Root compatible string
+            files: list of filenames corresponding to the DTB
+    """
+    # Get the compatible / model information
+    with open(fname, 'rb') as inf:
+        data = inf.read()
+    fdt = libfdt.FdtRo(data)
+    model = fdt.getprop(0, 'model').as_str()
+    compat = fdt.getprop(0, 'compatible')
+
+    if args.decompose_dtbs:
+        # Check if the DTB needs to be decomposed
+        path, basename = os.path.split(fname)
+        cmd_fname = os.path.join(path, f'.{basename}.cmd')
+        with open(cmd_fname, 'r', encoding='ascii') as inf:
+            cmd = inf.read()
+
+        if 'scripts/dtc/fdtoverlay' in cmd:
+            # This depends on the structure of the composite DTB command
+            files = cmd.split()
+            files = files[files.index('-i') + 1:]
+        else:
+            files = [fname]
+    else:
+        files = [fname]
+
+    return (model, compat, files)
+
 def build_fit(args):
     """Build the FIT from the provided files and arguments
 
@@ -235,6 +266,7 @@ def build_fit(args):
     fsw = libfdt.FdtSw()
     setup_fit(fsw, args.name)
     entries = []
+    fdts = {}
 
     # Handle the kernel
     with open(args.kernel, 'rb') as inf:
@@ -243,12 +275,22 @@ def build_fit(args):
     write_kernel(fsw, comp_data, args)
 
     for fname in args.dtbs:
-        # Ignore overlay (.dtbo) files
-        if os.path.splitext(fname)[1] == '.dtb':
-            seq += 1
-            size += os.path.getsize(fname)
-            model, compat = output_dtb(fsw, seq, fname, args.arch, args.compress)
-            entries.append([model, compat])
+        # Ignore non-DTB (*.dtb) files
+        if os.path.splitext(fname)[1] != '.dtb':
+            continue
+
+        (model, compat, files) = process_dtb(fname, args)
+
+        for fn in files:
+            if fn not in fdts:
+                seq += 1
+                size += os.path.getsize(fn)
+                output_dtb(fsw, seq, fn, args.arch, args.compress)
+                fdts[fn] = seq
+
+        files_seq = [fdts[fn] for fn in files]
+
+        entries.append([model, compat, files_seq])
 
     finish_fit(fsw, entries)
 
-- 
2.45.2.627.g7a2c4fd464-goog


