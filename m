Return-Path: <linux-kbuild+bounces-5451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0BA0BB44
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713651696B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4580F2397B2;
	Mon, 13 Jan 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxKrZBxM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC78235BFC;
	Mon, 13 Jan 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780586; cv=none; b=LYmJdcuQSchpu97zFsPhX+rKNJMucdtBhjYPcSpAAIZ4I055ohht2/4F4GxtMU+5S3qdgLfZJDQRsgUgCBAGsyc5uldRyklulyoxkd6hbZBP8qtxZ8xvwS9a8MymOZI0bV6r1POC5fy/MiB2pIqnh/86b/lT/DO00q4/A4TQgTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780586; c=relaxed/simple;
	bh=KbCf9wRYe6d1/pmWcTMzq+haySq2hrnChmFMYX55DDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=np1LNMec3/jVAy1HJDyb1EHyzrb5K8vHZ+hhrlttH/si7fgveGXCKLo/+s7AhYTGFf61Rvg58KOiWgRScKp9dd6lfrtg9qe9XwWFF8Kq98UNywbJGOHZTS9zJ0+BWeL2zVgdAlVxqo/TX0VuhFW8QyqPwHIuwQ8gmpCVCmivXJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxKrZBxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2FEC4CED6;
	Mon, 13 Jan 2025 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780585;
	bh=KbCf9wRYe6d1/pmWcTMzq+haySq2hrnChmFMYX55DDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NxKrZBxMd4bOQV7G8yzKhxTRx7/Po3cVNaE5l3OAmRbqK1eg1hElVKsfKhE7stO22
	 GFbXvjkxvoE4rDPGuktEptDJ/4jBY/zbAdgr0xjlIJGv7rlr4dmBWrW0x9jlvIAfO5
	 zsLvHl1KhIvRm6ST3ZRbNtjdX4gE19rJgZ1PQ5x0//JAMWarxbwLa41jFkWC9vLTN7
	 6a9tP1Uuldt7LZpQkZzklorQAbrAQNZJjCzTh7NUEOoTTklSPEDWvWHZi+zlNjRMKp
	 U5bJVi4aB9KbUyfqgkMtOd4Wy0ORfAssmZnScu9Ku9JwEsHsff8VmkBllI7QXwgi9J
	 9h4dBbRzIbFbw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/17] genksyms: reduce type_qualifier directly to decl_specifier
Date: Tue, 14 Jan 2025 00:00:41 +0900
Message-ID: <20250113150253.3097820-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A type_qualifier (const, volatile, etc.) is not a type_specifier.

According to K&R [1], a type-qualifier should be directly reduced to
a declaration-specifier.

  <declaration-specifier> ::= <storage-class-specifier>
                            | <type-specifier>
                            | <type-qualifier>

[1]: https://cs.wmich.edu/~gupta/teaching/cs4850/sumII06/The%20syntax%20of%20C%20in%20Backus-Naur%20form.htm

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 8f62b9f0d99c..20cb3db7f149 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -211,6 +211,7 @@ decl_specifier:
 		  $$ = $1;
 		}
 	| type_specifier
+	| type_qualifier
 	;
 
 storage_class_specifier:
@@ -223,7 +224,6 @@ storage_class_specifier:
 
 type_specifier:
 	simple_type_specifier
-	| type_qualifier
 	| TYPEOF_KEYW '(' parameter_declaration ')'
 	| TYPEOF_PHRASE
 
-- 
2.43.0


