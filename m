Return-Path: <linux-kbuild+bounces-5503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AFA167F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 09:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 359E73A06F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B56191F6A;
	Mon, 20 Jan 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvvnpomI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C198189B8B;
	Mon, 20 Jan 2025 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360802; cv=none; b=jAIxUbIPekhaqOa2NJFM+lUrUOqdxQoXo2EIuQ8cjtMAcTwFgIsg3SDwA7+fBqBbIUb93Ef2M5LiViyFLnX8QdWk2qomi8gU3COa4qBvbtwKYQgdr6yQDfO5AkZ/wYnk2gLWz0PLtQaZ0vF4xDvJsbk1pHiWoqeCFUX5bN8YRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360802; c=relaxed/simple;
	bh=8/+emIQhVgyD0b69yIJ2VwnLy1z/sfkcdducrQG8K7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2jhd784g2kCjWRLYQtwm7knS7Z5MAmvf2W9nevA5qUJOWM8MtNDgWbcgW9Zdqkcmw3MyjCQOE5qQxwDpmDADJsIP7lzWAF0zvLG6TJeyTXtxxXhpI5AvW7z3eP1m6zJb6VHvhfMOz7lUQkz2vdOCoBwS977TdeU5698XYSlXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvvnpomI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5DFC4CEDD;
	Mon, 20 Jan 2025 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737360801;
	bh=8/+emIQhVgyD0b69yIJ2VwnLy1z/sfkcdducrQG8K7A=;
	h=From:To:Cc:Subject:Date:From;
	b=QvvnpomItSL77euk4dPaXbWFVGXhqoit12S2haLdmIJH4g1GzKDyGU8tYxOIBBRTk
	 l3ionH+w7rf55U5GrT3VQZMwXd36Px03s6qcDuuN2ctUgZ4mGqqy/cNqvsmK/AhHe/
	 x082YXFaYQn6X7WcEB8VMFSj7QO23Q2JMvF7v1LW8k7LTqrbgKY0RNWw0ZcoQkTPQm
	 IyQWSQtsyv8XoXuQUvlyUa1ZaDSSa6v1cu1mHJNJMQXcceKE7QCsx3ONSdBndyipJN
	 KcNVyB5EWh1Ki2CkpouYfW9W2LOIxAnz4BkVg1A/yXFtbIOAimBH5rNvbkndeWAUWu
	 dvG7a27e9Ky9A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH] kconfig: fix memory leak in sym_warn_unmet_dep()
Date: Mon, 20 Jan 2025 17:10:31 +0900
Message-ID: <20250120081039.29006-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The string allocated in sym_warn_unmet_dep() is never freed, leading
to a memory leak when an unmet dependency is detected.

Fixes: f8f69dc0b4e0 ("kconfig: make unmet dependency warnings readable")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 89b84bf8e21f..1521cdf62fce 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -389,6 +389,7 @@ static void sym_warn_unmet_dep(const struct symbol *sym)
 
 	fputs(str_get(&gs), stderr);
 	sym_warnings++;
+	str_free(&gs);
 }
 
 bool sym_dep_errors(void)
-- 
2.43.0


