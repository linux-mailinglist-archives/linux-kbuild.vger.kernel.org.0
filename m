Return-Path: <linux-kbuild+bounces-7636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD726AE6A33
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2543BCCCC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25472DCBFD;
	Tue, 24 Jun 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tq2kJHWr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773B2D4B7C;
	Tue, 24 Jun 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777653; cv=none; b=K9ARuEx1fUuWmdWwSkUr4O+M5EEKtwrL/lTSnX7KEh6IiKrA6KB7x7Up2n88M2P4qBkVWNrEObPOHp6gQWhcobnl8ZucWs+cidtI/WWr12KxbTYR0z/CTN9sKP8+gnbpURtIJu6al8bvESmuKmKKAVzotueUOEJ1CYvWUX2ssBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777653; c=relaxed/simple;
	bh=G1AT3VHKys4zTokOD43hca/wyFnW3MdYRZ+D26s86tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoYoD8tcSorM7bsN/zRotwJtMENs2NtuTQV/Qxo6IzSBZwbQlIm1DuqrPqwzYzRKcIEN9D3fyjoOmC3vrFwUt5DfHeFHKj5fV/zkTFsTOSHzoOzSoke+X8/FAFp1QPXpKftkZUwN/UfVHaaKxEhkFWKD+bv+jfgma274K9EvjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tq2kJHWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A82C4CEE3;
	Tue, 24 Jun 2025 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777653;
	bh=G1AT3VHKys4zTokOD43hca/wyFnW3MdYRZ+D26s86tE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tq2kJHWrQvhRdMtCuSqM3NbpSclmrn5uTtAL/Sdb2l4gcsamxoKNlGEWlw0anbgkY
	 gUbkJTWePLPOepRlnluy5FF2EizGztxt3kGPrEgyCX3f8H+IGg2TbmCjdqQ21lhFOK
	 P5+KYzLgvIyngAAERzTsQkIND4mhP+hJp1i5Vb/GXbm97OgFX1iXLj1M+lfuncnA/w
	 zKHU+cchCmK3Y47SVxeUnybk9yXucMxc655SYXO6eoCstUk//KYSAUh4ZHxVIOa4kU
	 kiERDqGQgq6IXxhAFz31YiWMZE87Gxlpfrn4NBXL71bB757kxdPBT3l+rgYgwKTnyo
	 XjGBje4G7V1NA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/66] kconfig: gconf: remove old #ifdef GTK_CHECK_VERSION
Date: Wed, 25 Jun 2025 00:04:57 +0900
Message-ID: <20250624150645.1107002-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove old code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 52d439a5119b..b2a0208b0a5f 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -849,16 +849,12 @@ on_treeview2_button_press_event(GtkWidget * widget,
 	struct menu *menu;
 	gint col;
 
-#if GTK_CHECK_VERSION(2,1,4) // bug in ctree with earlier version of GTK
 	gint tx = (gint) event->x;
 	gint ty = (gint) event->y;
 	gint cx, cy;
 
 	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, &cx,
 				      &cy);
-#else
-	gtk_tree_view_get_cursor(view, &path, &column);
-#endif
 	if (path == NULL)
 		return FALSE;
 
-- 
2.43.0


