Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02EC8AA3C
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 00:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfHLWOg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 18:14:36 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:50651 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfHLWOg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 18:14:36 -0400
Received: by mail-qk1-f201.google.com with SMTP id e18so94477540qkl.17
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 15:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YzrsGQWJ9vf69SNd20htWu1bd7T+J/M+qkSI3MhX4Ko=;
        b=iXjwC9Y27Pyh6en1ZnbDa1fykedsqhqOp1ZdMaRwYKA/BsVXNK4LjdCxOffkRdq2EA
         p4q1VdnEwfp5vDbFLEexJXk/E8jf1pXAfnuxWa7bUkgUKxKUWVIXx8futJWOKsg5tgRi
         t3ooQZ078lhn4jxx4pd7k6bEFrYpxJB1vanwsyLajRwYh9MRqaPPoUqrp0+b51qB5KWG
         5bbGA9QKKBMkyjzSjzupOYaoshw/SLswq48o083JipcVXn1lS53QSdbDbanb29/BjTB4
         Pl+Db5fwFXJs/xvuUfU7Y55JbRGSZ7WjYmHSJ7BJWzCoa3kDYU9wZg6PUxYsxS4G5HSq
         snhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YzrsGQWJ9vf69SNd20htWu1bd7T+J/M+qkSI3MhX4Ko=;
        b=ND/Xg0FApfCJaAsXcxItW6wii7iOKLJ0+Qr/FQIH6FHGD2Zy7foU5DrVo3dIBxoi+a
         ApDZ6OOAaEsdaNLKDaDuD1WRLMhtGDCrjIEq/fY77OWO1Z8NZgfxGD7UV04duYoOCiBt
         yHA0sUupxHHltBlOfyhO9GtzHW9GADrLlqE5VT6vr8fdCtClE4kXxB9cvoXNgLDwBMNm
         KoZmWx4kvJPU+kjQhY+3lVzw5bWhp2P9P131Jwu3sx97C/j4sx6vqJ5VQlrf3ttC/kU4
         pG6Ge82LcpBNH/l9wVmgGQsrVwEiAWkgeVFFozmL8DxfPsJMLlqQo4TaS2fhfwZmPsNg
         fdQw==
X-Gm-Message-State: APjAAAWuJzj5AQ3z1nu0m1BFrJ+ZKuCdf3P4Vm+sD05Ww+UI86xuip0K
        sEj+4pqek8M0jzVNSkzTOdeH4XEWVQ==
X-Google-Smtp-Source: APXvYqwItN2fhw3RZGfjP0FGuB7HJ+AD1Ro7BeqFi9haqdm/rxaIb60UELBKJiM5gqgLIKQSChRdRnAO0w==
X-Received: by 2002:a05:620a:1f0:: with SMTP id x16mr20622958qkn.11.1565648074752;
 Mon, 12 Aug 2019 15:14:34 -0700 (PDT)
Date:   Mon, 12 Aug 2019 15:14:16 -0700
In-Reply-To: <20190812214711.83710-1-nhuck@google.com>
Message-Id: <20190812221416.139678-1-nhuck@google.com>
Mime-Version: 1.0
References: <20190812214711.83710-1-nhuck@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v2] kbuild: Change fallthrough comments to attributes
From:   Nathan Huckleberry <nhuck@google.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, clang-built-linux@googlegroups.com,
        Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang does not support the use of comments to label
intentional fallthrough. This patch replaces some uses
of comments to attributesto cut down a significant number
of warnings on clang (from ~50000 to ~200). Only comments
in commonly used header files have been replaced.

Since there is still quite a bit of noise, this
patch moves -Wimplicit-fallthrough to
Makefile.extrawarn if you are compiling with
clang.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 Makefile                            |  4 ++
 include/linux/compiler_attributes.h |  4 ++
 include/linux/jhash.h               | 60 +++++++++++++++++++++--------
 include/linux/mm.h                  |  9 +++--
 include/linux/signal.h              | 14 ++++---
 include/linux/skbuff.h              | 12 +++---
 lib/zstd/bitstream.h                | 10 ++---
 scripts/Makefile.extrawarn          |  3 ++
 8 files changed, 81 insertions(+), 35 deletions(-)

diff --git a/Makefile b/Makefile
index 1b23f95db176..93b9744e66a2 100644
--- a/Makefile
+++ b/Makefile
@@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Warn about unmarked fall-throughs in switch statement.
+# If the compiler is clang, this warning is only enabled if W=1 in
+# Makefile.extrawarn
+ifndef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 6b318efd8a74..86c26bc0ace5 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -253,4 +253,8 @@
  */
 #define __weak                          __attribute__((__weak__))
 
+#if __has_attribute(fallthrough)
+#define __fallthrough                   __attribute__((fallthrough))
+#endif
+
 #endif /* __LINUX_COMPILER_ATTRIBUTES_H */
diff --git a/include/linux/jhash.h b/include/linux/jhash.h
index ba2f6a9776b6..1d21e3f32823 100644
--- a/include/linux/jhash.h
+++ b/include/linux/jhash.h
@@ -86,19 +86,43 @@ static inline u32 jhash(const void *key, u32 length, u32 initval)
 	}
 	/* Last block: affect all 32 bits of (c) */
 	switch (length) {
-	case 12: c += (u32)k[11]<<24;	/* fall through */
-	case 11: c += (u32)k[10]<<16;	/* fall through */
-	case 10: c += (u32)k[9]<<8;	/* fall through */
-	case 9:  c += k[8];		/* fall through */
-	case 8:  b += (u32)k[7]<<24;	/* fall through */
-	case 7:  b += (u32)k[6]<<16;	/* fall through */
-	case 6:  b += (u32)k[5]<<8;	/* fall through */
-	case 5:  b += k[4];		/* fall through */
-	case 4:  a += (u32)k[3]<<24;	/* fall through */
-	case 3:  a += (u32)k[2]<<16;	/* fall through */
-	case 2:  a += (u32)k[1]<<8;	/* fall through */
-	case 1:  a += k[0];
+	case 12:
+		c += (u32)k[11]<<24;
+		__fallthrough;
+	case 11:
+		c += (u32)k[10]<<16;
+		__fallthrough;
+	case 10:
+		c += (u32)k[9]<<8;
+		__fallthrough;
+	case 9:
+		c += k[8];
+		__fallthrough;
+	case 8:
+		b += (u32)k[7]<<24;
+		__fallthrough;
+	case 7:
+		b += (u32)k[6]<<16;
+		__fallthrough;
+	case 6:
+		b += (u32)k[5]<<8;
+		__fallthrough;
+	case 5:
+		b += k[4];
+		__fallthrough;
+	case 4:
+		a += (u32)k[3]<<24;
+		__fallthrough;
+	case 3:
+		a += (u32)k[2]<<16;
+		__fallthrough;
+	case 2:
+		a += (u32)k[1]<<8;
+		__fallthrough;
+	case 1:
+		a += k[0];
 		 __jhash_final(a, b, c);
+		break;
 	case 0: /* Nothing left to add */
 		break;
 	}
@@ -132,10 +156,16 @@ static inline u32 jhash2(const u32 *k, u32 length, u32 initval)
 
 	/* Handle the last 3 u32's */
 	switch (length) {
-	case 3: c += k[2];	/* fall through */
-	case 2: b += k[1];	/* fall through */
-	case 1: a += k[0];
+	case 3:
+		c += k[2];
+		__fallthrough;
+	case 2:
+		b += k[1];
+		__fallthrough;
+	case 1:
+		a += k[0];
 		__jhash_final(a, b, c);
+		break;
 	case 0:	/* Nothing left to add */
 		break;
 	}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0334ca97c584..7acb131e287f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -158,11 +158,14 @@ static inline void __mm_zero_struct_page(struct page *page)
 
 	switch (sizeof(struct page)) {
 	case 80:
-		_pp[9] = 0;	/* fallthrough */
+		_pp[9] = 0;
+		__fallthrough;
 	case 72:
-		_pp[8] = 0;	/* fallthrough */
+		_pp[8] = 0;
+		__fallthrough;
 	case 64:
-		_pp[7] = 0;	/* fallthrough */
+		_pp[7] = 0;
+		__fallthrough;
 	case 56:
 		_pp[6] = 0;
 		_pp[5] = 0;
diff --git a/include/linux/signal.h b/include/linux/signal.h
index b5d99482d3fe..fb750e87566f 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -129,11 +129,11 @@ static inline void name(sigset_t *r, const sigset_t *a, const sigset_t *b) \
 		b3 = b->sig[3]; b2 = b->sig[2];				\
 		r->sig[3] = op(a3, b3);					\
 		r->sig[2] = op(a2, b2);					\
-		/* fall through */					\
+		__fallthrough;						\
 	case 2:								\
 		a1 = a->sig[1]; b1 = b->sig[1];				\
 		r->sig[1] = op(a1, b1);					\
-		/* fall through */					\
+		__fallthrough;						\
 	case 1:								\
 		a0 = a->sig[0]; b0 = b->sig[0];				\
 		r->sig[0] = op(a0, b0);					\
@@ -163,9 +163,9 @@ static inline void name(sigset_t *set)					\
 	switch (_NSIG_WORDS) {						\
 	case 4:	set->sig[3] = op(set->sig[3]);				\
 		set->sig[2] = op(set->sig[2]);				\
-		/* fall through */					\
+		__fallthrough;				\
 	case 2:	set->sig[1] = op(set->sig[1]);				\
-		/* fall through */					\
+		__fallthrough;				\
 	case 1:	set->sig[0] = op(set->sig[0]);				\
 		    break;						\
 	default:							\
@@ -186,7 +186,7 @@ static inline void sigemptyset(sigset_t *set)
 		memset(set, 0, sizeof(sigset_t));
 		break;
 	case 2: set->sig[1] = 0;
-		/* fall through */
+		__fallthrough;
 	case 1:	set->sig[0] = 0;
 		break;
 	}
@@ -199,7 +199,7 @@ static inline void sigfillset(sigset_t *set)
 		memset(set, -1, sizeof(sigset_t));
 		break;
 	case 2: set->sig[1] = -1;
-		/* fall through */
+		__fallthrough;
 	case 1:	set->sig[0] = -1;
 		break;
 	}
@@ -230,6 +230,7 @@ static inline void siginitset(sigset_t *set, unsigned long mask)
 		memset(&set->sig[1], 0, sizeof(long)*(_NSIG_WORDS-1));
 		break;
 	case 2: set->sig[1] = 0;
+		__fallthrough;
 	case 1: ;
 	}
 }
@@ -242,6 +243,7 @@ static inline void siginitsetinv(sigset_t *set, unsigned long mask)
 		memset(&set->sig[1], -1, sizeof(long)*(_NSIG_WORDS-1));
 		break;
 	case 2: set->sig[1] = -1;
+		__fallthrough;
 	case 1: ;
 	}
 }
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index d8af86d995d6..1b7d3cf81dd8 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3639,19 +3639,19 @@ static inline bool __skb_metadata_differs(const struct sk_buff *skb_a,
 #define __it(x, op) (x -= sizeof(u##op))
 #define __it_diff(a, b, op) (*(u##op *)__it(a, op)) ^ (*(u##op *)__it(b, op))
 	case 32: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case 24: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case 16: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case  8: diffs |= __it_diff(a, b, 64);
 		break;
 	case 28: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case 20: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case 12: diffs |= __it_diff(a, b, 64);
-		 /* fall through */
+		__fallthrough;
 	case  4: diffs |= __it_diff(a, b, 32);
 		break;
 	}
diff --git a/lib/zstd/bitstream.h b/lib/zstd/bitstream.h
index 3a49784d5c61..36c9aeafd801 100644
--- a/lib/zstd/bitstream.h
+++ b/lib/zstd/bitstream.h
@@ -259,15 +259,15 @@ ZSTD_STATIC size_t BIT_initDStream(BIT_DStream_t *bitD, const void *srcBuffer, s
 		bitD->bitContainer = *(const BYTE *)(bitD->start);
 		switch (srcSize) {
 		case 7: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[6]) << (sizeof(bitD->bitContainer) * 8 - 16);
-			/* fall through */
+			__fallthrough;
 		case 6: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[5]) << (sizeof(bitD->bitContainer) * 8 - 24);
-			/* fall through */
+			__fallthrough;
 		case 5: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[4]) << (sizeof(bitD->bitContainer) * 8 - 32);
-			/* fall through */
+			__fallthrough;
 		case 4: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[3]) << 24;
-			/* fall through */
+			__fallthrough;
 		case 3: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[2]) << 16;
-			/* fall through */
+			__fallthrough;
 		case 2: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[1]) << 8;
 		default:;
 		}
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..e12359d69bb7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-option, -Wunused-const-variable)
 warning-1 += $(call cc-option, -Wpacked-not-aligned)
 warning-1 += $(call cc-option, -Wstringop-truncation)
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 # The following turn off the warnings enabled by -Wextra
 warning-1 += -Wno-missing-field-initializers
 warning-1 += -Wno-sign-compare
-- 
2.23.0.rc1.153.gdeed80330f-goog

