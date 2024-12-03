Return-Path: <linux-kbuild+bounces-4957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACD9E191F
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA601285E08
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EB91E200F;
	Tue,  3 Dec 2024 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SErINJVf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E21E2009;
	Tue,  3 Dec 2024 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221303; cv=none; b=cXslxiPmtgx6qapRhVOHcxmqjU5/YNFNx3ZiDfBQIlI0tOfgnDjdqw/a2iv3iKEG2Nxxe2w9PF3p1GttJKB75n7MIp2Hi4YfDQWU6fOdKLCdHEz3Vl8hHvyDdYu9ubceeNOYnMy7MEMT3zsNGgDmUfGGEGIG18V0YNowMxr9yBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221303; c=relaxed/simple;
	bh=YmjM2Lrggb9Gs+pcn5M2jdP/zJRW6qkZGASAf5l4m6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkRLleSg0agGRuTSQ1wP2TykI1TYsp/WPCuf7idbdw76tQSvwhIwHsKcXaeOvcFY7E1THJyfCToFI+bn6T9AbCAjwSyXjyQgFGjvlQlYKLw2XTULCZ1gy5/yxFyM08wfRO0ViCxVcSKOPFXYdp6leKtr0mxpk7phdlHCRyhSKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SErINJVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86326C4CED8;
	Tue,  3 Dec 2024 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733221303;
	bh=YmjM2Lrggb9Gs+pcn5M2jdP/zJRW6qkZGASAf5l4m6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SErINJVfV7uMV3ZDrZxVUKw9bMP5opZuBdHDPIeqi0Hc+umJUsVE9A1y3IR6C1gGu
	 XwLtt3XUECGrm/X1XVXjqoi9MwnG5Q03CL2CaEZ6rlEPuK/tgracLoLiJ7CMjrgjvH
	 KqumyP8kbpigHykGESNzHWcbxosDTjcOBJO9QlkAuEavodgbLplLakJd34YSD+yKA0
	 vnpWKr8aAmMr8Oc//OpYU5uQoR8E/PrVsWZGCydOALvuzb/3/Pdw9ESXiqGGGoGOAq
	 tXjaZCZ6vsWCC0PP0DRjDpMZ33Vbf4XZhSE0+2OLBmjYrpsSpryjquImKivoVJj4uz
	 Xc4l14HMgYK2Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthias Maennich <maennich@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] doc: module: revert misconversions for MODULE_IMPORT_NS()
Date: Tue,  3 Dec 2024 19:21:06 +0900
Message-ID: <20241203102124.3147478-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203102124.3147478-1-masahiroy@kernel.org>
References: <20241203102124.3147478-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts the misconversions introduced by commit cdd30ebb1b9f
("module: Convert symbol namespace to string literal").

The affected descriptions refer to MODULE_IMPORT_NS() tags in general,
rather than suggesting the use of the empty string ("") as the namespace.

Fixes: cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/core-api/symbol-namespaces.rst                  | 4 ++--
 .../translations/it_IT/core-api/symbol-namespaces.rst         | 4 ++--
 .../translations/zh_CN/core-api/symbol-namespaces.rst         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index d04639fd8a41..55886b4e6aea 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -106,7 +106,7 @@ inspected with modinfo::
 	[...]
 
 
-It is advisable to add the MODULE_IMPORT_NS("") statement close to other module
+It is advisable to add the MODULE_IMPORT_NS() statement close to other module
 metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
 5. for a way to create missing import statements automatically.
 
@@ -128,7 +128,7 @@ enable loading regardless, but will emit a warning.
 Missing namespaces imports can easily be detected at build time. In fact,
 modpost will emit a warning if a module uses a symbol from a namespace
 without importing it.
-MODULE_IMPORT_NS("") statements will usually be added at a definite location
+MODULE_IMPORT_NS() statements will usually be added at a definite location
 (along with other module meta data). To make the life of module authors (and
 subsystem maintainers) easier, a script and make target is available to fixup
 missing imports. Fixing missing imports can be done with::
diff --git a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
index 55a7978c662b..df152c2c55db 100644
--- a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
@@ -107,7 +107,7 @@ modinfo::
 	[...]
 
 
-Si consiglia di posizionare la dichiarazione MODULE_IMPORT_NS("") vicino
+Si consiglia di posizionare la dichiarazione MODULE_IMPORT_NS() vicino
 ai metadati del modulo come MODULE_AUTHOR() o MODULE_LICENSE(). Fate
 riferimento alla sezione 5. per creare automaticamente le importazioni
 mancanti.
@@ -131,7 +131,7 @@ emetterà un avviso.
 La mancanza di un'importazione può essere individuata facilmente al momento
 della compilazione. Infatti, modpost emetterà un avviso se il modulo usa
 un simbolo da uno spazio dei nomi che non è stato importato.
-La dichiarazione MODULE_IMPORT_NS("") viene solitamente aggiunta in un posto
+La dichiarazione MODULE_IMPORT_NS() viene solitamente aggiunta in un posto
 ben definito (assieme agli altri metadati del modulo). Per facilitare
 la vita di chi scrive moduli (e i manutentori di sottosistemi), esistono uno
 script e un target make per correggere le importazioni mancanti. Questo può
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
index 5e698f58b3fe..fc7f3797dcee 100644
--- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -99,7 +99,7 @@
        [...]
 
 
-建议将 MODULE_IMPORT_NS("") 语句添加到靠近其他模块元数据定义的地方，
+建议将 MODULE_IMPORT_NS() 语句添加到靠近其他模块元数据定义的地方，
 如 MODULE_AUTHOR() 或 MODULE_LICENSE() 。关于自动创建缺失的导入
 语句的方法，请参考第5节。
 
@@ -118,7 +118,7 @@ EINVAL方式失败。要允许加载不满足这个前提条件的模块，可
 
 缺少命名空间的导入可以在构建时很容易被检测到。事实上，如果一个模块
 使用了一个命名空间的符号而没有导入它，modpost会发出警告。
-MODULE_IMPORT_NS("")语句通常会被添加到一个明确的位置（和其他模块元
+MODULE_IMPORT_NS()语句通常会被添加到一个明确的位置（和其他模块元
 数据一起）。为了使模块作者（和子系统维护者）的生活更加轻松，我们提
 供了一个脚本和make目标来修复丢失的导入。修复丢失的导入可以用::
 
-- 
2.43.0


