Return-Path: <linux-kbuild+bounces-5740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A78A34496
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 16:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208111711AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 14:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3802320A5FC;
	Thu, 13 Feb 2025 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Y5db328";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="siXfTNw2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EAB1FFC69;
	Thu, 13 Feb 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458542; cv=none; b=qr4LWZYmHhhGfIJkcBWYWVEJRzZBHCqOdaH+VEiw3pYB2kIu+0W50K9+ju7TaKC2HgT098uA7krvEsqvLKAHANy3JDsagcAto0BzoczhuTTKXRi45FDhiRJlg0nO+oZ9UMVBnhV6kl1kPEnGmT8aVBi+J8BS6hvNaHWTfS4t4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458542; c=relaxed/simple;
	bh=VsJP2WA7ooxf6Q50q5cBWRfJTkxkoykLDjcBCjCSHrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQPKj5ZMD7AviyJS6oOyTOVithpftapfP6LRCACmObFx4Pmkz16aqvp/xhnqNLUGkuaX58CniXu8poURoiQjeDXHTx4dn4X82aT5+mSQkq8mIpyLimWlS7S7or231z2cSzyUlaeyeO8+YrutwY6ZJlU2xxn+dGsmJHXBnILj4aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Y5db328; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=siXfTNw2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739458534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0Uz4M0nysayxZy8O+uDEBR3eTZPLx7yuVwYwNJRJKg=;
	b=2Y5db328te54wyfew7h4HOb/N3hvFahLRa/HQxYQcn2qIWZk3Lnq6EZ8/wF9jNz+fCeWuo
	0HKZCzi7w8BSY7jRDy5Kqmx6rq/0R4LRN14jTCwismiU/vsAVHzUDCw5a0xIsbacTmA4g8
	BmY43HogkQ7hDQEY20pr3fO9VlXPyiAQANb3WIwDzpIh/cDg6rpDzfF9jh7PYpqqmZT0IW
	sa+tIsilWygLkASpnSfQI+n6LE2WP6m4iXC03lPsqAz2PkZJY5Fvc/hwtWt6f/vOm6faZq
	HvRd0WX2FGRArDD6TY29E9fkuiSywKsSf9tQUp7m44zhL+VHAjoSpUpfL8jC9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739458534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0Uz4M0nysayxZy8O+uDEBR3eTZPLx7yuVwYwNJRJKg=;
	b=siXfTNw2xSiOkdln54UCJxk/2Isv3RzFueCNsMvTaaXKOelkE8j18podtAhYikCkPREM6S
	tS4OoxlyvbrQlzCw==
Date: Thu, 13 Feb 2025 15:55:18 +0100
Subject: [PATCH 2/2] kbuild: userprogs: use lld to link through clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250213-kbuild-userprog-fixes-v1-2-f255fb477d98@linutronix.de>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
In-Reply-To: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739458532; l=1464;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VsJP2WA7ooxf6Q50q5cBWRfJTkxkoykLDjcBCjCSHrI=;
 b=8OMIVLKzPjKBGa+nsuyZo48SgY/H7ox75L6z9V8p2CPGZuYfEbGXiibYamh8B6s+e9cikZVwq
 UOOjyGCL6v+DwjajMJZig3VnB/KagLzox2tccsCQfBkVnRBxL8VhKQQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The userprog infrastructure links objects files through $(CC).
Either explicitly by manually calling $(CC) on multiple object files or
implicitly by directly compiling a source file to an executable.
The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld would
be used for linking if LLVM=1 is specified.
However clang instead will use either a globally installed cross linker from
$PATH called ${target}-ld or fall back to the system linker, which probably
does not support crosslinking.
For the normal kernel build this is not an issue because the linker is always
executed directly, without the compiler being involved.

Fix this by passing -fuse-lld and let clang find its matching lld.

Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index bb5737ce7f9e79f4023c9c1f578a49a951d1e239..b4c208ae4041c1f4e32c2a158322422ce7353d06 100644
--- a/Makefile
+++ b/Makefile
@@ -510,6 +510,7 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+KBUILD_USERLDFLAGS += -fuse-ld=lld
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld

-- 
2.48.1


