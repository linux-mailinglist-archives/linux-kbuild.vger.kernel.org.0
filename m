Return-Path: <linux-kbuild+bounces-4889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5F09DA574
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 11:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54D7282411
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 10:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CEE194A7C;
	Wed, 27 Nov 2024 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4vZlVzbF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xxyr8yU7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE7140360;
	Wed, 27 Nov 2024 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702171; cv=none; b=Hdr1u2P6rcFEwCOwMRdypI9YOGOOktYqaILG3HHj3Cb6YfhrRxXBQKGE9sSy70g7CeiVxgJi1LTkTmdUuZGYkJGKsjGbuTuCfeB5GxDty8wPX2/TJkL+4Cjz/nUktdAs/G+fwie6xLoY76Jl50Bj6sOZImovNwEGV/GkOwDx2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702171; c=relaxed/simple;
	bh=hos0B81mtiH43szaIHvvoha/vWABBUll4CLtZzxgOIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZsLCd0OcUxpAu1xA0jGX5vmRY3C36x2ZZPRCnMUYCRUJ9+oolFEcfaL0PokV7++hHzhSqjM8Pb5T+QSPH7NQ9k8e4ILBL5sXJbbNuLbCe2zNqK4OTRJJ8r8j7D0RFzqV8BARma9/6Cl0VbYeOGGYD6EWguvUb+JYqvWkKNySzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4vZlVzbF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xxyr8yU7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732702165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8EMe9Vs7mDmZ8dPCe0AVvvKyoQUtvqjTkqDKxWbs8bY=;
	b=4vZlVzbFW/Tf5G4P95Fs32e1/eKZy+JDOO6swOiDo7Y4Euk/IdWGzptzCKqOIh1z2v60kE
	ew1kUmAzGRRrltWEdNePDEH7xSlykrCNVXWROW4KMcrffVPSECxaS0qLllLFtvyGYP9ilW
	5FY+3O4mdKIqNq609/ojk0F/2nCqd8V7V7WjNGyTqkODwd5Cu9ED+NPLXHrtmUOdAkxlgy
	e3zd4A0pbgeapVrPJ8hx4dMGAXqHog2uYVOkLG1dgZ50ILREu+bZkaV55YKDq0pBzFu/bv
	vyp4frAZ/vrzBYcWtEF01sR5RuHPDGshL61F+pZUB2k/LWEe4UN1OlZfLHQtUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732702165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8EMe9Vs7mDmZ8dPCe0AVvvKyoQUtvqjTkqDKxWbs8bY=;
	b=Xxyr8yU7tUUI2AJiBGxnEJhS3HD0X/9cQd3dghEwXIjsC9hzq5SUgEp77wPChUHThOiezS
	fzqy8VxObyROgnCw==
Date: Wed, 27 Nov 2024 11:09:22 +0100
Subject: [PATCH v2] selinux: add generated av_permissions.h to targets
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de>
X-B4-Tracking: v=1; b=H4sIANHvRmcC/3WMwQ7CIBAFf6XZsxhAIsaT/9H0gLDYTRowUAmm4
 d+lvXuc9zKzQcZEmOE+bJCwUKYYOsjTAHY24YWMXGeQXCohJGcZFwqfyuyCJjDnreOozUWpJ3T
 nndBTPXrj1HmmvMb0PfJF7Ou/UhFMsOtNc4Wca6/NY3/XFAPVs0OYWms/nfT1F64AAAA=
X-Change-ID: 20241120-selinux-clean-dfcd0e7a344b
To: Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732702163; l=1720;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hos0B81mtiH43szaIHvvoha/vWABBUll4CLtZzxgOIM=;
 b=89mTpni/SDfIfxh00LY6RcZVtJrY5DeIRjEb1ZrypIhxblhqYg2WfU13kMS4Vh9JToDvYRfA7
 8qa8rwRxh30BiQiYU/1Ti3385c3rN7c1faoNIVbtF8DZpfawLgy25hM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

av_permissions.h was not declared as a target and therefore not cleaned
up automatically by kbuild.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Link: https://lore.kernel.org/lkml/CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Adopt Masahiro's suggestion
- Link to v1: https://lore.kernel.org/r/20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de
---
I left out the modifications to the grouped target comments.
The current state doesn't hurt and I was not able to come up with
something actually nice.
---
 security/selinux/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 86f0575f670da66a9dc57e13a236d6a5551af38e..66e56e9011dfa4474ac51f00c7595946785273fe 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -33,11 +33,10 @@ $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
 quiet_cmd_genhdrs = GEN     $(addprefix $(obj)/,$(genhdrs))
       cmd_genhdrs = $< $(addprefix $(obj)/,$(genhdrs))
 
-# see the note above, replace the $targets and 'flask.h' rule with the lines
-# below:
-#  targets += $(genhdrs)
+targets += $(genhdrs)
+
+# see the note above, replace the 'flask.h' rule with the line below:
 #  $(addprefix $(obj)/,$(genhdrs)) &: $(obj)/genheaders FORCE
-targets += flask.h
 $(obj)/flask.h: $(obj)/genheaders FORCE
 	$(call if_changed,genhdrs)
 

---
base-commit: aaf20f870da056752f6386693cc0d8e25421ef35
change-id: 20241120-selinux-clean-dfcd0e7a344b

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


