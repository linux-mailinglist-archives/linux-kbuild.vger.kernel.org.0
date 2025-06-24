Return-Path: <linux-kbuild+bounces-7643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604AAE6A60
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065341C253D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AA82E0B6D;
	Tue, 24 Jun 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Es6ALf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD562E0B52;
	Tue, 24 Jun 2025 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777669; cv=none; b=lalM12LVV26gJsWKoWlQEUkeCcOpIMK+80rlaq3SlY0/LxwxHyUoC1L+WEht8fg3/VAAaqBS5Cp3+ERmngjMeI2SRW9+E02T0N0QYwV2/ycxaSiBJ4W2jtWd6G3YpN08ehtoAciGRFDjLbb6BihBlQZVxI7D23y0QV+Mld/iwE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777669; c=relaxed/simple;
	bh=WY3+oQOoOobBDBIV9B9r0FRd//LRrSH0ZkEsslD3FRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaOx0tG3B/YDBnlm7vKtDtmGoUwMZxCANJ48FGm3tJJvarzc0rmEzF3Z8w0VVGmLOMqbp4ej2804oERe41Gxi3eYeX1H6KB0JzRJ0jqtMlyQjyEWE+t9L2+v3/VaFW9MgvKH1SZyIUtec2tQSw0k5O5zYBz3RS+E+p4pDrdlnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Es6ALf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB5AC4CEEE;
	Tue, 24 Jun 2025 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777668;
	bh=WY3+oQOoOobBDBIV9B9r0FRd//LRrSH0ZkEsslD3FRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8Es6ALf7oU/8fzIJQlXx1UssqPm7/P6kEDHCDxhMhHYytv9kNUs3ksJc759kdZsw
	 9ZNxzeM6amOuHxaIwIFr47XY7aBhOy6vZPjLeoC+9d3j8Ded/qsDIG8cWQnh7AX7iK
	 kf/eNhCafzmLxl5rbcedvW70jm70rzuVKDIETYxdHzFUNjSDgxVsr4AUab+f2e7oQe
	 Ud2Mg1e2SY4a1Spf1EFYGgqd2M+ZHQ5XE9N2TRaQlCwlCnoEiLplZ6wJkoaczdZ68n
	 pvjNgOPwkdsIvy+50nh82WnEH/far+EDl6j1utMqPWO1anckcjRJIKRu4z4KSDeZa6
	 pYr8gnz7agOtA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/66] kconfig: gconf: remove unnecessary gtk_set_locale() call
Date: Wed, 25 Jun 2025 00:05:04 +0900
Message-ID: <20250624150645.1107002-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gtk_set_locale() has been deprecated since version 2.24, and setlocale()
should be used directly. [1]

However, gtk_init() automatically does this, so there is typically no
point in calling this function.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtkmain.c#L1152

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 4bbc8f87deb6..3e632a325c10 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1367,7 +1367,6 @@ int main(int ac, char *av[])
 	gchar *glade_file;
 
 	/* GTK stuffs */
-	gtk_set_locale();
 	gtk_init(&ac, &av);
 	glade_init();
 
-- 
2.43.0


