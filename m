Return-Path: <linux-kbuild+bounces-11693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBibCI59rmlfFQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11693-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 08:58:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D02235220
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 08:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 001B13031CFF
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 07:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A8E368970;
	Mon,  9 Mar 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbTTsrRM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72484364924;
	Mon,  9 Mar 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043008; cv=none; b=HrYSFm4SvRBVn3EQuN992oxtq8cJLRtKgjF/lT2E7qpiLbVxhaKNWWGkXMO+C3vl9dO0KXFN2Nj7VXqId9uwxBdBjbd2ZlXCqW9lJO47uIFgksGntjvvCludA4kBkWiGARphTXH21Tjopb9LMueK6Qwz4Odfqo7Ew9tlfW172CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043008; c=relaxed/simple;
	bh=LQioj1O+T/k303qoDxjS+mfwUrX6uNeb9Rxlz3cTNOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWMcOrj186eu48dWarX82ShcZkVD0i6mCaMI79owtlPvSglBHeSDD90z5v+JaJFGfc37HqgyeJ6c20YZKHDV12DluHilI1aPjvYj2eMQQGgtABN7x2sJBYQGdGut41K8aCFEWLVewbXhwgbsMnzh8lnkWiJwkUUlQOSaBVmcPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbTTsrRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447B3C4CEF7;
	Mon,  9 Mar 2026 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043008;
	bh=LQioj1O+T/k303qoDxjS+mfwUrX6uNeb9Rxlz3cTNOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nbTTsrRMGC3FBdK+dYh1ent0EsP6Tf0T7GDpe3wNMZgv1qVjDkWH92X29YFjrbSKu
	 +ZRiLNnYuKTBZS7jyft42LaAJpZ4GcSSLbL0u+J4DUhHnfCtsQH38zFWk1UJKqGsMt
	 qgwXQgxXuk7akyd6BZKV/9EqlBs7dwUpWH23OVhsTznjvA2+KIw3LarxAoD3X4h51Q
	 SCsw5dk2dI8Uv6b1yFX6rmbEEWSsxWdpkJdYfEuDa98u51xVcQdPeyvQTFaOpl5xeH
	 1+zGgZGsjxj/u7KZ8vPF6oKVEJ1KZ0xKiSYEiEo69S2p1D2/1zHOfZ1s/07Y01Z2rM
	 jkcJ6omgvUfAg==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 09 Mar 2026 08:56:30 +0100
Subject: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
In-Reply-To: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=5372; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=LQioj1O+T/k303qoDxjS+mfwUrX6uNeb9Rxlz3cTNOg=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBprn0zFV2RZDeD8ISuYKZpgnYW1SAn6R0Q0e7r0
 GTx91WPK86JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaa59MwAKCRAHUgpwFiYS
 aZDcEACmf5NuNqJrf7xyKoFuoM/aOLLVB6pH/qq62jlLNdpPvrdRo+/fJnP+p8/7ei0t9qJwGla
 kW79k/mqpDj+cumkjW31z8DGl+VggyPtXYvtyR/9XBgNv+LP1zgXyz+xSwB2qWS8CyMLR7C/s4V
 p/5EDLXY5dW2PG75MiPAQiZ5yfDx9kWt0CCtq7zDgdA2dJYdjg4ooWxL+w4HN5uEu7TELxXhpBo
 CcZw4gqeCbC2qo7uBr9cL7dmAXObLoK+eJ81B2G7FnhsbtwRPSqs2/dbAnRT/oe0jycmhnSv3EI
 JTHK1QCtZXWFnD4cbCNtSNfJk6dodJZBFnl3CcG7qlu8/r9ql7aqhDhsihgiY+U73Wig2Cyaw7G
 GYWfmYMyAuOMDYbC4kRlr4ctxgkmil1NVXUUSJl+ixtS8IBjldxYaecNa6ZgWgxMkfaW5fvOKXy
 c0DaEkpgVngAV07NUMTXvQ7im+glcGBlran3r4nw1QRmUE64upd1CCoYxZswKxxZgxMWQopA262
 6JVKiBNS551K6XBbvXUpeo2ZZbkcPOlG9Dt+uInqnasYTMNrLKzBXcefBzEwSxVwqCIjHPK68WM
 1WYrgjVdriASgb9whID++aX2KHS7AzrMICLiIvGUSNjE+151DWA+L0t3HsYOcBmYQRFXPwxP6Zc
 NtouVqIQGnha0Zg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Queue-Id: 78D02235220
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11693-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gen_initramfs.sh:url]
X-Rspamd-Action: no action

get_init_cpio and gen_initramfs.sh are part of kbuild and required for
all kernel builds.  Move it to scripts/ to be more clear about their
importance.

Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---

Nathan, could this go through kbuild-fixes even though it is not really
a fix?  Introducing a top-level Makefile target 'usr_gen_init_cpio'
in v7.0 and renaming it to 'scripts/gen_init_cpio` in v7.1 doesn't sound
good to me.
---
 MAINTAINERS                       |  1 +
 Makefile                          | 10 +++++-----
 scripts/.gitignore                |  1 +
 scripts/Makefile                  |  2 ++
 {usr => scripts}/gen_init_cpio.c  |  0
 {usr => scripts}/gen_initramfs.sh |  2 +-
 scripts/remove-stale-files        |  2 ++
 usr/.gitignore                    |  4 +++-
 usr/Makefile                      |  4 +---
 9 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..0e374c92941f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13833,6 +13833,7 @@ F:	scripts/basic/
 F:	scripts/clang-tools/
 F:	scripts/container
 F:	scripts/dummy-tools/
+F:	scripts/gen_init*
 F:	scripts/include/
 F:	scripts/install.sh
 F:	scripts/mk*
diff --git a/Makefile b/Makefile
index 0e788ce45457..7798863002ac 100644
--- a/Makefile
+++ b/Makefile
@@ -296,7 +296,7 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 usr_gen_init_cpio \
+			 scripts/gen_init_cpio \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
@@ -1437,9 +1437,9 @@ ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
 endif
 
-PHONY += usr_gen_init_cpio
-usr_gen_init_cpio: scripts_basic
-	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
+PHONY += scripts/gen_init_cpio
+scripts/gen_init_cpio: scripts_basic
+	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio
 
 PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
@@ -1709,7 +1709,7 @@ distclean: mrproper
 # Packaging of the kernel to various formats
 # ---------------------------------------------------------------------------
 
-modules-cpio-pkg: usr_gen_init_cpio
+modules-cpio-pkg: scripts/gen_init_cpio
 
 %src-pkg: FORCE
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4215c2208f7e..700456543910 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /asn1_compiler
+/gen_init_cpio
 /gen_packed_field_checks
 /generate_rust_target
 /insert-sys-cert
diff --git a/scripts/Makefile b/scripts/Makefile
index 0941e5ce7b57..039863cd064e 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -52,6 +52,8 @@ ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
 
+hostprogs-always-y += gen_init_cpio
+
 # The following programs are only built on demand
 hostprogs += unifdef gen_packed_field_checks
 
diff --git a/usr/gen_init_cpio.c b/scripts/gen_init_cpio.c
similarity index 100%
rename from usr/gen_init_cpio.c
rename to scripts/gen_init_cpio.c
diff --git a/usr/gen_initramfs.sh b/scripts/gen_initramfs.sh
similarity index 99%
rename from usr/gen_initramfs.sh
rename to scripts/gen_initramfs.sh
index 7eba2fddf0ef..27ac1fd48001 100755
--- a/usr/gen_initramfs.sh
+++ b/scripts/gen_initramfs.sh
@@ -247,4 +247,4 @@ done
 
 # If output_file is set we will generate cpio archive
 # we are careful to delete tmp files
-usr/gen_init_cpio $output $timestamp $cpio_list
+scripts/gen_init_cpio $output $timestamp $cpio_list
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 6e39fa8540df..e46337e4bfb8 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -26,3 +26,5 @@ rm -f scripts/selinux/genheaders/genheaders
 rm -f *.spec
 
 rm -f lib/test_fortify.log
+
+rm -f usr/gen_init_cpio
diff --git a/usr/.gitignore b/usr/.gitignore
index 8996e7a88902..13bf7a38355c 100644
--- a/usr/.gitignore
+++ b/usr/.gitignore
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-/gen_init_cpio
 /initramfs_data.cpio
 /initramfs_inc_data
+
+# Keep around until cleanup in scripts/remove-stale-files
+/gen_init_cpio
diff --git a/usr/Makefile b/usr/Makefile
index e8f42478a0b7..5b97ee66c00a 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -16,8 +16,6 @@ obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
 $(obj)/initramfs_data.o: $(obj)/initramfs_inc_data
 
-hostprogs := gen_init_cpio
-
 ramfs-input := $(CONFIG_INITRAMFS_SOURCE)
 cpio-data :=
 
@@ -72,7 +70,7 @@ quiet_cmd_initfs = GEN     $@
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/initramfs_data.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+$(obj)/initramfs_data.cpio: $(srctree)/scripts/gen_initramfs.sh scripts/gen_init_cpio $(deps_initramfs) FORCE
 	$(call if_changed,initfs)
 
 endif

-- 
2.51.0


