Return-Path: <linux-kbuild+bounces-11126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHlqL3YojWmEzgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11126-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:10:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6A128C97
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D6E30AEE8A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 01:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45C61E47CC;
	Thu, 12 Feb 2026 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyF4+crk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C81D5174;
	Thu, 12 Feb 2026 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858599; cv=none; b=QiChVP1Lzqs7/BEnyx5T1vFabVvFPcAbILx5qCaCddq9CvENK0Qwoybj7i+Ed8g98jfAlYTOnu+gsWZurS4vSHtJQoKm/MNlFwKZGbyOQ3+pZaReT2Fqf32BCuu54r+ojLKWbFNg24qtUixG+zBreb4843AWTChIMYtn5LXp31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858599; c=relaxed/simple;
	bh=Xk6C0tLZl0mcPul5b73YwJ7OykcI6cowwrKSzOOhHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atSwUN5hJNhUmu9Eb1yYuRc8GLDqksxTfSZrT0d+BvbxkwlxbdnlMWOBw5MjUY7Gn888LUbH1h5W3TgSjJAcoqFstdtRGD7OvuRkUkOYmIgc5o4iL9NJe/xWT+b8SY0sFQbWAvttbBVfFLLVdPGIVStssg1M5YinM5uPCMll4DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyF4+crk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8037DC19423;
	Thu, 12 Feb 2026 01:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770858599;
	bh=Xk6C0tLZl0mcPul5b73YwJ7OykcI6cowwrKSzOOhHLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qyF4+crk4tum6+JV8I8ShusljSA54LAndWhLcV9hn18rMLHS613PfJwiyttYbWLPf
	 3+iYQD/cRVGIjBAlKbhUWsTzfzkKErxsv5MMc8ndExChZ92qwihZA461A1dQrF14YZ
	 MttccQmQ8lg34dUGwyju5g7ZBr5WHdWXnSj2uRBNciP5P0vZY9xEZBURco/Z6kqXLI
	 nfsIc67TGbLzOBfss+D5oQdn6tTwjgE0/CAppHQGinwa6c7Kn6TarKximKZgt3Y0SH
	 CtXuV/1/xV1ky2FwORbRpWxf0IV3FUP85gaIxY888M9XwjTjstafuTRidEaDTgVgZe
	 9239zV3RQOrkg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sami Tolvanen <samitolvanen@google.com>,
	=?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] gendwarfksyms: Fix build on 32-bit hosts
Date: Wed, 11 Feb 2026 20:09:25 -0500
Message-ID: <20260212010955.3480391-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212010955.3480391-1-sashal@kernel.org>
References: <20260212010955.3480391-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11126-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 65F6A128C97
X-Rspamd-Action: no action

From: Sami Tolvanen <samitolvanen@google.com>

[ Upstream commit ddc54f912a551f6eb0bbcfc3880f45fe27a252cb ]

We have interchangeably used unsigned long for some of the types
defined in elfutils, assuming they're always 64-bit. This obviously
fails when building gendwarfksyms on 32-bit hosts. Fix the types.

Reported-by: Michal Suchánek <msuchanek@suse.de>
Closes: https://lore.kernel.org/linux-modules/aRcxzPxtJblVSh1y@kitsune.suse.cz/
Tested-by: Michal Suchánek <msuchanek@suse.de>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Let me write my analysis.

---

## Comprehensive Analysis

### 1. COMMIT MESSAGE ANALYSIS

The subject "gendwarfksyms: Fix build on 32-bit hosts" clearly
identifies this as a **build fix**. The message explains that `unsigned
long` was used interchangeably with elfutils types that are always
64-bit (`uint64_t`), which breaks compilation on 32-bit hosts where
`unsigned long` is only 32 bits.

Key indicators:
- **Reported-by:** Michal Suchanek (SUSE engineer) - a real user who hit
  this building kernels
- **Tested-by:** Same reporter - confirms the fix works
- **Closes:** link to lore.kernel.org bug report - documented issue

### 2. CODE CHANGE ANALYSIS

The fix addresses three distinct but related 32-bit portability bugs
across two files:

**Bug 1 - `dwarf.c` (`process_enumerator_type`):**

The type chain is:
- `Dwarf_Word` = `GElf_Xword` = `Elf64_Xword` = `uint64_t` (always
  64-bit)
- `unsigned long` = 32-bit on 32-bit hosts

The pre-fix code passes `&value` (where `value` is `Dwarf_Word` /
`uint64_t`) to `kabi_get_enumerator_value()`, which expects `unsigned
long *`. On a 32-bit host, this is a type mismatch: passing a
`uint64_t*` where `unsigned long*` (4 bytes) is expected. The function
would write only 4 bytes to a memory location expected to hold 8 bytes,
leaving the upper half uninitialized. This is both a **compiler
error/warning** and a **correctness bug**.

The fix introduces a properly-typed `unsigned long override` variable,
passes it to the function, then assigns `value = override;` to widen it
back.

**Bug 2 - `symbols.c` (format strings):**

`shdr->sh_entsize` is `GElf_Xword` = `uint64_t`, but was printed with
`%lu` (expects `unsigned long`, 32-bit). Fixed to `"%" PRIu64`.
Similarly, `sym->addr.address` is `Elf64_Addr` = `uint64_t`, but was
printed with `%lx`. Fixed to `"%" PRIx64`. The missing `#include
<inttypes.h>` is added for the `PRIu64`/`PRIx64` macros.

On 32-bit hosts, these format mismatches would cause:
- Compiler warnings (`-Wformat`) or errors (`-Werror`)
- Incorrect printed values (reading wrong stack slots for variadic args)

### 3. CLASSIFICATION

This is unambiguously a **build fix**. Build fixes are explicitly listed
in the stable kernel rules as appropriate for backporting. They don't
introduce new features or change runtime behavior - they simply make the
code compile correctly.

### 4. SCOPE AND RISK ASSESSMENT

- **Files changed:** 2 (`dwarf.c`, `symbols.c`)
- **Lines changed:** ~10 meaningful lines
- **Risk:** Extremely low. The changes are format specifier corrections
  and a type-narrowing variable addition. They cannot introduce
  regressions.
- **Subsystem:** `scripts/gendwarfksyms/` - a build-time host tool, not
  runtime kernel code. Even if there were a mistake, it couldn't crash
  the kernel.

### 5. APPLICABILITY TO STABLE TREES

`gendwarfksyms` was introduced in **v6.14-rc1** (commit
`f28568841ae0a`). I verified:
- **v6.12 and earlier (LTS):** Do NOT have `gendwarfksyms` - this fix is
  **not applicable**
- **v6.14 through v6.19:** All have the buggy code - this fix IS
  applicable

The buggy code (`%lu` formats, `Dwarf_Word`/`unsigned long` mismatch)
has existed since the initial introduction in v6.14-rc1. All three bug
patterns exist in `git show v6.14:scripts/gendwarfksyms/symbols.c` and
`git show v6.14:scripts/gendwarfksyms/dwarf.c`.

Active stable trees that benefit: **v6.18.y** (and potentially v6.14.y
through v6.17.y if still maintained).

### 6. USER IMPACT

This affects anyone building a 6.14+ kernel on a 32-bit host system with
`CONFIG_GENDWARFKSYMS` enabled. While 32-bit build hosts are
increasingly rare, they are still used in some enterprise and embedded
development environments. The reporter is from SUSE, indicating this
affects enterprise distribution builds. Without this fix, the build
simply **fails** on 32-bit hosts.

### 7. DEPENDENCY CHECK

The fix is completely self-contained. It changes format specifiers, adds
a standard C include, and introduces a temporary variable. It has **zero
dependencies** on other commits.

### 8. VERDICT

**Meets stable criteria:**
- Obviously correct and tested (type/format corrections, Tested-by tag)
- Fixes a real bug (build failure on 32-bit hosts + potential incorrect
  behavior)
- Small and contained (~10 lines across 2 files)
- No new features, no API changes, no behavioral changes
- Build fixes are explicitly allowed in stable

**Risk vs. benefit:**
- Risk: Near zero - trivial type corrections in a host build tool
- Benefit: Enables building the kernel on 32-bit hosts when
  gendwarfksyms is enabled

The only limitation is that this fix is only applicable to stable trees
v6.14.y and newer, since `gendwarfksyms` doesn't exist in the main LTS
trees (6.12.y, 6.6.y, 6.1.y). But for the trees where it applies, it's a
clear and necessary build fix.

**YES**

 scripts/gendwarfksyms/dwarf.c   | 4 +++-
 scripts/gendwarfksyms/symbols.c | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 3538a7d9cb070..e76d732f5f602 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -750,6 +750,7 @@ static void process_enumerator_type(struct state *state, struct die *cache,
 				    Dwarf_Die *die)
 {
 	bool overridden = false;
+	unsigned long override;
 	Dwarf_Word value;
 
 	if (stable) {
@@ -761,7 +762,8 @@ static void process_enumerator_type(struct state *state, struct die *cache,
 			return;
 
 		overridden = kabi_get_enumerator_value(
-			state->expand.current_fqn, cache->fqn, &value);
+			state->expand.current_fqn, cache->fqn, &override);
+		value = override;
 	}
 
 	process_list_comma(state, cache);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index ecddcb5ffcdfb..42cd27c9cec4f 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <inttypes.h>
 #include "gendwarfksyms.h"
 
 #define SYMBOL_HASH_BITS 12
@@ -242,7 +243,7 @@ static void elf_for_each_global(int fd, elf_symbol_callback_t func, void *arg)
 				error("elf_getdata failed: %s", elf_errmsg(-1));
 
 			if (shdr->sh_entsize != sym_size)
-				error("expected sh_entsize (%lu) to be %zu",
+				error("expected sh_entsize (%" PRIu64 ") to be %zu",
 				      shdr->sh_entsize, sym_size);
 
 			nsyms = shdr->sh_size / shdr->sh_entsize;
@@ -292,7 +293,7 @@ static void set_symbol_addr(struct symbol *sym, void *arg)
 		hash_add(symbol_addrs, &sym->addr_hash,
 			 symbol_addr_hash(&sym->addr));
 
-		debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
+		debug("%s -> { %u, %" PRIx64 " }", sym->name, sym->addr.section,
 		      sym->addr.address);
 	} else if (sym->addr.section != addr->section ||
 		   sym->addr.address != addr->address) {
-- 
2.51.0


