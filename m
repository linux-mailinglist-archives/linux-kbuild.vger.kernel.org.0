Return-Path: <linux-kbuild+bounces-11474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJPZLuY7oWnqrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11474-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7D1B3507
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6308304FF66
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF2C3ECBD9;
	Fri, 27 Feb 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IfSNgTpR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D73D902B;
	Fri, 27 Feb 2026 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174289; cv=none; b=I/UGTEchJcRJhq8kzMy5ZtDm8cKYgkGMSFFNeWBgVM2B59Svms9XFFeJ0W9GHHXn6sYW5Ykthc/KHnY33HcNyQaDekpvrhuS9+rnIsu63UgkPzpU9pjlHhV8Hxfqonna7FN9zUfzJlqw6iqWZsLZ2llWf1Bub47IcDv2MVoOwwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174289; c=relaxed/simple;
	bh=QD+9pJ53Zlo1bcaqUL/5KFnD4U1juiqCG2mLBtvOl58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fajtfFzo4FIgEY6tsFl88k6ayJ8iSp/Xr3QnLD1LjuygWn/ZDdflbFgUiVVbQ9qfkq0eYkjXOMfLyMBO0uIAkkHhAUQp7MVE1M+wz4HVEi20R/W/kfCl2ldQatce6ccfT5UezOC6kcOx/rctGMPULkTj8zR53a8TPsQMs9p0vX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IfSNgTpR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174283;
	bh=QD+9pJ53Zlo1bcaqUL/5KFnD4U1juiqCG2mLBtvOl58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IfSNgTpRuwbhnmj/CJ8pKdeSjUDt2/LnRJvMWkDb876m302BSPwZpaWQSpEsq2Ees
	 nlBe7yBXvTnEY+SgD4pfmEE81ErW0+zmM3sqNj+1NdhiFYRK5eTwygiZe5ghWdXC7b
	 QQom7VF1/9Acd2jizfSIqSuzOdOweD/4+NbXv48g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:04 +0100
Subject: [PATCH 6/9] kbuild: uapi: provide stub includes for some libc
 headers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-6-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=5017;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QD+9pJ53Zlo1bcaqUL/5KFnD4U1juiqCG2mLBtvOl58=;
 b=AhjJXCS9Dz0yzq5HBE9clFd2lctzRCoDQJPngBi/tfLSmH7KZgGl44PH5vLJWiGo+Ny0p2wNX
 aWdq5v0FkgvAQRHS555UnP9XuIzE8DBAM3eYAI7bUQ4oI+7xwC+M8Y8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11474-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8A7D1B3507
X-Rspamd-Action: no action

Some UAPI headers incorrectly use libc headers. To compile-test these
UAPI headers, their respective libc dependencies need to be present.
Not all kernel toolchains provide these headers, reducing test coverage.

Introduce some stub headers which provide just enough symbols to test
all UAPI headers. Most headers are empty anyways, as their symbols are
only used in macros which are not actually evaluated.

As these headers are only ever used with newer kernel toolchains, they
can defer to compiler builtins in many cases.

As more UAPI headers are cleaned up to not require these stubs anymore,
they can be removed again.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/dummy-include/endian.h           |  0
 usr/dummy-include/limits.h           |  8 ++++++++
 usr/dummy-include/netinet/if_ether.h |  0
 usr/dummy-include/netinet/in.h       |  0
 usr/dummy-include/stddef.h           |  8 ++++++++
 usr/dummy-include/stdint.h           | 17 +++++++++++++++++
 usr/dummy-include/string.h           | 12 ++++++++++++
 usr/dummy-include/sys/ioctl.h        |  0
 usr/dummy-include/sys/socket.h       | 12 ++++++++++++
 usr/dummy-include/sys/time.h         |  3 +++
 usr/dummy-include/sys/types.h        |  0
 usr/dummy-include/time.h             |  0
 usr/dummy-include/unistd.h           |  0
 13 files changed, 60 insertions(+)

diff --git a/usr/dummy-include/endian.h b/usr/dummy-include/endian.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/limits.h b/usr/dummy-include/limits.h
new file mode 100644
index 000000000000..49b17c10c7b6
--- /dev/null
+++ b/usr/dummy-include/limits.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DUMMY_LIMITS_H
+#define _DUMMY_LIMITS_H
+
+#define INT_MAX ((int)(~0U >> 1))
+#define INT_MIN (-INT_MAX - 1)
+
+#endif /* _DUMMY_LIMITS_H */
diff --git a/usr/dummy-include/netinet/if_ether.h b/usr/dummy-include/netinet/if_ether.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/netinet/in.h b/usr/dummy-include/netinet/in.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/stddef.h b/usr/dummy-include/stddef.h
new file mode 100644
index 000000000000..a61703d1c896
--- /dev/null
+++ b/usr/dummy-include/stddef.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DUMMY_STDDEF_H
+#define _DUMMY_STDDEF_H
+
+#define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
+#define NULL ((void *)0)
+
+#endif /* _DUMMY_STDDEF_H */
diff --git a/usr/dummy-include/stdint.h b/usr/dummy-include/stdint.h
new file mode 100644
index 000000000000..93b1962fd08c
--- /dev/null
+++ b/usr/dummy-include/stdint.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DUMMY_STDINT_H
+#define _DUMMY_STDINT_H
+
+#include <linux/types.h>
+
+typedef	__u64	uint64_t;
+typedef	__u32	uint32_t;
+typedef	__u16	uint16_t;
+typedef	__u8	uint8_t;
+
+typedef	__s64	int64_t;
+typedef	__s32	int32_t;
+typedef	__s16	int16_t;
+typedef	__s8	int8_t;
+
+#endif /* _DUMMY_STDINT_H */
diff --git a/usr/dummy-include/string.h b/usr/dummy-include/string.h
new file mode 100644
index 000000000000..e059808d309a
--- /dev/null
+++ b/usr/dummy-include/string.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DUMMY_STRING_H
+#define _DUMMY_STRING_H
+
+#include <stddef.h>
+
+#define memset(_s, _c, _n) __builtin_memset(_s, _c, _n)
+#define memcpy(_dest, _src, _n) __builtin_memcpy(_dest, _src, _n)
+
+#define strlen(_s) __builtin_strlen(_s)
+
+#endif /* _DUMMY_STRING_H */
diff --git a/usr/dummy-include/sys/ioctl.h b/usr/dummy-include/sys/ioctl.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/sys/socket.h b/usr/dummy-include/sys/socket.h
new file mode 100644
index 000000000000..748751f9e53e
--- /dev/null
+++ b/usr/dummy-include/sys/socket.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _DUMMY_SYS_SOCKET_H
+#define _DUMMY_SYS_SOCKET_H
+
+#include <linux/socket.h>
+
+struct sockaddr {
+	__kernel_sa_family_t	sa_family;	/* address family, AF_xxx	*/
+	char			sa_data[14];	/* 14 bytes of protocol address	*/
+};
+
+#endif /* _DUMMY_SYS_SOCKET_H */
diff --git a/usr/dummy-include/sys/time.h b/usr/dummy-include/sys/time.h
new file mode 100644
index 000000000000..9817b8afb1a6
--- /dev/null
+++ b/usr/dummy-include/sys/time.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/time.h>
diff --git a/usr/dummy-include/sys/types.h b/usr/dummy-include/sys/types.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/time.h b/usr/dummy-include/time.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/usr/dummy-include/unistd.h b/usr/dummy-include/unistd.h
new file mode 100644
index 000000000000..e69de29bb2d1

-- 
2.53.0


