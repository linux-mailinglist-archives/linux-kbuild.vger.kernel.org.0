Return-Path: <linux-kbuild+bounces-5870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31946A4206B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7494616C983
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DBF248862;
	Mon, 24 Feb 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XaJOdO6w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9A248896
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403315; cv=none; b=V61pbcu68ZCYbAOg/+1MvRK3AUMQs1hi1+ILYvexn8QBDCgOHe+6VILX8iJo0tKGv7W31lR9qN40JPdU+B27q7hEcC7S15q74QL7NMbIYHfgdHv/SgB9Un6rNlAotWl1JVXWaVuWZADmo4ZAeW7QRDbwggCC6kvIvHMgM6QN1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403315; c=relaxed/simple;
	bh=dRq0U8z9TE+qNLNwYD7S40TkyqyC8cws+VNe0sBWZT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ORB3lJTiBXuo0+Hg/wsi8K4d75jQvV9+piu2l4wdGX8eGCR3iKXXTGOVJnDaI0dhTbSYTYI57+SdqoXDml6DaQZTKNRqNZo8BadnGNmMX0EoPn17/Qvfs5J9UnK8ZQncVvNo9pBuSmbMmIW2Z/PdrDTIdSrRWtU2T/Hrmh9n4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XaJOdO6w; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38f42f21f54so1686672f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 05:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740403312; x=1741008112; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PDru/78LRKbfp6+7TkdUZoiPcKmAw5IJh8X3W3/JHc=;
        b=XaJOdO6wnvC0oYsVP5uJJuueBs5CcjOaBlV/aQyiQIWySnuy9l0my08mNFsK07uB5/
         JfHgtDgFX2gk1VVLvBbx6JXqi/xje2aDYrx8Qe7PAe7SxAST8tcvgCES4Te2x4RATqiV
         ntKLcZOCpagAI2GuBmQ0dOzfUE7mmtCfRHkCBQdRpISfZZoLDrv7IaPZyhbi3yzIKuuA
         mQJySE/ECfNQ48e0CV8InQIAJxW+8U5coJz7LK2DbpVEqPUgdgNTLXE8Me5gufnkaa0V
         JSW6KYredvXSnzF/+J2zjdSlZulUNTYrHOJI/6mvzpfHRy7uWb7m2SZzCnDqzoMzwsqY
         mm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403312; x=1741008112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PDru/78LRKbfp6+7TkdUZoiPcKmAw5IJh8X3W3/JHc=;
        b=ZRl8+8w47X6BD1n84tjW4eA1XacZxlRzcfDGZfX38cPVQF+kM+TolkIDWpuVljo2jA
         gDl1naeCKHUIr8Jot0Oocv8anof6OR6wAL0b1A5gmzQtHpY8w7qAs3Xmi+e+vj03d74a
         rpfO77XBWZOI6SRfISR2DR7pJnoR6G9mInvMR1TmekzL32DYLDxwvZrJpLU6m+wTcOPg
         n3pI1UIVHDWsJXvXJ6Dc3N1uhNtETjkcvPJlya8dJHUs7nNAoZsGn6hr2v47WIbz229H
         POaKFT1APCF2E8jWIHYRBFdcgIgScy7YK0gUPb5rklNUvKY9quSsDUptp6iti5O+R5n6
         IojA==
X-Forwarded-Encrypted: i=1; AJvYcCXtYrx7AgNpmXCpWPiCnJFyHznLgwE+8lkmk0DK4uyypdYf7PHuhSpi1dHjepttrsOz4zjxwZ2Ieov6WgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXl2BuDH6HKMBwsGnPy/sgvR03h4ptwRi6C3dAiDUWXIA05uhr
	+//Mg7Fo6dmg1ICl4JgJdAYXq5s7tejP14cO0EkXZUoI27fsc+z+EgHOVKiV2m0lnnGJZQ==
X-Google-Smtp-Source: AGHT+IGU6iDng62JC/uLtF9oeXB7JINtB0+X2gy+zOzmsORQVum5UsRDNd0ELZATXgLI/M52j6Z9Q+1I
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:439:35bc:65d0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5886:0:b0:38a:2b34:e13e
 with SMTP id ffacd0b85a97d-38f70789b52mr11208308f8f.18.1740403312079; Mon, 24
 Feb 2025 05:21:52 -0800 (PST)
Date: Mon, 24 Feb 2025 14:21:34 +0100
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=ardb@kernel.org;
 h=from:subject; bh=MckhOuu0fwDOa6nZDYfMs/sVcAaSvlXxSpoP6NXXouI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIX1PUZztSo+O9dm7WebVL9w0VV/ovoOuwKz/YUuWLuVgK
 HrtJlfdUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSZcLwP6bXJ+ho2p3tq/mF
 W0/dF7jeO0fGQeFTyaZkbgeG7UxpyowME46d/Huu1O/g2f7TZyI/GctEFSh1PF9qumGpoL6FseB cVgA=
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224132132.1765115-7-ardb+git@google.com>
Subject: [RFC PATCH 1/4] Kbuild/link-vmlinux.sh: Make output file name configurable
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order to introduce an intermediate, non-stripped vmlinux build that
can be used by other build steps as an input, pass the output file name
to link-vmlinux.sh via its command line.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/Makefile.vmlinux |  2 +-
 scripts/link-vmlinux.sh  | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 873caaa55313..3523ce3ce3dc 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -69,7 +69,7 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
-	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
+	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 targets += vmlinux
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 56a077d204cf..e55026128e05 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -31,6 +31,7 @@ set -e
 LD="$1"
 KBUILD_LDFLAGS="$2"
 LDFLAGS_vmlinux="$3"
+VMLINUX="$4"
 
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
@@ -278,7 +279,7 @@ fi
 
 strip_debug=
 
-vmlinux_link vmlinux
+vmlinux_link "${VMLINUX}"
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -290,11 +291,11 @@ if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} vmlinux
 fi
 
-mksysmap vmlinux System.map
+mksysmap "${VMLINUX}" System.map
 
 if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then
-	info SORTTAB vmlinux
-	if ! sorttable vmlinux; then
+	info SORTTAB "${VMLINUX}"
+	if ! sorttable "${VMLINUX}"; then
 		echo >&2 Failed to sort kernel tables
 		exit 1
 	fi
@@ -310,4 +311,4 @@ if is_enabled CONFIG_KALLSYMS; then
 fi
 
 # For fixdep
-echo "vmlinux: $0" > .vmlinux.d
+echo "${VMLINUX}: $0" > ".${VMLINUX}.d"
-- 
2.48.1.601.g30ceb7b040-goog


