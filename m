Return-Path: <linux-kbuild+bounces-6502-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE85A7F1C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 02:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1169C1897785
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 00:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA3F25F97C;
	Tue,  8 Apr 2025 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiZ6IHMY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B0725F979;
	Tue,  8 Apr 2025 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073634; cv=none; b=Gr4L8xEz/Dcqs3lKQqwONO0+zIKff1cIQIIX28ZPEeiqG17nCaTJLUP+gzJ5b03Mm+BRQ/E/HOiPtW9ZMYzheBkEM+rv0Wqtc9UG/gV9diTv1xw0k4g5cp7nCGcPyw0dA+X1OutaYg/ocB+j9CGyNgrc95j62fhSlMo2i18jSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073634; c=relaxed/simple;
	bh=5shCUpL32JQ0J0p2ImZRworI9Ip01R6iAdj+DvbED4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f2RaPFBDN0CXvwmLNKaHd3KnWGaKVaewXnu29Rncwqj9EikroRE2/do0ga/56pmDtLO8iBMKUW0i1p1ITDdc4KEaJQ9LBg4C5thxtjczBcC5Xa0jt4TRoQCz2cWDxXHrZKqPN0BbOJBgF+Jt5h4eW3vUUXAgj7n0s0fqysfbrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiZ6IHMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBDAC4CEE9;
	Tue,  8 Apr 2025 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744073633;
	bh=5shCUpL32JQ0J0p2ImZRworI9Ip01R6iAdj+DvbED4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WiZ6IHMYN6sGh+TsXJ+eKDLU71UiMAkElZbiTXxovO4v8Y1BML8iXcmeastnOzj3p
	 pOTmoK5E4M1DC8G4M69rcvXpdKV9US6V/VamdbdqciFEQtL1cuP2o5jFI1Q/QLXyAa
	 t+9KktOHY3l/5EZPHqdkGEp3sQ5djnTlYo8h9ix2W9ELC5bhcTXNDuab+4PiTDgCB+
	 HdhnoEjq79UJklcLagIXXQyEKNJT7kYe/F4n6hUXN798ZL1J7aKMVod+bgAA0EebSP
	 1F/kucvP3Jq9wuL1/OtzCwoWI4CaYYWPq3RlnZVnTP7p4zgoyDnRPLUWOU7XzawRFp
	 LjPRR2/VIJO6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xi Ruoyao <xry111@xry111.site>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 2/3] kbuild: add dependency from vmlinux to sorttable
Date: Mon,  7 Apr 2025 20:53:46 -0400
Message-Id: <20250408005347.3334681-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408005347.3334681-1-sashal@kernel.org>
References: <20250408005347.3334681-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit

From: Xi Ruoyao <xry111@xry111.site>

[ Upstream commit 82c09de2d4c472ab1b973e6e033671020691e637 ]

Without this dependency it's really puzzling when we bisect for a "bad"
commit in a series of sorttable change: when "git bisect" switches to
another commit, "make" just does nothing to vmlinux.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Makefile.vmlinux | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 873caaa553134..fb79fd6b24654 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -79,6 +79,10 @@ ifdef CONFIG_DEBUG_INFO_BTF
 vmlinux: $(RESOLVE_BTFIDS)
 endif
 
+ifdef CONFIG_BUILDTIME_TABLE_SORT
+vmlinux: scripts/sorttable
+endif
+
 # module.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
-- 
2.39.5


