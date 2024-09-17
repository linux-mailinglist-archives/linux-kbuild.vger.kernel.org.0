Return-Path: <linux-kbuild+bounces-3600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AC97B148
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F3D285D1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E054192B94;
	Tue, 17 Sep 2024 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIVlRwM2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275917C99B;
	Tue, 17 Sep 2024 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582680; cv=none; b=jrdMsy947iGx17PtAK3yg2qzI/Xk5lnOiGezxICS1aNrjwnsCobzSoKtoL0V0PiDnA2fGvakarQHBwIe/zMH/+gg4QS6ZNly6WEaq0cpYU0e1nlIGCaLZFG6f4SP+5D44+yH7T4gIa5exLMKmCInJY/WGuJ2oLhCC4S1GbDlQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582680; c=relaxed/simple;
	bh=dwKSfpuXEb7k3eYZ4e5Rn0Sa6XU7qYIELYeSbbtc8lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WkTHrq4HtNc4IpYpuHhsFOtLH2QNWMqRibwt2ua79fKPUHS1aDFdNIZ5ydr/0Uw6tW99kwOY76HsBoubLiIf+I/y8l/7S45Rj/q0f4R04cBSE9elFvqWs9V+AJ2vWKbUufwTV8q61kFmJhSOBH2cRqNkbmStyd+vUwLAwhjtTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIVlRwM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE01C4CEC5;
	Tue, 17 Sep 2024 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582679;
	bh=dwKSfpuXEb7k3eYZ4e5Rn0Sa6XU7qYIELYeSbbtc8lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AIVlRwM2FUewwZKUrJJdl5EsCeHBQBPtX6OhxpHOFEIK9AraokHsrtNY/xSxE5tgl
	 AaAdfZlGy2I7l63r2Kp/Z0qOIujYa/cqQESKw6LrxicB64QqxhRSZRUkpjSgPLFsys
	 g7tWOtUzFpp0KNu0UqbxJzCcH3ySNuiSAbYa7TfkxEA+Y17UlrboAtE74i/DlrM6lt
	 OUhVqIu2xJHr6LZp/X0OKIpEiHK7P0VDI6O+bSI6tg9aVJ8jSWzvu0i+If0JxmKz5g
	 frqA1qk29/VpKAja8loJv7t4rqDDuLlMny6TFTIpUyYLgyvbIMIw3AO+EmiFQF178d
	 Gr1AUE1Pkcr3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 13/23] kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
Date: Tue, 17 Sep 2024 23:16:41 +0900
Message-ID: <20240917141725.466514-14-masahiroy@kernel.org>
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

Kbuild changes the working directory until it matches $(abs_objtree).

When $(need-sub-make) is empty, $(abs_objtree) is the same as $(CURDIR).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5700d08c9b57..ee9ad0f0960f 100644
--- a/Makefile
+++ b/Makefile
@@ -228,12 +228,12 @@ else # need-sub-make
 
 # We process the rest of the Makefile if this is the final invocation of make
 
-ifeq ($(abs_srctree),$(abs_objtree))
+ifeq ($(abs_srctree),$(CURDIR))
         # building in the source tree
         srctree := .
 	building_out_of_srctree :=
 else
-        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
+        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
                 # building in a subdirectory of the source tree
                 srctree := ..
         else
-- 
2.43.0


