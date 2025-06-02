Return-Path: <linux-kbuild+bounces-7341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C56ACAEA0
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 15:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584BA1891A80
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9871224893;
	Mon,  2 Jun 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGOPujj8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C822424C;
	Mon,  2 Jun 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869611; cv=none; b=TmOrdkypOKYbEfkS76XzfLTJEzxsbsv7uom/TX28NAo47q62UnJKDIz2qf26Uz+HVRwoZc+6wLYwe1FpWoUJA61Q83TFraafDJkXaCv8/cR6jtUjlF8Zrai3k4mN0LY5HzuIxZvcJMANa67bMwyLA3vacAzSazvT5MDq/O+2Pts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869611; c=relaxed/simple;
	bh=ADbnYsa65bvXTe9eG8sDy/Kp7GEJDwl9jGtzi10wXjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p83JmR9I0S+6LEp6GYd7V2LeQPMLbFSdqO4IfclvAE2jZ4z7KE+M1h7u6bl9HC6cb/0GBHYyr++6PZubbidN8voGKcmrbAVBm1IqCcauPvXp9kflo1HT04Qc75tKlRc8cufJnPcfP3qkOKgEn32EFeTuZPFdEg15hmTEuZNyEf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGOPujj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E786FC4CEF3;
	Mon,  2 Jun 2025 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748869611;
	bh=ADbnYsa65bvXTe9eG8sDy/Kp7GEJDwl9jGtzi10wXjs=;
	h=From:To:Cc:Subject:Date:From;
	b=qGOPujj8rbuPfdNJjqeofvAKW6x8xdVNIfLO5ycjZLdaMWmEhIz8o+nvSr+l7s25g
	 6hb+YZmasJf99KJ42h3KvLU1wQYcdPFmPRgETB4gaoOVsdhL00v+tNS05gtWBYL2DG
	 zkhYQX7oc5gB7u+yktAOcgRVhFFrjOj1ByZxiwmCOxxf7IztLpAOqC/iq4YuvXmUY8
	 UiymrO/+O0QxpJV10OT54V6bagM5CiqsioXsiVjF18n6ffgOa2peyU1xSYldeotI5a
	 V9Z+SDA7rjVmwJZ8zIxOWRLNf/0WsAYHcdzbCBUDVSqdB3Hqo73wxqCWTOyAHTD4Qb
	 cq/UMDxcuxHyA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org
Subject: [PATCH] kbuild: stop module name mangling
Date: Mon,  2 Jun 2025 22:06:02 +0900
Message-ID: <20250602130609.402581-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the old days, KBUILD_MODNAME was passed to C without double quotes,
and then handled by __stringify() on the C side. This was the reason
why KBUILD_MODNAME was mangled: characters such as commas (,) and
hyphens (-) are not allowed in C identifiers, so they were replaced
with underscores (_) in Kbuild.

Since commit f83b5e323f57 ("kbuild: set correct KBUILD_MODNAME when
using well known kernel symbols as module names"), KBUILD_MODNAME has
been passed to C as a string literal, which allows any characters.

Aside from this historical behavior in the build system, there is no
longer a reason for mangling. In fact, it is rather annoying, as we
now need to convert between hyphens and underscores in some places,
but not in others. See commit 0267cbf297bf ("module: Account for the
build time module name mangling").

This commit eliminates that oddity, so the module name will now match
the filename. For example, the module name of "foo-bar.ko" will be
"foo-bar", not "foo_bar".

However, this oddity persisted for so long and also affected the
userspace. To adapt to this behavior, when a user runs "rmmod foo-bar",
kmod converts hyphens to underscores, and passes "foo_bar" to the
delete_module syscall.

Therefore, the mod_strncmp() needs to remain in find_module_all(),
otherwise, we cannot unload modules.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/module/main.c | 8 ++++++--
 scripts/Makefile.lib | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index b8440b0887e3..1fa90a95e0c5 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -410,7 +410,11 @@ struct module *find_module_all(const char *name, size_t len,
 				lockdep_is_held(&module_mutex)) {
 		if (!even_unformed && mod->state == MODULE_STATE_UNFORMED)
 			continue;
-		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
+		/*
+		 * For historical reasons, kmod passes a module name with
+		 * a hyphen replaced with an underscore.
+		 */
+		if (!mod_strncmp(mod->name, name, len))
 			return mod;
 	}
 	return NULL;
@@ -1135,7 +1139,7 @@ static bool module_match(const char *modname, const char *patterns)
 		if (*sep)
 			sep++;
 
-		if (mod_strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
+		if (strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
 			return true;
 	}
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 336fb0d763c7..e37e2db5f528 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -18,8 +18,8 @@ target-stem = $(basename $(patsubst $(obj)/%,%,$@))
 # end up in (or would, if it gets compiled in)
 name-fix-token = $(subst $(comma),_,$(subst -,_,$1))
 name-fix = $(call stringify,$(call name-fix-token,$1))
-basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
-modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname)) \
+basename_flags = -DKBUILD_BASENAME=$(call stringify,$(basetarget))
+modname_flags  = -DKBUILD_MODNAME=$(call stringify,$(modname)) \
 		 -D__KBUILD_MODNAME=kmod_$(call name-fix-token,$(modname))
 modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
 
-- 
2.43.0


