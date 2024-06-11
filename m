Return-Path: <linux-kbuild+bounces-2065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D39042D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D20028C203
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADAB5CDF0;
	Tue, 11 Jun 2024 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvWR6h5c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1F5C8EF;
	Tue, 11 Jun 2024 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128562; cv=none; b=FIp2IbSymY1bGzh82wkpN4BOuI20UkZcteI8B1U6onsr1BpGQ62oEwdX2cZUsT3OnrK3+vGIpc0pN+R+JZQBa0vFnjiH+xk6x1FcEq/DCvd5QpK85WiOBZUDvoO/TWGiS++8YApfXV825dELYwNqWGcYKwjuDDVHvC4bhtCTwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128562; c=relaxed/simple;
	bh=GAF8ysZjcl8Pyp7JrwXDuhYLpidrAnZjl20cqs4nMoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Az9SL8c5MWdNoTHn4HwrvZ/9SHvcQsfLkogkNXeLeY1sReHxlSQb9H3CJ2yGAfN4uMYS0zlofErm+9aWGJRqQNbwEmoR8Pjm/xit4NkXMLj+P42ziDUr89nk8a//h293PkPzMD9vyEhocE0FASz32a6LV0g4YjQlkb0rprTupLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvWR6h5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A73C4AF1C;
	Tue, 11 Jun 2024 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128561;
	bh=GAF8ysZjcl8Pyp7JrwXDuhYLpidrAnZjl20cqs4nMoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WvWR6h5cbXcaWPrB7UY3qFLDFMuo2WYZX7F/rJpMr3UuM0ruagWgaEGxqbXBjzCBV
	 npl6OZpe5q+SB2LgNQPqHacP+BSNUcM3mVrKp1GmfSYL6UzZarn84YOvzCZyV+LjGK
	 u1twpscq54KcDqS3kPQS6rkACV2JTxxes746ivY28gDPCokxcQXvnoKi99K4+qbRy7
	 gmUD1etk8cFv1TinNQCq8hf+VVsIq6BJxPvhCOlPfJYgPBwSSjJRG5A/kMTRy4tdc3
	 GwSif/BU17sfDi7Xfobn+/j2hFX9pVSpj6xY67oWfeUXR+7q08LGEzT0MGQ80e+41z
	 PWFuUE1lbPJxQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/16] kconfig: remove unneeded code in expr_compare_type()
Date: Wed, 12 Jun 2024 02:55:10 +0900
Message-ID: <20240611175536.3518179-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The condition (t2 == 0) never becomes true because the zero value
(i.e., E_NONE) is only used as a dummy type for prevtoken. It can
be passed to t1, but not to t2.

The caller of this function only checks expr_compare_type() > 0.
Therefore, the distinction between 0 and -1 is unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index fcc190b67b6f..31737b2cb8e2 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1096,11 +1096,8 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	case E_OR:
 		if (t2 == E_LIST)
 			return 1;
-	case E_LIST:
-		if (t2 == 0)
-			return 1;
 	default:
-		return -1;
+		break;
 	}
 	return 0;
 }
-- 
2.43.0


