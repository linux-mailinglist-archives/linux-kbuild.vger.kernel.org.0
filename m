Return-Path: <linux-kbuild+bounces-3594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4A97B13B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E52641F23179
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7133218A956;
	Tue, 17 Sep 2024 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTwPRpGA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619F18A6CC;
	Tue, 17 Sep 2024 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582666; cv=none; b=k2iUKGj+HUTGLdtsb/Ry4bPithXgoNgMq3xVXWue2XjzNFo8M23FJYd39raqSqQQHV0aGYAwWtpIi2W/yxsZtNKIYFPVI33o0W1O+/IjACkBNz0Y9EgIm8Req6h4llzgFq14t3rFZcS7IyP8ZyO/HPje8XgZfImkYGDpHHKPKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582666; c=relaxed/simple;
	bh=+9PNpuHsdm7Ec9+L5pNvm1cAeo6Z5ZSpTWnrQWR6nsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1sf6F2hXZRI2ioKLgbyykpJG7on1UvyGD1IeDQO7eIMtyOA8nAog++qWz8rFpBchjIAbjxjMt0KLfkgAb3+zCzUGSIZ97vpc/C4VMS0eS1J3ceY4XZ9/XFc9ePYf8Rgv+UoZoK2rleGSpwN7eC/kcBdOz5OE87DEUoQOvy2gNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTwPRpGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599BAC4CEC5;
	Tue, 17 Sep 2024 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582666;
	bh=+9PNpuHsdm7Ec9+L5pNvm1cAeo6Z5ZSpTWnrQWR6nsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTwPRpGA7aRIKVZP6gJs11R258Rf/4UU5zer3t5jnekFkSwXESj29OVdiDU/GaxO2
	 MGXEMJ3GY74WkfZvQAoHTmqCPhQ1kjiv8t6ml/Bx5Qi+d6TZZsq3VLTO71dFuP0KuP
	 sdsGbbBQ9KigJp/IYxzNR5ybSkuJwlrD2OXPGuYtxUR9KxZDOxGLKNLGMvdZEPeHNM
	 oVimC+mEmgUx9Qtskna0HwMwrkJU2QbnD9OREkncCoVmoh6FSmWRxs3UyriKXtJPX1
	 k2NpB6dXd8WoM/0fXiTXMRGdsYaEK7nE5UkFY+3aQJQrhnDHMPBfMIe7FNDu12LiD4
	 u1BxdQA/VnPiA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/23] kbuild: remove unnecessary prune of rust/alloc for rustfmt
Date: Tue, 17 Sep 2024 23:16:35 +0900
Message-ID: <20240917141725.466514-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9d0441bab775 ("rust: alloc: remove our fork of the `alloc`
crate") removed the rust/alloc/ directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index 35b8392d2bef..5b16e0605a77 100644
--- a/Makefile
+++ b/Makefile
@@ -1741,9 +1741,7 @@ PHONY += rustfmt rustfmtcheck
 # We `grep` afterwards in order to remove the directory entry itself.
 rustfmt:
 	$(Q)find $(abs_srctree) -type f -name '*.rs' \
-		-o -path $(abs_srctree)/rust/alloc -prune \
 		-o -path $(abs_objtree)/rust/test -prune \
-		| grep -Fv $(abs_srctree)/rust/alloc \
 		| grep -Fv $(abs_objtree)/rust/test \
 		| grep -Fv generated \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
-- 
2.43.0


