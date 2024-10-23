Return-Path: <linux-kbuild+bounces-4293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D09AD3E3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43579B23E11
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8341FAC5E;
	Wed, 23 Oct 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbGZWTZT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296D1F80B1;
	Wed, 23 Oct 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707520; cv=none; b=IOaw5tAANFJPHxuDEqJiVjMs9oK0t6QTEnH39YhqDgWk5agO0RWJ3B5GbNXOdM02uzJ5maLfirLE3jlTwwMnGx2180RsbwK9x7E8faprlAdLg2XLQa2+mwa65X6/L7Mtqbf6q+Ltc8jOL0B4PoIQclqBjNfA4zrGaWTKO+Z4Kwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707520; c=relaxed/simple;
	bh=K00qyjigorjR5oV/0gvj6r3uws0hpbfnhwCGMESVbuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLITHEibv/Zl5URaMmFdpYmlQuV/yus7HavL1Js+XilQ8Ti3lEm+6WuAXr70NDswJnv6MD7wBjVT0+9IkhMl1oi/qQAoY++X+zxrRO5wB4KNoUBhDfdgfgF0q1J5QGx10vsce+gwbPhGdOqchdjYWNLGwNVrDO+mac+3LKeNgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbGZWTZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE2CC4CEC7;
	Wed, 23 Oct 2024 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707520;
	bh=K00qyjigorjR5oV/0gvj6r3uws0hpbfnhwCGMESVbuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbGZWTZTCTSGm+oLPf6mAlVa/wwke6rl0nue1/PGyTMN1jMn3ydWTCQMHx8GW/AKY
	 e3FukNqqroj+TIIpdzgVKn9yqE3SfAadbxxIr3L3ejDoJvwgp5ijhXLsOmPH7X4RqM
	 3lfOitq8FmRD0NIpgcsGbuPy4g6a/4InXnoh5UXwICdRFdwkRJZXvpSD8lsKcCPIPK
	 uewiGUtuV4UoLyTqzwLQJh4wek37Eu0UdAfOdvkxsRdR/G1L+TzzWYvcffrDDkonmA
	 TiuHm/3T81TjhylheJIvutJwjQa1yQD3p2kkldOqUcVmehs+akdlKdcwY3IvGcNCM4
	 tyyGatskx+9Rg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] kconfig: qconf: remove non-functional href="m..." tag
Date: Thu, 24 Oct 2024 03:18:00 +0900
Message-ID: <20241023181823.138524-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only functional tag is href="s<symbol_name>".

Commit c4f7398bee9c ("kconfig: qconf: make debug links work again")
changed prop->name to sym->name for this reference, but it missed to
change the tag "m" to "s".

This tag is not functional at all.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index acbc4331ebc5..a208ef33128f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1065,9 +1065,9 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 		switch (prop->type) {
 		case P_PROMPT:
 		case P_MENU:
-			stream << "prompt: <a href=\"m" << sym->name << "\">";
+			stream << "prompt: ";
 			stream << print_filter(prop->text);
-			stream << "</a><br>";
+			stream << "<br>";
 			break;
 		case P_DEFAULT:
 		case P_SELECT:
-- 
2.43.0


