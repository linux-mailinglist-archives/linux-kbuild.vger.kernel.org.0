Return-Path: <linux-kbuild+bounces-2343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69E92776D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A801F23FD0
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 13:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8061AE852;
	Thu,  4 Jul 2024 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNFV6lM/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02E1AB8EC;
	Thu,  4 Jul 2024 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100918; cv=none; b=cry5HKXkKdNkhxEE2RyXdYcOsOyomk2JZPVW2KZduaili6JbaPdXn2JDoDi99r+cJXAFszNAzncZxm8ppQ6l1ZhmQQ8dGZsr4tW9mnv7uHg48urerjZQb0Iuc8XRXrv6w8wU139IqsfFNdJdj4U5RQ3zef+/euU3YybwX3fhFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100918; c=relaxed/simple;
	bh=ObGG99YV3Pwkwhl/5zKzk6upTQesHksgHPQdb/eaq0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7McFux4/seEUf2bK9fa1PLhx9ffNWU6cEUetJDMrIqDBg9ZG/Hm+HKYiC4NhJFvUZcQAfIn4SKHJlJit7ylr8rEKjpx3qo0BxyO/enMgB0cyeMTdkbeVSvQq0JrCCKUkYugEo/Uq6yK5H9yLUpKo7phRh1yV7didq9YJd5fG1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNFV6lM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113E8C3277B;
	Thu,  4 Jul 2024 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720100917;
	bh=ObGG99YV3Pwkwhl/5zKzk6upTQesHksgHPQdb/eaq0U=;
	h=From:To:Cc:Subject:Date:From;
	b=RNFV6lM/+XjGCHyW7HXZcQr8Y7KnLj3ltOXT/EZwhLf7xSdqGvJbX8fT6LMXYU471
	 rRGjzLjUSxmqhIY4r8XPofo9EfRYFhqwF5EFhsDD4da+/LAjAHXjZMmxqgpHJd8lj0
	 JqcIUsK2nLj5Shw1cQLkCKg0TwF0QUYAdbDYTaPz0R2OFr8jH/437hkYGCa3jIhZIm
	 Jlj457BLquSwdxu8sy2Ph9icYgrAAJWFwfQ4F7z5brCKSxf0+5msmw0PgBRbi7y+RQ
	 +x+3y4jLX40lu/cDXk7Gb8g3UhapytlcC1/4mP0DFBz78anQz2wA2N5mLpB+4q4VpW
	 YSLAEmNHf1WkA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH 1/3] kbuild: raise the minimum GNU Make requirement to 4.0
Date: Thu,  4 Jul 2024 22:47:55 +0900
Message-ID: <20240704134812.1511315-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RHEL/CentOS 7, popular distributions that install GNU Make 3.82, reached
EOM/EOL on June 30, 2024. While you may get extended support, it is a
good time to raise the minimum GNU Make version.

The new requirement, GNU Make 4.0, was released in October, 2013.

I did not touch the Makefiles under tools/ because I do not know the
requirements for building tools. I do not find any GNU Make version
checks under tools/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/process/changes.rst |  4 ++--
 Makefile                          | 22 +++-------------------
 scripts/Kbuild.include            |  2 +-
 3 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..415ac8eeb46c 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -33,7 +33,7 @@ GNU C                  5.1              gcc --version
 Clang/LLVM (optional)  13.0.1           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
-GNU make               3.82             make --version
+GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.25             ld -v
 flex                   2.5.35           flex --version
@@ -111,7 +111,7 @@ It depends on ``libclang``.
 Make
 ----
 
-You will need GNU make 3.82 or later to build the kernel.
+You will need GNU make 4.0 or later to build the kernel.
 
 Bash
 ----
diff --git a/Makefile b/Makefile
index 06aa6402b385..c90d408c825e 100644
--- a/Makefile
+++ b/Makefile
@@ -11,8 +11,8 @@ NAME = Baby Opossum Posse
 # Comments in this file are targeted only to the developer, do not
 # expect to learn how to build the kernel reading this file.
 
-ifeq ($(filter undefine,$(.FEATURES)),)
-$(error GNU Make >= 3.82 is required. Your Make version is $(MAKE_VERSION))
+ifeq ($(filter output-sync,$(.FEATURES)),)
+$(error GNU Make >= 4.0 is required. Your Make version is $(MAKE_VERSION))
 endif
 
 $(if $(filter __%, $(MAKECMDGOALS)), \
@@ -93,15 +93,7 @@ endif
 
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
-# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
-
-ifeq ($(filter 3.%,$(MAKE_VERSION)),)
-short-opts := $(firstword -$(MAKEFLAGS))
-else
-short-opts := $(filter-out --%,$(MAKEFLAGS))
-endif
-
-ifneq ($(findstring s,$(short-opts)),)
+ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
 quiet=silent_
 override KBUILD_VERBOSE :=
 endif
@@ -201,14 +193,6 @@ ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
 $(error source directory cannot contain spaces or colons)
 endif
 
-ifneq ($(filter 3.%,$(MAKE_VERSION)),)
-# 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
-# We need to invoke sub-make to avoid implicit rules in the top Makefile.
-need-sub-make := 1
-# Cancel implicit rules for this Makefile.
-$(this-makefile): ;
-endif
-
 export sub_make_done := 1
 
 endif # sub_make_done
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index faf37bafa3f8..ed8a7493524b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -68,7 +68,7 @@ kbuild-file = $(or $(wildcard $(src)/Kbuild),$(src)/Makefile)
 # Read a file, replacing newlines with spaces
 #
 # Make 4.2 or later can read a file by using its builtin function.
-ifneq ($(filter-out 3.% 4.0 4.1, $(MAKE_VERSION)),)
+ifneq ($(filter-out 4.0 4.1, $(MAKE_VERSION)),)
 read-file = $(subst $(newline),$(space),$(file < $1))
 else
 read-file = $(shell cat $1 2>/dev/null)
-- 
2.43.0


