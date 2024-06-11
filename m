Return-Path: <linux-kbuild+bounces-2066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 711029042DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2251C1F242A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B256E2BE;
	Tue, 11 Jun 2024 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pksLM9/2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F26BFD5;
	Tue, 11 Jun 2024 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128563; cv=none; b=erYmBmavanIvnDjKp6ALxTtJVAKvqkQvXr9Kmse0TM9vbj++Agmpd6+yr8yagw+pG05Ikms0fQuerk6d2uzyqZPyCH5iDBYr6UgySPclOBGvVzk12VgPpenITtLDbsS8SnM2Z/B+Hn+sLsnDVz9GpcFvP5zG1Z2Exy6Ll7zHgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128563; c=relaxed/simple;
	bh=Il2IBkyPBNx4lEb9nfcAhP52gScXtLIKtiTPj1sRzy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jab7CgMxdHBLEGSisEwufDMqQ1MxwM+FS+s03y2qIftDRNyJWvpUrOf5kQoFe4K+g79uXQK4JDrxZIRd2BP93++PErkOEnqakVTS6uwVI7SHsM1DE21lZrznhzWlt2fwwlciwBSCbargi1ZAJxok+SxpzKKuh51kwpcjFtU2m0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pksLM9/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6166AC32786;
	Tue, 11 Jun 2024 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128563;
	bh=Il2IBkyPBNx4lEb9nfcAhP52gScXtLIKtiTPj1sRzy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pksLM9/2wl6MgTyi+GkZPXyHQpUzbQTo3iHzZEn07BE4Gm6vWPfD8sAOPBmd09GJp
	 hs3id94yKPxzhEds9gJZLgjc5J0RStTLNTRNsMBzJDWzsIR5Cz4h5x6MMK3OyX/r/o
	 E85wOn+xVQXfvYRFHJRrFzaQ0MSuINOchkuH4h/Nz4+/bzQtn7dbyWmteCT23OedXf
	 vqXtihOI5/S3WyhuaXxXQa19WU6ryhVxZbeLFL8+HA9XpAYrQ8HVzjyYTD+K8i6uSP
	 wcuCrP1Jl0KhTASznEX166Sg2fhBYuL7+rs/f0PlqW7oBwKBCNkpuHci0GXhVlLX+X
	 Ma7Xx/NMCSkCw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/16] kconfig: add fallthrough comments to expr_compare_type()
Date: Wed, 12 Jun 2024 02:55:11 +0900
Message-ID: <20240611175536.3518179-3-masahiroy@kernel.org>
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

Clarify the missing 'break' is intentional.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 31737b2cb8e2..bea82d5cac83 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1083,19 +1083,24 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	case E_GTH:
 		if (t2 == E_EQUAL || t2 == E_UNEQUAL)
 			return 1;
+		/* fallthrough */
 	case E_EQUAL:
 	case E_UNEQUAL:
 		if (t2 == E_NOT)
 			return 1;
+		/* fallthrough */
 	case E_NOT:
 		if (t2 == E_AND)
 			return 1;
+		/* fallthrough */
 	case E_AND:
 		if (t2 == E_OR)
 			return 1;
+		/* fallthrough */
 	case E_OR:
 		if (t2 == E_LIST)
 			return 1;
+		/* fallthrough */
 	default:
 		break;
 	}
-- 
2.43.0


