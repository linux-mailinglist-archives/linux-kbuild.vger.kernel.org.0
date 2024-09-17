Return-Path: <linux-kbuild+bounces-3596-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA4397B140
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B7D1C21179
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE0318E038;
	Tue, 17 Sep 2024 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzXSvH7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01E18E02B;
	Tue, 17 Sep 2024 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582671; cv=none; b=esbi+WBjPqkSi8XZiFVbc5FCsX7v1moCDgoS7IdXDzVTNVk+OF9OXTvM4oTFrQ89mU8VwHNid3kGtlvYV6sX97RNSlEkREMzJ7KQV1Q/p6OykqconY2N4lL3vvqH5nB3S9KhYHwOx63PzUdGv/2tsiS20I/fQFFvcj9LLD7DP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582671; c=relaxed/simple;
	bh=v1w8q5fANzCuOIlI91VhLyPWmXzboTXSVo9AD3A2I0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWL9+SmtmiSR4o4aMNUnH6wMx0p91RvxN5cMX3RIV2jw3lPtw3OubdR3+sssKLAafRlUU2IZeS58NYorTP+o6dF3oipB6tZ/jplNPbOCyLvxjTG0Fwf2+de+AXf8q9PmYBakga0niVJ12ZvjEyiQlp60/a6UhxIyvuLB+zt0jmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzXSvH7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7B6C4CECF;
	Tue, 17 Sep 2024 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582670;
	bh=v1w8q5fANzCuOIlI91VhLyPWmXzboTXSVo9AD3A2I0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzXSvH7r9H0jhAg4LT7kVq5RXbI35nkRhJGKkXRly5yEfNWsBdbvPgUHU7IlyGhAO
	 QVBBVtiHOOx3uHXcDtzFx3XxQG/45Evv+0lyk/+jFkC1+o7JEIl/2XSTqIUMKB/CFc
	 U+RtU0nExBesrp01FEjrF11s8NcAxd0KRj23l+YjQXZz9ZZlIc2f32FMkxBX7uy7fC
	 4JdlA8K2Yi9DXKdZ/64iXxtenQ8JW8IQgOAS7Ez5v7TQxUk1nnYdlyoWhjqEtHyNN4
	 JUnlkMxB24d6ZImIqqBdHU0xeFLcwiFYjVpD7go804uAUgGg1r9R+iZMHIiJ7TPT2f
	 69PyiXzsHlKCg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/23] speakup: use SPKDIR=$(src) to specify the source directory
Date: Tue, 17 Sep 2024 23:16:37 +0900
Message-ID: <20240917141725.466514-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b1992c3772e6 ("kbuild: use $(src) instead of
$(srctree)/$(src) for source directory"), $(src) consistently points
to the source directory whether this is compiled an as external module
or not.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/accessibility/speakup/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibility/speakup/Makefile
index 6f6a83565c0d..14ba1cca87f4 100644
--- a/drivers/accessibility/speakup/Makefile
+++ b/drivers/accessibility/speakup/Makefile
@@ -40,9 +40,7 @@ hostprogs += makemapdata
 makemapdata-objs := makemapdata.o
 
 quiet_cmd_mkmap = MKMAP   $@
-      cmd_mkmap = TOPDIR=$(srctree) \
-		  SPKDIR=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(srctree)/drivers/accessibility/speakup) \
-		  $(obj)/makemapdata > $@
+      cmd_mkmap = TOPDIR=$(srctree) SPKDIR=$(src) $(obj)/makemapdata > $@
 
 $(obj)/mapdata.h: $(obj)/makemapdata
 	$(call cmd,mkmap)
-- 
2.43.0


