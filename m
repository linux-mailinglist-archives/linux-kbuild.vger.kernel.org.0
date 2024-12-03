Return-Path: <linux-kbuild+bounces-4963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC849E1AC9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 12:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D192B6369F
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64A51E3787;
	Tue,  3 Dec 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF024No2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6B1DE8AA;
	Tue,  3 Dec 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224509; cv=none; b=YOrOf11Bed8PUeeG2ymAGf3dCOIeYln5NVabUoj3zl3kEym0UdoHnQIFfNHqWTcSzex5NPAW3dUMCqO4kFyxvOn9piAnJ9I58ItYgC4Jf1Tc4dxzq2baYgXFkw98DFkqBRog9IbijjlXHjjTm0XJuKdmftguCpjjBay4FVybl40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224509; c=relaxed/simple;
	bh=iawhnenaWY2lWeuk9GU/cwTVeVccbon43Qla7QBiHBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IU44xlvIVeRFw2PL3fiDeyAnw7P5AhSJdjlQ2GBstK6Bud+YYiNa5ErfAPBEvdQeETUyzaDbTPqZYKi6+aHYmskuKPiutqkr2hEgj9TDleE2anB9ny98fBI+c627mYDyTQinZInr+aJ+GxyBgiaoLuIRYG+mjVVUQPSVy/jg9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF024No2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5A5C4CEE5;
	Tue,  3 Dec 2024 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733224509;
	bh=iawhnenaWY2lWeuk9GU/cwTVeVccbon43Qla7QBiHBw=;
	h=From:To:Cc:Subject:Date:From;
	b=nF024No2cTYxFWel+x3K/QNK9850K/p5asfEsB+SM/zi6mja7WLRG5yfdhAz6B7oT
	 s+Jm7GUHJvfiTi7mAklzopUxTPFA2jYAarC7RAiqdx27qT0VosPDVUfRkZs1cJnHJb
	 laTpFff8fAZalCbbmRrE5EnK2PiTXduYnxOwUpDeSpb2LoBJdzmj+vNkw9m3mh4NGb
	 TmNjkCzpyQULGgBZp4BwtFcGj3hPaOv/7t2lL+Q4YkvVYRDkfEKfLSLZH19xPEQFL1
	 SpOhx27MG0PaQ5sBmhTmYpJ32xbXzwSGtPAAg1TPrZ/wMlJDuIth4y+xXPTIX/Q8O8
	 UM68qwuyowCxQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: add debarch for ARCH=um
Date: Tue,  3 Dec 2024 20:14:45 +0900
Message-ID: <20241203111459.3331534-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'make ARCH=um bindeb-pkg' shows the following warning.

  $ make ARCH=um bindeb-pkg
     [snip]
    GEN     debian

  ** ** **  WARNING  ** ** **

  Your architecture doesn't have its equivalent
  Debian userspace architecture defined!
  Falling back to the current host architecture (amd64).
  Please add support for um to ./scripts/package/mkdebian ...

This commit hard-codes i386/amd64 because UML is only supported for x86.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 4ffcc70f8e31..b038a1380b8a 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -70,6 +70,13 @@ set_debarch() {
 			debarch=sh4$(if_enabled_echo CONFIG_CPU_BIG_ENDIAN eb)
 		fi
 		;;
+	um)
+		if is_enabled CONFIG_64BIT; then
+			debarch=amd64
+		else
+			debarch=i386
+		fi
+		;;
 	esac
 	if [ -z "$debarch" ]; then
 		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
-- 
2.43.0


