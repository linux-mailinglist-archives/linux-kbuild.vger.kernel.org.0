Return-Path: <linux-kbuild+bounces-7688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F21AE6AD4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D2F55A6B7E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8172A2FE39B;
	Tue, 24 Jun 2025 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrU0lHEe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BF92FE395;
	Tue, 24 Jun 2025 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777763; cv=none; b=TEG54758QsIejTr2zaVkWiPCmHiI0UKAxhkdb73ObNoMexhxVT9mjt/JNnNW+/bnVgcP9KKxrtcPrNT7yp8hYdWZcLhg2NjRLOKpo2Ou/BJTpd5hqMlKIgH+3gPrkbLDom+zl7PiCRTvfR/gDNmRPECy9o0t7VWeZV0JHHLLqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777763; c=relaxed/simple;
	bh=6qPp6sIDL96xp+ZOlMxJoK1W7yHhzqj9HUhDdoQtrdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsU/u9x/muYhXarMNWKzBQeyGYNAsmkYEV6rqqZ7pAjnYp+2xpJl9ku80emyru3xB89YkQSt6OYxY8iCRsMEH7AIFbWnIFO3a8qG/b162gZ86bqVaYY7uCdqaq56GNIb1vQWVQM6CYsPz2/DV1yG5mQ39GACCCg7U7BF2ltjXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrU0lHEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D3C4CEF4;
	Tue, 24 Jun 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777763;
	bh=6qPp6sIDL96xp+ZOlMxJoK1W7yHhzqj9HUhDdoQtrdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrU0lHEeRWAb48ZGbzD9YKS/xjEqA/FZpwO/RqdP4EnvSSE4oKqWcwLhNq6As3ZIf
	 MSac7H3S9oTUzMC0zqZE1ZiEJg3OBCGu1qfH2Ch6i9SqFMgcfp3rGGSoJOeevaGviQ
	 oIr3MkEQF3vsJCaHcV1wIl/d2jSzInG4oU+29uRtZQ4WKF0gKIRgffEVgun9G1R57V
	 zJvvpFb3vWTkExpGT8JwU2ufjoIs4TcinSTOmIIOy387Modc4ZnmP0vvp/AsjjiVd6
	 K99tcMjYMaPLG/y51FLRyDX94N1M1IzwSyFnMfmAzN1G4YPw7YCxVWwWoUMhmhfFuB
	 5+yfUdsijQUxw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 61/66] kconfig: gconf: remove GtkHandleBox from glade
Date: Wed, 25 Jun 2025 00:05:49 +0900
Message-ID: <20250624150645.1107002-62-masahiroy@kernel.org>
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

GtkHandleBox is deprecated with GTK 3.4. [1]

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.4.0/gtk/deprecated/gtkhandlebox.c#L426

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.glade | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index b2e15b23744f..f0c572c7f47c 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -214,13 +214,6 @@
       </child>
 
       <child>
-	<widget class="GtkHandleBox" id="handlebox1">
-	  <property name="visible">True</property>
-	  <property name="shadow_type">GTK_SHADOW_OUT</property>
-	  <property name="handle_position">GTK_POS_LEFT</property>
-	  <property name="snap_edge">GTK_POS_TOP</property>
-
-	  <child>
 	    <widget class="GtkToolbar" id="toolbar1">
 	      <property name="visible">True</property>
 	      <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
@@ -420,8 +413,6 @@
 		</packing>
 	      </child>
 	    </widget>
-	  </child>
-	</widget>
 	<packing>
 	  <property name="padding">0</property>
 	  <property name="expand">False</property>
-- 
2.43.0


