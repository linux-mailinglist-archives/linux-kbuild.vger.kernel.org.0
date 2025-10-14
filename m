Return-Path: <linux-kbuild+bounces-9120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02217BD88D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 11:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6A3408BA4
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 09:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF5C3081B7;
	Tue, 14 Oct 2025 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="XetqUFTe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43192ECD1B;
	Tue, 14 Oct 2025 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435130; cv=none; b=dRNlAOb7aMPYZXnrMe58ZbWCclKp0/aTfwDuL2Ihqhuema2M5Gs5bWrbDzbS/RNPttd/lhA8MtTcL7oGM4LM5QZDw/awoCWNbBUvkho6nsPr9jfuU34As/Zt5m6s6idww9GFixmWGOYoZ9hk66NUQ47i1ExgjCB5p9lx5g6yTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435130; c=relaxed/simple;
	bh=CdJERmWvNp7t0aS7szl7vFW60Q5hzog8gZxLGjoRqyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1Jr91nlvvhVv40XM7c98kZa6leryByKOliFOJx4XgMwxfq0/38fBwGTN6ugxulkM+S8cEf1VVPIaKIp5XCInAfekvsqp79jPfOk0ohFKl/qfZs2bUaTlcFgmx77mJXiTIrMCsMzoJ/Ld/03H+p71jJrzzFI1TB2rFGQdaaDhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=XetqUFTe; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id A044F1FD0A;
	Tue, 14 Oct 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1760435119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZNxn908i10T5ef/uzJnec8IbaWn/a7A52AraZk7MdQ=;
	b=XetqUFTe0JfS3FKDc8kSnMhqQgEpNh76KiAwGnkdQ7a6sziShiHeFZFYTeG4aujA1e6b2G
	YYrbqU9aHAdfiu8nlscq9yS7G6eg+pAWPeJU//GmGzKG0d3M8abo0qMLAZMrGJPkY4f+G6
	HV94vfL1Qb8bhW05x9B/Sgu/005W0D/lzJ2ES3zOg5u6c1uklxUJLvnrRutc8ejO0IKoW5
	kBRr0Pe6HE7k5Yh9gYUTguFLpYEm7wccFj05BOMnSHfpOr3MXXhHNZvjooqBS7l5GgeK7j
	ha15lIJOJQ9JGktJiwwjVCqzJUla4p1WxPR7oRsRrHkIXzX/NucVwfToV+lIMg==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER option
Date: Tue, 14 Oct 2025 11:45:11 +0200
Message-ID: <20251014094511.627258-2-gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014094511.627258-1-gtucker@gtucker.io>
References: <20251014094511.627258-1-gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

Add scripts/Makefile.container to wrap the make command in a container
using the CONTAINER= variable to specify the image name.  For example:

    make -f scripts/Makefile.container CONTAINER=korg-gcc defconfig

The container image name is entirely arbitrary and the container tool
may be Docker, Podman or any other compatible alternative specified by
the CONTAINER_COMMAND variable.  The default is set to docker for now.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/Makefile.container | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 scripts/Makefile.container

diff --git a/scripts/Makefile.container b/scripts/Makefile.container
new file mode 100644
index 000000000000..711cf9188016
--- /dev/null
+++ b/scripts/Makefile.container
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONTAINER),)
+$(error "Usage: make CONTAINER=<container-image-name> [...]")
+endif
+CONTAINER_COMMAND ?= docker
+PHONY := __all
+
+__all:
+%:
+	@echo Running in $(CONTAINER_COMMAND) $(CONTAINER)
+	@$(CONTAINER_COMMAND) run -it -v $(PWD):/src -w /src \
+	$(CONTAINER) $(MAKE) \
+	$(subst CONTAINER=$(CONTAINER),,$(MAKEFLAGS)) \
+	$(GNUMAKEFLAGS) $(MAKECMDGOALS)
-- 
2.47.3


