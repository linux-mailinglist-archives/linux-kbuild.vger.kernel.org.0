Return-Path: <linux-kbuild+bounces-6843-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16203AA643F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 21:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33151BA7289
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 19:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEBB235063;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6XGbZ49"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2992144C9;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128909; cv=none; b=gNDfAcV72mcenUc/Y6DWed1AUwkoCsxkqm4AL1Cx2xkaUvn+JFGuCE/d8tQcHbcWwnbAcZvRHmEzUY2fo0a+VZKMbATMzJJUcJqUx5Q8Qnc3t162AiD3J/cOqVkB3LJnKsq/cAITbLw8s9kk0HBgaQ31wpgLFxuUmGU2wRFzr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128909; c=relaxed/simple;
	bh=nJ/O2qfc5y7+GRelzxRyWAg1TE/6pK01eAAImGz7s0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPBMVH/D+qagrxrMK/q1zIp9DBL/CzGt3PaGsQ0mmcRrjmE7D/egoT6J64y/sx5iQ4Wvf2JuXh95S5dBG90EUtsNcAL5dK2tFNG/TMKBerOUSm+ZFgMAA6ZDFbLhgRMcdSw8e7MKcJErxWMw8dndeeW9tO8du4RKe6vaxKTJc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6XGbZ49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AACFC4AF0B;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128909;
	bh=nJ/O2qfc5y7+GRelzxRyWAg1TE/6pK01eAAImGz7s0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k6XGbZ49vl8PTh+LQjcJFY0SfyaNPpsIRb8XsMKZKxWg6Xeoin0vF22/pdsR/WOqY
	 rtGYgoCR4cfYfGrDgrLlzcbZl6THWvE6FE/iuAgGwi/gMgysDcd/0wF8cGQ5/EB6D9
	 3b8mHsDzhEs90sHxQ9wx2tNtFaxJ8j4sbYBIY/8j9mrhkHcXEuM/DdPxEiuu/HWtZ5
	 QitPXN64n24J7PauE+1Oql2iTEZ9kcuZovpM5sX3CEQ1PcBm0GUSTe8DqTv/HlwEYu
	 5rztIYEAL1cJ95qTMQ8uEEwb9iwFvGkThlFcYktOfXx0Fx5fHQvBD78u84n+0CoL6G
	 bbqGjaaZkpa9A==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
Date: Thu,  1 May 2025 12:48:16 -0700
Message-Id: <20250501194826.2947101-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250501193839.work.525-kees@kernel.org>
References: <20250501193839.work.525-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=kees@kernel.org; h=from:subject; bh=nJ/O2qfc5y7+GRelzxRyWAg1TE/6pK01eAAImGz7s0o=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnCFxh7neu0XGZnlWzRUTPY0/hmqavW0X8s8ZvqWDaLM YtfZWDpKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmIixGsP/0Jsy0+XCkiRaDyZ8 a3qewybydodJZSCjU7gao1DsHN1sRobLb+7dut0Q9Cbs45z/D6p6V370npSh9UJGkSmOZXWL1E4 WAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

There was no dependency between the plugins changing and the rest of the
kernel being built. Enforce this by including a synthetic header file
when using plugins, that is regenerated any time the plugins are built.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: <linux-hardening@vger.kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
---
 scripts/Makefile.gcc-plugins | 2 +-
 scripts/gcc-plugins/Makefile | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 5b8a8378ca8a..b0d2b9ccf42c 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
 
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
+GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -include $(objtree)/scripts/gcc-plugins/deps.h
 export GCC_PLUGINS_CFLAGS
 
 # Add the flags to the build!
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 320afd3cf8e8..38fd4c9f9b98 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -66,3 +66,11 @@ quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
 
 $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,plugin_cxx_o_c)
+
+quiet_cmd_gcc_plugins_updated = UPDATE  $@
+      cmd_gcc_plugins_updated = echo '/* $^ */' > $(obj)/deps.h
+
+$(obj)/deps.h: $(plugin-single) $(plugin-multi) FORCE
+	$(call if_changed,gcc_plugins_updated)
+
+always-y += deps.h
-- 
2.34.1


