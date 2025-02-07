Return-Path: <linux-kbuild+bounces-5663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947ABA2CA8E
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37665164B8C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 17:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984C7192590;
	Fri,  7 Feb 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pP9uPRWm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CABF8479;
	Fri,  7 Feb 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950715; cv=none; b=E2T3f7AJLXL3zmBd7qkIKCrxfhbrVEjYJopbe6UOw2pBBKydVamDurYpKYVkQonejLczO6NNyQK79lrnCCwGaHJzYHDTwJcUk6oYoTgs+alaewR+LGjPteInaAwRisZYNv7N+kna2w9Vn34fzQ5P3TOzGUJInuWSA0ZcSiNy+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950715; c=relaxed/simple;
	bh=b8WBVjVkJiqfW3LmTFn95i2/AjXZK/HkOd6sFqAYCPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVp9fPFv8sUumJ2DZnDAypgdv1jssy5up1KfMSSKKiy1cHmgg/Z/RsucadWFvapXOnBP+ekRV52slD/zajhkohAo+GxUfUlRjlO4N5J3gJk1yxtlltI0V0Kjz0JvPW+nVwHALPgWTwhlRKqk8xshM7/x96gZTuP3tezp3EsL+58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pP9uPRWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2093C4CED1;
	Fri,  7 Feb 2025 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738950714;
	bh=b8WBVjVkJiqfW3LmTFn95i2/AjXZK/HkOd6sFqAYCPk=;
	h=From:To:Cc:Subject:Date:From;
	b=pP9uPRWm5UkYlSL3AEPCKAse3p5ltmiWi/M7VgA1qKF2Wm2nfszKLo89GbT71tCwy
	 bX+rHjIOnjOX2KKa5uAY/pyJxNMwRnGewJHERGgMMNZz5y1IgXoane7QSggKv5RJFx
	 3tXi/blbvHhSRNofsbxY1FBuvtGMN49uXWPOujIyh5rzaTHdY0OhxccHJeBEjBnY9O
	 tVAzIOXQie65tr8/aaOImLdwpZlaV/5nCMIUHcbN35NgVc9mKD1PoBzNv092FyGRBg
	 EEV26+zehOqHUJGUwsx05OYD9XWYvdcqg9yi3imzwMJvLThaKLOBwvuRAAatR4uL4X
	 fRIMYFFTinzMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: use strstarts() to clean up parse_source_files()
Date: Sat,  8 Feb 2025 02:50:55 +0900
Message-ID: <20250207175104.412158-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index e79fc40d852f..3dd28b4d0099 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -330,7 +330,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 			line++;
 		p = line;
 
-		if (strncmp(line, "source_", sizeof("source_")-1) == 0) {
+		if (strstarts(line, "source_")) {
 			p = strrchr(line, ' ');
 			if (!p) {
 				warn("malformed line: %s\n", line);
@@ -344,7 +344,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 			}
 			continue;
 		}
-		if (strncmp(line, "deps_", sizeof("deps_")-1) == 0) {
+		if (strstarts(line, "deps_")) {
 			check_files = 1;
 			continue;
 		}
-- 
2.43.0


