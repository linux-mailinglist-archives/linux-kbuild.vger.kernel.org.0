Return-Path: <linux-kbuild+bounces-8019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECEB080FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A89464E40CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA002EF9C2;
	Wed, 16 Jul 2025 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op9eM30G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7D2EF9B4;
	Wed, 16 Jul 2025 23:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708350; cv=none; b=gfyRfPk4Q0oM5vwGYb6nTbzil+jm21k2ZSKkAqGFqlhTDPIivLi62+x09ARCfqjno+GbuczM8RKjEIsvbpDJKihHZoUnA1lIjONg5L2hVMlW/DahDzSV3ifkyO5kxeWwJXk70nBaIcNF8dMUbkhy2p+Y1KQAqudzWfxmkuDTJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708350; c=relaxed/simple;
	bh=PRD69IubuS+YNJtEC0NEviliKBWdcEJiUbDlYw7l21o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQx3LHuZhak5Wb/FKh8QTmc3/uXuGSLWmMsMCYLXWxXiMeu1hj7jUsL1ETtFcdMP6TsUb1wBaNPc70yXfeGn3Il3EFx7qw734ZDWfQjCwkHK0Pc5rCdXxD8aIhxh/4879RL67vuAywcCkR6WPKky5eFA4QTD3cslfSvKj0j462g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op9eM30G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84D8C4CEE7;
	Wed, 16 Jul 2025 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708349;
	bh=PRD69IubuS+YNJtEC0NEviliKBWdcEJiUbDlYw7l21o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=op9eM30GwKmxtizZW7/YIYpt6vAkaoCaf4NNR0SGAkumVWLXXNtghDuAEeSV6CRIQ
	 deVjFlJjbF/mbll+qjUCRKlY359fH1OgDk5rTQ8IutoVLyK6MZihO8ktvGU6QZwr1l
	 pSSypkQXDiOuXiD6WBTSDbkaDlL7ne0gw3HCp5toJBWjTxwXHt3s7Auq8Vdpi5fJyl
	 V+x6V6beYTlyR5bYhjuOLu7b0LJ5CaahHWhVsZuLeHNBmcLqvUAVDdW8SC2niqL9rB
	 7imVHT4+t35sucuPn01NoYtO6C2U494TWKn1rpKkepJKEwlZOz3nmVduS0bDnz47PW
	 5ktd7AvfN7ILw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] kconfig: gconf: replace GtkImageMenuItem with GtkMenuItem
Date: Thu, 17 Jul 2025 08:24:10 +0900
Message-ID: <20250716232542.873747-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716232542.873747-1-masahiroy@kernel.org>
References: <20250716232542.873747-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GtkImageMenuItem is deprecated with GTK 3.10. [1]

Use GtkMenuItem instead.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.10.0/gtk/deprecated/gtkimagemenuitem.c#L797

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.ui | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/gconf.ui b/scripts/kconfig/gconf.ui
index c37807e8b782..ab4431255fa7 100644
--- a/scripts/kconfig/gconf.ui
+++ b/scripts/kconfig/gconf.ui
@@ -39,7 +39,7 @@
 		<object class="GtkMenu" id="file1_menu">
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="load1">
+		    <object class="GtkMenuItem" id="load1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Load a config file</property>
 		      <property name="label" translatable="yes">_Load</property>
@@ -49,7 +49,7 @@
 		  </child>
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="save1">
+		    <object class="GtkMenuItem" id="save1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Save the config in .config</property>
 		      <property name="label" translatable="yes">_Save</property>
@@ -59,7 +59,7 @@
 		  </child>
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="save_as1">
+		    <object class="GtkMenuItem" id="save_as1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Save the config in a file</property>
 		      <property name="label" translatable="yes">Save _as</property>
@@ -74,7 +74,7 @@
 		  </child>
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="quit1">
+		    <object class="GtkMenuItem" id="quit1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Quit</property>
 		      <property name="use_underline">True</property>
@@ -178,7 +178,7 @@
 		<object class="GtkMenu" id="help1_menu">
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="introduction1">
+		    <object class="GtkMenuItem" id="introduction1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Introduction</property>
 		      <property name="use_underline">True</property>
@@ -187,7 +187,7 @@
 		  </child>
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="about1">
+		    <object class="GtkMenuItem" id="about1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_About</property>
 		      <property name="use_underline">True</property>
@@ -196,7 +196,7 @@
 		  </child>
 
 		  <child>
-		    <object class="GtkImageMenuItem" id="license1">
+		    <object class="GtkMenuItem" id="license1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_License</property>
 		      <property name="use_underline">True</property>
-- 
2.43.0


