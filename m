Return-Path: <linux-kbuild+bounces-9638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D755C5F846
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 23:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9D6F4E11D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 22:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8AA3112BB;
	Fri, 14 Nov 2025 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjG3v7LW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FB12C0F96;
	Fri, 14 Nov 2025 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763159323; cv=none; b=fr3HM6sIsFC/h+SlRel5Ke3Ip8tn9nEgLoigxdx/u+YMT5zqcnE8nrauDuQfQLuy9t6gMR8ytFQ8DHpbmEFrovSG13I3rWxopUTFieBhEKqTzK3LiTEz5BrC98foTHYob6gvXfKCPPxmmW7xIM2jQHeVIEGdAq/GE9ximt9LRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763159323; c=relaxed/simple;
	bh=7MiWo7GmoSDqrOiGq0YpKyPcFGwIoNVH5oLyt5f4I24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgQxvIU09NURtCZqIB4VNzE2L2E0R0jz8v+Ohgb8ndglBC6hldqgiC9TqXRX07QEF58hPkgo/YNaQIxUJ/T8/Mf/6R4zrZcO+rntkzZPt8PhDRASsRRMH/Xcr+4PybexEFjNKRrT579QH90EddNTXs+qMiQ6oYM0RqCq5LSGD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjG3v7LW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D79C16AAE;
	Fri, 14 Nov 2025 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763159322;
	bh=7MiWo7GmoSDqrOiGq0YpKyPcFGwIoNVH5oLyt5f4I24=;
	h=From:To:Cc:Subject:Date:From;
	b=VjG3v7LWMXRzOctQn8BwZZMGlrxkkQVgLxyu+6EAP4SXfLc+rQgkHGTcku2zLZ6ha
	 +WToUrOjzFoDRgu5XcyyFnmx7x4ysT5cFs8WWfjyYvR0zW58fT5Dos6oxkKrvCcrE5
	 kSSWjk/l0GIbzhYpECc8jiGRlrGP4gQ69bYWyEYo8GCxi9nt/DeZYK4uoUe3/oT8ua
	 0CpvBzYIqOB1beQxl3ywhJjIMB19/W2JEOPCFxDIW6Hih0E+nkvySlre9+E0J/G/rl
	 h+ozcCNct1UJWpRdWzMr4F4CsGAEJPZOJIWI/YRhrXCUiQPiWj3sPID1uflYqGkwvL
	 QHpeIO0iaj41A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Ensure .dtbo targets are applied to a base .dtb
Date: Fri, 14 Nov 2025 16:27:58 -0600
Message-ID: <20251114222759.4181152-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a requirement that DT overlays in the kernel are applied at build
time to a base DTB in order to validate they can be applied and to
validate them against the DT schemas. DT overlays on their own may be
incomplete and can't be validated.

Add a kbuild check so this doesn't have to be checked and fixed
periodically.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 scripts/Makefile.dtbs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 2d321b813600..15473edc2589 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -10,6 +10,13 @@ real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
 # Base DTB that overlay is applied onto
 base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), .dtb, -dtbs))
 
+# Ensure that any .dtbo is applied to at least one base .dtb. Otherwise, it
+# does not get validated.
+applied-dtbo := $(filter %.dtbo, \
+	$(call real-search, $(call multi-search, $(dtb-y) $(dtb-), .dtb, -dtbs), .dtb, -dtbs))
+unapplied-dtbo := $(filter-out $(applied-dtbo),$(filter %.dtbo, $(dtb-y)))
+$(if $(unapplied-dtbo), $(warning .dtbo is not applied to any base: $(unapplied-dtbo)))
+
 dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
-- 
2.51.0


