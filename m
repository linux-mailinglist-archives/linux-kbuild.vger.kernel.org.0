Return-Path: <linux-kbuild+bounces-7322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D74AC9EAA
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 15:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F97189271C
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 13:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCCF1DDC11;
	Sun,  1 Jun 2025 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP+B1Cim"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69411DC988;
	Sun,  1 Jun 2025 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784757; cv=none; b=k9nlsYcqztkqqFA0zDmSciTBohQ/hKM8/P752CvWA6/W7TgYS2XhEJkdzGKbGA8DC9pfpPFeRIn0cQEx4QNaqrCyC7SyFMWiVQNT9Q1hTtwm7HyAKllWJT5Ze1VwJfJm0CnM0ohD9dY6zsllRk9gLD78BNZdpWpI18Dl69AxgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784757; c=relaxed/simple;
	bh=jzdMOEDNPa3l/6CWjUBOUhjHpOa0PCNzEIMF/GX5Weg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGCOMldPuTMFWJyTCrSgaFVkfzhPIzr4GEjRAOw3sEFVeHVDn4or+9R6uoLrPBOWAPZJ5fwkw5T63/KAt7zU0MiW6/JzTbaTN7UT+osSZLP7Vqo9H/LkF6LwdEcNG5ZV/n8g6kWXD+lfVtEpy54834CRe7+nUIFflcSuP0kKlcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP+B1Cim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746E5C4CEF0;
	Sun,  1 Jun 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748784757;
	bh=jzdMOEDNPa3l/6CWjUBOUhjHpOa0PCNzEIMF/GX5Weg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uP+B1CimJIh3+VcmiHqotIS5MJKHxIJLky6qpqJQI/7WwIrZErEVmrarFkM/IezRE
	 6ORjWIWZGm9tHXu5vu0q7XBcJe9Bim0IccDtmAQSXeuN6lwFFB2/CqUyzJw+0p3YhB
	 exQM+QX1/+Ge2lQPeNth8erYvDDAUruKTgVHfiBNI/WewFLyHo/0gOUUhlge8DjuOY
	 pdPxkjQfuu7C20782940REBax1V+5zkJgHpjNlPSMEtYIMW9W+qLTgMTTU89z/dmV0
	 ttwnSukNjMj5J9DzrGoQG/lY/wwbCh4uLTrtJp3XfJSi3ZZaLrguRv407UemIa2+FB
	 rif/QSu2uTwGA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 2/4] scripts/misc-check: add double-quotes to satisfy shellcheck
Date: Sun,  1 Jun 2025 22:31:28 +0900
Message-ID: <20250601133230.4085512-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601133230.4085512-1-masahiroy@kernel.org>
References: <20250601133230.4085512-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In scripts/misc-check line 8:
        git -C ${srctree:-.} ls-files -i -c --exclude-per-directory=.gitignore 2>/dev/null |
               ^-----------^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - New patch

 scripts/misc-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/misc-check b/scripts/misc-check
index f37b2f6931cc..21551d721079 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -5,7 +5,7 @@ set -e
 
 # Detect files that are tracked but ignored by git.
 check_tracked_ignored_files () {
-	git -C ${srctree:-.} ls-files -i -c --exclude-per-directory=.gitignore 2>/dev/null |
+	git -C "${srctree:-.}" ls-files -i -c --exclude-per-directory=.gitignore 2>/dev/null |
 		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
 }
 
-- 
2.43.0


