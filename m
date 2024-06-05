Return-Path: <linux-kbuild+bounces-1994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E38FC855
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 11:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4655DB24D0A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 09:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7318FC89;
	Wed,  5 Jun 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GhVI6W1T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07218FDAD
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717580934; cv=none; b=gh44FKYmS5IzNLnreAGLafnnCsSAs5uTs2W5hg1BfooePDcUtgTWHtWuM9KyreXnLkArkYyt2GIIyrAjl1bOPD7MJJCN1vEksunhVWff9Hu9PoUxzj2ljshGYFULIxKRe7nbSP8o/IFPoKuNKRoriWoDBeh7+9Ar/YCXQ0U2PYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717580934; c=relaxed/simple;
	bh=G7a0iyS6sIqZYNGcKPVxXtpLjTv+OfZXcjKHAD84RvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAad7zCydFeJwdDuc7dTt0BjcDDuCk8zeJKoHHpTSHnB/Q0Lqy6imyeAG0Qw719aOAIsHVbXnp6+d5pmM3dRx+FgVF8ZDu8ZUAHJpR2uSVYR8R/moQHBHN8UPm0Cdf65cbZePK6nc2he1gMHCIJ84pZUTvbCW/FfBTdz1+MPrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GhVI6W1T; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1f62217f806so57502275ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Jun 2024 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717580930; x=1718185730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm+wESSJ2b9azwGcOomilcFDsOy50vPKEGHCLBQ7j8A=;
        b=GhVI6W1TCjOORT7U9/yF9YcbYeo966WTAcxEXJ1Ea9qZeJXwcU2cGcPLlF3kwv+1IQ
         RgLCPk0NIakAU3Lo+Llzz6m5Ch8FV0sJjUdzYIr1FIOi5V5/FX4b4yN+14zln2BocSWv
         Cumldye6rdXJQvZrAPgxrbZjaZpQ6L7PXgn3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580930; x=1718185730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wm+wESSJ2b9azwGcOomilcFDsOy50vPKEGHCLBQ7j8A=;
        b=TDRlAL/bXDjuAcOL9K4+BhuMd5bxmL1aSYbFG4Y+t8ZzewMV2/fojsSOuiYStGgSzi
         5aHAM1I82aBmOGbX1Si3n3SHSvSqcoa+KgHVgphjmCsAW/LANbii3greqfyO/NUZ8Azm
         Q4dx9q9YV5N/goSnEeuo4H3W3lb4deZ6Cw4RuW7LDTjDvPu5JuOIJOnSw0gDwsPggFtF
         UNcRQnO2QzhMikutavBhiZZmhclSYnnOp2ajNzwy6PrFUnb3g3xQU7NjSl2vT41Nth5X
         tHdvhcAJK73V826iCkrsfowl107Y/NKMFXJuDsQdhvPOfz34cpIa0JkiIqJqH0RCRJ+B
         +Xuw==
X-Forwarded-Encrypted: i=1; AJvYcCUh4Bu6sOo67aIyZXCYGJOsyE0V8lh4Bx122iHLHU9MTeAk7m42Jo1HcK1/MvywzXOBllqMG9nKmaNWEpl9OK4aaaOIpBVgx/6Rzfgm
X-Gm-Message-State: AOJu0YxHo0QLvlOqTEocSMLuY1Aq41P7WbR9VZJKk8+T0PsRMRr00M61
	xELGUb82UMdCJlopuuBMXpnFNueQLHWbf9hqKBp/+HmgdH2jnaL6sRYSKP3/kw==
X-Google-Smtp-Source: AGHT+IGo6gOGLnvsTTt6FCOyv9gHObEwv++/4VTm9pVYpWLYqc/6KiMyvVg9DzZh7ncCFAv46cf5RQ==
X-Received: by 2002:a17:902:d4c8:b0:1f6:78f7:1503 with SMTP id d9443c01a7336-1f6a5a698f7mr25207925ad.43.1717580929599;
        Wed, 05 Jun 2024 02:48:49 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:201a:65c7:2b77:36db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235a619sm97844445ad.69.2024.06.05.02.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:48:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] scripts/make_fit: Support decomposing DTBs
Date: Wed,  5 Jun 2024 17:48:40 +0800
Message-ID: <20240605094843.4141730-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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
[2]

 scripts/Makefile.lib |  1 +
 scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++--------------
 2 files changed, 49 insertions(+), 22 deletions(-)

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
index 263147df80a4..120f13e1323c 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -22,6 +22,11 @@ the entire FIT.
 Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
 zstd algorithms.
 
+Use -d to decompose "composite" DTBs into their base components and
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
+    parser.add_argument('-d', '--decompose-dtbs', action='store_true',
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
+                fsw.property('fdt', b''.join([b'fdt-%d\x00' % x for x in files]))
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
@@ -215,7 +210,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
         with open(fname, 'rb') as inf:
             compressed = compress_data(inf, compress)
         fsw.property('data', compressed)
-    return model, compat
 
 
 def build_fit(args):
@@ -235,6 +229,7 @@ def build_fit(args):
     fsw = libfdt.FdtSw()
     setup_fit(fsw, args.name)
     entries = []
+    fdts = collections.OrderedDict()
 
     # Handle the kernel
     with open(args.kernel, 'rb') as inf:
@@ -243,12 +238,43 @@ def build_fit(args):
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
+        # Get the compatible / model information
+        with open(fname, 'rb') as inf:
+            data = inf.read()
+        fdt = libfdt.FdtRo(data)
+        model = fdt.getprop(0, 'model').as_str()
+        compat = fdt.getprop(0, 'compatible')
+
+        if args.decompose_dtbs:
+            # Check if the DTB needs to be decomposed
+            path, basename = os.path.split(fname)
+            cmd_fname = os.path.join(path, f'.{basename}.cmd')
+            with open(cmd_fname, 'r', encoding='ascii') as inf:
+                cmd = inf.read()
+
+            if 'scripts/dtc/fdtoverlay' in cmd:
+                # This depends on the structure of the composite DTB command
+                files = cmd.split()
+                files = files[files.index('-i')+1:]
+            else:
+                files = [fname]
+        else:
+            files = [fname]
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
2.45.1.288.g0e0cd299f1-goog


