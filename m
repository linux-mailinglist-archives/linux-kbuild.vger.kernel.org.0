Return-Path: <linux-kbuild+bounces-3598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42797B144
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32CF42840CD
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967E81922FD;
	Tue, 17 Sep 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKX6o4/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32617BEDB;
	Tue, 17 Sep 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582675; cv=none; b=RbI5WCIOxELIDhQZz5PQnJG69s0C8CKFyygMtL0lZvZdrnp2bRjcTToMgBXOpSOWbLbMcidw4VO/riCm2S2j7pzKve/1X+AltkFhNl3eDzAndEIff5UmQP65rWYbpKNV37SPqgp9pfTAzA3lCSdS1JVj1rbaEenjdzGin6SF+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582675; c=relaxed/simple;
	bh=4bq9doD09IGzlJ3vv9HsmysgLeLSxT9Eyw84oRf2g1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UchGlwTvHAEEwHtJEvD4+lT1+zyvVf45H+CSaYYzFOc7vTClJUYgC1cY2KmzaPEfO0Lj4amNXppa0AhUgsX+Dfi74uAhlC7ovFs3GkAo+541ZjR2qHsTXU3VwTGtK9cyq1xw//aLG+sghg1r5T+nfzjQWMfnbS5fQo3IhTOYtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKX6o4/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FBCC4CECE;
	Tue, 17 Sep 2024 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582675;
	bh=4bq9doD09IGzlJ3vv9HsmysgLeLSxT9Eyw84oRf2g1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKX6o4/rSSj/+99p6SQAuNKThNXjF+BJA2kw2x9aSClEOtv5zysvRDgXIdXtFwwpk
	 3kvuQWyTw2vFMucNX5MGNztXZIVXlUYMpWlOhHSgDVNfnYedO4l+hdizb+Yeu2xvTz
	 K4YrjvLrtkBD+dwj7YK4SXhWpNQqW+tgknpFMtdN9cywZO/NbabRrS4iyisKh6PUqz
	 vwp1leq9nFURUP2KOXvHGyvmCZmmokq5wfecgHTTzqbWYSJHiQkuUApUp8oBM9pCYo
	 USu9LBQ2asHTDl/ZJSQfRqa9KHCLzIN9KSXYQ4a+ynOpnBTGu3wEZFFdPeGK06U0U5
	 KmLsxAvhtVygA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/23] kbuild: check the presence of include/generated/rustc_cfg
Date: Tue, 17 Sep 2024 23:16:39 +0900
Message-ID: <20240917141725.466514-12-masahiroy@kernel.org>
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

Since commit 2f7ab1267dc9 ("Kbuild: add Rust support"), Kconfig
generates include/generated/rustc_cfg, but its presence is not checked
in the top-level Makefile. It should be checked similarly to the C
header counterpart, include/generated/autoconf.h.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3f5c273c2901..5700d08c9b57 100644
--- a/Makefile
+++ b/Makefile
@@ -780,7 +780,7 @@ else # !may-sync-config
 # and include/config/auto.conf but do not care if they are up-to-date.
 # Use auto.conf to show the error message
 
-checked-configs := include/generated/autoconf.h include/config/auto.conf
+checked-configs := include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf
 missing-configs := $(filter-out $(wildcard $(checked-configs)), $(checked-configs))
 
 ifdef missing-configs
@@ -1187,7 +1187,8 @@ PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
 	asm-generic $(version_h) include/generated/utsrelease.h \
-	include/generated/compile.h include/generated/autoconf.h remove-stale-files
+	include/generated/compile.h include/generated/autoconf.h \
+	include/generated/rustc_cfg remove-stale-files
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
-- 
2.43.0


