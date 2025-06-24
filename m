Return-Path: <linux-kbuild+bounces-7684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 591AFAE6AFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3241C4036D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA502FCFFA;
	Tue, 24 Jun 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maVY78zL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43632FCFF7;
	Tue, 24 Jun 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777754; cv=none; b=TJfq2jp06VzhiXYZXoHwr53u7N8Tzsj8mFSeiyky7oAaCw1Giwk5hnpK8moyevM6L2JPdZGpBruE/Lx5n8SKSlJ8IOV/6BjzZ5gFM0JnTw6uXyOB2IJfJE0UnZItckJo817sIabWYx3LNwi97OA57hWYU1FukK6TBZnUmwfaAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777754; c=relaxed/simple;
	bh=OegY9b6sECR27ULaASx2mhfovD6WCbXKMtUurFTMw8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsmXFJzNmCMQpeQY96k7PLnBgPkHZPlXftcm+Ph9WNF96nXJT+TZ4ZZ3zncxUobpBcMnP7x1KbExulXaUk2fqt8FPzwo1IA6gzyEEjzVkmkDS0H3dcUbNxREUr2Cpn0m/aRnsfsFP8hQum3uQxAQcZV2TUa+MHJeXB0q1EM1LnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maVY78zL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC43C4CEE3;
	Tue, 24 Jun 2025 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777754;
	bh=OegY9b6sECR27ULaASx2mhfovD6WCbXKMtUurFTMw8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=maVY78zLXSs4RKYl4dK0XNtYabqiLdKStwaFiQTQwNEMY/EVqRw43mOxwNac8KTtb
	 SBxUFhFxu/b+NEx/meCFQ3sCbQPt90fe7R2GJ+mJB4Vca6zuwxi5Lql+26q4Ge/JCc
	 HJ35pWhVnoPY5jxC+PRrBAdK51ZXEbDPKVfs7JruoVZea4QK+2rUKFD/vP6C2xC947
	 8KTJ3fD7H6JEHXP1rIgiJZB/U0KppQsctbi8jd98kWvRUefjRMJGzRdAndZI9LpiI0
	 CM95Y+s1w30kpwkntvYs5SJ1ktyuacfraHPqFK1Vb56I2FB2C8MCfAxa0oMHr+KUQZ
	 FrT5BIo91DVZw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 57/66] kconfig: gconf: replace "tooltip" property with "tooltip-text"
Date: Wed, 25 Jun 2025 00:05:45 +0900
Message-ID: <20250624150645.1107002-58-masahiroy@kernel.org>
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

This was replaced with "tooltip-text" in GtkBuilder with GTK 3.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.glade | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index c0ada331a5bf..c3996f4635e9 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -40,7 +40,7 @@
 		  <child>
 		    <widget class="GtkImageMenuItem" id="load1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Load a config file</property>
+		      <property name="tooltip-text" translatable="yes">Load a config file</property>
 		      <property name="label" translatable="yes">_Load</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="L" modifiers="GDK_CONTROL_MASK" signal="activate"/>
@@ -50,7 +50,7 @@
 		  <child>
 		    <widget class="GtkImageMenuItem" id="save1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Save the config in .config</property>
+		      <property name="tooltip-text" translatable="yes">Save the config in .config</property>
 		      <property name="label" translatable="yes">_Save</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="S" modifiers="GDK_CONTROL_MASK" signal="activate"/>
@@ -60,7 +60,7 @@
 		  <child>
 		    <widget class="GtkImageMenuItem" id="save_as1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Save the config in a file</property>
+		      <property name="tooltip-text" translatable="yes">Save the config in a file</property>
 		      <property name="label" translatable="yes">Save _as</property>
 		      <property name="use_underline">True</property>
 		    </widget>
@@ -97,7 +97,7 @@
 		  <child>
 		    <widget class="GtkCheckMenuItem" id="show_name1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show name</property>
+		      <property name="tooltip-text" translatable="yes">Show name</property>
 		      <property name="label" translatable="yes">Show _name</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
@@ -107,7 +107,7 @@
 		  <child>
 		    <widget class="GtkCheckMenuItem" id="show_range1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show range (Y/M/N)</property>
+		      <property name="tooltip-text" translatable="yes">Show range (Y/M/N)</property>
 		      <property name="label" translatable="yes">Show _range</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
@@ -117,7 +117,7 @@
 		  <child>
 		    <widget class="GtkCheckMenuItem" id="show_data1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show value of the option</property>
+		      <property name="tooltip-text" translatable="yes">Show value of the option</property>
 		      <property name="label" translatable="yes">Show _data</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
@@ -133,7 +133,7 @@
 		  <child>
 		    <widget class="GtkRadioMenuItem" id="set_option_mode1">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show normal options</property>
+		      <property name="tooltip-text" translatable="yes">Show normal options</property>
 		      <property name="label" translatable="yes">Show normal options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">True</property>
@@ -143,7 +143,7 @@
 		  <child>
 		    <widget class="GtkRadioMenuItem" id="set_option_mode2">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show all options</property>
+		      <property name="tooltip-text" translatable="yes">Show all options</property>
 		      <property name="label" translatable="yes">Show all _options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
@@ -154,7 +154,7 @@
 		  <child>
 		    <widget class="GtkRadioMenuItem" id="set_option_mode3">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show all options with prompts</property>
+		      <property name="tooltip-text" translatable="yes">Show all options with prompts</property>
 		      <property name="label" translatable="yes">Show all prompt options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
@@ -230,7 +230,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button1">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Goes up of one level (single view)</property>
+		  <property name="tooltip-text" translatable="yes">Goes up of one level (single view)</property>
 		  <property name="label" translatable="yes">Back</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-undo</property>
@@ -266,7 +266,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button2">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Load a config file</property>
+		  <property name="tooltip-text" translatable="yes">Load a config file</property>
 		  <property name="label" translatable="yes">Load</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-open</property>
@@ -283,7 +283,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button3">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Save a config file</property>
+		  <property name="tooltip-text" translatable="yes">Save a config file</property>
 		  <property name="label" translatable="yes">Save</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-save</property>
@@ -319,7 +319,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button4">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Single view</property>
+		  <property name="tooltip-text" translatable="yes">Single view</property>
 		  <property name="label" translatable="yes">Single</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-missing-image</property>
@@ -336,7 +336,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button5">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Split view</property>
+		  <property name="tooltip-text" translatable="yes">Split view</property>
 		  <property name="label" translatable="yes">Split</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-missing-image</property>
@@ -353,7 +353,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button6">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Full view</property>
+		  <property name="tooltip-text" translatable="yes">Full view</property>
 		  <property name="label" translatable="yes">Full</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-missing-image</property>
@@ -389,7 +389,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button7">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Collapse the whole tree in the right frame</property>
+		  <property name="tooltip-text" translatable="yes">Collapse the whole tree in the right frame</property>
 		  <property name="label" translatable="yes">Collapse</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-remove</property>
@@ -406,7 +406,7 @@
 	      <child>
 		<widget class="GtkToolButton" id="button8">
 		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Expand the whole tree in the right frame</property>
+		  <property name="tooltip-text" translatable="yes">Expand the whole tree in the right frame</property>
 		  <property name="label" translatable="yes">Expand</property>
 		  <property name="use_underline">True</property>
 		  <property name="stock_id">gtk-add</property>
-- 
2.43.0


