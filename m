Return-Path: <linux-kbuild+bounces-7743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B1AECFB1
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499253B3BF1
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA26923E35F;
	Sun, 29 Jun 2025 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdZ+xAfj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168223C513;
	Sun, 29 Jun 2025 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222770; cv=none; b=C+zKkEnvI5IfatqfZHKomt5lZwvRaZS6jZvsl9xWG/nKCZJlIuBtTuB6DTx8R6AtcpyjL1jgQGbbfNs5qc6/WlyqeUM6qqyJwwmfORHK8wrM3JM47+Xaoasn53aKq439o+FKgQqWCvWnNFZrK50DPfCkvXociKri3OqX7KKFjMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222770; c=relaxed/simple;
	bh=lYu52VM5uS+Ph+Ha2DQtFx4Adw8Wdn2qoTB8CKvd3gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMv5bG8jw7+Bw47ynLMQpPCL6X6F6I9YtbRrCkb7DRE+aHXjeR3JDoGNIedZnfOYlXg9f6nPN2He2QRu6YUpE9qHTyNusRa1RBfClJYKbgE/naBRJQCaQqTLIUqdFgIHGQLnN3iQYQTbcb+lVCukhefwH1nrNQnf0MuPe5Yyr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdZ+xAfj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5787DC4CEF1;
	Sun, 29 Jun 2025 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222770;
	bh=lYu52VM5uS+Ph+Ha2DQtFx4Adw8Wdn2qoTB8CKvd3gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdZ+xAfj5BSk8AFfldhQftBLEKnw6nbJkQY0TSWy5SuyuxfvwrIjOATSNjPB4KUcY
	 qEKTBqezJFLylMNiKB7M3o/iDJ/lvHnojwOvI20X3KxJJaC9cGfJaIuiCe1ASjZR60
	 F721KPhehYXQ/l9yKne9aCdjEDIwHlAT3slCm9/BKNOagkjQT0q1NuiQQXLFFrGLmF
	 vzhtnPMfENMrNzq0IzYYr/0zY6OiPydYAEAjrGBNuUxjCWUficVVfzy3zVCRmEwLX4
	 uO6k21QVoOdQOmQ7eRXM+iitsSmGLazWIuKNMeEDswe8NqYOl8o28zxhuJbLjW2IFn
	 kYuL9wAXEl88A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] kconfig: gconf: replace GtkHPaned and GtkVPaned with GtkPaned
Date: Mon, 30 Jun 2025 03:43:34 +0900
Message-ID: <20250629184554.407497-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GtkHPaned and GtkVPaned are deprecated with GTK 3.2. [1] [2]

Use GtkPaned instead.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.2.0/gtk/gtkhpaned.c#L44
[2]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.2.0/gtk/gtkvpaned.c#L44

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - A new patch

 scripts/kconfig/gconf.ui | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.ui b/scripts/kconfig/gconf.ui
index 378a3eadf9f8..f2c8342f1103 100644
--- a/scripts/kconfig/gconf.ui
+++ b/scripts/kconfig/gconf.ui
@@ -422,7 +422,7 @@
       </child>
 
       <child>
-	<object class="GtkHPaned" id="hpaned1">
+	<object class="GtkPaned" id="hpaned1">
 	  <property name="width_request">1</property>
 	  <property name="visible">True</property>
 	  <property name="can_focus">True</property>
@@ -453,7 +453,8 @@
 	  </child>
 
 	  <child>
-	    <object class="GtkVPaned" id="vpaned1">
+	    <object class="GtkPaned" id="vpaned1">
+	      <property name="orientation">vertical</property>
 	      <property name="visible">True</property>
 	      <property name="can_focus">True</property>
 
-- 
2.43.0


