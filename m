Return-Path: <linux-kbuild+bounces-12981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK1EL51o+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12981-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:36:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 213164BB08D
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73BD2303E4BA
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AFB37F75E;
	Mon,  4 May 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o1NfSlad";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3iMHR0tj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01737EFE4;
	Mon,  4 May 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887220; cv=none; b=X3uE2Nv51w4ZDx0ZgoCY2bvEnHgFKHIahOH1zEZm3S2QDMs/3QsstPgherV+Gx3WoUjZ/qHPh4jQVCypQ7C9r/+SXZpGOCFs+UHBHEPcKETIO91jjDdEVJph2nSYAsjol+PM4elduO13FVUNLk6NKX+RxOntgkltlLA2ubkfMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887220; c=relaxed/simple;
	bh=6rrqaxgFiPHF8GVMd6WSz8gimcEUJCAQ0WbyR1cySwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X82y4SjsMTrNPZKqSyud4wGuCw6b7CgfGm3UZKgiPPL/q3KZNWLWZsxIFd4WjA/N4ZRVIPwkwqetvfGTZlE0W9lx3q0l9tINsdKfhhcL1eqzqz/poEEUFkPTCVQ0+kco3dg0QOWxxxCHMY1C0gWzr0FTAA8L3pvUCn8o9qhms74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o1NfSlad; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3iMHR0tj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugVOeRWOWBTtOIYgmoFYz2LhMt6W4Dhjf2Ekki4Yvyw=;
	b=o1NfSladl93mM06aJdoptf/eSurx6nQPJXgm2QcRqoU9KrrsZnqml9Mw8ZAP59TqxL8PlW
	x4Za1b4elqPJ1HgTgVq7J4aBQNwu7rfUAYy15OK1W0zgPPdXpNeprVRTXHpiKe9aA9+rWe
	QRDNCxHGuPy+9zraizvL+c5W4ACpPpTOCqb4EX4xOHyPRFnqzjowy2eQmPCwVJ+un+7GrH
	T7NVljFiawhvvp8LXv19e82B/FJuRiTHA+yV8FGLYieRtA1JIsoh2ph5qaKW/j+6qW40tc
	Nk2EQ3vT0YRchsXI2UWCVAGkeFSDKiGhwKkGp0Vov3V5vE6ir3q5rF9ppb7zCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugVOeRWOWBTtOIYgmoFYz2LhMt6W4Dhjf2Ekki4Yvyw=;
	b=3iMHR0tjbnL8tPWjVIBtZgGPFqGE0Ei/V/A1ZWtgai9bVFgsjYH0+VP0OJAFVPacr6mFK3
	QXOXum6eDsu39fBA==
Date: Mon, 04 May 2026 11:33:21 +0200
Subject: [PATCH v6 05/11] init: add nolibc build support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-5-712d3d526d97@linutronix.de>
References: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
In-Reply-To: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, workflows@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=2801;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6rrqaxgFiPHF8GVMd6WSz8gimcEUJCAQ0WbyR1cySwc=;
 b=lLv26QbCnoFu+xwMv5Zb421C/VYsqHUM8BHxOQNWqkF7mZy+TSz+5G6TsseajtATALbOf1Rbj
 X8kKFb3ozuSCcD605KF4XXKed6PUuWZkfSuZHLuIibd1Cu9USBgBroO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 213164BB08D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12981-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1wt.eu:email,avm.de:email,weissschuh.net:email]

Building userspace applications through the kbuild "userprogs" framework
requires a libc. Kernel toolchains often do not contain a libc.
In this case it is useful to use the nolibc library from the kernel tree.
Nolibc does not support all architectures and requires compiler flags.

Add a kconfig option, so users can know where it is available and provide a
variable for common options.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---
 MAINTAINERS          |  2 ++
 init/Kconfig         |  2 ++
 init/Kconfig.nolibc  | 16 ++++++++++++++++
 init/Makefile.nolibc | 13 +++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..be4f6242b3fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18960,6 +18960,8 @@ M:	Willy Tarreau <w@1wt.eu>
 M:	Thomas Weißschuh <linux@weissschuh.net>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git
+F:	init/Kconfig.nolibc
+F:	init/Makefile.nolibc
 F:	tools/include/nolibc/
 F:	tools/testing/selftests/nolibc/
 
diff --git a/init/Kconfig b/init/Kconfig
index 3bb92a3f6cc1..c37d9227ba72 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -106,6 +106,8 @@ config CC_CAN_LINK
 	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 	default $(cc_can_link_user,$(m32-flag))
 
+source "init/Kconfig.nolibc"
+
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
 config GCC_ASM_GOTO_OUTPUT_BROKEN
diff --git a/init/Kconfig.nolibc b/init/Kconfig.nolibc
new file mode 100644
index 000000000000..07488ef18f4f
--- /dev/null
+++ b/init/Kconfig.nolibc
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config ARCH_HAS_NOLIBC
+	bool
+	default y if ARM
+	default y if ARM64
+	default y if LOONGARCH
+	default y if M68K
+	default y if MIPS
+	default y if PPC
+	default y if RISCV
+	default y if S390
+	default y if SPARC
+	default y if SUPERH
+	default y if UML_X86
+	default y if X86
diff --git a/init/Makefile.nolibc b/init/Makefile.nolibc
new file mode 100644
index 000000000000..dacc78ab4c81
--- /dev/null
+++ b/init/Makefile.nolibc
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+# Compiler flags, which are necessary to build userspace applications with the
+# in-kernel libc "nolibc".
+
+ifeq ($(and $(CONFIG_ARCH_HAS_NOLIBC),$(CONFIG_HEADERS_INSTALL)),y)
+
+NOLIBC_USERCFLAGS := -nostdlib -nostdinc -static -ffreestanding \
+		     -fno-asynchronous-unwind-tables -fno-stack-protector \
+		     -I$(objtree)/usr/include -I$(srctree)/tools/include/nolibc/
+
+NOLIBC_USERLDFLAGS := -nostdlib -nostdinc -static
+
+endif # CONFIG_ARCH_HAS_NOLIBC && CONFIG_HEADERS_INSTALL

-- 
2.53.0


