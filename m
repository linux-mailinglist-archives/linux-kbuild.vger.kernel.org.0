Return-Path: <linux-kbuild+bounces-7683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9159FAE6AF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167331C272A1
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB422FCFDD;
	Tue, 24 Jun 2025 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4ORJt+K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89BA2FCFDA;
	Tue, 24 Jun 2025 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777752; cv=none; b=m4pmk8fsxrmgVypmo79H1XBneXpkXggzdqQpSHVJI1f1V2iYfBf74+WO1MW4D9L5kwRmeU7Int0nvzuu9y/g7V1trDe9+8ZLl/RLaSNGWcF19oTCdl/A0GVAx0/Zrbe17LYOYRwWxL35L0Zi62Ega2qK1iRdJ1YzuGOKmgjxRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777752; c=relaxed/simple;
	bh=0tqH0RLbA29AAC1GgzXmYAocsoCaLeD8PAD7fLt7BNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkXzIHRZWzW7IVPR283gWvbMbe+H3QaDVe4i5UJ/GLH4FuvGd0c/Y7nVUl1g0f6qeeG6PGJeIa0A3mkHVGJA97Vffz2v886oCi7hMC82hcY8B3a2uoXfap87iMbdN00fHRTIKKlxqIH34EbY6NNdxrT4qgfZIS8EPaJo2Yf98uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4ORJt+K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55261C4CEEE;
	Tue, 24 Jun 2025 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777752;
	bh=0tqH0RLbA29AAC1GgzXmYAocsoCaLeD8PAD7fLt7BNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4ORJt+KPXL/Wh86Os4sHknY+B7qK0mEO1qwAOSC6K2jnBkk34aW1oheCqtTdIiq3
	 el2iu8FVIzqtniMRhbZyck0OenO2qAAs3WXHKsrfI8nBM3SuaQa/ioCGxadQbPLvUK
	 WwbI6iTHjAK1dX8UYh7wVVaeLrUQOCrLr6nG1OQlqwVutS0JSiNU5NW0GVC1p/6ZRA
	 NgNy2/M2JPz8dcnAJyLS9yYN9fLsNRAoQqvGUJTVrMq5D/8JcMekxZNMjWpP5ZQVw0
	 yZIWynMJpuImnJ67pcYrDBBv9/sIUi6MO4oHvkxEP3ifQpHWdLInNmkKqtp1OI0yRV
	 6MBJlKItr84lA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 56/66] kconfig: gconf: remove "tooltips" property from glade
Date: Wed, 25 Jun 2025 00:05:44 +0900
Message-ID: <20250624150645.1107002-57-masahiroy@kernel.org>
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

The tips are still displayed without this.

This property does not exist in GtkBuilder with GTK 3.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.glade | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index 8519104a3c2b..c0ada331a5bf 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -225,7 +225,6 @@
 	      <property name="visible">True</property>
 	      <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
 	      <property name="toolbar_style">GTK_TOOLBAR_BOTH</property>
-	      <property name="tooltips">True</property>
 	      <property name="show_arrow">True</property>
 
 	      <child>
-- 
2.43.0


