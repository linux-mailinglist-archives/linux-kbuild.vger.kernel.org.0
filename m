Return-Path: <linux-kbuild+bounces-2620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364899388B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 08:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E3A1C20E0E
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 06:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C5917BA9;
	Mon, 22 Jul 2024 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="uzxc5I7P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward206a.mail.yandex.net (forward206a.mail.yandex.net [178.154.239.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0626168BE;
	Mon, 22 Jul 2024 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721628004; cv=none; b=EFIQALz1e+QVLH5JSNDsdKpA6nwkPEnbPYleotFU4jjhYIX/CEvczfiC28iujdPZXDMkLDFJROHWL3W6sLLJuFjoxWPl3yh5hXIqA59w52h26KlLVP0xqlSPILKs4ZwTgGxXMk+2sGw13mAE9drHr93kKjGxkM495Y2ornGUWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721628004; c=relaxed/simple;
	bh=ierZ12X7z3oQ/lS0FGW+wClZ8Zy6pxAMzAPVSW5u0/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rer11ArVcqjgdpslVMTROHP51k8QaMDe5b2hb3r6IoIjIXuJGRedqNqjNxRcI6KzhE7uefkZlyun7v2GWXVZiBSNS+MQfihOCTkhmKHY/8X2M3kOisu51qJ0kz2ABQazQJnxAjRgNO2VlGDL8ydznFgVPk7dcujlCdrZaLQi16I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=uzxc5I7P; arc=none smtp.client-ip=178.154.239.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward206a.mail.yandex.net (Yandex) with ESMTPS id 29E02655B4;
	Mon, 22 Jul 2024 08:59:57 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0d:409f:0:640:f1f0:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id DBB2E47173;
	Mon, 22 Jul 2024 08:59:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id kxFT5TaoI4Y0-wNpRrxye;
	Mon, 22 Jul 2024 08:59:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1721627988; bh=ACG6XmQ70P6qOXNr3gtI5DEJ6qQRSPvIN83cuZz3xrY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=uzxc5I7PfCdYUmh19FAJFyqAIqvpIzvJT+AtCSw0vhqBooQSlUfxOVEJja5b/5fzh
	 Awk44VWd1AMOAL5S8iXLySM++6jM90GcX/Pvnzzj/8X3XUoBHY7XcalaqwEiL5eOEQ
	 O78pLk/j0//2IL3IrqfoxlDEpP4MhLYfzCX7XdXM=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Ivan Davydov <davydoff33@yandex.ru>
To: linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	corbet@lwn.net,
	masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas@fjasle.eu,
	Ivan Davydov <davydoff33@yandex.ru>
Subject: [PATCH v2] kbuild: doc: gcc to CC change
Date: Mon, 22 Jul 2024 08:57:31 +0300
Message-ID: <20240722055810.2302-1-davydoff33@yandex.ru>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this part of the documentation, $(CC) is meant, but gcc is written.

Signed-off-by: Ivan Davydov <davydoff33@yandex.ru>
---
 Documentation/kbuild/makefiles.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 991ce6081e35..be43990f1e7f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -578,7 +578,7 @@ cc-option
   Note: cc-option uses KBUILD_CFLAGS for $(CC) options
 
 cc-option-yn
-  cc-option-yn is used to check if gcc supports a given option
+  cc-option-yn is used to check if $(CC) supports a given option
   and return "y" if supported, otherwise "n".
 
   Example::
@@ -596,7 +596,7 @@ cc-option-yn
   Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
 
 cc-disable-warning
-  cc-disable-warning checks if gcc supports a given warning and returns
+  cc-disable-warning checks if $(CC) supports a given warning and returns
   the commandline switch to disable it. This special function is needed,
   because gcc 4.4 and later accept any unknown -Wno-* option and only
   warn about it if there is another warning in the source file.
@@ -606,7 +606,7 @@ cc-disable-warning
     KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 
   In the above example, -Wno-unused-but-set-variable will be added to
-  KBUILD_CFLAGS only if gcc really accepts it.
+  KBUILD_CFLAGS only if $(CC) really accepts it.
 
 gcc-min-version
   gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than
-- 
2.45.2


