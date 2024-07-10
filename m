Return-Path: <linux-kbuild+bounces-2449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B32B92CB5D
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394061C2262B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E65823AF;
	Wed, 10 Jul 2024 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAymWaH2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024D7BB06;
	Wed, 10 Jul 2024 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594474; cv=none; b=anhs+eVSymwFSHdIZjqewUWWz9RvW1i7JTY4B+h1c3WU661PyXbgLjO3hXpPXi20O9Y/xdcuikkuqL/hYmt7Se93MjQF5LlokGuHm7GTa11A4TQkbSrTUj9ci8U8U7wqtwIkHJX5SoivkLRKvInixd0PtqNGi1y22W8z3AP5By0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594474; c=relaxed/simple;
	bh=RqawAEV+fmtmwlfKkxY79Y8QX5x7zi3iFGYhOs5QYW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eIe6TeAMD5zdYxEv2ViYznTGnm64WPAsjzfbbQ6W/boto3jX+puE1QPUSgWaVvfyHhTmYpd8FMnv+bklN/dkuO1z+ghWfFlMIiU4uIks7KU7BQhp9L1zV+xdj7Qn85R94ReyQ5CKpcpzwaoUU7BLjBEvQb0qG50EdEPsygHUwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAymWaH2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso71203901fa.0;
        Tue, 09 Jul 2024 23:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594468; x=1721199268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OiR6XqTxrPzfPOqCzsX9poP6s4vUBvThBfmkaA77SI=;
        b=UAymWaH2jDZCsxOD8lsrmdOQCdn2KYg67s/mLavZb4tT17IJJ3tCYPcMVkCSljnl1t
         NCksOke3Z1AB06rw8VzTayuw+cL30kAGM7w88f79fVgFWQ3QlwXfVebWgpWd/T9sps41
         4jdPzkpy/69DcBbGw8+aaFbDk8lRat0I4yavwOg9GkzzsLophKxNQMBdu2qx7ZOs3EPG
         k1N6BUSMywDMWHq/bzCPfbkLi0XpnYJhDdJ6xb7FXew4Lrp5RjaZJOAX+aBNWtz1Ikl2
         iKMkzw0ZM+KE5asX5t3KMYxn4ChKK4+gad+HKJpnR4o2NtRU8txblQDPLzRZYItAue/u
         fxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594468; x=1721199268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OiR6XqTxrPzfPOqCzsX9poP6s4vUBvThBfmkaA77SI=;
        b=JKymh7zOwxQeuGY/JvhVujQaDpMYrmRwNRkZOB6SfmzKkS9DXVi7ufQSC9JZ1DXThF
         oGkXOIZw15B+eavTL8Kg1LaxqtyWjXKuu58WqnxinRKn72XwI3xr4WjsOKX2Bv9UfrMn
         KieWGFctVmcyWw3f+pA96k97JmJkoJ/aHjYft1ZiR5ffTMWLx6W1yMA0ePMid6/xuQnx
         BZWUIpnITg+vzxQz0+mZ+cu2u4wYyUK9sdLGNOlb4XRikY4r7mAiMTwwf7c2xHOpKwnB
         BBi1o44Tc2sRqOKHGYJgZWlPQPlkIA7UTH2j+WPAVHI/hh+oi50yVjf8jBfQ/MkKXRqD
         ye7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5BHVwuUoXVCq5TTmfNCWqnrmyD5AagFQ8fBpFxiw1uv60assNczFvuSMa9++Xj41H6sn0vv6VWJMAAkV0x9EyjlE5AlVGIIZCxMwi
X-Gm-Message-State: AOJu0YwtQUv6xu4Yg/kOytuC0kHuYbjflGl7PXNGWMZyNR9qgj1cCm40
	CrV7LzW6TTe+ymGIsgQuPW2hy0iUAKGiwaI7uN3lXT4yFRFaskqR0utvFg==
X-Google-Smtp-Source: AGHT+IHDyyGtiX42HJdETXWil2T7ot/rKZCraJ/MYgYj76JD+D0z0kdm++YpEoqyDR+eOnyt6HNz/Q==
X-Received: by 2002:a2e:6e0e:0:b0:2ee:7b7d:66ee with SMTP id 38308e7fff4ca-2eeb318a2f2mr27094331fa.41.1720594467356;
        Tue, 09 Jul 2024 23:54:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:26 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Date: Wed, 10 Jul 2024 08:52:45 +0200
Message-Id: <20240710065255.10338-3-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710065255.10338-1-ole0811sch@gmail.com>
References: <20240710065255.10338-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PicoSAT is the SAT solver used in this project. picosat.c is the actual
SAT solver. Since the file is too big for a single patch, it needs to be
split up. This patch contains the first part of the file.

Signed-off-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/picosat.c | 3000 +++++++++++++++++++++++++++++++++++++
 1 file changed, 3000 insertions(+)
 create mode 100644 scripts/kconfig/picosat.c

diff --git a/scripts/kconfig/picosat.c b/scripts/kconfig/picosat.c
new file mode 100644
index 000000000000..872a38b335c4
--- /dev/null
+++ b/scripts/kconfig/picosat.c
@@ -0,0 +1,3000 @@
+/****************************************************************************
+Copyright (c) 2006 - 2015, Armin Biere, Johannes Kepler University.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to
+deal in the Software without restriction, including without limitation the
+rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+IN THE SOFTWARE.
+****************************************************************************/
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <assert.h>
+#include <limits.h>
+#include <ctype.h>
+#include <stdarg.h>
+#include <stdint.h>
+
+#include "picosat.h"
+
+/* By default code for 'all different constraints' is disabled, since 'NADC'
+ * is defined.
+ */
+#define NADC
+
+/* By default we enable failed literals, since 'NFL' is undefined.
+ *
+#define NFL
+ */
+
+/* By default we 'detach satisfied (large) clauses', e.g. NDSC undefined.
+ *
+#define NDSC
+ */
+
+/* Do not use luby restart schedule instead of inner/outer.
+ *
+#define NLUBY
+ */
+
+/* Enabling this define, will use gnuplot to visualize how the scores evolve.
+ *
+#define VISCORES
+ */
+#ifdef VISCORES
+// #define WRITEGIF		/* ... to generate a video */
+#endif
+
+#ifdef VISCORES
+#ifndef WRITEGIF
+#include <unistd.h>		/* for 'usleep' */
+#endif
+#endif
+
+#ifdef RCODE
+#include <R.h>
+#endif
+
+#define MINRESTART	100	/* minimum restart interval */
+#define MAXRESTART	1000000 /* maximum restart interval */
+#define RDECIDE		1000	/* interval of random decisions */
+#define FRESTART	110	/* restart increase factor in percent */
+#define FREDUCE		110	/* reduce increase factor in percent  */
+#define FREDADJ		121	/* reduce increase adjustment factor */
+#define MAXCILS		10	/* maximal number of unrecycled internals */
+#define FFLIPPED	10000	/* flipped reduce factor */
+#define FFLIPPEDPREC	10000000/* flipped reduce factor precision */
+#define INTERRUPTLIM	1024	/* check interrupt after that many decisions */
+
+#ifndef TRACE
+#define NO_BINARY_CLAUSES	/* store binary clauses more compactly */
+#endif
+
+/* For debugging purposes you may want to define 'LOGGING', which actually
+ * can be enforced by using './configure.sh --log'.
+ */
+#ifdef LOGGING
+#define LOG(code) do { code; } while (0)
+#else
+#define LOG(code) do { } while (0)
+#endif
+#define NOLOG(code) do { } while (0)		/* log exception */
+#define ONLYLOG(code) do { code; } while (0)	/* force logging */
+
+#define FALSE ((Val)-1)
+#define UNDEF ((Val)0)
+#define TRUE ((Val)1)
+
+#define COMPACT_TRACECHECK_TRACE_FMT 0
+#define EXTENDED_TRACECHECK_TRACE_FMT 1
+#define RUP_TRACE_FMT 2
+
+#define NEWN(p,n) do { (p) = new (ps, sizeof (*(p)) * (n)); } while (0)
+#define CLRN(p,n) do { memset ((p), 0, sizeof (*(p)) * (n)); } while (0)
+#define CLR(p) CLRN(p,1)
+#define DELETEN(p,n) \
+  do { delete (ps, p, sizeof (*(p)) * (n)); (p) = 0; } while (0)
+
+#define RESIZEN(p,old_num,new_num) \
+  do { \
+    size_t old_size = sizeof (*(p)) * (old_num); \
+    size_t new_size = sizeof (*(p)) * (new_num); \
+    (p) = resize (ps, (p), old_size, new_size) ; \
+  } while (0)
+
+#define ENLARGE(start,head,end) \
+  do { \
+    unsigned old_num = (ptrdiff_t)((end) - (start)); \
+    size_t new_num = old_num ? (2 * old_num) : 1; \
+    unsigned count = (head) - (start); \
+    assert ((start) <= (end)); \
+    RESIZEN((start),old_num,new_num); \
+    (head) = (start) + count; \
+    (end) = (start) + new_num; \
+  } while (0)
+
+#define NOTLIT(l) (ps->lits + (1 ^ ((l) - ps->lits)))
+
+#define LIT2IDX(l) ((ptrdiff_t)((l) - ps->lits) / 2)
+#define LIT2IMPLS(l) (ps->impls + (ptrdiff_t)((l) - ps->lits))
+#define LIT2INT(l) ((int)(LIT2SGN(l) * LIT2IDX(l)))
+#define LIT2SGN(l) (((ptrdiff_t)((l) - ps->lits) & 1) ? -1 : 1)
+#define LIT2VAR(l) (ps->vars + LIT2IDX(l))
+#define LIT2HTPS(l) (ps->htps + (ptrdiff_t)((l) - ps->lits))
+#define LIT2JWH(l) (ps->jwh + ((l) - ps->lits))
+
+#ifndef NDSC
+#define LIT2DHTPS(l) (ps->dhtps + (ptrdiff_t)((l) - ps->lits))
+#endif
+
+#ifdef NO_BINARY_CLAUSES
+typedef uintptr_t Wrd;
+#define ISLITREASON(C) (1&(Wrd)C)
+#define LIT2REASON(L) \
+  (assert (L->val==TRUE), ((Cls*)(1 + (2*(L - ps->lits)))))
+#define REASON2LIT(C) ((Lit*)(ps->lits + ((Wrd)C)/2))
+#endif
+
+#define ENDOFCLS(c) ((void*)((Lit**)(c)->lits + (c)->size))
+
+#define SOC ((ps->oclauses == ps->ohead) ? ps->lclauses : ps->oclauses)
+#define EOC (ps->lhead)
+#define NXC(p) (((p) + 1 == ps->ohead) ? ps->lclauses : (p) + 1)
+
+#define OIDX2IDX(idx) (2 * ((idx) + 1))
+#define LIDX2IDX(idx) (2 * (idx) + 1)
+
+#define ISLIDX(idx) ((idx)&1)
+
+#define IDX2OIDX(idx) (assert(!ISLIDX(idx)), (idx)/2 - 1)
+#define IDX2LIDX(idx) (assert(ISLIDX(idx)), (idx)/2)
+
+#define EXPORTIDX(idx) \
+  ((ISLIDX(idx) ? (IDX2LIDX (idx) + (ps->ohead - ps->oclauses)) : IDX2OIDX(idx)) + 1)
+
+#define IDX2CLS(i) \
+  (assert(i), (ISLIDX(i) ? ps->lclauses : ps->oclauses)[(i)/2 - !ISLIDX(i)])
+
+#define IDX2ZHN(i) (assert(i), (ISLIDX(i) ? ps->zhains[(i)/2] : 0))
+
+#define CLS2TRD(c) (((Trd*)(c)) - 1)
+#define CLS2IDX(c) ((((Trd*)(c)) - 1)->idx)
+
+#define CLS2ACT(c) \
+  ((Act*)((assert((c)->learned)),assert((c)->size>2),ENDOFCLS(c)))
+
+#define VAR2LIT(v) (ps->lits + 2 * ((v) - ps->vars))
+#define VAR2RNK(v) (ps->rnks + ((v) - ps->vars))
+
+#define RNK2LIT(r) (ps->lits + 2 * ((r) - ps->rnks))
+#define RNK2VAR(r) (ps->vars + ((r) - ps->rnks))
+
+#define BLK_FILL_BYTES 8
+#define SIZE_OF_BLK (sizeof (Blk) - BLK_FILL_BYTES)
+
+#define PTR2BLK(void_ptr) \
+  ((void_ptr) ? (Blk*)(((char*)(void_ptr)) - SIZE_OF_BLK) : 0)
+
+#define AVERAGE(a,b) ((b) ? (((double)a) / (double)(b)) : 0.0)
+#define PERCENT(a,b) (100.0 * AVERAGE(a,b))
+
+#ifndef RCODE
+#define ABORT(msg) \
+  do { \
+    fputs ("*** picosat: " msg "\n", stderr); \
+    abort (); \
+  } while (0)
+#else
+#define ABORT(msg) \
+  do { \
+    Rf_error (msg); \
+  } while (0)
+#endif
+
+#define ABORTIF(cond,msg) \
+  do { \
+    if (!(cond)) break; \
+    ABORT (msg); \
+  } while (0)
+
+#define ZEROFLT		(0x00000000u)
+#define EPSFLT		(0x00000001u)
+#define INFFLT		(0xffffffffu)
+
+#define FLTCARRY	(1u << 25)
+#define FLTMSB		(1u << 24)
+#define FLTMAXMANTISSA	(FLTMSB - 1)
+
+#define FLTMANTISSA(d)	((d) & FLTMAXMANTISSA)
+#define FLTEXPONENT(d)	((int)((d) >> 24) - 128)
+
+#define FLTMINEXPONENT	(-128)
+#define FLTMAXEXPONENT	(127)
+
+#define CMPSWAPFLT(a,b) \
+  do { \
+    Flt tmp; \
+    if (((a) < (b))) \
+      { \
+	tmp = (a); \
+	(a) = (b); \
+	(b) = tmp; \
+      } \
+  } while (0)
+
+#define UNPACKFLT(u,m,e) \
+  do { \
+    (m) = FLTMANTISSA(u); \
+    (e) = FLTEXPONENT(u); \
+    (m) |= FLTMSB; \
+  } while (0)
+
+#define INSERTION_SORT_LIMIT 10
+
+#define SORTING_SWAP(T,p,q) \
+do { \
+  T tmp = *(q); \
+  *(q) = *(p); \
+  *(p) = tmp; \
+} while (0)
+
+#define SORTING_CMP_SWAP(T,cmp,p,q) \
+do { \
+  if ((cmp) (ps, *(p), *(q)) > 0) \
+    SORTING_SWAP (T, p, q); \
+} while(0)
+
+#define QUICKSORT_PARTITION(T,cmp,a,l,r) \
+do { \
+  T pivot; \
+  int j; \
+  i = (l) - 1; 			/* result in 'i' */ \
+  j = (r); \
+  pivot = (a)[j]; \
+  for (;;) \
+    { \
+      while ((cmp) (ps, (a)[++i], pivot) < 0) \
+	; \
+      while ((cmp) (ps, pivot, (a)[--j]) < 0) \
+        if (j == (l)) \
+	  break; \
+      if (i >= j) \
+	break; \
+      SORTING_SWAP (T, (a) + i, (a) + j); \
+    } \
+  SORTING_SWAP (T, (a) + i, (a) + (r)); \
+} while(0)
+
+#define QUICKSORT(T,cmp,a,n) \
+do { \
+  int l = 0, r = (n) - 1, m, ll, rr, i; \
+  assert (ps->ihead == ps->indices); \
+  if (r - l <= INSERTION_SORT_LIMIT) \
+    break; \
+  for (;;) \
+    { \
+      m = (l + r) / 2; \
+      SORTING_SWAP (T, (a) + m, (a) + r - 1); \
+      SORTING_CMP_SWAP (T, cmp, (a) + l, (a) + r - 1); \
+      SORTING_CMP_SWAP (T, cmp, (a) + l, (a) + r); \
+      SORTING_CMP_SWAP (T, cmp, (a) + r - 1, (a) + r); \
+      QUICKSORT_PARTITION (T, cmp, (a), l + 1, r - 1); \
+      if (i - l < r - i) \
+	{ \
+	  ll = i + 1; \
+	  rr = r; \
+	  r = i - 1; \
+	} \
+      else \
+	{ \
+	  ll = l; \
+	  rr = i - 1; \
+	  l = i + 1; \
+	} \
+      if (r - l > INSERTION_SORT_LIMIT) \
+	{ \
+	  assert (rr - ll > INSERTION_SORT_LIMIT); \
+	  if (ps->ihead == ps->eoi) \
+	    ENLARGE (ps->indices, ps->ihead, ps->eoi); \
+	  *ps->ihead++ = ll; \
+	  if (ps->ihead == ps->eoi) \
+	    ENLARGE (ps->indices, ps->ihead, ps->eoi); \
+	  *ps->ihead++ = rr; \
+	} \
+      else if (rr - ll > INSERTION_SORT_LIMIT) \
+        { \
+	  l = ll; \
+	  r = rr; \
+	} \
+      else if (ps->ihead > ps->indices) \
+	{ \
+	  r = *--ps->ihead; \
+	  l = *--ps->ihead; \
+	} \
+      else \
+	break; \
+    } \
+} while (0)
+
+#define INSERTION_SORT(T,cmp,a,n) \
+do { \
+  T pivot; \
+  int l = 0, r = (n) - 1, i, j; \
+  for (i = r; i > l; i--) \
+    SORTING_CMP_SWAP (T, cmp, (a) + i - 1, (a) + i); \
+  for (i = l + 2; i <= r; i++)  \
+    { \
+      j = i; \
+      pivot = (a)[i]; \
+      while ((cmp) (ps, pivot, (a)[j - 1]) < 0) \
+        { \
+	  (a)[j] = (a)[j - 1]; \
+	  j--; \
+	} \
+      (a)[j] = pivot; \
+    } \
+} while (0)
+
+#ifdef NDEBUG
+#define CHECK_SORTED(cmp,a,n) do { } while(0)
+#else
+#define CHECK_SORTED(cmp,a,n) \
+do { \
+  int i; \
+  for (i = 0; i < (n) - 1; i++) \
+    assert ((cmp) (ps, (a)[i], (a)[i + 1]) <= 0); \
+} while(0)
+#endif
+
+#define SORT(T,cmp,a,n) \
+do { \
+  T * aa = (a); \
+  int nn = (n); \
+  QUICKSORT (T, cmp, aa, nn); \
+  INSERTION_SORT (T, cmp, aa, nn); \
+  assert (ps->ihead == ps->indices); \
+  CHECK_SORTED (cmp, aa, nn); \
+} while (0)
+
+#define WRDSZ (sizeof (long) * 8)
+
+#ifdef RCODE
+#define fprintf(...) do { } while (0)
+#define vfprintf(...) do { } while (0)
+#define fputs(...) do { } while (0)
+#define fputc(...) do { } while (0)
+#endif
+
+typedef unsigned Flt;		/* 32 bit deterministic soft float */
+typedef Flt Act;		/* clause and variable activity */
+typedef struct Blk Blk;		/* allocated memory block */
+typedef struct Cls Cls;		/* clause */
+typedef struct Lit Lit;		/* literal */
+typedef struct Rnk Rnk;		/* variable to score mapping */
+typedef signed char Val;	/* TRUE, UNDEF, FALSE */
+typedef struct Var Var;		/* variable */
+#ifdef TRACE
+typedef struct Trd Trd;		/* trace data for clauses */
+typedef struct Zhn Zhn;		/* compressed chain (=zain) data */
+typedef unsigned char Znt;	/* compressed antecedent data */
+#endif
+
+#ifdef NO_BINARY_CLAUSES
+typedef struct Ltk Ltk;
+
+struct Ltk
+{
+  Lit ** start;
+  unsigned count : WRDSZ == 32 ? 27 : 32;
+  unsigned ldsize : WRDSZ == 32 ? 5 : 32;
+};
+#endif
+
+struct Lit
+{
+  Val val;
+};
+
+struct Var
+{
+  unsigned mark		: 1;	/*bit 1*/
+  unsigned resolved	: 1;	/*bit 2*/
+  unsigned phase	: 1;	/*bit 3*/
+  unsigned assigned	: 1;	/*bit 4*/
+  unsigned used		: 1;	/*bit 5*/
+  unsigned failed	: 1;	/*bit 6*/
+  unsigned internal	: 1;	/*bit 7*/
+  unsigned usedefphase  : 1;    /*bit 8*/
+  unsigned defphase     : 1;    /*bit 9*/
+  unsigned msspos       : 1;    /*bit 10*/
+  unsigned mssneg       : 1;    /*bit 11*/
+  unsigned humuspos     : 1;    /*bit 12*/
+  unsigned humusneg     : 1;    /*bit 13*/
+  unsigned partial      : 1;    /*bit 14*/
+#ifdef TRACE
+  unsigned core		: 1;	/*bit 15*/
+#endif
+  unsigned level;
+  Cls *reason;
+#ifndef NADC
+  Lit ** inado;
+  Lit ** ado;
+  Lit *** adotabpos;
+#endif
+};
+
+struct Rnk
+{
+  Act score;
+  unsigned pos : 30;			/* 0 iff not on heap */
+  unsigned moreimportant : 1;
+  unsigned lessimportant : 1;
+};
+
+struct Cls
+{
+  unsigned size;
+
+  unsigned collect:1;	/* bit 1 */
+  unsigned learned:1;	/* bit 2 */
+  unsigned locked:1;	/* bit 3 */
+  unsigned used:1;	/* bit 4 */
+#ifndef NDEBUG
+  unsigned connected:1;	/* bit 5 */
+#endif
+#ifdef TRACE
+  unsigned collected:1;	/* bit 6 */
+  unsigned core:1;	/* bit 7 */
+#endif
+
+#define LDMAXGLUE 25	/* 32 - 7 */
+#define MAXGLUE 	((1<<LDMAXGLUE)-1)
+
+  unsigned glue:LDMAXGLUE;
+
+  Cls *next[2];
+  Lit *lits[2];
+};
+
+#ifdef TRACE
+struct Zhn
+{
+  unsigned ref:31;
+  unsigned core:1;
+  Znt * liz;
+  Znt znt[0];
+};
+
+struct Trd
+{
+  unsigned idx;
+  Cls cls[0];
+};
+#endif
+
+struct Blk
+{
+#ifndef NDEBUG
+  union
+  {
+    size_t size;		/* this is what we really use */
+    void *as_two_ptrs[2];	/* 2 * sizeof (void*) alignment of data */
+  }
+  header;
+#endif
+  char data[BLK_FILL_BYTES];
+};
+
+enum State
+{
+  RESET = 0,
+  READY = 1,
+  SAT = 2,
+  UNSAT = 3,
+  UNKNOWN = 4,
+};
+
+enum Phase
+{
+  POSPHASE,
+  NEGPHASE,
+  JWLPHASE,
+  RNDPHASE,
+};
+
+struct PicoSAT
+{
+  enum State state;
+  enum Phase defaultphase;
+  int last_sat_call_result;
+
+  FILE *out;
+  char * prefix;
+  int verbosity;
+  int plain;
+  unsigned LEVEL;
+  unsigned max_var;
+  unsigned size_vars;
+
+  Lit *lits;
+  Var *vars;
+  Rnk *rnks;
+  Flt *jwh;
+  Cls **htps;
+#ifndef NDSC
+  Cls **dhtps;
+#endif
+#ifdef NO_BINARY_CLAUSES
+  Ltk *impls;
+  Cls impl, cimpl;
+  int implvalid, cimplvalid;
+#else
+  Cls **impls;
+#endif
+  Lit **trail, **thead, **eot, **ttail, ** ttail2;
+#ifndef NADC
+  Lit **ttailado;
+#endif
+  unsigned adecidelevel;
+  Lit **als, **alshead, **alstail, **eoals;
+  Lit **CLS, **clshead, **eocls;
+  int *rils, *rilshead, *eorils;
+  int *cils, *cilshead, *eocils;
+  int *fals, *falshead, *eofals;
+  int *mass, szmass;
+  int *mssass, szmssass;
+  int *mcsass, nmcsass, szmcsass;
+  int *humus, szhumus;
+  Lit *failed_assumption;
+  int extracted_all_failed_assumptions;
+  Rnk **heap, **hhead, **eoh;
+  Cls **oclauses, **ohead, **eoo;	/* original clauses */
+  Cls **lclauses, **lhead, ** EOL;	/* learned clauses */
+  int * soclauses, * sohead, * eoso; /* saved original clauses */
+  int saveorig;
+  int partial;
+#ifdef TRACE
+  int trace;
+  Zhn **zhains, **zhead, **eoz;
+  int ocore;
+#endif
+  FILE * rup;
+  int rupstarted;
+  int rupvariables;
+  int rupclauses;
+  Cls *mtcls;
+  Cls *conflict;
+  Lit **added, **ahead, **eoa;
+  Var **marked, **mhead, **eom;
+  Var **dfs, **dhead, **eod;
+  Cls **resolved, **rhead, **eor;
+  unsigned char *levels, *levelshead, *eolevels;
+  unsigned *dused, *dusedhead, *eodused;
+  unsigned char *buffer, *bhead, *eob;
+  Act vinc, lscore, ilvinc, ifvinc;
+#ifdef VISCORES
+  Act fvinc, nvinc;
+#endif
+  Act cinc, lcinc, ilcinc, fcinc;
+  unsigned srng;
+  size_t current_bytes;
+  size_t max_bytes;
+  size_t recycled;
+  double seconds, flseconds;
+  double entered;
+  unsigned nentered;
+  int measurealltimeinlib;
+  char *rline[2];
+  int szrline, RCOUNT;
+  double levelsum;
+  unsigned iterations;
+  int reports;
+  int lastrheader;
+  unsigned calls;
+  unsigned decisions;
+  unsigned restarts;
+  unsigned simps;
+  unsigned fsimplify;
+  unsigned isimplify;
+  unsigned reductions;
+  unsigned lreduce;
+  unsigned lreduceadjustcnt;
+  unsigned lreduceadjustinc;
+  unsigned lastreduceconflicts;
+  unsigned llocked;	/* locked large learned clauses */
+  unsigned lrestart;
+#ifdef NLUBY
+  unsigned drestart;
+  unsigned ddrestart;
+#else
+  unsigned lubycnt;
+  unsigned lubymaxdelta;
+  int waslubymaxdelta;
+#endif
+  unsigned long long lsimplify;
+  unsigned long long propagations;
+  unsigned long long lpropagations;
+  unsigned fixed;		/* top level assignments */
+#ifndef NFL
+  unsigned failedlits;
+  unsigned ifailedlits;
+  unsigned efailedlits;
+  unsigned flcalls;
+#ifdef STATS
+  unsigned flrounds;
+  unsigned long long flprops;
+  unsigned long long floopsed, fltried, flskipped;
+#endif
+  unsigned long long fllimit;
+  int simplifying;
+  Lit ** saved;
+  unsigned saved_size;
+#endif
+  unsigned conflicts;
+  unsigned contexts;
+  unsigned internals;
+  unsigned noclauses;	/* current number large original clauses */
+  unsigned nlclauses;	/* current number large learned clauses */
+  unsigned olits;		/* current literals in large original clauses */
+  unsigned llits;		/* current literals in large learned clauses */
+  unsigned oadded;		/* added original clauses */
+  unsigned ladded;		/* added learned clauses */
+  unsigned loadded;	/* added original large clauses */
+  unsigned lladded;	/* added learned large clauses */
+  unsigned addedclauses;	/* oadded + ladded */
+  unsigned vused;		/* used variables */
+  unsigned llitsadded;	/* added learned literals */
+  unsigned long long visits;
+#ifdef STATS
+  unsigned loused;		/* used large original clauses */
+  unsigned llused;		/* used large learned clauses */
+  unsigned long long bvisits;
+  unsigned long long tvisits;
+  unsigned long long lvisits;
+  unsigned long long othertrue;
+  unsigned long long othertrue2;
+  unsigned long long othertruel;
+  unsigned long long othertrue2u;
+  unsigned long long othertruelu;
+  unsigned long long ltraversals;
+  unsigned long long traversals;
+#ifdef TRACE
+  unsigned long long antecedents;
+#endif
+  unsigned uips;
+  unsigned znts;
+  unsigned assumptions;
+  unsigned rdecisions;
+  unsigned sdecisions;
+  size_t srecycled;
+  size_t rrecycled;
+  unsigned long long derefs;
+#endif
+  unsigned minimizedllits;
+  unsigned nonminimizedllits;
+#ifndef NADC
+  Lit *** ados, *** hados, *** eados;
+  Lit *** adotab;
+  unsigned nadotab;
+  unsigned szadotab;
+  Cls * adoconflict;
+  unsigned adoconflicts;
+  unsigned adoconflictlimit;
+  int addingtoado;
+  int adodisabled;
+#endif
+  unsigned long long flips;
+#ifdef STATS
+  unsigned long long FORCED;
+  unsigned long long assignments;
+  unsigned inclreduces;
+  unsigned staticphasedecisions;
+  unsigned skippedrestarts;
+#endif
+  int * indices, * ihead, *eoi;
+  unsigned sdflips;
+
+  unsigned long long saved_flips;
+  unsigned saved_max_var;
+  unsigned min_flipped;
+
+  void * emgr;
+  picosat_malloc enew;
+  picosat_realloc eresize;
+  picosat_free edelete;
+
+  struct {
+    void * state;
+    int (*function) (void *);
+  } interrupt;
+
+#ifdef VISCORES
+  FILE * fviscores;
+#endif
+};
+
+typedef PicoSAT PS;
+
+static Flt
+packflt (unsigned m, int e)
+{
+  Flt res;
+  assert (m < FLTMSB);
+  assert (FLTMINEXPONENT <= e);
+  assert (e <= FLTMAXEXPONENT);
+  res = m | ((unsigned)(e + 128) << 24);
+  return res;
+}
+
+static Flt
+base2flt (unsigned m, int e)
+{
+  if (!m)
+    return ZEROFLT;
+
+  if (m < FLTMSB)
+    {
+      do
+	{
+	  if (e <= FLTMINEXPONENT)
+	    return EPSFLT;
+
+	  e--;
+	  m <<= 1;
+
+	}
+      while (m < FLTMSB);
+    }
+  else
+    {
+      while (m >= FLTCARRY)
+	{
+	  if (e >= FLTMAXEXPONENT)
+	    return INFFLT;
+
+	  e++;
+	  m >>= 1;
+	}
+    }
+
+  m &= ~FLTMSB;
+  return packflt (m, e);
+}
+
+static Flt
+addflt (Flt a, Flt b)
+{
+  unsigned ma, mb, delta;
+  int ea, eb;
+
+  CMPSWAPFLT (a, b);
+  if (!b)
+    return a;
+
+  UNPACKFLT (a, ma, ea);
+  UNPACKFLT (b, mb, eb);
+
+  assert (ea >= eb);
+  delta = ea - eb;
+  if (delta < 32) mb >>= delta; else mb = 0;
+  if (!mb)
+    return a;
+
+  ma += mb;
+  if (ma & FLTCARRY)
+    {
+      if (ea == FLTMAXEXPONENT)
+	return INFFLT;
+
+      ea++;
+      ma >>= 1;
+    }
+
+  assert (ma < FLTCARRY);
+  ma &= FLTMAXMANTISSA;
+
+  return packflt (ma, ea);
+}
+
+static Flt
+mulflt (Flt a, Flt b)
+{
+  unsigned ma, mb;
+  unsigned long long accu;
+  int ea, eb;
+
+  CMPSWAPFLT (a, b);
+  if (!b)
+    return ZEROFLT;
+
+  UNPACKFLT (a, ma, ea);
+  UNPACKFLT (b, mb, eb);
+
+  ea += eb;
+  ea += 24;
+  if (ea > FLTMAXEXPONENT)
+    return INFFLT;
+
+  if (ea < FLTMINEXPONENT)
+    return EPSFLT;
+
+  accu = ma;
+  accu *= mb;
+  accu >>= 24;
+
+  if (accu >= FLTCARRY)
+    {
+      if (ea == FLTMAXEXPONENT)
+	return INFFLT;
+
+      ea++;
+      accu >>= 1;
+
+      if (accu >= FLTCARRY)
+	return INFFLT;
+    }
+
+  assert (accu < FLTCARRY);
+  assert (accu & FLTMSB);
+
+  ma = accu;
+  ma &= ~FLTMSB;
+
+  return packflt (ma, ea);
+}
+
+static Flt
+ascii2flt (const char *str)
+{
+  Flt ten = base2flt (10, 0);
+  Flt onetenth = base2flt (26843546, -28);
+  Flt res = ZEROFLT, tmp, base;
+  const char *p = str;
+  int ch;
+
+  ch = *p++;
+
+  if (ch != '.')
+    {
+      if (!isdigit (ch))
+	return INFFLT;	/* better abort ? */
+
+      res = base2flt (ch - '0', 0);
+
+      while ((ch = *p++))
+	{
+	  if (ch == '.')
+	    break;
+
+	  if (!isdigit (ch))
+	    return INFFLT;	/* better abort? */
+
+	  res = mulflt (res, ten);
+	  tmp = base2flt (ch - '0', 0);
+	  res = addflt (res, tmp);
+	}
+    }
+
+  if (ch == '.')
+    {
+      ch = *p++;
+      if (!isdigit (ch))
+	return INFFLT;	/* better abort ? */
+
+      base = onetenth;
+      tmp = mulflt (base2flt (ch - '0', 0), base);
+      res = addflt (res, tmp);
+
+      while ((ch = *p++))
+	{
+	  if (!isdigit (ch))
+	    return INFFLT;	/* better abort? */
+
+	  base = mulflt (base, onetenth);
+	  tmp = mulflt (base2flt (ch - '0', 0), base);
+	  res = addflt (res, tmp);
+	}
+    }
+
+  return res;
+}
+
+#if defined(VISCORES)
+
+static double
+flt2double (Flt f)
+{
+  double res;
+  unsigned m;
+  int e, i;
+
+  UNPACKFLT (f, m, e);
+  res = m;
+
+  if (e < 0)
+    {
+      for (i = e; i < 0; i++)
+	res *= 0.5;
+    }
+  else
+    {
+      for (i = 0; i < e; i++)
+	res *= 2.0;
+    }
+
+  return res;
+}
+
+#endif
+
+static int
+log2flt (Flt a)
+{
+  return FLTEXPONENT (a) + 24;
+}
+
+static int
+cmpflt (Flt a, Flt b)
+{
+  if (a < b)
+    return -1;
+
+  if (a > b)
+    return 1;
+
+  return 0;
+}
+
+static void *
+new (PS * ps, size_t size)
+{
+  size_t bytes;
+  Blk *b;
+
+  if (!size)
+    return 0;
+
+  bytes = size + SIZE_OF_BLK;
+
+  if (ps->enew)
+    b = ps->enew (ps->emgr, bytes);
+  else
+    b = malloc (bytes);
+
+  ABORTIF (!b, "out of memory in 'new'");
+#ifndef NDEBUG
+  b->header.size = size;
+#endif
+  ps->current_bytes += size;
+  if (ps->current_bytes > ps->max_bytes)
+    ps->max_bytes = ps->current_bytes;
+  return b->data;
+}
+
+static void
+delete (PS * ps, void *void_ptr, size_t size)
+{
+  size_t bytes;
+  Blk *b;
+
+  if (!void_ptr)
+    {
+      assert (!size);
+      return;
+    }
+
+  assert (size);
+  b = PTR2BLK (void_ptr);
+
+  assert (size <= ps->current_bytes);
+  ps->current_bytes -= size;
+
+  assert (b->header.size == size);
+
+  bytes = size + SIZE_OF_BLK;
+  if (ps->edelete)
+    ps->edelete (ps->emgr, b, bytes);
+  else
+    free (b);
+}
+
+static void *
+resize (PS * ps, void *void_ptr, size_t old_size, size_t new_size)
+{
+  size_t old_bytes, new_bytes;
+  Blk *b;
+
+  b = PTR2BLK (void_ptr);
+
+  assert (old_size <= ps->current_bytes);
+  ps->current_bytes -= old_size;
+
+  if ((old_bytes = old_size))
+    {
+      assert (old_size && b && b->header.size == old_size);
+      old_bytes += SIZE_OF_BLK;
+    }
+  else
+    assert (!b);
+
+  if ((new_bytes = new_size))
+    new_bytes += SIZE_OF_BLK;
+
+  if (ps->eresize)
+    b = ps->eresize (ps->emgr, b, old_bytes, new_bytes);
+  else
+    b = realloc (b, new_bytes);
+
+  if (!new_size)
+    {
+      assert (!b);
+      return 0;
+    }
+
+  ABORTIF (!b, "out of memory in 'resize'");
+#ifndef NDEBUG
+  b->header.size = new_size;
+#endif
+
+  ps->current_bytes += new_size;
+  if (ps->current_bytes > ps->max_bytes)
+    ps->max_bytes = ps->current_bytes;
+
+  return b->data;
+}
+
+static unsigned
+int2unsigned (int l)
+{
+  return (l < 0) ? 1 + 2 * -l : 2 * l;
+}
+
+static Lit *
+int2lit (PS * ps, int l)
+{
+  return ps->lits + int2unsigned (l);
+}
+
+static Lit **
+end_of_lits (Cls * c)
+{
+  return (Lit**)c->lits + c->size;
+}
+
+#if !defined(NDEBUG) || defined(LOGGING)
+
+static void
+dumplits (PS * ps, Lit ** l, Lit ** end)
+{
+  int first;
+  Lit ** p;
+
+  if (l == end)
+    {
+      /* empty clause */
+    }
+  else if (l + 1 == end)
+    {
+      fprintf (ps->out, "%d ", LIT2INT (l[0]));
+    }
+  else
+    {
+      assert (l + 2 <= end);
+      first = (abs (LIT2INT (l[0])) > abs (LIT2INT (l[1])));
+      fprintf (ps->out, "%d ", LIT2INT (l[first]));
+      fprintf (ps->out, "%d ", LIT2INT (l[!first]));
+      for (p = l + 2; p < end; p++)
+	 fprintf (ps->out, "%d ", LIT2INT (*p));
+    }
+
+  fputc ('0', ps->out);
+}
+
+static void
+dumpcls (PS * ps, Cls * c)
+{
+  Lit **end;
+
+  if (c)
+    {
+      end = end_of_lits (c);
+      dumplits (ps, c->lits, end);
+#ifdef TRACE
+      if (ps->trace)
+	 fprintf (ps->out, " clause(%u)", CLS2IDX (c));
+#endif
+    }
+  else
+    fputs ("DECISION", ps->out);
+}
+
+static void
+dumpclsnl (PS * ps, Cls * c)
+{
+  dumpcls (ps, c);
+  fputc ('\n', ps->out);
+}
+
+void
+dumpcnf (PS * ps)
+{
+  Cls **p, *c;
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      c = *p;
+
+      if (!c)
+	continue;
+
+#ifdef TRACE
+      if (c->collected)
+	continue;
+#endif
+
+      dumpclsnl (ps, *p);
+    }
+}
+
+#endif
+
+static void
+delete_prefix (PS * ps)
+{
+  if (!ps->prefix)
+    return;
+
+  delete (ps, ps->prefix, strlen (ps->prefix) + 1);
+  ps->prefix = 0;
+}
+
+static void
+new_prefix (PS * ps, const char * str)
+{
+  delete_prefix (ps);
+  assert (str);
+  ps->prefix = new (ps, strlen (str) + 1);
+  strcpy (ps->prefix, str);
+}
+
+static PS *
+init (void * pmgr,
+      picosat_malloc pnew, picosat_realloc presize, picosat_free pdelete)
+{
+  PS * ps;
+
+#if 0
+  int count = 3 - !pnew - !presize - !pdelete;
+
+  ABORTIF (count && !pnew, "API usage: missing 'picosat_set_new'");
+  ABORTIF (count && !presize, "API usage: missing 'picosat_set_resize'");
+  ABORTIF (count && !pdelete, "API usage: missing 'picosat_set_delete'");
+#endif
+
+  ps = pnew ? pnew (pmgr, sizeof *ps) : malloc (sizeof *ps);
+  ABORTIF (!ps, "failed to allocate memory for PicoSAT manager");
+  memset (ps, 0, sizeof *ps);
+
+  ps->emgr = pmgr;
+  ps->enew = pnew;
+  ps->eresize = presize;
+  ps->edelete = pdelete;
+
+  ps->size_vars = 1;
+  ps->state = RESET;
+  ps->defaultphase = JWLPHASE;
+#ifdef TRACE
+  ps->ocore = -1;
+#endif
+  ps->lastrheader = -2;
+#ifndef NADC
+  ps->adoconflictlimit = UINT_MAX;
+#endif
+  ps->min_flipped = UINT_MAX;
+
+  NEWN (ps->lits, 2 * ps->size_vars);
+  NEWN (ps->jwh, 2 * ps->size_vars);
+  NEWN (ps->htps, 2 * ps->size_vars);
+#ifndef NDSC
+  NEWN (ps->dhtps, 2 * ps->size_vars);
+#endif
+  NEWN (ps->impls, 2 * ps->size_vars);
+  NEWN (ps->vars, ps->size_vars);
+  NEWN (ps->rnks, ps->size_vars);
+
+  /* because '0' pos denotes not on heap
+   */
+  ENLARGE (ps->heap, ps->hhead, ps->eoh);
+  ps->hhead = ps->heap + 1;
+
+  ps->vinc = base2flt (1, 0);		/* initial var activity */
+  ps->ifvinc = ascii2flt ("1.05");	/* var score rescore factor */
+#ifdef VISCORES
+  ps->fvinc = ascii2flt ("0.9523809");	/*     1/f =     1/1.05 */
+  ps->nvinc = ascii2flt ("0.0476191");	/* 1 - 1/f = 1 - 1/1.05 */
+#endif
+  ps->lscore = base2flt (1, 90);	/* var activity rescore limit */
+  ps->ilvinc = base2flt (1, -90);	/* inverse of 'lscore' */
+
+  ps->cinc = base2flt (1, 0);		/* initial clause activity */
+  ps->fcinc = ascii2flt ("1.001");	/* cls activity rescore factor */
+  ps->lcinc = base2flt (1, 90);		/* cls activity rescore limit */
+  ps->ilcinc = base2flt (1, -90);	/* inverse of 'ilcinc' */
+
+  ps->lreduceadjustcnt = ps->lreduceadjustinc = 100;
+  ps->lpropagations = ~0ull;
+
+#ifndef RCODE
+  ps->out = stdout;
+#else
+  ps->out = 0;
+#endif
+  new_prefix (ps, "c ");
+  ps->verbosity = 0;
+  ps->plain = 0;
+
+#ifdef NO_BINARY_CLAUSES
+  memset (&ps->impl, 0, sizeof (ps->impl));
+  ps->impl.size = 2;
+
+  memset (&ps->cimpl, 0, sizeof (ps->impl));
+  ps->cimpl.size = 2;
+#endif
+
+#ifdef VISCORES
+  ps->fviscores = popen (
+    "/usr/bin/gnuplot -background black"
+    " -xrm 'gnuplot*textColor:white'"
+    " -xrm 'gnuplot*borderColor:white'"
+    " -xrm 'gnuplot*axisColor:white'"
+    , "w");
+  fprintf (ps->fviscores, "unset key\n");
+  // fprintf (ps->fviscores, "set log y\n");
+  fflush (ps->fviscores);
+  system ("rm -rf /tmp/picosat-viscores");
+  system ("mkdir /tmp/picosat-viscores");
+  system ("mkdir /tmp/picosat-viscores/data");
+#ifdef WRITEGIF
+  system ("mkdir /tmp/picosat-viscores/gif");
+  fprintf (ps->fviscores,
+           "set terminal gif giant animate opt size 1024,768 x000000 xffffff"
+	   "\n");
+
+  fprintf (ps->fviscores,
+           "set output \"/tmp/picosat-viscores/gif/animated.gif\"\n");
+#endif
+#endif
+  ps->defaultphase = JWLPHASE;
+  ps->state = READY;
+  ps->last_sat_call_result = 0;
+
+  return ps;
+}
+
+static size_t
+bytes_clause (PS * ps, unsigned size, unsigned learned)
+{
+  size_t res;
+
+  res = sizeof (Cls);
+  res += size * sizeof (Lit *);
+  res -= 2 * sizeof (Lit *);
+
+  if (learned && size > 2)
+    res += sizeof (Act);	/* add activity */
+
+#ifdef TRACE
+  if (ps->trace)
+    res += sizeof (Trd);	/* add trace data */
+#else
+  (void) ps;
+#endif
+
+  return res;
+}
+
+static Cls *
+new_clause (PS * ps, unsigned size, unsigned learned)
+{
+  size_t bytes;
+  void * tmp;
+#ifdef TRACE
+  Trd *trd;
+#endif
+  Cls *res;
+
+  bytes = bytes_clause (ps, size, learned);
+  tmp = new (ps, bytes);
+
+#ifdef TRACE
+  if (ps->trace)
+    {
+      trd = tmp;
+
+      if (learned)
+	trd->idx = LIDX2IDX (ps->lhead - ps->lclauses);
+      else
+	trd->idx = OIDX2IDX (ps->ohead - ps->oclauses);
+
+      res = trd->cls;
+    }
+  else
+#endif
+    res = tmp;
+
+  res->size = size;
+  res->learned = learned;
+
+  res->collect = 0;
+#ifndef NDEBUG
+  res->connected = 0;
+#endif
+  res->locked = 0;
+  res->used = 0;
+#ifdef TRACE
+  res->core = 0;
+  res->collected = 0;
+#endif
+
+  if (learned && size > 2)
+    {
+      Act * p = CLS2ACT (res);
+      *p = ps->cinc;
+    }
+
+  return res;
+}
+
+static void
+delete_clause (PS * ps, Cls * c)
+{
+  size_t bytes;
+#ifdef TRACE
+  Trd *trd;
+#endif
+
+  bytes = bytes_clause (ps, c->size, c->learned);
+
+#ifdef TRACE
+  if (ps->trace)
+    {
+      trd = CLS2TRD (c);
+      delete (ps, trd, bytes);
+    }
+  else
+#endif
+    delete (ps, c, bytes);
+}
+
+static void
+delete_clauses (PS * ps)
+{
+  Cls **p;
+  for (p = SOC; p != EOC; p = NXC (p))
+    if (*p)
+      delete_clause (ps, *p);
+
+  DELETEN (ps->oclauses, ps->eoo - ps->oclauses);
+  DELETEN (ps->lclauses, ps->EOL - ps->lclauses);
+
+  ps->ohead = ps->eoo = ps->lhead = ps->EOL = 0;
+}
+
+#ifdef TRACE
+
+static void
+delete_zhain (PS * ps, Zhn * zhain)
+{
+  const Znt *p, *znt;
+
+  assert (zhain);
+
+  znt = zhain->znt;
+  for (p = znt; *p; p++)
+    ;
+
+  delete (ps, zhain, sizeof (Zhn) + (p - znt) + 1);
+}
+
+static void
+delete_zhains (PS * ps)
+{
+  Zhn **p, *z;
+  for (p = ps->zhains; p < ps->zhead; p++)
+    if ((z = *p))
+      delete_zhain (ps, z);
+
+  DELETEN (ps->zhains, ps->eoz - ps->zhains);
+  ps->eoz = ps->zhead = 0;
+}
+
+#endif
+
+#ifdef NO_BINARY_CLAUSES
+static void
+lrelease (PS * ps, Ltk * stk)
+{
+  if (stk->start)
+    DELETEN (stk->start, (1 << (stk->ldsize)));
+  memset (stk, 0, sizeof (*stk));
+}
+#endif
+
+#ifndef NADC
+
+static unsigned
+llength (Lit ** a)
+{
+  Lit ** p;
+  for (p = a; *p; p++)
+    ;
+  return p - a;
+}
+
+static void
+resetadoconflict (PS * ps)
+{
+  assert (ps->adoconflict);
+  delete_clause (ps, ps->adoconflict);
+  ps->adoconflict = 0;
+}
+
+static void
+reset_ados (PS * ps)
+{
+  Lit *** p;
+
+  for (p = ps->ados; p < ps->hados; p++)
+    DELETEN (*p, llength (*p) + 1);
+
+  DELETEN (ps->ados, ps->eados - ps->ados);
+  ps->hados = ps->eados = 0;
+
+  DELETEN (ps->adotab, ps->szadotab);
+  ps->szadotab = ps->nadotab = 0;
+
+  if (ps->adoconflict)
+    resetadoconflict (ps);
+
+  ps->adoconflicts = 0;
+  ps->adoconflictlimit = UINT_MAX;
+  ps->adodisabled = 0;
+}
+
+#endif
+
+static void
+reset (PS * ps)
+{
+  ABORTIF (!ps ||
+           ps->state == RESET, "API usage: reset without initialization");
+
+  delete_clauses (ps);
+#ifdef TRACE
+  delete_zhains (ps);
+#endif
+#ifdef NO_BINARY_CLAUSES
+  {
+    unsigned i;
+    for (i = 2; i <= 2 * ps->max_var + 1; i++)
+      lrelease (ps, ps->impls + i);
+  }
+#endif
+#ifndef NADC
+  reset_ados (ps);
+#endif
+#ifndef NFL
+  DELETEN (ps->saved, ps->saved_size);
+#endif
+  DELETEN (ps->htps, 2 * ps->size_vars);
+#ifndef NDSC
+  DELETEN (ps->dhtps, 2 * ps->size_vars);
+#endif
+  DELETEN (ps->impls, 2 * ps->size_vars);
+  DELETEN (ps->lits, 2 * ps->size_vars);
+  DELETEN (ps->jwh, 2 * ps->size_vars);
+  DELETEN (ps->vars, ps->size_vars);
+  DELETEN (ps->rnks, ps->size_vars);
+  DELETEN (ps->trail, ps->eot - ps->trail);
+  DELETEN (ps->heap, ps->eoh - ps->heap);
+  DELETEN (ps->als, ps->eoals - ps->als);
+  DELETEN (ps->CLS, ps->eocls - ps->CLS);
+  DELETEN (ps->rils, ps->eorils - ps->rils);
+  DELETEN (ps->cils, ps->eocils - ps->cils);
+  DELETEN (ps->fals, ps->eofals - ps->fals);
+  DELETEN (ps->mass, ps->szmass);
+  DELETEN (ps->mssass, ps->szmssass);
+  DELETEN (ps->mcsass, ps->szmcsass);
+  DELETEN (ps->humus, ps->szhumus);
+  DELETEN (ps->added, ps->eoa - ps->added);
+  DELETEN (ps->marked, ps->eom - ps->marked);
+  DELETEN (ps->dfs, ps->eod - ps->dfs);
+  DELETEN (ps->resolved, ps->eor - ps->resolved);
+  DELETEN (ps->levels, ps->eolevels - ps->levels);
+  DELETEN (ps->dused, ps->eodused - ps->dused);
+  DELETEN (ps->buffer, ps->eob - ps->buffer);
+  DELETEN (ps->indices, ps->eoi - ps->indices);
+  DELETEN (ps->soclauses, ps->eoso - ps->soclauses);
+  delete_prefix (ps);
+  delete (ps, ps->rline[0], ps->szrline);
+  delete (ps, ps->rline[1], ps->szrline);
+  assert (getenv ("LEAK") || !ps->current_bytes);	/* found leak if failing */
+#ifdef VISCORES
+  pclose (ps->fviscores);
+#endif
+  if (ps->edelete)
+    ps->edelete (ps->emgr, ps, sizeof *ps);
+  else
+    free (ps);
+}
+
+inline static void
+tpush (PS * ps, Lit * lit)
+{
+  assert (ps->lits < lit && lit <= ps->lits + 2* ps->max_var + 1);
+  if (ps->thead == ps->eot)
+    {
+      unsigned ttail2count = ps->ttail2 - ps->trail;
+      unsigned ttailcount = ps->ttail - ps->trail;
+#ifndef NADC
+      unsigned ttailadocount = ps->ttailado - ps->trail;
+#endif
+      ENLARGE (ps->trail, ps->thead, ps->eot);
+      ps->ttail = ps->trail + ttailcount;
+      ps->ttail2 = ps->trail + ttail2count;
+#ifndef NADC
+      ps->ttailado = ps->trail + ttailadocount;
+#endif
+    }
+
+  *ps->thead++ = lit;
+}
+
+static void
+assign_reason (PS * ps, Var * v, Cls * reason)
+{
+#if defined(NO_BINARY_CLAUSES) && !defined(NDEBUG)
+  assert (reason != &ps->impl);
+#else
+  (void) ps;
+#endif
+  v->reason = reason;
+}
+
+static void
+assign_phase (PS * ps, Lit * lit)
+{
+  unsigned new_phase, idx;
+  Var * v = LIT2VAR (lit);
+
+#ifndef NFL
+  /* In 'simplifying' mode we only need to keep 'min_flipped' up to date if
+   * we force assignments on the top level.   The other assignments will be
+   * undone and thus we can keep the old saved value of the phase.
+   */
+  if (!ps->LEVEL || !ps->simplifying)
+#endif
+    {
+      new_phase = (LIT2SGN (lit) > 0);
+
+      if (v->assigned)
+	{
+	  ps->sdflips -= ps->sdflips/FFLIPPED;
+
+	  if (new_phase != v->phase)
+	    {
+	      assert (FFLIPPEDPREC >= FFLIPPED);
+	      ps->sdflips += FFLIPPEDPREC / FFLIPPED;
+	      ps->flips++;
+
+	      idx = LIT2IDX (lit);
+	      if (idx < ps->min_flipped)
+		ps->min_flipped = idx;
+
+              NOLOG (fprintf (ps->out,
+	                      "%sflipped %d\n",
+			       ps->prefix, LIT2INT (lit)));
+	    }
+	}
+
+      v->phase = new_phase;
+      v->assigned = 1;
+    }
+
+  lit->val = TRUE;
+  NOTLIT (lit)->val = FALSE;
+}
+
+inline static void
+assign (PS * ps, Lit * lit, Cls * reason)
+{
+  Var * v = LIT2VAR (lit);
+  assert (lit->val == UNDEF);
+#ifdef STATS
+  ps->assignments++;
+#endif
+  v->level = ps->LEVEL;
+  assign_phase (ps, lit);
+  assign_reason (ps, v, reason);
+  tpush (ps, lit);
+}
+
+inline static int
+cmp_added (PS * ps, Lit * k, Lit * l)
+{
+  Val a = k->val, b = l->val;
+  Var *u, *v;
+  int res;
+
+  if (a == UNDEF && b != UNDEF)
+    return -1;
+
+  if (a != UNDEF && b == UNDEF)
+    return 1;
+
+  u = LIT2VAR (k);
+  v = LIT2VAR (l);
+
+  if (a != UNDEF)
+    {
+      assert (b != UNDEF);
+      res = v->level - u->level;
+      if (res)
+	return res;		/* larger level first */
+    }
+
+  res = cmpflt (VAR2RNK (u)->score, VAR2RNK (v)->score);
+  if (res)
+    return res;			/* smaller activity first */
+
+  return u - v;			/* smaller index first */
+}
+
+static void
+sorttwolits (Lit ** v)
+{
+  Lit * a = v[0], * b = v[1];
+
+  assert (a != b);
+
+  if (a < b)
+    return;
+
+  v[0] = b;
+  v[1] = a;
+}
+
+inline static void
+sortlits (PS * ps, Lit ** v, unsigned size)
+{
+  if (size == 2)
+    sorttwolits (v);	/* same order with and with out 'NO_BINARY_CLAUSES' */
+  else
+    SORT (Lit *, cmp_added, v, size);
+}
+
+#ifdef NO_BINARY_CLAUSES
+static Cls *
+setimpl (PS * ps, Lit * a, Lit * b)
+{
+  assert (!ps->implvalid);
+  assert (ps->impl.size == 2);
+
+  ps->impl.lits[0] = a;
+  ps->impl.lits[1] = b;
+
+  sorttwolits (ps->impl.lits);
+  ps->implvalid = 1;
+
+  return &ps->impl;
+}
+
+static void
+resetimpl (PS * ps)
+{
+  ps->implvalid = 0;
+}
+
+static Cls *
+setcimpl (PS * ps, Lit * a, Lit * b)
+{
+  assert (!ps->cimplvalid);
+  assert (ps->cimpl.size == 2);
+
+  ps->cimpl.lits[0] = a;
+  ps->cimpl.lits[1] = b;
+
+  sorttwolits (ps->cimpl.lits);
+  ps->cimplvalid = 1;
+
+  return &ps->cimpl;
+}
+
+static void
+resetcimpl (PS * ps)
+{
+  assert (ps->cimplvalid);
+  ps->cimplvalid = 0;
+}
+
+#endif
+
+static int
+cmp_ptr (PS * ps, void *l, void *k)
+{
+  (void) ps;
+  return ((char*)l) - (char*)k;		/* arbitrarily already reverse */
+}
+
+static int
+cmp_rnk (Rnk * r, Rnk * s)
+{
+  if (!r->moreimportant && s->moreimportant)
+    return -1;
+
+  if (r->moreimportant && !s->moreimportant)
+    return 1;
+
+  if (!r->lessimportant && s->lessimportant)
+    return 1;
+
+  if (r->lessimportant && !s->lessimportant)
+    return -1;
+
+  if (r->score < s->score)
+    return -1;
+
+  if (r->score > s->score)
+    return 1;
+
+  return -cmp_ptr (0, r, s);
+}
+
+static void
+hup (PS * ps, Rnk * v)
+{
+  int upos, vpos;
+  Rnk *u;
+
+#ifndef NFL
+  assert (!ps->simplifying);
+#endif
+
+  vpos = v->pos;
+
+  assert (0 < vpos);
+  assert (vpos < ps->hhead - ps->heap);
+  assert (ps->heap[vpos] == v);
+
+  while (vpos > 1)
+    {
+      upos = vpos / 2;
+
+      u = ps->heap[upos];
+
+      if (cmp_rnk (u, v) > 0)
+	break;
+
+      ps->heap[vpos] = u;
+      u->pos = vpos;
+
+      vpos = upos;
+    }
+
+  ps->heap[vpos] = v;
+  v->pos = vpos;
+}
+
+static Cls *add_simplified_clause (PS *, int);
+
+inline static void
+add_antecedent (PS * ps, Cls * c)
+{
+  assert (c);
+
+#ifdef NO_BINARY_CLAUSES
+  if (ISLITREASON (c))
+    return;
+
+  if (c == &ps->impl)
+    return;
+#elif defined(STATS) && defined(TRACE)
+  ps->antecedents++;
+#endif
+  if (ps->rhead == ps->eor)
+    ENLARGE (ps->resolved, ps->rhead, ps->eor);
+
+  assert (ps->rhead < ps->eor);
+  *ps->rhead++ = c;
+}
+
+#ifdef TRACE
+
+#ifdef NO_BINARY_CLAUSES
+#error "can not combine TRACE and NO_BINARY_CLAUSES"
+#endif
+
+#endif /* TRACE */
+
+static void
+add_lit (PS * ps, Lit * lit)
+{
+  assert (lit);
+
+  if (ps->ahead == ps->eoa)
+    ENLARGE (ps->added, ps->ahead, ps->eoa);
+
+  *ps->ahead++ = lit;
+}
+
+static void
+push_var_as_marked (PS * ps, Var * v)
+{
+  if (ps->mhead == ps->eom)
+    ENLARGE (ps->marked, ps->mhead, ps->eom);
+
+  *ps->mhead++ = v;
+}
+
+static void
+mark_var (PS * ps, Var * v)
+{
+  assert (!v->mark);
+  v->mark = 1;
+  push_var_as_marked (ps, v);
+}
+
+#ifdef NO_BINARY_CLAUSES
+
+static Cls *
+impl2reason (PS * ps, Lit * lit)
+{
+  Lit * other;
+  Cls * res;
+  other = ps->impl.lits[0];
+  if (lit == other)
+    other = ps->impl.lits[1];
+  assert (other->val == FALSE);
+  res = LIT2REASON (NOTLIT (other));
+  resetimpl (ps);
+  return res;
+}
+
+#endif
+
+/* Whenever we have a top level derived unit we really should derive a unit
+ * clause otherwise the resolutions in 'add_simplified_clause' become
+ * incorrect.
+ */
+static Cls *
+resolve_top_level_unit (PS * ps, Lit * lit, Cls * reason)
+{
+  unsigned count_resolved;
+  Lit **p, **eol, *other;
+  Var *u, *v;
+
+  assert (ps->rhead == ps->resolved);
+  assert (ps->ahead == ps->added);
+
+  add_lit (ps, lit);
+  add_antecedent (ps, reason);
+  count_resolved = 1;
+  v = LIT2VAR (lit);
+
+  eol = end_of_lits (reason);
+  for (p = reason->lits; p < eol; p++)
+    {
+      other = *p;
+      u = LIT2VAR (other);
+      if (u == v)
+	continue;
+
+      add_antecedent (ps, u->reason);
+      count_resolved++;
+    }
+
+  /* Some of the literals could be assumptions.  If at least one
+   * variable is not an assumption, we should resolve.
+   */
+  if (count_resolved >= 2)
+    {
+#ifdef NO_BINARY_CLAUSES
+      if (reason == &ps->impl)
+	resetimpl (ps);
+#endif
+      reason = add_simplified_clause (ps, 1);
+#ifdef NO_BINARY_CLAUSES
+      if (reason->size == 2)
+	{
+	  assert (reason == &ps->impl);
+	  reason = impl2reason (ps, lit);
+	}
+#endif
+      assign_reason (ps, v, reason);
+    }
+  else
+    {
+      ps->ahead = ps->added;
+      ps->rhead = ps->resolved;
+    }
+
+  return reason;
+}
+
+static void
+fixvar (PS * ps, Var * v)
+{
+  Rnk * r;
+
+  assert (VAR2LIT (v) != UNDEF);
+  assert (!v->level);
+
+  ps->fixed++;
+
+  r = VAR2RNK (v);
+  r->score = INFFLT;
+
+#ifndef NFL
+  if (ps->simplifying)
+    return;
+#endif
+
+  if (!r->pos)
+    return;
+
+  hup (ps, r);
+}
+
+static void
+use_var (PS * ps, Var * v)
+{
+  if (v->used)
+    return;
+
+  v->used = 1;
+  ps->vused++;
+}
+
+static void
+assign_forced (PS * ps, Lit * lit, Cls * reason)
+{
+  Var *v;
+
+  assert (reason);
+  assert (lit->val == UNDEF);
+
+#ifdef STATS
+  ps->FORCED++;
+#endif
+  assign (ps, lit, reason);
+
+#ifdef NO_BINARY_CLAUSES
+  assert (reason != &ps->impl);
+  if (ISLITREASON (reason))
+    {
+      reason = setimpl (ps, lit, NOTLIT (REASON2LIT (reason)));
+      assert (reason);
+    }
+#endif
+  LOG ( fprintf (ps->out,
+                "%sassign %d at level %d by ",
+                ps->prefix, LIT2INT (lit), ps->LEVEL);
+       dumpclsnl (ps, reason));
+
+  v = LIT2VAR (lit);
+  if (!ps->LEVEL)
+    use_var (ps, v);
+
+  if (!ps->LEVEL && reason->size > 1)
+    {
+      reason = resolve_top_level_unit (ps, lit, reason);
+      assert (reason);
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  if (ISLITREASON (reason) || reason == &ps->impl)
+    {
+      /* DO NOTHING */
+    }
+  else
+#endif
+    {
+      assert (!reason->locked);
+      reason->locked = 1;
+      if (reason->learned && reason->size > 2)
+	ps->llocked++;
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  if (reason == &ps->impl)
+    resetimpl (ps);
+#endif
+
+  if (!ps->LEVEL)
+    fixvar (ps, v);
+}
+
+#ifdef NO_BINARY_CLAUSES
+
+static void
+lpush (PS * ps, Lit * lit, Cls * c)
+{
+  int pos = (c->lits[0] == lit);
+  Ltk * s = LIT2IMPLS (lit);
+  unsigned oldsize, newsize;
+
+  assert (c->size == 2);
+
+  if (!s->start)
+    {
+      assert (!s->count);
+      assert (!s->ldsize);
+      NEWN (s->start, 1);
+    }
+  else
+    {
+      oldsize = (1 << (s->ldsize));
+      assert (s->count <= oldsize);
+      if (s->count == oldsize)
+	{
+	  newsize = 2 * oldsize;
+	  RESIZEN (s->start, oldsize, newsize);
+	  s->ldsize++;
+	}
+    }
+
+  s->start[s->count++] = c->lits[pos];
+}
+
+#endif
+
+static void
+connect_head_tail (PS * ps, Lit * lit, Cls * c)
+{
+  Cls ** s;
+  assert (c->size >= 1);
+  if (c->size == 2)
+    {
+#ifdef NO_BINARY_CLAUSES
+      lpush (ps, lit, c);
+      return;
+#else
+      s = LIT2IMPLS (lit);
+#endif
+    }
+  else
+    s = LIT2HTPS (lit);
+
+  if (c->lits[0] != lit)
+    {
+      assert (c->size >= 2);
+      assert (c->lits[1] == lit);
+      c->next[1] = *s;
+    }
+  else
+    c->next[0] = *s;
+
+  *s = c;
+}
+
+#ifdef TRACE
+static void
+zpush (PS * ps, Zhn * zhain)
+{
+  assert (ps->trace);
+
+  if (ps->zhead == ps->eoz)
+    ENLARGE (ps->zhains, ps->zhead, ps->eoz);
+
+  *ps->zhead++ = zhain;
+}
+
+static int
+cmp_resolved (PS * ps, Cls * c, Cls * d)
+{
+#ifndef NDEBUG
+  assert (ps->trace);
+#else
+  (void) ps;
+#endif
+  return CLS2IDX (c) - CLS2IDX (d);
+}
+
+static void
+bpushc (PS * ps, unsigned char ch)
+{
+  if (ps->bhead == ps->eob)
+    ENLARGE (ps->buffer, ps->bhead, ps->eob);
+
+  *ps->bhead++ = ch;
+}
+
+static void
+bpushu (PS * ps, unsigned u)
+{
+  while (u & ~0x7f)
+    {
+      bpushc (ps, u | 0x80);
+      u >>= 7;
+    }
+
+  bpushc (ps, u);
+}
+
+static void
+bpushd (PS * ps, unsigned prev, unsigned this)
+{
+  unsigned delta;
+  assert (prev < this);
+  delta = this - prev;
+  bpushu (ps, delta);
+}
+
+static void
+add_zhain (PS * ps)
+{
+  unsigned prev, this, count, rcount;
+  Cls **p, *c;
+  Zhn *res;
+
+  assert (ps->trace);
+  assert (ps->bhead == ps->buffer);
+  assert (ps->rhead > ps->resolved);
+
+  rcount = ps->rhead - ps->resolved;
+  SORT (Cls *, cmp_resolved, ps->resolved, rcount);
+
+  prev = 0;
+  for (p = ps->resolved; p < ps->rhead; p++)
+    {
+      c = *p;
+      this = CLS2TRD (c)->idx;
+      bpushd (ps, prev, this);
+      prev = this;
+    }
+  bpushc (ps, 0);
+
+  count = ps->bhead - ps->buffer;
+
+  res = new (ps, sizeof (Zhn) + count);
+  res->core = 0;
+  res->ref = 0;
+  memcpy (res->znt, ps->buffer, count);
+
+  ps->bhead = ps->buffer;
+#ifdef STATS
+  ps->znts += count - 1;
+#endif
+  zpush (ps, res);
+}
+
+#endif
+
+static void
+add_resolved (PS * ps, int learned)
+{
+#if defined(STATS) || defined(TRACE)
+  Cls **p, *c;
+
+  for (p = ps->resolved; p < ps->rhead; p++)
+    {
+      c = *p;
+      if (c->used)
+	continue;
+
+      c->used = 1;
+
+      if (c->size <= 2)
+	continue;
+
+#ifdef STATS
+      if (c->learned)
+	ps->llused++;
+      else
+	ps->loused++;
+#endif
+    }
+#endif
+
+#ifdef TRACE
+  if (learned && ps->trace)
+    add_zhain (ps);
+#else
+  (void) learned;
+#endif
+  ps->rhead = ps->resolved;
+}
+
+static void
+incjwh (PS * ps, Cls * c)
+{
+  Lit **p, *lit, ** eol;
+  Flt * f, inc, sum;
+  unsigned size = 0;
+  Var * v;
+  Val val;
+
+  eol = end_of_lits (c);
+
+  for (p = c->lits; p < eol; p++)
+    {
+      lit = *p;
+      val = lit->val;
+
+      if (val && ps->LEVEL > 0)
+	{
+	  v = LIT2VAR (lit);
+	  if (v->level > 0)
+	    val = UNDEF;
+	}
+
+      if (val == TRUE)
+	return;
+
+      if (val != FALSE)
+	size++;
+    }
+
+  inc = base2flt (1, -size);
+
+  for (p = c->lits; p < eol; p++)
+    {
+      lit = *p;
+      f = LIT2JWH (lit);
+      sum = addflt (*f, inc);
+      *f = sum;
+    }
+}
+
+static void
+write_rup_header (PS * ps, FILE * file)
+{
+  char line[80];
+  int i;
+
+  sprintf (line, "%%RUPD32 %u %u", ps->rupvariables, ps->rupclauses);
+
+  fputs (line, file);
+  for (i = 255 - strlen (line); i >= 0; i--)
+    fputc (' ', file);
+
+  fputc ('\n', file);
+  fflush (file);
+}
+
+static Cls *
+add_simplified_clause (PS * ps, int learned)
+{
+  unsigned num_true, num_undef, num_false, size, count_resolved;
+  Lit **p, **q, *lit, ** end;
+  unsigned litlevel, glue;
+  Cls *res, * reason;
+  int reentered;
+  Val val;
+  Var *v;
+#if !defined(NDEBUG) && defined(TRACE)
+  unsigned idx;
+#endif
+
+  reentered = 0;
+
+REENTER:
+
+  size = ps->ahead - ps->added;
+
+  add_resolved (ps, learned);
+
+  if (learned)
+    {
+      ps->ladded++;
+      ps->llitsadded += size;
+      if (size > 2)
+	{
+	  ps->lladded++;
+	  ps->nlclauses++;
+	  ps->llits += size;
+	}
+    }
+  else
+    {
+      ps->oadded++;
+      if (size > 2)
+	{
+	  ps->loadded++;
+	  ps->noclauses++;
+	  ps->olits += size;
+	}
+    }
+
+  ps->addedclauses++;
+  assert (ps->addedclauses == ps->ladded + ps->oadded);
+
+#ifdef NO_BINARY_CLAUSES
+  if (size == 2)
+    res = setimpl (ps, ps->added[0], ps->added[1]);
+  else
+#endif
+    {
+      sortlits (ps, ps->added, size);
+
+      if (learned)
+	{
+	  if (ps->lhead == ps->EOL)
+	    {
+	      ENLARGE (ps->lclauses, ps->lhead, ps->EOL);
+
+	      /* A very difficult to find bug, which only occurs if the
+	       * learned clauses stack is immediately allocated before the
+	       * original clauses stack without padding.  In this case, we
+	       * have 'SOC == EOC', which terminates all loops using the
+	       * idiom 'for (p = SOC; p != EOC; p = NXC(p))' immediately.
+	       * Unfortunately this occurred in 'fix_clause_lits' after
+	       * using a recent version of the memory allocator of 'Google'
+	       * perftools in the context of one large benchmark for
+	       * our SMT solver 'Boolector'.
+	       */
+	      if (ps->EOL == ps->oclauses)
+		ENLARGE (ps->lclauses, ps->lhead, ps->EOL);
+	    }
+
+#if !defined(NDEBUG) && defined(TRACE)
+	  idx = LIDX2IDX (ps->lhead - ps->lclauses);
+#endif
+	}
+      else
+	{
+	  if (ps->ohead == ps->eoo)
+	    {
+	      ENLARGE (ps->oclauses, ps->ohead, ps->eoo);
+	      if (ps->EOL == ps->oclauses)
+		ENLARGE (ps->oclauses, ps->ohead, ps->eoo);	/* ditto */
+	    }
+
+#if !defined(NDEBUG) && defined(TRACE)
+	  idx = OIDX2IDX (ps->ohead - ps->oclauses);
+#endif
+	}
+
+      assert (ps->EOL != ps->oclauses);			/* ditto */
+
+      res = new_clause (ps, size, learned);
+
+      glue = 0;
+
+      if (learned)
+	{
+	  assert (ps->dusedhead == ps->dused);
+
+	  for (p = ps->added; p < ps->ahead; p++)
+	    {
+	      lit = *p;
+	      if (lit->val)
+		{
+		  litlevel = LIT2VAR (lit)->level;
+		  assert (litlevel <= ps->LEVEL);
+		  while (ps->levels + litlevel >= ps->levelshead)
+		    {
+		      if (ps->levelshead >= ps->eolevels)
+			ENLARGE (ps->levels, ps->levelshead, ps->eolevels);
+		      assert (ps->levelshead < ps->eolevels);
+		      *ps->levelshead++ = 0;
+		    }
+		  if (!ps->levels[litlevel])
+		    {
+		      if (ps->dusedhead >= ps->eodused)
+			ENLARGE (ps->dused, ps->dusedhead, ps->eodused);
+		      assert (ps->dusedhead < ps->eodused);
+		      *ps->dusedhead++ = litlevel;
+		      ps->levels[litlevel] = 1;
+		      glue++;
+		    }
+		}
+	      else
+		glue++;
+	    }
+
+	  while (ps->dusedhead > ps->dused)
+	    {
+	      litlevel = *--ps->dusedhead;
+	      assert (ps->levels + litlevel < ps->levelshead);
+	      assert (ps->levels[litlevel]);
+	      ps->levels[litlevel] = 0;
+	    }
+	}
+
+      assert (glue <= MAXGLUE);
+      res->glue = glue;
+
+#if !defined(NDEBUG) && defined(TRACE)
+      if (ps->trace)
+	assert (CLS2IDX (res) == idx);
+#endif
+      if (learned)
+	*ps->lhead++ = res;
+      else
+	*ps->ohead++ = res;
+
+#if !defined(NDEBUG) && defined(TRACE)
+      if (ps->trace && learned)
+	assert (ps->zhead - ps->zhains == ps->lhead - ps->lclauses);
+#endif
+      assert (ps->lhead != ps->oclauses);		/* ditto */
+    }
+
+  if (learned && ps->rup)
+    {
+      if (!ps->rupstarted)
+	{
+	  write_rup_header (ps, ps->rup);
+	  ps->rupstarted = 1;
+	}
+    }
+
+  num_true = num_undef = num_false = 0;
+
+  q = res->lits;
+  for (p = ps->added; p < ps->ahead; p++)
+    {
+      lit = *p;
+      *q++ = lit;
+
+      if (learned && ps->rup)
+	fprintf (ps->rup, "%d ", LIT2INT (lit));
+
+      val = lit->val;
+
+      num_true += (val == TRUE);
+      num_undef += (val == UNDEF);
+      num_false += (val == FALSE);
+    }
+  assert (num_false + num_true + num_undef == size);
+
+  if (learned && ps->rup)
+    fputs ("0\n", ps->rup);
+
+  ps->ahead = ps->added;		/* reset */
+
+  if (!reentered)				// TODO merge
+  if (size > 0)
+    {
+      assert (size <= 2 || !reentered);		// TODO remove
+      connect_head_tail (ps, res->lits[0], res);
+      if (size > 1)
+	connect_head_tail (ps, res->lits[1], res);
+    }
+
+  if (size == 0)
+    {
+      if (!ps->mtcls)
+	ps->mtcls = res;
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  if (size != 2)
+#endif
+#ifndef NDEBUG
+    res->connected = 1;
+#endif
+
+  LOG ( fprintf (ps->out, "%s%s ", ps->prefix, learned ? "learned" : "original");
+        dumpclsnl (ps, res));
+
+  /* Shrink clause by resolving it against top level assignments.
+   */
+  if (!ps->LEVEL && num_false > 0)
+    {
+      assert (ps->ahead == ps->added);
+      assert (ps->rhead == ps->resolved);
+
+      count_resolved = 1;
+      add_antecedent (ps, res);
+
+      end = end_of_lits (res);
+      for (p = res->lits; p < end; p++)
+	{
+	  lit = *p;
+	  v = LIT2VAR (lit);
+	  use_var (ps, v);
+
+	  if (lit->val == FALSE)
+	    {
+	      add_antecedent (ps, v->reason);
+	      count_resolved++;
+	    }
+	  else
+	    add_lit (ps, lit);
+	}
+
+      assert (count_resolved >= 2);
+
+      learned = 1;
+#ifdef NO_BINARY_CLAUSES
+      if (res == &ps->impl)
+	resetimpl (ps);
+#endif
+      reentered = 1;
+      goto REENTER;		/* and return simplified clause */
+    }
+
+  if (!num_true && num_undef == 1)	/* unit clause */
+    {
+      lit = 0;
+      for (p = res->lits; p < res->lits + size; p++)
+	{
+	  if ((*p)->val == UNDEF)
+	    lit = *p;
+
+	  v = LIT2VAR (*p);
+	  use_var (ps, v);
+	}
+      assert (lit);
+
+      reason = res;
+#ifdef NO_BINARY_CLAUSES
+      if (size == 2)
+        {
+	  Lit * other = res->lits[0];
+	  if (other == lit)
+	    other = res->lits[1];
+
+	  assert (other->val == FALSE);
+	  reason = LIT2REASON (NOTLIT (other));
+	}
+#endif
+      assign_forced (ps, lit, reason);
+      num_true++;
+    }
+
+  if (num_false == size && !ps->conflict)
+    {
+#ifdef NO_BINARY_CLAUSES
+      if (res == &ps->impl)
+	ps->conflict = setcimpl (ps, res->lits[0], res->lits[1]);
+      else
+#endif
+      ps->conflict = res;
+    }
+
+  if (!learned && !num_true && num_undef)
+    incjwh (ps, res);
+
+#ifdef NO_BINARY_CLAUSES
+  if (res == &ps->impl)
+    resetimpl (ps);
+#endif
+  return res;
+}
+
+static int
+trivial_clause (PS * ps)
+{
+  Lit **p, **q, *prev;
+  Var *v;
+
+  SORT (Lit *, cmp_ptr, ps->added,  ps->ahead - ps->added);
+
+  prev = 0;
+  q = ps->added;
+  for (p = q; p < ps->ahead; p++)
+    {
+      Lit *this = *p;
+
+      v = LIT2VAR (this);
+
+      if (prev == this)		/* skip repeated literals */
+	continue;
+
+      /* Top level satisfied ?
+       */
+      if (this->val == TRUE && !v->level)
+	 return 1;
+
+      if (prev == NOTLIT (this))/* found pair of dual literals */
+	return 1;
+
+      *q++ = prev = this;
+    }
+
+  ps->ahead = q;			/* shrink */
+
+  return 0;
+}
+
+static void
+simplify_and_add_original_clause (PS * ps)
+{
+#ifdef NO_BINARY_CLAUSES
+  Cls * c;
+#endif
+  if (trivial_clause (ps))
+    {
+      ps->ahead = ps->added;
+
+      if (ps->ohead == ps->eoo)
+	ENLARGE (ps->oclauses, ps->ohead, ps->eoo);
+
+      *ps->ohead++ = 0;
+
+      ps->addedclauses++;
+      ps->oadded++;
+    }
+  else
+    {
+      if (ps->CLS != ps->clshead)
+	add_lit (ps, NOTLIT (ps->clshead[-1]));
+
+#ifdef NO_BINARY_CLAUSES
+      c =
+#endif
+      add_simplified_clause (ps, 0);
+#ifdef NO_BINARY_CLAUSES
+      if (c == &ps->impl) assert (!ps->implvalid);
+#endif
+    }
+}
+
+#ifndef NADC
+
+static void
+add_ado (PS * ps)
+{
+  unsigned len = ps->ahead - ps->added;
+  Lit ** ado, ** p, ** q, *lit;
+  Var * v, * u;
+
+#ifdef TRACE
+  assert (!ps->trace);
+#endif
+
+  ABORTIF (ps->ados < ps->hados && llength (ps->ados[0]) != len,
+           "internal: non matching all different constraint object lengths");
+
+  if (ps->hados == ps->eados)
+    ENLARGE (ps->ados, ps->hados, ps->eados);
+
+  NEWN (ado, len + 1);
+  *ps->hados++ = ado;
+
+  p = ps->added;
+  q = ado;
+  u = 0;
+  while (p < ps->ahead)
+    {
+      lit = *p++;
+      v = LIT2VAR (lit);
+      ABORTIF (v->inado,
+               "internal: variable in multiple all different objects");
+      v->inado = ado;
+      if (!u && !lit->val)
+	u = v;
+      *q++ = lit;
+    }
+
+  assert (q == ado + len);
+  *q++ = 0;
+
+  /* TODO simply do a conflict test as in propado */
+
+  ABORTIF (!u,
+    "internal: "
+    "adding fully instantiated all different object not implemented yet");
+
+  assert (u);
+  assert (u->inado == ado);
+  assert (!u->ado);
+  u->ado = ado;
+
+  ps->ahead = ps->added;
+}
+
+#endif
+
+static void
+hdown (PS * ps, Rnk * r)
+{
+  unsigned end, rpos, cpos, opos;
+  Rnk *child, *other;
+
+  assert (r->pos > 0);
+  assert (ps->heap[r->pos] == r);
+
+  end = ps->hhead - ps->heap;
+  rpos = r->pos;
+
+  for (;;)
+    {
+      cpos = 2 * rpos;
+      if (cpos >= end)
+	break;
+
+      opos = cpos + 1;
+      child = ps->heap[cpos];
+
+      if (cmp_rnk (r, child) < 0)
+	{
+	  if (opos < end)
+	    {
+	      other = ps->heap[opos];
+
+	      if (cmp_rnk (child, other) < 0)
+		{
+		  child = other;
+		  cpos = opos;
+		}
+	    }
+	}
+      else if (opos < end)
+	{
+	  child = ps->heap[opos];
+
+	  if (cmp_rnk (r, child) >= 0)
+	    break;
+
+	  cpos = opos;
+	}
+      else
+	break;
+
+      ps->heap[rpos] = child;
+      child->pos = rpos;
+      rpos = cpos;
+    }
+
+  r->pos = rpos;
+  ps->heap[rpos] = r;
+}
+
+static Rnk *
+htop (PS * ps)
+{
+  assert (ps->hhead > ps->heap + 1);
+  return ps->heap[1];
+}
+
+static Rnk *
+hpop (PS * ps)
+{
+  Rnk *res, *last;
+  unsigned end;
+
+  assert (ps->hhead > ps->heap + 1);
+
+  res = ps->heap[1];
+  res->pos = 0;
+
+  end = --ps->hhead - ps->heap;
+  if (end == 1)
+    return res;
+
+  last = ps->heap[end];
+
+  ps->heap[last->pos = 1] = last;
+  hdown (ps, last);
+
+  return res;
+}
+
+inline static void
+hpush (PS * ps, Rnk * r)
+{
+  assert (!r->pos);
+
+  if (ps->hhead == ps->eoh)
+    ENLARGE (ps->heap, ps->hhead, ps->eoh);
+
+  r->pos = ps->hhead++ - ps->heap;
+  ps->heap[r->pos] = r;
+  hup (ps, r);
+}
+
+static void
+fix_trail_lits (PS * ps, long delta)
+{
+  Lit **p;
+  for (p = ps->trail; p < ps->thead; p++)
+    *p += delta;
+}
+
+#ifdef NO_BINARY_CLAUSES
+static void
+fix_impl_lits (PS * ps, long delta)
+{
+  Ltk * s;
+  Lit ** p;
+
+  for (s = ps->impls + 2; s <= ps->impls + 2 * ps->max_var + 1; s++)
+    for (p = s->start; p < s->start + s->count; p++)
+      *p += delta;
+}
+#endif
+
+static void
+fix_clause_lits (PS * ps, long delta)
+{
+  Cls **p, *clause;
+  Lit **q, *lit, **eol;
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      clause = *p;
+      if (!clause)
+	continue;
+
+      q = clause->lits;
+      eol = end_of_lits (clause);
+      while (q < eol)
+	{
+	  assert (q - clause->lits <= (int) clause->size);
+	  lit = *q;
+	  lit += delta;
+	  *q++ = lit;
+	}
+    }
+}
+
+static void
+fix_added_lits (PS * ps, long delta)
+{
+  Lit **p;
+  for (p = ps->added; p < ps->ahead; p++)
+    *p += delta;
+}
+
+static void
+fix_assumed_lits (PS * ps, long delta)
+{
+  Lit **p;
+  for (p = ps->als; p < ps->alshead; p++)
+    *p += delta;
+}
+
+static void
+fix_cls_lits (PS * ps, long delta)
+{
+  Lit **p;
+  for (p = ps->CLS; p < ps->clshead; p++)
+    *p += delta;
+}
+
+static void
+fix_heap_rnks (PS * ps, long delta)
+{
+  Rnk **p;
+
+  for (p = ps->heap + 1; p < ps->hhead; p++)
+    *p += delta;
+}
+
+#ifndef NADC
+
+static void
+fix_ado (long delta, Lit ** ado)
+{
+  Lit ** p;
+  for (p = ado; *p; p++)
+    *p += delta;
+}
+
+static void
+fix_ados (PS * ps, long delta)
+{
+  Lit *** p;
+
+  for (p = ps->ados; p < ps->hados; p++)
+    fix_ado (delta, *p);
+}
+
+#endif
+
+static void
+enlarge (PS * ps, unsigned new_size_vars)
+{
+  long rnks_delta, lits_delta;
+  Lit *old_lits = ps->lits;
+  Rnk *old_rnks = ps->rnks;
+
+  RESIZEN (ps->lits, 2 * ps->size_vars, 2 * new_size_vars);
+  RESIZEN (ps->jwh, 2 * ps->size_vars, 2 * new_size_vars);
+  RESIZEN (ps->htps, 2 * ps->size_vars, 2 * new_size_vars);
+#ifndef NDSC
+  RESIZEN (ps->dhtps, 2 * ps->size_vars, 2 * new_size_vars);
+#endif
+  RESIZEN (ps->impls, 2 * ps->size_vars, 2 * new_size_vars);
+  RESIZEN (ps->vars, ps->size_vars, new_size_vars);
+  RESIZEN (ps->rnks, ps->size_vars, new_size_vars);
+
+  if ((lits_delta = ps->lits - old_lits))
+    {
+      fix_trail_lits (ps, lits_delta);
+      fix_clause_lits (ps, lits_delta);
+      fix_added_lits (ps, lits_delta);
+      fix_assumed_lits (ps, lits_delta);
+      fix_cls_lits (ps, lits_delta);
+#ifdef NO_BINARY_CLAUSES
+      fix_impl_lits (ps, lits_delta);
+#endif
+#ifndef NADC
+      fix_ados (ps, lits_delta);
+#endif
+    }
+
+  if ((rnks_delta = ps->rnks - old_rnks))
+    {
+      fix_heap_rnks (ps, rnks_delta);
+    }
+
+  assert (ps->mhead == ps->marked);
+
+  ps->size_vars = new_size_vars;
+}
+
+static void
+unassign (PS * ps, Lit * lit)
+{
+  Cls *reason;
+  Var *v;
+  Rnk *r;
+
+  assert (lit->val == TRUE);
+
+  LOG ( fprintf (ps->out, "%sunassign %d\n", ps->prefix, LIT2INT (lit)));
+
+  v = LIT2VAR (lit);
+  reason = v->reason;
+
+#ifdef NO_BINARY_CLAUSES
+  assert (reason != &ps->impl);
+  if (ISLITREASON (reason))
+    {
+      /* DO NOTHING */
+    }
+  else
+#endif
+  if (reason)
+    {
+      assert (reason->locked);
+      reason->locked = 0;
+      if (reason->learned && reason->size > 2)
+	{
+	  assert (ps->llocked > 0);
+	  ps->llocked--;
+	}
+    }
+
+  lit->val = UNDEF;
+  NOTLIT (lit)->val = UNDEF;
+
+  r = VAR2RNK (v);
+  if (!r->pos)
+    hpush (ps, r);
+
+#ifndef NDSC
+  {
+    Cls * p, * next, ** q;
+
+    q = LIT2DHTPS (lit);
+    p = *q;
+    *q = 0;
+
+    while (p)
+      {
+	Lit * other = p->lits[0];
+
+	if (other == lit)
+	  {
+	    other = p->lits[1];
+	    q = p->next + 1;
-- 
2.39.2


