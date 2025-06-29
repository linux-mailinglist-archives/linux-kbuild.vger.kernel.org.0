Return-Path: <linux-kbuild+bounces-7741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA8AECFAC
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DFA93B01BC
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7BB23C51B;
	Sun, 29 Jun 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0P0tE9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9D23C513;
	Sun, 29 Jun 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222767; cv=none; b=Vf71RolgrGMl/t8P2xN160V3fsHapZ7Pg3BQbiX9P70Ykz38wztBOQvyYHJ9a2DNX8+KGYCt+E3Z3fLV8MNPQM30etCBOQFypt1/1mLrd2hpH4IYrOw+WIOdBRU8HLJXW8H/6UugURhEYiy9MUm1FxQ0JihDV4m+EVKIXtnFCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222767; c=relaxed/simple;
	bh=WRwJMae1CgHGHcw4S5uertPs20kNlqueT5mDIQq5Ics=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKVctiwoOCTCxnA9jsR05re7xxgtPNEE7R2rIxSDIFJ8DoO+VD/nbP7q0/xNGRhOoDTQZwBFc4NtGLj8kwp+Z2t0CPbCWEp8ZD/n5G7C0fq3iIhtVzNxwHbK+KNmIRS/jlG7BSKb2JX3YrSSJImk03CeOJGjrv2+S3sdqE9up9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0P0tE9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D88C4CEF0;
	Sun, 29 Jun 2025 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222767;
	bh=WRwJMae1CgHGHcw4S5uertPs20kNlqueT5mDIQq5Ics=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0P0tE9lL6ruBTjHj75e8bYVJxkG0gRUZ0lXkXgL+jl9LGXqR9nr7Byl8lBothrPv
	 VrHCxq6jsb/l4NhjNFO01ma26YDj8czc+7GLyEVwRAHFu9G5Bz9oeLUZSnlWKzGCpf
	 7E1PFdc0z2rD/68tnsTOkl577RnRHfRCcekXEAhuSAtT5N9ecfVhzfA4Uo/9EJ3fp4
	 zyZnmYv68TmuJJcHdYOgbBJKd09BGlZFJGlmOXpA87jR6Yb+SEsu7lTVQbeD8J6NSS
	 EwOQDo3xmpI7rLRtexnSlQAT1ga5OIoP/8onsHSebQTdlS/aA5RI4SO3FlDT3MmNbl
	 G+jMF7VoGIJWQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] kconfig: gconf: replace GtkVbox with GtkBox
Date: Mon, 30 Jun 2025 03:43:32 +0900
Message-ID: <20250629184554.407497-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GtkVBox is deprecated with GTK 3.2. [1]

Use GtkBox instead.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.2.0/gtk/gtkvbox.c#L47

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/gconf.ui | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.ui b/scripts/kconfig/gconf.ui
index e5dad2b06502..378a3eadf9f8 100644
--- a/scripts/kconfig/gconf.ui
+++ b/scripts/kconfig/gconf.ui
@@ -19,7 +19,8 @@
   <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
 
   <child>
-    <object class="GtkVBox" id="vbox1">
+    <object class="GtkBox" id="vbox1">
+      <property name="orientation">vertical</property>
       <property name="visible">True</property>
       <property name="homogeneous">False</property>
       <property name="spacing">0</property>
-- 
2.43.0


