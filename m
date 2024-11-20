Return-Path: <linux-kbuild+bounces-4749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 168DA9D3698
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 10:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D915E285ECB
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 09:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1132E19B586;
	Wed, 20 Nov 2024 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZNIwuK88";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q6xhrnB7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FD1953BB;
	Wed, 20 Nov 2024 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094104; cv=none; b=kjvAT2O21HvC/ge7Cduj8pu0pVu04Iyrvgyy4IPkQUF0NrNy8bcJJUtDWQa2xmBunbBBfNfya3Ea7YzJRl09rMNya9hYLeO2OTKo17vDfj6EQYlDk93xJm3SBcxMjjYmj8IWT7OONrIaVY/QaZh6bYZXGSgXI8Xb6YE9H0S26RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094104; c=relaxed/simple;
	bh=1AqMwBd2fwyT0PJ1aufpv7qtkxrCYGdSVyFzcWGPUSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b4toi+uzE5jbragG2MoCREjDmzIjDasgEFkf6BR8xP9b/8Z6fhJ7o7V5zR1ciYbrP+1BzPoH3rN3KGWq5Jwu31afNMIiNuCBXDgLtqYvANKR7oCXoSPzFCBKn0KIyfKIfzzH719PbOUjhHplUx7EmMHsqXdRXK/YFXLuc4+tPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZNIwuK88; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q6xhrnB7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732094100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qUaoUu58p2ei5u53XgN4KnMyMyGd6RlLfof/fQPZE84=;
	b=ZNIwuK88dMFIWC8wSIf0aVTNzXeGUXLUC+gljr89+H+QAi0aQFZWNMwu6TAWym/7Wvfv6/
	AavMBIufDy5Row6FcGF//7BYyo7jaZqDGDpO812O+H8ZuLAAdKGARm7ahCFrAPU1skjmW+
	ymsBHUR1s2bfO8PR8V60xceAONg87pN9bDE5xwfLx7xFWE3z1Ctacphqa9AMRxSfXUQT2S
	Gtqydpmu37Rf/HWBlTOP7VLX8Ns1HAM5SKEQmlD937j6p+bbR9CcU2y3sSOrtwUOdufOAN
	+bFUNgO8UN3KoYM6Jf1skX+qlI5boZvQwyTnlqwAtgnreQubelul8eSyvZXkcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732094100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qUaoUu58p2ei5u53XgN4KnMyMyGd6RlLfof/fQPZE84=;
	b=q6xhrnB730/spkq4OzzNB48+6IpzX0nb9L0558CGOnFrZ7LweF4iXUUXAajjNIVf0qv9Gg
	P1Yz438Lee8xO7CA==
Date: Wed, 20 Nov 2024 10:14:07 +0100
Subject: [PATCH] selinux: explicitly clean generated av_permissions.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAF6oPWcC/x3MQQqAIBBA0avErBtQE4KuEi1MxxoQC6UQxLsnL
 d/i/wqZElOGZaiQ6OXMV+yQ4wD2NPEgZNcNSigtpRKYKXB8CtpAJqLz1gmazaT1Dr25E3ku/2/
 dWvsAd0QQ4V8AAAA=
X-Change-ID: 20241120-selinux-clean-dfcd0e7a344b
To: Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732094098; l=1017;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1AqMwBd2fwyT0PJ1aufpv7qtkxrCYGdSVyFzcWGPUSA=;
 b=hJegPWxCYL19dK/A3bdGcHvZDa2ZCb0G0ux8MxYfF0sWVfGH03wj6TaFYygAuForlBzEBMxa+
 V9AHgS73VzLBVEzXPpGDXvrW4O+D80oCVmLETrvEiwZTNzDwTGpZ+UI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

av_permissions.h is not declared as a target and therefore won't be
added to clean-files automatically by kbuild.
For details why it is not a target see the Makefile itself.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 security/selinux/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 86f0575f670da66a9dc57e13a236d6a5551af38e..58129a7c8cfa08f9caf5444f7df776f41056b77a 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -41,5 +41,8 @@ targets += flask.h
 $(obj)/flask.h: $(obj)/genheaders FORCE
 	$(call if_changed,genhdrs)
 
+# see the note above, remove this line
+clean-files += av_permissions.h
+
 hostprogs := genheaders
 HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include

---
base-commit: bf9aa14fc523d2763fc9a10672a709224e8fcaf4
change-id: 20241120-selinux-clean-dfcd0e7a344b

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


