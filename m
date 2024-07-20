Return-Path: <linux-kbuild+bounces-2598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B7937FAF
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 09:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79CD1281E46
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 07:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297F1101E4;
	Sat, 20 Jul 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHU9noTN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A7179AF;
	Sat, 20 Jul 2024 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721460510; cv=none; b=AnX7bzljQM/4Kw5A5CCC8vb8bIP0joazmrq6Flq4FB7VZ+aaDo5JEAUbRIEv6uyNs2ZKeRpaUClWExz43Q7jhCkrZw58bz8wgn1l6JOimpnDbGgbOczZntl4RkHaqluvaFtrU2h8uYlFkgBdB5jjpcTjt+zWi73youFEB3ccm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721460510; c=relaxed/simple;
	bh=7J6mnaHOJ8JK7N4UckzSzLMo6ZznVBPZ8MuFBV06wJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=at/WU9jq3nBHbUOuqq+mQHOdFtvXbHPkmZQYBmki8njT73w5mWRV/vLyYD30B+xMYw4lJPaVQlCokcaZMitHbO3dlHQ04f55DR3Y2nwLtzXKP7e+5duui3uAssqJWYZeNcjJAHmR2mnjyrYrz0c6u+AU8zuZyFki9S/TANduV5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHU9noTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643BBC2BD10;
	Sat, 20 Jul 2024 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721460509;
	bh=7J6mnaHOJ8JK7N4UckzSzLMo6ZznVBPZ8MuFBV06wJE=;
	h=From:To:Cc:Subject:Date:From;
	b=FHU9noTNRUhKjGMf9d8vEWgKKGFUjpfQV3Xskscm0ernCuUs7XHv4Lxk2Bo70TVgo
	 mQk/T1/kbVVTumdA7Q6ENO8gmVt/Cli9L8feeeXL8a8LTnJcs7RxySbngikSPNoDWA
	 eZkYXcS1kMgxUWXqWo3mHKrPzpfDRQKLxTnGi4YxsB5BiUALLGpL8g1E0HJ4kbapjd
	 JUJrLRuALzavn95NI3PuhneFBZtihXV4MGqUmNWBuEKAVlA8x9AAV+lL0Ri6ZICFN0
	 Y5L/b0cvXhG5/CTaaHu2DdzVbtMJQKS/hy18f/nWwvavC+9l2vidzJOUqdZ2jqlC0g
	 uwpV5j45cCGRg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/2] kbuild: move some helper headers from scripts/kconfig/ to scripts/include/
Date: Sat, 20 Jul 2024 16:27:38 +0900
Message-ID: <20240720072750.2840541-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move array_size.h, hashtable.h, list.h, list_types.h from scripts/kconfig/
to scripts/include/.

These headers will be useful for other host programs.

Remove scripts/mod/list.h.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 MAINTAINERS                               |   1 +
 Makefile                                  |   6 +-
 scripts/{kconfig => include}/array_size.h |   0
 scripts/{kconfig => include}/hashtable.h  |   0
 scripts/{kconfig => include}/list.h       |   0
 scripts/{kconfig => include}/list_types.h |   0
 scripts/kconfig/expr.h                    |   3 +-
 scripts/kconfig/internal.h                |   2 +-
 scripts/kconfig/mconf.c                   |   2 +-
 scripts/kconfig/menu.c                    |   2 +-
 scripts/kconfig/mnconf-common.c           |   2 +-
 scripts/kconfig/mnconf-common.h           |   2 +
 scripts/kconfig/nconf.c                   |   2 +-
 scripts/kconfig/preprocess.c              |   4 +-
 scripts/kconfig/util.c                    |   2 +-
 scripts/mod/list.h                        | 213 ----------------------
 scripts/mod/modpost.c                     |   2 +
 scripts/mod/modpost.h                     |   2 +-
 18 files changed, 19 insertions(+), 226 deletions(-)
 rename scripts/{kconfig => include}/array_size.h (100%)
 rename scripts/{kconfig => include}/hashtable.h (100%)
 rename scripts/{kconfig => include}/list.h (100%)
 rename scripts/{kconfig => include}/list_types.h (100%)
 delete mode 100644 scripts/mod/list.h

diff --git a/MAINTAINERS b/MAINTAINERS
index da5352dbd4f3..0fe40cf1929f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11943,6 +11943,7 @@ F:	scripts/Makefile*
 F:	scripts/basic/
 F:	scripts/clang-tools/
 F:	scripts/dummy-tools/
+F:	scripts/include/
 F:	scripts/mk*
 F:	scripts/mod/
 F:	scripts/package/
diff --git a/Makefile b/Makefile
index c97d6404b891..cbad2bbe4561 100644
--- a/Makefile
+++ b/Makefile
@@ -458,8 +458,10 @@ export rust_common_flags := --edition=2021 \
 			    -Dclippy::no_mangle_with_rust_abi \
 			    -Wclippy::dbg_macro
 
-KBUILD_HOSTCFLAGS   := $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
-KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
+KBUILD_HOSTCFLAGS   := $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) \
+		       $(HOSTCFLAGS) -I $(srctree)/scripts/include
+KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
+		       -I $(srctree)/scripts/include
 KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
diff --git a/scripts/kconfig/array_size.h b/scripts/include/array_size.h
similarity index 100%
rename from scripts/kconfig/array_size.h
rename to scripts/include/array_size.h
diff --git a/scripts/kconfig/hashtable.h b/scripts/include/hashtable.h
similarity index 100%
rename from scripts/kconfig/hashtable.h
rename to scripts/include/hashtable.h
diff --git a/scripts/kconfig/list.h b/scripts/include/list.h
similarity index 100%
rename from scripts/kconfig/list.h
rename to scripts/include/list.h
diff --git a/scripts/kconfig/list_types.h b/scripts/include/list_types.h
similarity index 100%
rename from scripts/kconfig/list_types.h
rename to scripts/include/list_types.h
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 6e47e0ad6e6e..2bc96cd28253 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -12,12 +12,11 @@ extern "C" {
 
 #include <assert.h>
 #include <stdio.h>
-#include "list_types.h"
 #ifndef __cplusplus
 #include <stdbool.h>
 #endif
 
-#include "list_types.h"
+#include <list_types.h>
 
 typedef enum tristate {
 	no, mod, yes
diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
index 6c721c4cfd72..02106eb7815e 100644
--- a/scripts/kconfig/internal.h
+++ b/scripts/kconfig/internal.h
@@ -2,7 +2,7 @@
 #ifndef INTERNAL_H
 #define INTERNAL_H
 
-#include "hashtable.h"
+#include <hashtable.h>
 
 #define SYMBOL_HASHSIZE		(1U << 14)
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 4a0a97bb342f..3887eac75289 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -19,7 +19,7 @@
 #include <signal.h>
 #include <unistd.h>
 
-#include "list.h"
+#include <list.h>
 #include "lkc.h"
 #include "lxdialog/dialog.h"
 #include "mnconf-common.h"
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index cd34cc5aefcf..323cc0b62be6 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -8,9 +8,9 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include <list.h>
 #include "lkc.h"
 #include "internal.h"
-#include "list.h"
 
 static const char nohelp_text[] = "There is no help available for this option.";
 
diff --git a/scripts/kconfig/mnconf-common.c b/scripts/kconfig/mnconf-common.c
index 18cb9a6c5aaa..8e24b07121df 100644
--- a/scripts/kconfig/mnconf-common.c
+++ b/scripts/kconfig/mnconf-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <list.h>
 #include "expr.h"
-#include "list.h"
 #include "mnconf-common.h"
 
 int jump_key_char;
diff --git a/scripts/kconfig/mnconf-common.h b/scripts/kconfig/mnconf-common.h
index ab6292cc4bf2..53bd7292e931 100644
--- a/scripts/kconfig/mnconf-common.h
+++ b/scripts/kconfig/mnconf-common.h
@@ -4,6 +4,8 @@
 
 #include <stddef.h>
 
+#include <list_types.h>
+
 struct search_data {
 	struct list_head *head;
 	struct menu *target;
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 1456e24969aa..b91ca47e9e9a 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -11,7 +11,7 @@
 #include <strings.h>
 #include <stdlib.h>
 
-#include "list.h"
+#include <list.h>
 #include "lkc.h"
 #include "mnconf-common.h"
 #include "nconf.h"
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index f0a4a218c4a5..67d1fb95c491 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -9,9 +9,9 @@
 #include <stdlib.h>
 #include <string.h>
 
-#include "array_size.h"
+#include <array_size.h>
+#include <list.h>
 #include "internal.h"
-#include "list.h"
 #include "lkc.h"
 #include "preprocess.h"
 
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 1ea78927121d..696ff477671e 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -8,7 +8,7 @@
 #include <stdlib.h>
 #include <string.h>
 
-#include "hashtable.h"
+#include <hashtable.h>
 #include "lkc.h"
 
 unsigned int strhash(const char *s)
diff --git a/scripts/mod/list.h b/scripts/mod/list.h
deleted file mode 100644
index a924a6c4aa4d..000000000000
--- a/scripts/mod/list.h
+++ /dev/null
@@ -1,213 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef LIST_H
-#define LIST_H
-
-#include <stdbool.h>
-#include <stddef.h>
-
-/* Are two types/vars the same type (ignoring qualifiers)? */
-#define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
-
-/**
- * container_of - cast a member of a structure out to the containing structure
- * @ptr:	the pointer to the member.
- * @type:	the type of the container struct this is embedded in.
- * @member:	the name of the member within the struct.
- *
- */
-#define container_of(ptr, type, member) ({				\
-	void *__mptr = (void *)(ptr);					\
-	_Static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
-		      __same_type(*(ptr), void),			\
-		      "pointer type mismatch in container_of()");	\
-	((type *)(__mptr - offsetof(type, member))); })
-
-#define LIST_POISON1  ((void *) 0x100)
-#define LIST_POISON2  ((void *) 0x122)
-
-/*
- * Circular doubly linked list implementation.
- *
- * Some of the internal functions ("__xxx") are useful when
- * manipulating whole lists rather than single entries, as
- * sometimes we already know the next/prev entries and we can
- * generate better code by using them directly rather than
- * using the generic single-entry routines.
- */
-
-struct list_head {
-	struct list_head *next, *prev;
-};
-
-#define LIST_HEAD_INIT(name) { &(name), &(name) }
-
-#define LIST_HEAD(name) \
-	struct list_head name = LIST_HEAD_INIT(name)
-
-/**
- * INIT_LIST_HEAD - Initialize a list_head structure
- * @list: list_head structure to be initialized.
- *
- * Initializes the list_head to point to itself.  If it is a list header,
- * the result is an empty list.
- */
-static inline void INIT_LIST_HEAD(struct list_head *list)
-{
-	list->next = list;
-	list->prev = list;
-}
-
-/*
- * Insert a new entry between two known consecutive entries.
- *
- * This is only for internal list manipulation where we know
- * the prev/next entries already!
- */
-static inline void __list_add(struct list_head *new,
-			      struct list_head *prev,
-			      struct list_head *next)
-{
-	next->prev = new;
-	new->next = next;
-	new->prev = prev;
-	prev->next = new;
-}
-
-/**
- * list_add - add a new entry
- * @new: new entry to be added
- * @head: list head to add it after
- *
- * Insert a new entry after the specified head.
- * This is good for implementing stacks.
- */
-static inline void list_add(struct list_head *new, struct list_head *head)
-{
-	__list_add(new, head, head->next);
-}
-
-/**
- * list_add_tail - add a new entry
- * @new: new entry to be added
- * @head: list head to add it before
- *
- * Insert a new entry before the specified head.
- * This is useful for implementing queues.
- */
-static inline void list_add_tail(struct list_head *new, struct list_head *head)
-{
-	__list_add(new, head->prev, head);
-}
-
-/*
- * Delete a list entry by making the prev/next entries
- * point to each other.
- *
- * This is only for internal list manipulation where we know
- * the prev/next entries already!
- */
-static inline void __list_del(struct list_head *prev, struct list_head *next)
-{
-	next->prev = prev;
-	prev->next = next;
-}
-
-static inline void __list_del_entry(struct list_head *entry)
-{
-	__list_del(entry->prev, entry->next);
-}
-
-/**
- * list_del - deletes entry from list.
- * @entry: the element to delete from the list.
- * Note: list_empty() on entry does not return true after this, the entry is
- * in an undefined state.
- */
-static inline void list_del(struct list_head *entry)
-{
-	__list_del_entry(entry);
-	entry->next = LIST_POISON1;
-	entry->prev = LIST_POISON2;
-}
-
-/**
- * list_is_head - tests whether @list is the list @head
- * @list: the entry to test
- * @head: the head of the list
- */
-static inline int list_is_head(const struct list_head *list, const struct list_head *head)
-{
-	return list == head;
-}
-
-/**
- * list_empty - tests whether a list is empty
- * @head: the list to test.
- */
-static inline int list_empty(const struct list_head *head)
-{
-	return head->next == head;
-}
-
-/**
- * list_entry - get the struct for this entry
- * @ptr:	the &struct list_head pointer.
- * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_head within the struct.
- */
-#define list_entry(ptr, type, member) \
-	container_of(ptr, type, member)
-
-/**
- * list_first_entry - get the first element from a list
- * @ptr:	the list head to take the element from.
- * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_head within the struct.
- *
- * Note, that list is expected to be not empty.
- */
-#define list_first_entry(ptr, type, member) \
-	list_entry((ptr)->next, type, member)
-
-/**
- * list_next_entry - get the next element in list
- * @pos:	the type * to cursor
- * @member:	the name of the list_head within the struct.
- */
-#define list_next_entry(pos, member) \
-	list_entry((pos)->member.next, typeof(*(pos)), member)
-
-/**
- * list_entry_is_head - test if the entry points to the head of the list
- * @pos:	the type * to cursor
- * @head:	the head for your list.
- * @member:	the name of the list_head within the struct.
- */
-#define list_entry_is_head(pos, head, member)				\
-	(&pos->member == (head))
-
-/**
- * list_for_each_entry - iterate over list of given type
- * @pos:	the type * to use as a loop cursor.
- * @head:	the head for your list.
- * @member:	the name of the list_head within the struct.
- */
-#define list_for_each_entry(pos, head, member)				\
-	for (pos = list_first_entry(head, typeof(*pos), member);	\
-	     !list_entry_is_head(pos, head, member);			\
-	     pos = list_next_entry(pos, member))
-
-/**
- * list_for_each_entry_safe - iterate over list of given type. Safe against removal of list entry
- * @pos:	the type * to use as a loop cursor.
- * @n:		another type * to use as temporary storage
- * @head:	the head for your list.
- * @member:	the name of the list_head within the struct.
- */
-#define list_for_each_entry_safe(pos, n, head, member)			\
-	for (pos = list_first_entry(head, typeof(*pos), member),	\
-		n = list_next_entry(pos, member);			\
-	     !list_entry_is_head(pos, head, member);			\
-	     pos = n, n = list_next_entry(n, member))
-
-#endif /* LIST_H */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e5313ed6065..9eade18b4388 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -20,6 +20,8 @@
 #include <limits.h>
 #include <stdbool.h>
 #include <errno.h>
+
+#include <list.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ee43c7950636..58197b34a3c8 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -13,7 +13,7 @@
 #include <elf.h>
 #include "../../include/linux/module_symbol.h"
 
-#include "list.h"
+#include <list_types.h>
 #include "elfconfig.h"
 
 /* On BSD-alike OSes elf.h defines these according to host's word size */
-- 
2.43.0


