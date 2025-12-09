Return-Path: <linux-kbuild+bounces-10036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49665CB07C0
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 17:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01E34301EDD4
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 16:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C678426056E;
	Tue,  9 Dec 2025 16:00:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D51B2FFFBE
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Dec 2025 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296017; cv=none; b=FxbUq4H+ATM5gL+4V5+1PaFkoKtN1AWltqmW0KSELES50aDtWIosJBRS60WmuIENibB1dBz/wu1UkKU6Q3HSFO/yc2cMlRkvVYT9PHMrw3ZjSofw81+kUX465bmh4rYOaiHYbEXvSpUGF50pYBHZjketcgQ3tgBpRUq6YUFS5SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296017; c=relaxed/simple;
	bh=WVtm8hD4kZaCBS5grcK0EKQgNTMT33zHKGqgKjUiCOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d7YkBWUZTuphSlYznWKOzl32cG+AXgiPC5w4fjluSHpbfmxW86sUA8xBUP1712SH7OMKjmzSRi2WYlsPPpd2BlTvzV09fR+AtJfKBDVva3tJvMxSEQS+cMBJia9MerVdCTKoWE3MLseqFgZjxzdVlkf27Fr7l9osUslDHH7D19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1vT08B-0006C2-Sj; Tue, 09 Dec 2025 17:00:03 +0100
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Date: Tue, 09 Dec 2025 16:59:45 +0100
Subject: [PATCH] kbuild: fix modules.builtin.modinfo being executable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAHBHOGkC/x3MQQqAIBBA0avErBN0KKKuEi1MxxooDa0IpLsnL
 d/i/wyJIlOCocoQ6ebEwReougKzar+QYFsMKLFVKHuxB8veBUEPmevU80YCLWrXNaqVRkIJj0i
 On386Tu/7AaKnrk5kAAAA
X-Change-ID: 20251209-modinfo-executable-2d2af74150c0
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: f.pfitzner@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Since commit a26a6c93edfe ("kbuild: Strip trailing padding bytes from
modules.builtin.modinfo") the resulting modules.builtin.modinfo file gets
copied by objcopy resulting in an executable file.

It seems, that objcopy detects this file as executable even though
the file is not executable at all.

This problem arises on x86_64 and arm-v7a, but for some reason does not
happen on aarch64.

Fix this problem by removing the execution bit afterwards.

Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
---
 scripts/Makefile.vmlinux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91dadcf4e83a39142f9d7bc61ffed0..7ee6aad760495ac5357132954c32ff879d24f72e 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -113,6 +113,7 @@ vmlinux: vmlinux.unstripped FORCE
 # what kmod expects to parse.
 quiet_cmd_modules_builtin_modinfo = GEN     $@
       cmd_modules_builtin_modinfo = $(cmd_objcopy); \
+                                    chmod -x $@; \
                                     sed -i 's/\x00\+$$/\x00/g' $@
 
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary

---
base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
change-id: 20251209-modinfo-executable-2d2af74150c0

Best regards,
-- 
Fabian Pfitzner <f.pfitzner@pengutronix.de>


