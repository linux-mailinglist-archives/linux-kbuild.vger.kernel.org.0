Return-Path: <linux-kbuild+bounces-6753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0027A9DC2A
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8571A3BC1EC
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D32F25D538;
	Sat, 26 Apr 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j18RMJwD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E725CC40;
	Sat, 26 Apr 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684317; cv=none; b=X+cy6Z1ZI5xtNfaxiO7/gd8tKUbRt/Iov5mXPHS8GR0edQCW/auLCuQG47/RHY3XQVmb+jnQ8FFxIyHGT8LmREej6s/smGElYCcWFCZQ8bJ8qZT9PUck6p4HILfN4I8Ti66AlOAhRPgI/ld/QyZYa37T4mJ6XdfDOdI3OUAlmWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684317; c=relaxed/simple;
	bh=Bvx1FYs4m1TvOYHdJyie5w96jb5imjrAobaaRTDTwfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkNgXjELwL9DzUHhVqtQQYFxmaCTcMioGpOyFj2SI6dH5um9rvF+kaiO/0Dzs1sY3WJgBDGXnWrvU0dMnTYBUn3b79MVeXWw+f3QPfnUkZW1TaM18kyjneVmAvPmH7UgPPn83GOsl4HYu5pgadbkL22pPK5nehNak5xf8PN9S38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j18RMJwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C4BC4CEEB;
	Sat, 26 Apr 2025 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684317;
	bh=Bvx1FYs4m1TvOYHdJyie5w96jb5imjrAobaaRTDTwfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j18RMJwD1GVZ4ijRa+deD7oOzl1m6ftjW9j67h2J81hMTHISadLChOZ/kVsA/cuZS
	 SgDT90vd5nYHeJ88s0u3Kqkql368+V5MJiJH8ls0fhSIC0FRFQg6nWjflunk7NPmSt
	 1STTIyUwCbmrUmFDlgm66KTIhiI3CceLxL03cjsNdfYslj7IjbcmtL+w57NOgVVFzQ
	 gEIbgiTSFoWArjU4X+RKTGp3HRp66YDFzaT/2dIJL+3raBwo64mcdRIaWskcPz33CS
	 KXG+MutG9ilwpzzEOuaJJ9fDkhzGUPGzL51fjODMRerS+PqGTYTOfwHcCc/cWH4Qje
	 HSoICJXVr7S6Q==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 1/7] mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
Date: Sat, 26 Apr 2025 18:16:32 +0200
Message-ID: <79d5a847303e45a46098f2d827d3d8a249a32be3.1745591072.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name used in the macro does not exist.

drivers/mfd/stmpe-spi.c:132:26: error: use of undeclared identifier 'stmpe_id'
  132 | MODULE_DEVICE_TABLE(spi, stmpe_id);
      |                          ^
1 error generated.

Fixes: e789995d5c61 ("mfd: Add support for STMPE SPI interface")
Cc: Lee Jones <lee@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/mfd/stmpe-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 792236f56399..b9cc85ea2c40 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -129,7 +129,7 @@ static const struct spi_device_id stmpe_spi_id[] = {
 	{ "stmpe2403", STMPE2403 },
 	{ }
 };
-MODULE_DEVICE_TABLE(spi, stmpe_id);
+MODULE_DEVICE_TABLE(spi, stmpe_spi_id);
 
 static struct spi_driver stmpe_spi_driver = {
 	.driver = {
-- 
2.49.0


