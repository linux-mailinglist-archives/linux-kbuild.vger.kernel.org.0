Return-Path: <linux-kbuild+bounces-5092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7F9EEDE3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 16:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136FB1659D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F27D222D64;
	Thu, 12 Dec 2024 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnZjfeyD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A9222D5A;
	Thu, 12 Dec 2024 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018388; cv=none; b=IpXN0TxmDK4rHqg7kYsv5nEfK+SUO6ZnIE1n8pufBCVyfdtIiR7X0qUTe/QPGsH7ZkzNa385rNLJmnQiXEZPcaDz9Oc6QQPm/EevEuyLaYk/l7P9gd8afKjpO5sRQcvwGnff4hINXPCbhmbXIwE6VJTTXtqZ+uyxnVPRnmVHh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018388; c=relaxed/simple;
	bh=cjecqa6KE7wIp2HpyNXNQYhAziNBUeuWWVeG1WO0qNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ij0EGKlzKX4bRbKhYOg6wApxmDsLY1WZAeqLlq8igVUx7zraf4Gl5B3H6sCObhYN/828DgQUaKrkVyqClcPWxmv2tbvt5AUh9rXw/Ak76VC9wIW9UfkDBihfbL1AGp6yAvdo+wx75K1tYUlN3kaxZt55RrjJyvwlaEbSF4LCQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnZjfeyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C18C4CECE;
	Thu, 12 Dec 2024 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734018387;
	bh=cjecqa6KE7wIp2HpyNXNQYhAziNBUeuWWVeG1WO0qNY=;
	h=From:To:Cc:Subject:Date:From;
	b=KnZjfeyDQ9BaHtyuEpEMLvlY6LC+tHS2X4tKhvxPDusDAWqYzUBrXcWLlyERy8b/A
	 2/6/K78LWeZmkHOttwgpMYFpc83HUzYV1cBY8oDScDZQ+DZaMzCpl02+cwDucA/gLg
	 4m1loFi22DScXg2r4zLw+eX7R0aouY4vJc7G7VUm9TSlldM/bySP4Tin7vt4On5Z6p
	 C72hCNwnGcZB1Qv89N0FttrpqO6JKdTV0e8/Qo5bNUt9JVIqt4s6wkMdGCXv3KLQIg
	 +iADGYuOobrzcZHGc4UCIxnQfftmvo5m9/SzsmLJNSCqMU7ICtScTFlU5ICEjLJkg/
	 MVJcrkUk5dhCw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: distinguish same module paths from different dump files
Date: Fri, 13 Dec 2024 00:46:15 +0900
Message-ID: <20241212154619.2235767-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 13b25489b6f8 ("kbuild: change working directory to external
module directory with M="), module paths are always relative to the top
of the external module tree.

The module paths recorded in Module.symvers is no longer globally unique
when they are passed via KBUILD_EXTRA_SYMBOLS for building other external
modules, which may result in false positive "exported twice" errors.
Such errors should not occur because external modules should be able to
override in-tree modules.

To address this, record the dump file path in struct module and check it
when searching for a module.

Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/eb21a546-a19c-40df-b821-bbba80f19a3d@nvidia.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 17 +++++++++--------
 scripts/mod/modpost.h |  3 ++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fb787a5715f5..94ee49207a45 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -155,12 +155,13 @@ char *get_line(char **stringp)
 /* A list of all modules we processed */
 LIST_HEAD(modules);
 
-static struct module *find_module(const char *modname)
+static struct module *find_module(const char *filename, const char *modname)
 {
 	struct module *mod;
 
 	list_for_each_entry(mod, &modules, list) {
-		if (strcmp(mod->name, modname) == 0)
+		if (!strcmp(mod->dump_file, filename) &&
+		    !strcmp(mod->name, modname))
 			return mod;
 	}
 	return NULL;
@@ -2030,10 +2031,10 @@ static void read_dump(const char *fname)
 			continue;
 		}
 
-		mod = find_module(modname);
+		mod = find_module(fname, modname);
 		if (!mod) {
 			mod = new_module(modname, strlen(modname));
-			mod->from_dump = true;
+			mod->dump_file = fname;
 		}
 		s = sym_add_exported(symname, mod, gpl_only, namespace);
 		sym_set_crc(s, crc);
@@ -2052,7 +2053,7 @@ static void write_dump(const char *fname)
 	struct symbol *sym;
 
 	list_for_each_entry(mod, &modules, list) {
-		if (mod->from_dump)
+		if (mod->dump_file)
 			continue;
 		list_for_each_entry(sym, &mod->exported_symbols, list) {
 			if (trim_unused_exports && !sym->used)
@@ -2076,7 +2077,7 @@ static void write_namespace_deps_files(const char *fname)
 
 	list_for_each_entry(mod, &modules, list) {
 
-		if (mod->from_dump || list_empty(&mod->missing_namespaces))
+		if (mod->dump_file || list_empty(&mod->missing_namespaces))
 			continue;
 
 		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
@@ -2194,7 +2195,7 @@ int main(int argc, char **argv)
 		read_symbols_from_files(files_source);
 
 	list_for_each_entry(mod, &modules, list) {
-		if (mod->from_dump || mod->is_vmlinux)
+		if (mod->dump_file || mod->is_vmlinux)
 			continue;
 
 		check_modname_len(mod);
@@ -2205,7 +2206,7 @@ int main(int argc, char **argv)
 		handle_white_list_exports(unused_exports_white_list);
 
 	list_for_each_entry(mod, &modules, list) {
-		if (mod->from_dump)
+		if (mod->dump_file)
 			continue;
 
 		if (mod->is_vmlinux)
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 49848fcbe2a1..8b72c227ebf4 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -95,14 +95,15 @@ struct module_alias {
 /**
  * struct module - represent a module (vmlinux or *.ko)
  *
+ * @dump_file: path to the .symvers file if loaded from a file
  * @aliases: list head for module_aliases
  */
 struct module {
 	struct list_head list;
 	struct list_head exported_symbols;
 	struct list_head unresolved_symbols;
+	const char *dump_file;
 	bool is_gpl_compatible;
-	bool from_dump;		/* true if module was loaded from *.symvers */
 	bool is_vmlinux;
 	bool seen;
 	bool has_init;
-- 
2.43.0


