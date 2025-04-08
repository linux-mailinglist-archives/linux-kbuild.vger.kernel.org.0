Return-Path: <linux-kbuild+bounces-6503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B00A7F1C6
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 02:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974931897C09
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 00:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B461B25F7A2;
	Tue,  8 Apr 2025 00:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N56u2zpX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC825F7A1;
	Tue,  8 Apr 2025 00:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073643; cv=none; b=jAu5Wbr4FDvL5zW/yurMNFBO6BiaDRjZCkDIDek+8myA0SsckbJFvcVbtwPbSP4pwTuq9SOnzG+JPTS/onK33YUPrTLJ7MpGc7n1Ha5Y6utk+hYTDJ4KybzphGGS+IWSwcPuCffGwqiN+xwG88lXi63v3j05xUUF7iI3o50kqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073643; c=relaxed/simple;
	bh=0kTEpk9P6j3NjzoQKYrL3gZ5oj7C2kRlUkSqokABmLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kVGYlIAiYcNPZ3Y0Sf8kwyvqRRAyBi5YR3cX3+yeWA2zuQMASfBejIMSgRxisL2QyNoslx/CqcwXY9770tm2CKj02TxBeTwB5VFN180S1e7x0oQ+H605Da0pyMEZuvAQeLx76YJrX62Rx+EocMEXyt2dP62SpOnghf8uDDBK5YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N56u2zpX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2D6C4CEDD;
	Tue,  8 Apr 2025 00:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744073643;
	bh=0kTEpk9P6j3NjzoQKYrL3gZ5oj7C2kRlUkSqokABmLY=;
	h=From:To:Cc:Subject:Date:From;
	b=N56u2zpXfAAwfOJHvBkRrW5PEiaTBiPJZQkkzoTA6gEsmfAEnKZugFaLzj8Y93gl1
	 trPCXwy07wETmCCE8uMUCDCLfiSqyC8fZtKb+wtMsN7l+aw3H2UYckUyHsdCvwE9uk
	 5LE6jGtWcafU67OyXH0QkXXBSldYTS+Q3ViBuvzQPuHYeG2hUq8Ckl7AgGCei6p/Sf
	 n0D5RE1cqt4WoW8NZFFTPGKW49nhOuz+VfkJOE9SJtVTux0FXWWiCLtE0jyKzEFvYN
	 4XlOKxafm8lPYGbkeTvwniI6HFdSq47pJeslTNONk4mxKiBI1NVVUbI17pEri45eqE
	 pxUbYsDOUDhlA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xi Ruoyao <xry111@xry111.site>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 1/2] kbuild: add dependency from vmlinux to sorttable
Date: Mon,  7 Apr 2025 20:53:56 -0400
Message-Id: <20250408005357.3334801-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.22
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
index 1284f05555b97..0c2494ffcaf87 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -33,6 +33,10 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+ifdef CONFIG_BUILDTIME_TABLE_SORT
+vmlinux: scripts/sorttable
+endif
+
 # module.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
-- 
2.39.5


