Return-Path: <linux-kbuild+bounces-6050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D99A5BE7D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7411C16BFBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6E2253B5C;
	Tue, 11 Mar 2025 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TblQfrBQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF982528EB
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691194; cv=none; b=lGx5yKFU96iIL0O55e3SRRKgIluxdK0bT0ot3hk7r5z8MQgVyr8M2bohhtFFux5Cq+VOkF+IkX7sacjj28fXZi4kj8Ag2Y0qDJsaBvW+krdOo0KsC+mO9NMwA9Hdu2s8RyJvZSpfVGpiNbzHWjxutpJZbb6nmL0peFSvpPfTgjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691194; c=relaxed/simple;
	bh=gVD0/fzhrleJz7qWjI+8Zc3sgv/qdPMRB6vrQfcnKH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EnwcnVd/rJ1pQRGQYPeN6naSs3Vy5PjFRrP8/cQJScMQSITxre2CEqInzV33vUf7/puQk5CQZ7pfYVWjGVAjlPKTZYNtDRV1OxHW9o9hLZgIAgt/k3Rs8NLpFQ5NpRdI5v2kq++Wincd64DdWUIuc8n8/i+aokxn5DltPejAHg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TblQfrBQ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912fe32a30so2102308f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741691190; x=1742295990; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tV9KNmIji6xAM0Ucpo6ZsPi4ZsXCFqqr1ylqjFTDO+c=;
        b=TblQfrBQY1Hxe5fKIh+uSzzb6H4A66ym7YXwY0o+G80R3H4DZKUoWpV1xbBWosJF0c
         4JRbolgBCM95CYUjTGBeTiAF/hjpdgJ61snW/iRfQ+ZeI+OJ31xgw9lTO6H25GKIb2AK
         lQ7Hvfs8p4qzvIg8kNaiRkZPqgiuQmCEKujP1TAMWhCjhgH2GDKpX3cj6vegtE8M6Gj+
         K3knFkKaBIhowHtW7cSnb5JlaxFM4P63D7RmKcpt1HhPDAhnMWYDzk4GnFJSmIS/L9DG
         G+RsOEa0WMddJo+9BUH1tqEXvfIoQLhxkQWrKZIQSPMNzIiY1YivDRqArQZQgkpmKJeb
         f44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691190; x=1742295990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV9KNmIji6xAM0Ucpo6ZsPi4ZsXCFqqr1ylqjFTDO+c=;
        b=uVLwRoC8gMFmnl77tEHizIUkv90UnG5NnSARoppPpg7LRl48ALBnA9vaaAOVrokeVM
         X1m3cEPZTQmnmevXFJe/gLAOUccxsXdfHPhZfjoQ5rhwXDhZLVvUZMenKVs9lNlUZPJV
         c5AwKoNy4DyomChwDXKDVBKtPEJwx86emNWIwWAr0Wd50L/UHg8t2LCRnhGLz+tzw6Td
         HvuDdIO8FDKK07PTAhpjDpWPv5bdJ/Vcvrl8FYXH+GZmtiYSI42at0v9lrybthCw8Ew8
         gyZ+lj1HfSF30E/GKIQIxg2HT7sw4Md0kLUr72JtMdjTng2Sd0j4C0igf4Mm/SCd+vyO
         VAzg==
X-Gm-Message-State: AOJu0Yz50XRpJ2PAlja+YXSz4nKc5Qv+3R4/hrZlDtn5hN3fREOidL7m
	7eBI6mtcvdnfZ+6Ioi+492kuK6BKwiU9cOdI9AF7Do4j6vxyAKohBO1JfiHYXE2ypXiNYA==
X-Google-Smtp-Source: AGHT+IGx5sLNnKxVFCGhCCzaNKMvpj+hJ1CMgltFrMWRcriH1uhpFfBfRRlejgGSfIVVwI7xdZNOUNcl
X-Received: from wrbgz25.prod.google.com ([2002:a05:6000:4819:b0:391:3213:f77f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64c5:0:b0:390:fdba:ac7
 with SMTP id ffacd0b85a97d-3926c78f683mr4008136f8f.51.1741691190737; Tue, 11
 Mar 2025 04:06:30 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:06:18 +0100
In-Reply-To: <20250311110616.148682-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=ardb@kernel.org;
 h=from:subject; bh=CGnv6V5I23eS/SExFYiNHZ+B0GmQlF8wLC6M1T8xHx4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2CpOb3sw3R948qlQYYiblGM+ulcO/2LdLm8N/Pz1PWn
 +974FtHKQuDGAeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmIiHMiPD08Mc70NvSuVs/VFZ
 vXSTUq/wq04HGf9emzihoqx3Kh6dDP8MWf5oHO+qXp/rxKExWX6Vl/O8H7qvp/UFL/hSs7NLrYE JAA==
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311110616.148682-7-ardb+git@google.com>
Subject: [PATCH v2 1/4] Kbuild/link-vmlinux.sh: Make output file name configurable
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, 
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
2.49.0.rc0.332.g42c0ae87b1-goog


