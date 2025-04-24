Return-Path: <linux-kbuild+bounces-6733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C5A99CB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 02:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7014A5A515A
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 00:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317F360DCF;
	Thu, 24 Apr 2025 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWlTdRev"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411C5A79B;
	Thu, 24 Apr 2025 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453845; cv=none; b=MmXXwOKjI2z3r5X3Tser+p6dxjPfaXvvrkRJGJ9gk/qqws6LUYsNtqk/Rwc6MTn2Y3Q2T9RKRo2k26RfPQ7+xUHEhjvKOUj/vfNYrh5QQrx++pIh5tG1pHy2JOeISxleyKf2s+/slsCSa/AVXKd2ZNAA/B+ysHykAcTR5FIWwec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453845; c=relaxed/simple;
	bh=8dGEYgfrt2cILb+HcehoPNS3YrZDE5G2Fa+vM33+Uws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRbdhy8l28S0coUzyjtWRDI/kcGUY1CGxLkQvIbtTpMR1mG+z5PyoINnC/SRGUFxbj+Om09EKspjXZK5GTdwuLhs/fy8H4dFV7BntNQ04JscWK7FTQbmjeGpvAE1/OTLDl9Xixm3o0mKauKdy9JBPsD5A/5Qp3XNO7W7Q6n//H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWlTdRev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A57BC4CEE2;
	Thu, 24 Apr 2025 00:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745453844;
	bh=8dGEYgfrt2cILb+HcehoPNS3YrZDE5G2Fa+vM33+Uws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWlTdRev+mTVE3JVAWfpvDUvVUPHJZlj8UwBubvoz0A3hCt/Sw/ZNfzBcUQUEu+TG
	 Luoi1iLPxRBRQz+kV5LuM6FNPX7NiMwvNQhQAIaresDknj/nIWtZH94RgcKJnn9f6/
	 8yyhN2M/aa2DXD02+Gd9QBRcZgI8LrG31Vfl/3TFtynV1Fg34fwGw0/N7HgOWirh0x
	 9RWxu0COnFdIw2k3omzJ6PaHx/8V7KA5rq5u/CWp9XcQZFhrDFFwSLKWXVaPtKHJiO
	 qY5GxNudnCyV1aHVfTkI8tgtthdjwDSDtuKGwZZ04An3gdR2vz1fXZVSDBmlHMVSyK
	 pKlZ+q5ALDayQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u7kH5-0000000049Z-2A0z;
	Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 3/4] scripts/kernel-doc.py: don't create *.pyc files
Date: Thu, 24 Apr 2025 08:16:23 +0800
Message-ID: <158b962ed7cd104f7bbfe69f499ec1cc378864db.1745453655.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As reported by Andy, kernel-doc.py is creating a __pycache__
directory at build time.

Disable creation of __pycache__ for the libraries used by
kernel-doc.py, when excecuted via the build system or via
scripts/find-unused-docs.sh.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/Makefile.build        | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..d21d0cd2c752 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..ab6b89a163e7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
+    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
 endif
 
 # header test
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..1df6962556ef 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 13dcd86e74ca..884dc86ce04e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -83,7 +83,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif
 
 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
+  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
 endif
diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
index ee6a50e33aba..d6d397fbf917 100755
--- a/scripts/find-unused-docs.sh
+++ b/scripts/find-unused-docs.sh
@@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
 	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
 	continue;
 	fi
-	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
+	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
 	if [[ -n "$str" ]]; then
 	echo "$file"
 	fi
-- 
2.49.0


