Return-Path: <linux-kbuild+bounces-1823-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138E8C2DC8
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 02:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37431C21468
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 00:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87AD367;
	Sat, 11 May 2024 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aqv833lQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD990184;
	Sat, 11 May 2024 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715386208; cv=none; b=LF9N7d8469h/DbKAU8oqbZOB64w5+YU/h0PJ9Sd8v9GkQ8rWGF02FBFH39AY45NZrjFSimUW511ZXPib9hyyFbhch/cSyaaJs8VoeNMkGyGmQXmdM3fKPlaenGrHABMfbsqmSqWlNEw6bfDqtN9Mi3Ano3gxtgxsCcjYTtUap50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715386208; c=relaxed/simple;
	bh=PmbRSz4vFfq3tUiAWbuBVMbqbGPa4AdCtc2z1kbg+aA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iXEX9YMIAFfUggfbuigeL5F2ShE3FeQdHNzM9kZVHYTXJx6D3Lioxoc2nE6IslJGStHr/DqCyr9vef1XQZ0DntTMzrbhH+wK4BZUUWFgt6h8+KZxundxU7ejV3o22pF631LLLl1jL/Fz2YJ4WD0igcU+VH77nxYoyU4p46H5o2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aqv833lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB97AC113CC;
	Sat, 11 May 2024 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715386208;
	bh=PmbRSz4vFfq3tUiAWbuBVMbqbGPa4AdCtc2z1kbg+aA=;
	h=From:To:Cc:Subject:Date:From;
	b=Aqv833lQWiApuGN986eoEt4kbCeKMWoS1dHhu6pbLuqDLbZWZz3fZYM/BsXHfx8I4
	 XTUZlJe0LUUwf454kkvgaKuXtcE6h0OxP6kwVj689DTlDa7S/59n+WZR5rg5CGMpY3
	 IrasLGoGlqMcUthQ/u/MdZ9K8W7HufdhbDGIp5CqXitiO1NHE8TwQOXRsReB0AjPfe
	 PkqaliZvSmKYnxHHGMQCcR1VwKs156N6oawJoAMTrUVz234YT/CLiYrfkdMQT6HIG8
	 aBMWbpecGGLSLzuT3I6iKzEgPI3M/205x0tJVyW3xzx7I4DRUivU1ApSf/0bDOOwRR
	 uw6YbvIgsVvvg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] rapidio: remove choice for enumeration
Date: Sat, 11 May 2024 09:09:53 +0900
Message-Id: <20240511000953.11181-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the last use of the tristate choice.

This choice was introduced a decade ago by commit a11650e11093
("rapidio: make enumeration/discovery configurable"). Since then,
RAPIDIO_ENUM_BASIC has always been the sole member.

There was no need to have this choice block.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/rapidio/Kconfig | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/rapidio/Kconfig b/drivers/rapidio/Kconfig
index b9f8514909bf..f1d742ac8f7c 100644
--- a/drivers/rapidio/Kconfig
+++ b/drivers/rapidio/Kconfig
@@ -59,26 +59,13 @@ config RAPIDIO_DEBUG
 
 	  If you are unsure about this, say N here.
 
-choice
-	prompt "Enumeration method"
-	depends on RAPIDIO
-	default RAPIDIO_ENUM_BASIC
-	help
-	  There are different enumeration and discovery mechanisms offered
-	  for RapidIO subsystem. You may select single built-in method or
-	  or any number of methods to be built as modules.
-	  Selecting a built-in method disables use of loadable methods.
-
-	  If unsure, select Basic built-in.
-
 config RAPIDIO_ENUM_BASIC
-	tristate "Basic"
+	tristate "Basic Enumeration method"
+	depends on RAPIDIO
 	help
 	  This option includes basic RapidIO fabric enumeration and discovery
 	  mechanism similar to one described in RapidIO specification Annex 1.
 
-endchoice
-
 config RAPIDIO_CHMAN
 	tristate "RapidIO Channelized Messaging driver"
 	depends on RAPIDIO
-- 
2.40.1


