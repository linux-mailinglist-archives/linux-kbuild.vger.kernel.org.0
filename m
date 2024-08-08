Return-Path: <linux-kbuild+bounces-2908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CB94C027
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 16:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DDD51C203B9
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86EE18FDBD;
	Thu,  8 Aug 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJhI9J+a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014F18FDD1;
	Thu,  8 Aug 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128222; cv=none; b=Hplx3Zbg4Gn10xdIU6AHEKqINbwIsiMPkRsmB9dOpEyd7C+mOYtjjzoslMop1cor5rPwAftWLv2bNawBImiz2fi99flwtF2HHNwSPn34tY28vIsf3WASgwQRG/l2jibFgD/qSjbqKKfIRFdS38njWjEOnyE/3yHpls9JQcbnpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128222; c=relaxed/simple;
	bh=ENCA4hfSUOcIkbni+56Y1olghtJQaFGd6hXdw3tN7C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sDA4UDzpgwQSP2ucrm0M9ZH+fMf5+CCbx8B+IGCg1+IwEEo8X9SM1zTZ04FG7Mr6aRwoLM+cB8TBmxL9CgVaszIZZrBH9dk+K/UUxFy7WHZqhWuDrh1GS5qHdjWcq7dLVu+JciuRxaVCbKUdUxotGlKxoLqDiuxWEImTBehl/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJhI9J+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C352C32782;
	Thu,  8 Aug 2024 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723128222;
	bh=ENCA4hfSUOcIkbni+56Y1olghtJQaFGd6hXdw3tN7C0=;
	h=From:To:Cc:Subject:Date:From;
	b=XJhI9J+aOk3YHWaEpUN5Abeach3Kw7T05zXb7Rpy6VgKt+WTWqV8kPLhoMnpTioT6
	 V5muQJ3mwQX0aBZpc5wZsCmtx0P9Gk0m9CbmH3tferaen8GRlY7FV0haAo9dAWn4uD
	 ns912LsDuBViIXu5CTH5m35h67F+CzLVPcKjycCWFpTukoAn5Iy8dRBbg2lY/vXa+7
	 mmSPTKgU+xN1uKMUDd4PnHrdMi3uvK4ZM+d0YAlRNXOTm3NVVN7uVJTzZ4cwYigr7N
	 iD9oyDLTOi8KIXxeoM2ousyFN5Hr/q1YhEfYgIwqnXczYDLGayxGBCntcRseh25bpY
	 jjW4sZ1cW4JUQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/remove-stale-files: clean up stale lib/test_fortify.log
Date: Thu,  8 Aug 2024 23:42:36 +0900
Message-ID: <20240808144328.807649-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6eeccc5361e8 ("fortify: refactor test_fortify Makefile to fix some
build problems") moved test_fortify.log from lib/ to lib/test_fortify/.

If lib/test_fortify.log from previous builds remains, Git will show it as
an untracked file. Let's clean it up.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Kees,
Please apply this to your tree.
Or, if you can modify your branch, please squash this to 6eeccc5361e8

 scripts/remove-stale-files | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index f38d26b78c2a..8fc55a749ccc 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -21,3 +21,5 @@ set -e
 # then will be really dead and removed from the code base entirely.
 
 rm -f *.spec
+
+rm -f lib/test_fortify.log
-- 
2.43.0


