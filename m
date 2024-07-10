Return-Path: <linux-kbuild+bounces-2451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4B92CB5F
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 306301C225D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7BC8288F;
	Wed, 10 Jul 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM9e+G3/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DBF81AC1;
	Wed, 10 Jul 2024 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594477; cv=none; b=jIzyZYPGMmfnEkuDvfw6H7ayVhdOT7d8BFU/PTrgcMC3FXY8FhmHswAZxUJ/WQeyQ8s/jiZ0lDIhien6g+HkFoyPrYM/lRjDHYcf6DOaWqUZS1GFb0C75APpkdBCWGs5m0AoiXTXLsFiZ5dUrOP56VmhmDkFWXd1xIUmZnZQprI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594477; c=relaxed/simple;
	bh=tWtsDP7SnsDtmcCo6vKPvfeYeqe1Qik5A5xAc36AiPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAWunmIghpl6TW5YaG8YIYWMKau6AHm27ILArrhbb/KoAYqbdw1GzZwkDCQJAxEVUb/ZP0F4DLveZj5RJwmva3yUZDt9WFln0JCKKPwgSDIlaq2PkPbGJoeYB6cQIcrfII08rJey/A7kMQ/DcEyNkiOqFTWHYHmiDA9SWR0xLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM9e+G3/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so8912587a12.3;
        Tue, 09 Jul 2024 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594472; x=1721199272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBwPIYFYW1mrcPBvpSRetERGP4SKNemOFZINVli8rU4=;
        b=RM9e+G3/2QP2rL/dylAwT1tOVSNdrq7c0g0R3mG0gdUXrFu02k6Q5PaNaUAdihebnN
         uoAQPDskLXZD7shyqoabacgiStniHHHa8lXa0cB1jji65LmHM7iqXxa4rYSCsB5eMdQo
         evAgu2m0rDh73v8nflc8rF8SzuSLhuK6d4gSx9XxuudI4oNuJkySy6yjhMRF36yRMy2h
         Juk649Jtfy/WYRTrHIfOKscZiI0gCw0JqVSuNi9RPH/JcxDqPCzgLbJFPguNn5zHklmE
         VqthcmEtPnlu+iz0jYwZFqEei/n+94v/MykVdyeCXw7ue6mZ5gemcJWTbcAhRd3gpHO9
         YIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594472; x=1721199272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBwPIYFYW1mrcPBvpSRetERGP4SKNemOFZINVli8rU4=;
        b=EyGKffbEy65qBpbBiVoTkz2q0L1Gb1Ze+5hSLtsV5G3qN6ULWr5/bw4jzeVCNbqIgK
         u0tabbfZHpNVRWPm/JUQ3vWdDXPL5VnHTNPgWBWQxyy8u6w07CDYOPoFXqWFshjEbV9x
         VN0VYdPwMGfXXoRJMV4br/BDp7zr0uGo6xUEnMFDaI1JzwZjYJKwWLkHYyHaaISFL6gN
         MKQlX6PU4H0SX+reOfKTKs/jPFu2Wl5aV83R3oVGLV3NTpyi9lCPgBab+Q6uyINSZMpa
         654HwC3di/AMqKRJdqjQYhjbBW+C7HAc0zef9pmpsW3YuiJtNKaFrnh955yiQVxx/uRT
         9Xwg==
X-Forwarded-Encrypted: i=1; AJvYcCXhiXv7vh6bAtW9iDi02VHXcX8OXGyQxEVP8UMf+hN9ZQVuAT5p0DCzpBEGVJH6peKQA7zkBd1ktS+j7EFPi4VKBIcE/JHgzbqcV12C
X-Gm-Message-State: AOJu0Yyie+MZpKQRqlMEBv00AvyAfWFX3kYs/GViFaE7wJJblERfq1ZL
	a+fMSIyi3XHoJzni6R1zogiMUj96XE/RuRUkbbBd0+bH6ktTwkcTjSvRmA==
X-Google-Smtp-Source: AGHT+IFG/QM0MuNl2h8eWdBfoCP+ntDkBUkUdi+sNYEbqr8nRcqwzeEEWXRSXp/UL3E/H8LoDnd7uQ==
X-Received: by 2002:a05:6402:234b:b0:58c:909f:3d46 with SMTP id 4fb4d7f45d1cf-594ba0cbe63mr3547359a12.10.1720594472056;
        Tue, 09 Jul 2024 23:54:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:31 -0700 (PDT)
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
Subject: [PATCH v4 04/12] kconfig: Add picosat.c (3/3)
Date: Wed, 10 Jul 2024 08:52:47 +0200
Message-Id: <20240710065255.10338-5-ole0811sch@gmail.com>
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

The third part of picosat.c

Signed-off-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/picosat.c | 2502 +++++++++++++++++++++++++++++++++++++
 1 file changed, 2502 insertions(+)

diff --git a/scripts/kconfig/picosat.c b/scripts/kconfig/picosat.c
index c183dffb89a3..87931e864bfd 100644
--- a/scripts/kconfig/picosat.c
+++ b/scripts/kconfig/picosat.c
@@ -5998,3 +5998,2505 @@ sat (PS * ps, int l)
 
       if (need_to_reduce (ps))
 	reduce (ps, 50);
+
+      if (ps->conflicts >= ps->lrestart && ps->LEVEL > 2)
+	restart (ps);
+
+      decide (ps);
+      if (ps->failed_assumption)
+	return PICOSAT_UNSATISFIABLE;
+      count++;
+    }
+}
+
+static void
+rebias (PS * ps)
+{
+  Cls ** p, * c;
+  Var * v;
+
+  for (v = ps->vars + 1; v <= ps->vars + ps->max_var; v++)
+    v->assigned = 0;
+
+  memset (ps->jwh, 0, 2 * (ps->max_var + 1) * sizeof *ps->jwh);
+
+  for (p = ps->oclauses; p < ps->ohead; p++)
+    {
+      c = *p;
+
+      if (!c)
+	continue;
+
+      if (c->learned)
+	continue;
+
+      incjwh (ps, c);
+    }
+}
+
+#ifdef TRACE
+
+static unsigned
+core (PS * ps)
+{
+  unsigned idx, prev, this, delta, i, lcore, vcore;
+  unsigned *stack, *shead, *eos;
+  Lit **q, **eol, *lit;
+  Cls *c, *reason;
+  Znt *p, byte;
+  Zhn *zhain;
+  Var *v;
+
+  assert (ps->trace);
+
+  assert (ps->mtcls || ps->failed_assumption);
+  if (ps->ocore >= 0)
+    return ps->ocore;
+
+  lcore = ps->ocore = vcore = 0;
+
+  stack = shead = eos = 0;
+  ENLARGE (stack, shead, eos);
+
+  if (ps->mtcls)
+    {
+      idx = CLS2IDX (ps->mtcls);
+      *shead++ = idx;
+    }
+  else
+    {
+      assert (ps->failed_assumption);
+      v = LIT2VAR (ps->failed_assumption);
+      reason = v->reason;
+      assert (reason);
+      idx = CLS2IDX (reason);
+      *shead++ = idx;
+    }
+
+  while (shead > stack)
+    {
+      idx = *--shead;
+      zhain = IDX2ZHN (idx);
+
+      if (zhain)
+	{
+	  if (zhain->core)
+	    continue;
+
+	  zhain->core = 1;
+	  lcore++;
+
+	  c = IDX2CLS (idx);
+	  if (c)
+	    {
+	      assert (!c->core);
+	      c->core = 1;
+	    }
+
+	  i = 0;
+	  delta = 0;
+	  prev = 0;
+	  for (p = zhain->znt; (byte = *p); p++, i += 7)
+	    {
+	      delta |= (byte & 0x7f) << i;
+	      if (byte & 0x80)
+		continue;
+
+	      this = prev + delta;
+	      assert (prev < this);	/* no overflow */
+
+	      if (shead == eos)
+		ENLARGE (stack, shead, eos);
+	      *shead++ = this;
+
+	      prev = this;
+	      delta = 0;
+	      i = -7;
+	    }
+	}
+      else
+	{
+	  c = IDX2CLS (idx);
+
+	  assert (c);
+	  assert (!c->learned);
+
+	  if (c->core)
+	    continue;
+
+	  c->core = 1;
+	  ps->ocore++;
+
+	  eol = end_of_lits (c);
+	  for (q = c->lits; q < eol; q++)
+	    {
+	      lit = *q;
+	      v = LIT2VAR (lit);
+	      if (v->core)
+		continue;
+
+	      v->core = 1;
+	      vcore++;
+
+	      if (!ps->failed_assumption) continue;
+	      if (lit != ps->failed_assumption) continue;
+
+	      reason = v->reason;
+	      if (!reason) continue;
+	      if (reason->core) continue;
+
+	      idx = CLS2IDX (reason);
+	      if (shead == eos)
+		ENLARGE (stack, shead, eos);
+	      *shead++ = idx;
+	    }
+	}
+    }
+
+  DELETEN (stack, eos - stack);
+
+  if (ps->verbosity)
+     fprintf (ps->out,
+	     "%s%u core variables out of %u (%.1f%%)\n"
+	     "%s%u core original clauses out of %u (%.1f%%)\n"
+	     "%s%u core learned clauses out of %u (%.1f%%)\n",
+	     ps->prefix, vcore, ps->max_var, PERCENT (vcore, ps->max_var),
+	     ps->prefix, ps->ocore, ps->oadded, PERCENT (ps->ocore, ps->oadded),
+	     ps->prefix, lcore, ps->ladded, PERCENT (lcore, ps->ladded));
+
+  return ps->ocore;
+}
+
+static void
+trace_lits (PS * ps, Cls * c, FILE * file)
+{
+  Lit **p, **eol = end_of_lits (c);
+
+  assert (c);
+  assert (c->core);
+
+  for (p = c->lits; p < eol; p++)
+    fprintf (file, "%d ", LIT2INT (*p));
+
+  fputc ('0', file);
+}
+
+static void
+write_idx (PS * ps, unsigned idx, FILE * file)
+{
+  fprintf (file, "%ld", EXPORTIDX (idx));
+}
+
+static void
+trace_clause (PS * ps, unsigned idx, Cls * c, FILE * file, int fmt)
+{
+  assert (c);
+  assert (c->core);
+  assert (fmt == RUP_TRACE_FMT || !c->learned);
+  assert (CLS2IDX (c) == idx);
+
+  if (fmt != RUP_TRACE_FMT)
+    {
+      write_idx (ps, idx, file);
+      fputc (' ', file);
+    }
+
+  trace_lits (ps, c, file);
+
+  if (fmt != RUP_TRACE_FMT)
+    fputs (" 0", file);
+
+  fputc ('\n', file);
+}
+
+static void
+trace_zhain (PS * ps, unsigned idx, Zhn * zhain, FILE * file, int fmt)
+{
+  unsigned prev, this, delta, i;
+  Znt *p, byte;
+  Cls * c;
+
+  assert (zhain);
+  assert (zhain->core);
+
+  write_idx (ps, idx, file);
+  fputc (' ', file);
+
+  if (fmt == EXTENDED_TRACECHECK_TRACE_FMT)
+    {
+      c = IDX2CLS (idx);
+      assert (c);
+      trace_lits (ps, c, file);
+    }
+  else
+    {
+      assert (fmt == COMPACT_TRACECHECK_TRACE_FMT);
+      putc ('*', file);
+    }
+
+  i = 0;
+  delta = 0;
+  prev = 0;
+
+  for (p = zhain->znt; (byte = *p); p++, i += 7)
+    {
+      delta |= (byte & 0x7f) << i;
+      if (byte & 0x80)
+	continue;
+
+      this = prev + delta;
+
+      putc (' ', file);
+      write_idx (ps, this, file);
+
+      prev = this;
+      delta = 0;
+      i = -7;
+    }
+
+  fputs (" 0\n", file);
+}
+
+static void
+write_core (PS * ps, FILE * file)
+{
+  Lit **q, **eol;
+  Cls **p, *c;
+
+  fprintf (file, "p cnf %u %u\n", ps->max_var, core (ps));
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      c = *p;
+
+      if (!c || c->learned || !c->core)
+	continue;
+
+      eol = end_of_lits (c);
+      for (q = c->lits; q < eol; q++)
+	fprintf (file, "%d ", LIT2INT (*q));
+
+      fputs ("0\n", file);
+    }
+}
+
+#endif
+
+static void
+write_trace (PS * ps, FILE * file, int fmt)
+{
+#ifdef TRACE
+  Cls *c, ** p;
+  Zhn *zhain;
+  unsigned i;
+
+  core (ps);
+
+  if (fmt == RUP_TRACE_FMT)
+    {
+      ps->rupvariables = picosat_variables (ps),
+      ps->rupclauses = picosat_added_original_clauses (ps);
+      write_rup_header (ps, file);
+    }
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      c = *p;
+
+      if (ps->oclauses <= p && p < ps->eoo)
+	{
+	  i = OIDX2IDX (p - ps->oclauses);
+	  assert (!c || CLS2IDX (c) == i);
+	}
+      else
+	{
+          assert (ps->lclauses <= p && p < ps->EOL);
+	  i = LIDX2IDX (p - ps->lclauses);
+	}
+
+      zhain = IDX2ZHN (i);
+
+      if (zhain)
+	{
+	  if (zhain->core)
+	    {
+	      if (fmt == RUP_TRACE_FMT)
+		trace_clause (ps,i, c, file, fmt);
+	      else
+		trace_zhain (ps, i, zhain, file, fmt);
+	    }
+	}
+      else if (c)
+	{
+	  if (fmt != RUP_TRACE_FMT && c)
+	    {
+	      if (c->core)
+		trace_clause (ps, i, c, file, fmt);
+	    }
+	}
+    }
+#else
+  (void) file;
+  (void) fmt;
+  (void) ps;
+#endif
+}
+
+static void
+write_core_wrapper (PS * ps, FILE * file, int fmt)
+{
+  (void) fmt;
+#ifdef TRACE
+  write_core (ps, file);
+#else
+  (void) ps;
+  (void) file;
+#endif
+}
+
+static Lit *
+import_lit (PS * ps, int lit, int nointernal)
+{
+  Lit * res;
+  Var * v;
+
+  ABORTIF (lit == INT_MIN, "API usage: INT_MIN literal");
+  ABORTIF (abs (lit) > (int) ps->max_var && ps->CLS != ps->clshead,
+           "API usage: new variable index after 'picosat_push'");
+
+  if (abs (lit) <= (int) ps->max_var)
+    {
+      res = int2lit (ps, lit);
+      v = LIT2VAR (res);
+      if (nointernal && v->internal)
+	ABORT ("API usage: trying to import invalid literal");
+      else if (!nointernal && !v->internal)
+	ABORT ("API usage: trying to import invalid context");
+    }
+  else
+    {
+      while (abs (lit) > (int) ps->max_var)
+	inc_max_var (ps);
+      res = int2lit (ps, lit);
+    }
+
+  return res;
+}
+
+#ifdef TRACE
+static void
+reset_core (PS * ps)
+{
+  Cls ** p, * c;
+  Zhn ** q, * z;
+  unsigned i;
+
+  for (i = 1; i <= ps->max_var; i++)
+    ps->vars[i].core = 0;
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    if ((c = *p))
+      c->core = 0;
+
+  for (q = ps->zhains; q != ps->zhead; q++)
+    if ((z = *q))
+      z->core = 0;
+
+  ps->ocore = -1;
+}
+#endif
+
+static void
+reset_assumptions (PS * ps)
+{
+  Lit ** p;
+
+  ps->failed_assumption = 0;
+
+  if (ps->extracted_all_failed_assumptions)
+    {
+      for (p = ps->als; p < ps->alshead; p++)
+	LIT2VAR (*p)->failed = 0;
+
+      ps->extracted_all_failed_assumptions = 0;
+    }
+
+  ps->alstail = ps->alshead = ps->als;
+  ps->adecidelevel = 0;
+}
+
+static void
+check_ready (PS * ps)
+{
+  ABORTIF (!ps || ps->state == RESET, "API usage: uninitialized");
+}
+
+static void
+check_sat_state (PS * ps)
+{
+  ABORTIF (ps->state != SAT, "API usage: expected to be in SAT state");
+}
+
+static void
+check_unsat_state (PS * ps)
+{
+  ABORTIF (ps->state != UNSAT, "API usage: expected to be in UNSAT state");
+}
+
+static void
+check_sat_or_unsat_or_unknown_state (PS * ps)
+{
+  ABORTIF (ps->state != SAT && ps->state != UNSAT && ps->state != UNKNOWN,
+           "API usage: expected to be in SAT, UNSAT, or UNKNOWN state");
+}
+
+static void
+reset_partial (PS * ps)
+{
+  unsigned idx;
+  if (!ps->partial)
+    return;
+  for (idx = 1; idx <= ps->max_var; idx++)
+    ps->vars[idx].partial = 0;
+  ps->partial = 0;
+}
+
+static void
+reset_incremental_usage (PS * ps)
+{
+  unsigned num_non_false;
+  Lit * lit, ** q;
+
+  check_sat_or_unsat_or_unknown_state (ps);
+
+  LOG ( fprintf (ps->out, "%sRESET incremental usage\n", ps->prefix));
+
+  if (ps->LEVEL)
+    undo (ps, 0);
+
+  reset_assumptions (ps);
+
+  if (ps->conflict)
+    {
+      num_non_false = 0;
+      for (q = ps->conflict->lits; q < end_of_lits (ps->conflict); q++)
+	{
+	  lit = *q;
+	  if (lit->val != FALSE)
+	    num_non_false++;
+	}
+
+      // assert (num_non_false >= 2); // TODO: why this assertion?
+#ifdef NO_BINARY_CLAUSES
+      if (ps->conflict == &ps->cimpl)
+	resetcimpl (ps);
+#endif
+#ifndef NADC
+      if (ps->conflict == ps->adoconflict)
+	resetadoconflict (ps);
+#endif
+      ps->conflict = 0;
+    }
+
+#ifdef TRACE
+  reset_core (ps);
+#endif
+
+  reset_partial (ps);
+
+  ps->saved_flips = ps->flips;
+  ps->min_flipped = UINT_MAX;
+  ps->saved_max_var = ps->max_var;
+
+  ps->state = READY;
+}
+
+static void
+enter (PS * ps)
+{
+  if (ps->nentered++)
+    return;
+
+  check_ready (ps);
+  ps->entered = picosat_time_stamp ();
+}
+
+static void
+leave (PS * ps)
+{
+  assert (ps->nentered);
+  if (--ps->nentered)
+    return;
+
+  sflush (ps);
+}
+
+static void
+check_trace_support_and_execute (PS * ps,
+                                 FILE * file,
+				 void (*f)(PS*,FILE*,int), int fmt)
+{
+  check_ready (ps);
+  check_unsat_state (ps);
+#ifdef TRACE
+  ABORTIF (!ps->trace, "API usage: tracing disabled");
+  enter (ps);
+  f (ps, file, fmt);
+  leave (ps);
+#else
+  (void) file;
+  (void) fmt;
+  (void) f;
+  ABORT ("compiled without trace support");
+#endif
+}
+
+static void
+extract_all_failed_assumptions (PS * ps)
+{
+  Lit ** p, ** eol;
+  Var * v, * u;
+  int pos;
+  Cls * c;
+
+  assert (!ps->extracted_all_failed_assumptions);
+
+  assert (ps->failed_assumption);
+  assert (ps->mhead == ps->marked);
+
+  if (ps->marked == ps->eom)
+    ENLARGE (ps->marked, ps->mhead, ps->eom);
+
+  v = LIT2VAR (ps->failed_assumption);
+  mark_var (ps, v);
+  pos = 0;
+
+  while (pos < ps->mhead - ps->marked)
+    {
+      v = ps->marked[pos++];
+      assert (v->mark);
+      c = var2reason (ps, v);
+      if (!c)
+	continue;
+      eol = end_of_lits (c);
+      for (p = c->lits; p < eol; p++)
+	{
+	  u = LIT2VAR (*p);
+	  if (!u->mark)
+	    mark_var (ps, u);
+	}
+#ifdef NO_BINARY_CLAUSES
+      if (c == &ps->impl)
+	resetimpl (ps);
+#endif
+    }
+
+  for (p = ps->als; p < ps->alshead; p++)
+    {
+      u = LIT2VAR (*p);
+      if (!u->mark) continue;
+      u->failed = 1;
+      LOG ( fprintf (ps->out,
+                     "%sfailed assumption %d\n",
+		     ps->prefix, LIT2INT (*p)));
+    }
+
+  while (ps->mhead > ps->marked)
+    (*--ps->mhead)->mark = 0;
+
+  ps->extracted_all_failed_assumptions = 1;
+}
+
+const char *
+picosat_copyright (void)
+{
+  return "Copyright (c) 2006 - 2014 Armin Biere JKU Linz";
+}
+
+PicoSAT *
+picosat_init (void)
+{
+  return init (0, 0, 0, 0);
+}
+
+PicoSAT *
+picosat_minit (void * pmgr,
+	       picosat_malloc pnew,
+	       picosat_realloc presize,
+	       picosat_free pfree)
+{
+  ABORTIF (!pnew, "API usage: zero 'picosat_malloc' argument");
+  ABORTIF (!presize, "API usage: zero 'picosat_realloc' argument");
+  ABORTIF (!pfree, "API usage: zero 'picosat_free' argument");
+  return init (pmgr, pnew, presize, pfree);
+}
+
+
+void
+picosat_adjust (PS * ps, int new_max_var)
+{
+  unsigned new_size_vars;
+
+  ABORTIF (abs (new_max_var) > (int) ps->max_var && ps->CLS != ps->clshead,
+           "API usage: adjusting variable index after 'picosat_push'");
+  enter (ps);
+
+  new_max_var = abs (new_max_var);
+  new_size_vars = new_max_var + 1;
+
+  if (ps->size_vars < new_size_vars)
+    enlarge (ps, new_size_vars);
+
+  while (ps->max_var < (unsigned) new_max_var)
+    inc_max_var (ps);
+
+  leave (ps);
+}
+
+int
+picosat_inc_max_var (PS * ps)
+{
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  inc_max_var (ps);
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+
+  return ps->max_var;
+}
+
+int
+picosat_context (PS * ps)
+{
+  return ps->clshead == ps->CLS ? 0 : LIT2INT (ps->clshead[-1]);
+}
+
+int
+picosat_push (PS * ps)
+{
+  int res;
+  Lit *lit;
+  Var * v;
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  if (ps->rils != ps->rilshead)
+    {
+      res = *--ps->rilshead;
+      assert (ps->vars[res].internal);
+    }
+  else
+    {
+      inc_max_var (ps);
+      res = ps->max_var;
+      v = ps->vars + res;
+      assert (!v->internal);
+      v->internal = 1;
+      ps->internals++;
+      LOG ( fprintf (ps->out, "%snew internal variable index %d\n", ps->prefix, res));
+    }
+
+  lit = int2lit (ps, res);
+
+  if (ps->clshead == ps->eocls)
+    ENLARGE (ps->CLS, ps->clshead, ps->eocls);
+  *ps->clshead++ = lit;
+
+  ps->contexts++;
+
+  LOG ( fprintf (ps->out, "%snew context %d at depth %ld after push\n",
+                 ps->prefix, res, (long)(ps->clshead - ps->CLS)));
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+
+  return res;
+}
+
+int
+picosat_pop (PS * ps)
+{
+  Lit * lit;
+  int res;
+  ABORTIF (ps->CLS == ps->clshead, "API usage: too many 'picosat_pop'");
+  ABORTIF (ps->added != ps->ahead, "API usage: incomplete clause");
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  assert (ps->CLS < ps->clshead);
+  lit = *--ps->clshead;
+  LOG ( fprintf (ps->out, "%sclosing context %d at depth %ld after pop\n",
+                 ps->prefix, LIT2INT (lit), (long)(ps->clshead - ps->CLS) + 1));
+
+  if (ps->cilshead == ps->eocils)
+    ENLARGE (ps->cils, ps->cilshead, ps->eocils);
+  *ps->cilshead++ = LIT2INT (lit);
+
+  if (ps->cilshead - ps->cils > MAXCILS) {
+    LOG ( fprintf (ps->out,
+                  "%srecycling %ld interals with forced simplification\n",
+		  ps->prefix, (long)(ps->cilshead - ps->cils)));
+    simplify (ps, 1);
+  }
+
+  res = picosat_context (ps);
+  if (res)
+    LOG ( fprintf (ps->out, "%snew context %d at depth %ld after pop\n",
+		   ps->prefix, res, (long)(ps->clshead - ps->CLS)));
+  else
+    LOG ( fprintf (ps->out, "%souter most context reached after pop\n", ps->prefix));
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+
+  return res;
+}
+
+void
+picosat_set_verbosity (PS * ps, int new_verbosity_level)
+{
+  check_ready (ps);
+  ps->verbosity = new_verbosity_level;
+}
+
+void
+picosat_set_plain (PS * ps, int new_plain_value)
+{
+  check_ready (ps);
+  ps->plain = new_plain_value;
+}
+
+int
+picosat_enable_trace_generation (PS * ps)
+{
+  int res = 0;
+  check_ready (ps);
+#ifdef TRACE
+  ABORTIF (ps->addedclauses,
+           "API usage: trace generation enabled after adding clauses");
+  res = ps->trace = 1;
+#endif
+  return res;
+}
+
+void
+picosat_set_incremental_rup_file (PS * ps, FILE * rup_file, int m, int n)
+{
+  check_ready (ps);
+  assert (!ps->rupstarted);
+  ps->rup = rup_file;
+  ps->rupvariables = m;
+  ps->rupclauses = n;
+}
+
+void
+picosat_set_output (PS * ps, FILE * output_file)
+{
+  check_ready (ps);
+  ps->out = output_file;
+}
+
+void
+picosat_measure_all_calls (PS * ps)
+{
+  check_ready (ps);
+  ps->measurealltimeinlib = 1;
+}
+
+void
+picosat_set_prefix (PS * ps, const char * str)
+{
+  check_ready (ps);
+  new_prefix (ps, str);
+}
+
+void
+picosat_set_seed (PS * ps, unsigned s)
+{
+  check_ready (ps);
+  ps->srng = s;
+}
+
+void
+picosat_reset (PS * ps)
+{
+  check_ready (ps);
+  reset (ps);
+}
+
+int
+picosat_add (PS * ps, int int_lit)
+{
+  int res = ps->oadded;
+  Lit *lit;
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  ABORTIF (ps->rup && ps->rupstarted && ps->oadded >= (unsigned)ps->rupclauses,
+           "API usage: adding too many clauses after RUP header written");
+#ifndef NADC
+  ABORTIF (ps->addingtoado,
+           "API usage: 'picosat_add' and 'picosat_add_ado_lit' mixed");
+#endif
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  if (ps->saveorig)
+    {
+      if (ps->sohead == ps->eoso)
+	ENLARGE (ps->soclauses, ps->sohead, ps->eoso);
+
+      *ps->sohead++ = int_lit;
+    }
+
+  if (int_lit)
+    {
+      lit = import_lit (ps, int_lit, 1);
+      add_lit (ps, lit);
+    }
+  else
+    simplify_and_add_original_clause (ps);
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+
+  return res;
+}
+
+int
+picosat_add_arg (PS * ps, ...)
+{
+  int lit;
+  va_list ap;
+  va_start (ap, ps);
+  while ((lit = va_arg (ap, int)))
+    (void) picosat_add (ps, lit);
+  va_end (ap);
+  return picosat_add (ps, 0);
+}
+
+int
+picosat_add_lits (PS * ps, int * lits)
+{
+  const int * p;
+  int lit;
+  for (p = lits; (lit = *p); p++)
+    (void) picosat_add (ps, lit);
+  return picosat_add (ps, 0);
+}
+
+void
+picosat_add_ado_lit (PS * ps, int external_lit)
+{
+#ifndef NADC
+  Lit * internal_lit;
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  ABORTIF (!ps->addingtoado && ps->ahead > ps->added,
+           "API usage: 'picosat_add' and 'picosat_add_ado_lit' mixed");
+
+  if (external_lit)
+    {
+      ps->addingtoado = 1;
+      internal_lit = import_lit (ps, external_lit, 1);
+      add_lit (ps, internal_lit);
+    }
+  else
+    {
+      ps->addingtoado = 0;
+      add_ado (ps);
+    }
+  if (ps->measurealltimeinlib)
+    leave (ps);
+#else
+  (void) ps;
+  (void) external_lit;
+  ABORT ("compiled without all different constraint support");
+#endif
+}
+
+static void
+assume (PS * ps, Lit * lit)
+{
+  if (ps->alshead == ps->eoals)
+    {
+      assert (ps->alstail == ps->als);
+      ENLARGE (ps->als, ps->alshead, ps->eoals);
+      ps->alstail = ps->als;
+    }
+
+  *ps->alshead++ = lit;
+  LOG ( fprintf (ps->out, "%sassumption %d\n", ps->prefix, LIT2INT (lit)));
+}
+
+static void
+assume_contexts (PS * ps)
+{
+  Lit ** p;
+  if (ps->als != ps->alshead)
+    return;
+  for (p = ps->CLS; p != ps->clshead; p++)
+    assume (ps, *p);
+}
+
+#ifndef RCODE
+static const char * enumstr (int i) {
+  int last = i % 10;
+  if (last == 1) return "st";
+  if (last == 2) return "nd";
+  if (last == 3) return "rd";
+  return "th";
+}
+#endif
+
+static int
+tderef (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+
+  assert (abs (int_lit) <= (int) ps->max_var);
+
+  lit = int2lit (ps, int_lit);
+
+  v = LIT2VAR (lit);
+  if (v->level > 0)
+    return 0;
+
+  if (lit->val == TRUE)
+    return 1;
+
+  if (lit->val == FALSE)
+    return -1;
+
+  return 0;
+}
+
+static int
+pderef (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+
+  assert (abs (int_lit) <= (int) ps->max_var);
+
+  v = ps->vars + abs (int_lit);
+  if (!v->partial)
+    return 0;
+
+  lit = int2lit (ps, int_lit);
+
+  if (lit->val == TRUE)
+    return 1;
+
+  if (lit->val == FALSE)
+    return -1;
+
+  return 0;
+}
+
+static void
+minautarky (PS * ps)
+{
+  unsigned * occs, maxoccs, tmpoccs, npartial;
+  int * p, * c, lit, best, val;
+#ifdef LOGGING
+  int tl;
+#endif
+
+  assert (!ps->partial);
+
+  npartial = 0;
+
+  NEWN (occs, 2*ps->max_var + 1);
+  CLRN (occs, 2*ps->max_var + 1);
+  occs += ps->max_var;
+  for (p = ps->soclauses; p < ps->sohead; p++)
+    occs[*p]++;
+  assert (occs[0] == ps->oadded);
+
+  for (c = ps->soclauses; c < ps->sohead; c = p + 1)
+    {
+#ifdef LOGGING
+      tl = 0;
+#endif
+      best = 0;
+      maxoccs = 0;
+      for (p = c; (lit = *p); p++)
+	{
+	  val = tderef (ps, lit);
+	  if (val < 0)
+	    continue;
+	  if (val > 0)
+	    {
+#ifdef LOGGING
+	      tl = 1;
+#endif
+	      best = lit;
+	      maxoccs = occs[lit];
+	    }
+
+	  val = pderef (ps, lit);
+	  if (val > 0)
+	    break;
+	  if (val < 0)
+	    continue;
+	  val = int2lit (ps, lit)->val;
+	  assert (val);
+	  if (val < 0)
+	    continue;
+	  tmpoccs = occs[lit];
+	  if (best && tmpoccs <= maxoccs)
+	    continue;
+	  best = lit;
+	  maxoccs = tmpoccs;
+	}
+      if (!lit)
+	{
+	  assert (best);
+	  LOG ( fprintf (ps->out, "%sautark %d with %d occs%s\n",
+	       ps->prefix, best, maxoccs, tl ? " (top)" : ""));
+	  ps->vars[abs (best)].partial = 1;
+	  npartial++;
+	}
+      for (p = c; (lit = *p); p++)
+	{
+	  assert (occs[lit] > 0);
+	  occs[lit]--;
+	}
+    }
+  occs -= ps->max_var;
+  DELETEN (occs, 2*ps->max_var + 1);
+  ps->partial = 1;
+
+  if (ps->verbosity)
+     fprintf (ps->out,
+      "%sautarky of size %u out of %u satisfying all clauses (%.1f%%)\n",
+      ps->prefix, npartial, ps->max_var, PERCENT (npartial, ps->max_var));
+}
+
+void
+picosat_assume (PS * ps, int int_lit)
+{
+  Lit *lit;
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  assume_contexts (ps);
+  lit = import_lit (ps, int_lit, 1);
+  assume (ps, lit);
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+}
+
+int
+picosat_sat (PS * ps, int l)
+{
+  int res;
+  char ch;
+
+  enter (ps);
+
+  ps->calls++;
+  LOG ( fprintf (ps->out, "%sSTART call %u\n", ps->prefix, ps->calls));
+
+  if (ps->added < ps->ahead)
+    {
+#ifndef NADC
+      if (ps->addingtoado)
+	ABORT ("API usage: incomplete all different constraint");
+      else
+#endif
+	ABORT ("API usage: incomplete clause");
+    }
+
+  if (ps->state != READY)
+    reset_incremental_usage (ps);
+
+  assume_contexts (ps);
+
+  res = sat (ps, l);
+
+  assert (ps->state == READY);
+
+  switch (res)
+    {
+    case PICOSAT_UNSATISFIABLE:
+      ch = '0';
+      ps->state = UNSAT;
+      break;
+    case PICOSAT_SATISFIABLE:
+      ch = '1';
+      ps->state = SAT;
+      break;
+    default:
+      ch = '?';
+      ps->state = UNKNOWN;
+      break;
+    }
+
+  if (ps->verbosity)
+    {
+      report (ps, 1, ch);
+      rheader (ps);
+    }
+
+  leave (ps);
+  LOG ( fprintf (ps->out, "%sEND call %u result %d\n", ps->prefix, ps->calls, res));
+
+  ps->last_sat_call_result = res;
+
+  return res;
+}
+
+int
+picosat_res (PS * ps)
+{
+  return ps->last_sat_call_result;
+}
+
+int
+picosat_deref (PS * ps, int int_lit)
+{
+  Lit *lit;
+
+  check_ready (ps);
+  check_sat_state (ps);
+  ABORTIF (!int_lit, "API usage: can not deref zero literal");
+  ABORTIF (ps->mtcls, "API usage: deref after empty clause generated");
+
+#ifdef STATS
+  ps->derefs++;
+#endif
+
+  if (abs (int_lit) > (int) ps->max_var)
+    return 0;
+
+  lit = int2lit (ps, int_lit);
+
+  if (lit->val == TRUE)
+    return 1;
+
+  if (lit->val == FALSE)
+    return -1;
+
+  return 0;
+}
+
+int
+picosat_deref_toplevel (PS * ps, int int_lit)
+{
+  check_ready (ps);
+  ABORTIF (!int_lit, "API usage: can not deref zero literal");
+
+#ifdef STATS
+  ps->derefs++;
+#endif
+  if (abs (int_lit) > (int) ps->max_var)
+    return 0;
+
+  return tderef (ps, int_lit);
+}
+
+int
+picosat_inconsistent (PS * ps)
+{
+  check_ready (ps);
+  return ps->mtcls != 0;
+}
+
+int
+picosat_corelit (PS * ps, int int_lit)
+{
+  check_ready (ps);
+  check_unsat_state (ps);
+  ABORTIF (!int_lit, "API usage: zero literal can not be in core");
+
+  assert (ps->mtcls || ps->failed_assumption);
+
+#ifdef TRACE
+  {
+    int res = 0;
+    ABORTIF (!ps->trace, "tracing disabled");
+    if (ps->measurealltimeinlib)
+      enter (ps);
+    core (ps);
+    if (abs (int_lit) <= (int) ps->max_var)
+      res = ps->vars[abs (int_lit)].core;
+    assert (!res || ps->failed_assumption || ps->vars[abs (int_lit)].used);
+    if (ps->measurealltimeinlib)
+      leave (ps);
+    return res;
+  }
+#else
+  ABORT ("compiled without trace support");
+  return 0;
+#endif
+}
+
+int
+picosat_coreclause (PS * ps, int ocls)
+{
+  check_ready (ps);
+  check_unsat_state (ps);
+
+  ABORTIF (ocls < 0, "API usage: negative original clause index");
+  ABORTIF (ocls >= (int)ps->oadded, "API usage: original clause index exceeded");
+
+  assert (ps->mtcls || ps->failed_assumption);
+
+#ifdef TRACE
+  {
+    Cls ** clsptr, * c;
+    int res  = 0;
+
+    ABORTIF (!ps->trace, "tracing disabled");
+    if (ps->measurealltimeinlib)
+      enter (ps);
+    core (ps);
+    clsptr = ps->oclauses + ocls;
+    assert (clsptr < ps->ohead);
+    c = *clsptr;
+    if (c)
+      res = c->core;
+    if (ps->measurealltimeinlib)
+      leave (ps);
+
+    return res;
+  }
+#else
+  ABORT ("compiled without trace support");
+  return 0;
+#endif
+}
+
+int
+picosat_failed_assumption (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+  ABORTIF (!int_lit, "API usage: zero literal as assumption");
+  check_ready (ps);
+  check_unsat_state (ps);
+  if (ps->mtcls)
+    return 0;
+  assert (ps->failed_assumption);
+  if (abs (int_lit) > (int) ps->max_var)
+    return 0;
+  if (!ps->extracted_all_failed_assumptions)
+    extract_all_failed_assumptions (ps);
+  lit = import_lit (ps, int_lit, 1);
+  v = LIT2VAR (lit);
+  return v->failed;
+}
+
+int
+picosat_failed_context (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+  ABORTIF (!int_lit, "API usage: zero literal as context");
+  ABORTIF (abs (int_lit) > (int) ps->max_var, "API usage: invalid context");
+  check_ready (ps);
+  check_unsat_state (ps);
+  assert (ps->failed_assumption);
+  if (!ps->extracted_all_failed_assumptions)
+    extract_all_failed_assumptions (ps);
+  lit = import_lit (ps, int_lit, 0);
+  v = LIT2VAR (lit);
+  return v->failed;
+}
+
+const int *
+picosat_failed_assumptions (PS * ps)
+{
+  Lit ** p, * lit;
+  Var * v;
+  int ilit;
+
+  ps->falshead = ps->fals;
+  check_ready (ps);
+  check_unsat_state (ps);
+  if (!ps->mtcls)
+    {
+      assert (ps->failed_assumption);
+      if (!ps->extracted_all_failed_assumptions)
+	extract_all_failed_assumptions (ps);
+
+      for (p = ps->als; p < ps->alshead; p++)
+	{
+	  lit = *p;
+	  v = LIT2VAR (*p);
+	  if (!v->failed)
+	    continue;
+	  ilit = LIT2INT (lit);
+	  if (ps->falshead == ps->eofals)
+	    ENLARGE (ps->fals, ps->falshead, ps->eofals);
+	  *ps->falshead++ = ilit;
+	}
+    }
+  if (ps->falshead == ps->eofals)
+    ENLARGE (ps->fals, ps->falshead, ps->eofals);
+  *ps->falshead++ = 0;
+  return ps->fals;
+}
+
+const int *
+picosat_mus_assumptions (PS * ps, void * s, void (*cb)(void*,const int*), int fix)
+{
+  int i, j, ilit, len, nwork, * work, res;
+  signed char * redundant;
+  Lit ** p, * lit;
+  int failed;
+  Var * v;
+#ifndef NDEBUG
+  int oldlen;
+#endif
+#ifndef RCODE
+  int norig = ps->alshead - ps->als;
+#endif
+
+  check_ready (ps);
+  check_unsat_state (ps);
+  len = 0;
+  if (!ps->mtcls)
+    {
+      assert (ps->failed_assumption);
+      if (!ps->extracted_all_failed_assumptions)
+	extract_all_failed_assumptions (ps);
+
+      for (p = ps->als; p < ps->alshead; p++)
+	if (LIT2VAR (*p)->failed)
+	  len++;
+    }
+
+  if (ps->mass)
+    DELETEN (ps->mass, ps->szmass);
+  ps->szmass = len + 1;
+  NEWN (ps->mass, ps->szmass);
+
+  i = 0;
+  for (p = ps->als; p < ps->alshead; p++)
+    {
+      lit = *p;
+      v = LIT2VAR (lit);
+      if (!v->failed)
+	continue;
+      ilit = LIT2INT (lit);
+      assert (i < len);
+      ps->mass[i++] = ilit;
+    }
+  assert (i == len);
+  ps->mass[i] = 0;
+  if (ps->verbosity)
+     fprintf (ps->out,
+      "%sinitial set of failed assumptions of size %d out of %d (%.0f%%)\n",
+      ps->prefix, len, norig, PERCENT (len, norig));
+  if (cb)
+    cb (s, ps->mass);
+
+  nwork = len;
+  NEWN (work, nwork);
+  for (i = 0; i < len; i++)
+    work[i] = ps->mass[i];
+
+  NEWN (redundant, nwork);
+  CLRN (redundant, nwork);
+
+  for (i = 0; i < nwork; i++)
+    {
+      if (redundant[i])
+	continue;
+
+      if (ps->verbosity > 1)
+	 fprintf (ps->out,
+	         "%strying to drop %d%s assumption %d\n",
+		 ps->prefix, i, enumstr (i), work[i]);
+      for (j = 0; j < nwork; j++)
+	{
+	  if (i == j) continue;
+	  if (j < i && fix) continue;
+	  if (redundant[j]) continue;
+	  picosat_assume (ps, work[j]);
+	}
+
+      res = picosat_sat (ps, -1);
+      if (res == 10)
+	{
+	  if (ps->verbosity > 1)
+	     fprintf (ps->out,
+		     "%sfailed to drop %d%s assumption %d\n",
+		     ps->prefix, i, enumstr (i), work[i]);
+
+	  if (fix)
+	    {
+	      picosat_add (ps, work[i]);
+	      picosat_add (ps, 0);
+	    }
+	}
+      else
+	{
+	  assert (res == 20);
+	  if (ps->verbosity > 1)
+	     fprintf (ps->out,
+		     "%ssuceeded to drop %d%s assumption %d\n",
+		     ps->prefix, i, enumstr (i), work[i]);
+	  redundant[i] = 1;
+	  for (j = 0; j < nwork; j++)
+	    {
+	      failed = picosat_failed_assumption (ps, work[j]);
+	      if (j <= i)
+		{
+		  assert ((j < i && fix) || redundant[j] == !failed);
+		  continue;
+		}
+
+	      if (!failed)
+		{
+		  redundant[j] = -1;
+		  if (ps->verbosity > 1)
+		     fprintf (ps->out,
+			     "%salso suceeded to drop %d%s assumption %d\n",
+			     ps->prefix, j, enumstr (j), work[j]);
+		}
+	    }
+
+#ifndef NDEBUG
+	    oldlen = len;
+#endif
+	    len = 0;
+	    for (j = 0; j < nwork; j++)
+	      if (!redundant[j])
+		ps->mass[len++] = work[j];
+	    ps->mass[len] = 0;
+	    assert (len < oldlen);
+
+	    if (fix)
+	      {
+		picosat_add (ps, -work[i]);
+		picosat_add (ps, 0);
+	      }
+
+#ifndef NDEBUG
+	    for (j = 0; j <= i; j++)
+	      assert (redundant[j] >= 0);
+#endif
+	    for (j = i + 1; j < nwork; j++)
+	      {
+		if (redundant[j] >= 0)
+		  continue;
+
+		if (fix)
+		  {
+		    picosat_add (ps, -work[j]);
+		    picosat_add (ps, 0);
+		  }
+
+		redundant[j] = 1;
+	      }
+
+	    if (ps->verbosity)
+	       fprintf (ps->out,
+	"%sreduced set of failed assumptions of size %d out of %d (%.0f%%)\n",
+		ps->prefix, len, norig, PERCENT (len, norig));
+	    if (cb)
+	      cb (s, ps->mass);
+	}
+    }
+
+  DELETEN (work, nwork);
+  DELETEN (redundant, nwork);
+
+  if (ps->verbosity)
+    {
+       fprintf (ps->out, "%sreinitializing unsat state\n", ps->prefix);
+      fflush (ps->out);
+    }
+
+  for (i = 0; i < len; i++)
+    picosat_assume (ps, ps->mass[i]);
+
+#ifndef NDEBUG
+  res =
+#endif
+  picosat_sat (ps, -1);
+  assert (res == 20);
+
+  if (!ps->mtcls)
+    {
+      assert (!ps->extracted_all_failed_assumptions);
+      extract_all_failed_assumptions (ps);
+    }
+
+  return ps->mass;
+}
+
+static const int *
+mss (PS * ps, int * a, int size)
+{
+  int i, j, k, res;
+
+  assert (!ps->mtcls);
+
+  if (ps->szmssass)
+    DELETEN (ps->mssass, ps->szmssass);
+
+  ps->szmssass = 0;
+  ps->mssass = 0;
+
+  ps->szmssass = size + 1;
+  NEWN (ps->mssass, ps->szmssass);
+
+  LOG ( fprintf (ps->out, "%ssearch MSS over %d assumptions\n", ps->prefix, size));
+
+  k = 0;
+  for (i = k; i < size; i++)
+    {
+      for (j = 0; j < k; j++)
+	picosat_assume (ps, ps->mssass[j]);
+
+      LOG ( fprintf (ps->out,
+             "%strying to add assumption %d to MSS : %d\n",
+	     ps->prefix, i, a[i]));
+
+      picosat_assume (ps, a[i]);
+
+      res = picosat_sat (ps, -1);
+      if (res == 10)
+	{
+	  LOG ( fprintf (ps->out,
+		 "%sadding assumption %d to MSS : %d\n", ps->prefix, i, a[i]));
+
+	  ps->mssass[k++] = a[i];
+
+	  for (j = i + 1; j < size; j++)
+	    {
+	      if (picosat_deref (ps, a[j]) <= 0)
+		continue;
+
+	      LOG ( fprintf (ps->out,
+		     "%salso adding assumption %d to MSS : %d\n",
+		     ps->prefix, j, a[j]));
+
+	      ps->mssass[k++] = a[j];
+
+	      if (++i != j)
+		{
+		  int tmp = a[i];
+		  a[i] = a[j];
+		  a[j] = tmp;
+		}
+	    }
+	}
+      else
+	{
+	  assert (res == 20);
+
+	  LOG ( fprintf (ps->out,
+		 "%signoring assumption %d in MSS : %d\n", ps->prefix, i, a[i]));
+	}
+    }
+  ps->mssass[k] = 0;
+  LOG ( fprintf (ps->out, "%sfound MSS of size %d\n", ps->prefix, k));
+
+  return ps->mssass;
+}
+
+static void
+reassume (PS * ps, const int * a, int size)
+{
+  int i;
+  LOG ( fprintf (ps->out, "%sreassuming all assumptions\n", ps->prefix));
+  for (i = 0; i < size; i++)
+    picosat_assume (ps, a[i]);
+}
+
+const int *
+picosat_maximal_satisfiable_subset_of_assumptions (PS * ps)
+{
+  const int * res;
+  int i, *a, size;
+
+  ABORTIF (ps->mtcls,
+           "API usage: CNF inconsistent (use 'picosat_inconsistent')");
+
+  enter (ps);
+
+  size = ps->alshead - ps->als;
+  NEWN (a, size);
+
+  for (i = 0; i < size; i++)
+    a[i] = LIT2INT (ps->als[i]);
+
+  res = mss (ps, a, size);
+  reassume (ps, a, size);
+
+  DELETEN (a, size);
+
+  leave (ps);
+
+  return res;
+}
+
+static void
+check_mss_flags_clean (PS * ps)
+{
+#ifndef NDEBUG
+  unsigned i;
+  for (i = 1; i <= ps->max_var; i++)
+    {
+      assert (!ps->vars[i].msspos);
+      assert (!ps->vars[i].mssneg);
+    }
+#else
+  (void) ps;
+#endif
+}
+
+static void
+push_mcsass (PS * ps, int lit)
+{
+  if (ps->nmcsass == ps->szmcsass)
+    {
+      ps->szmcsass = ps->szmcsass ? 2*ps->szmcsass : 1;
+      RESIZEN (ps->mcsass, ps->nmcsass, ps->szmcsass);
+    }
+
+  ps->mcsass[ps->nmcsass++] = lit;
+}
+
+static const int *
+next_mss (PS * ps, int mcs)
+{
+  int i, *a, size, mssize, mcsize, lit, inmss;
+  const int * res, * p;
+  Var * v;
+
+  if (ps->mtcls) return 0;
+
+  check_mss_flags_clean (ps);
+
+  if (mcs && ps->mcsass)
+    {
+      DELETEN (ps->mcsass, ps->szmcsass);
+      ps->nmcsass = ps->szmcsass = 0;
+      ps->mcsass = 0;
+    }
+
+  size = ps->alshead - ps->als;
+  NEWN (a, size);
+
+  for (i = 0; i < size; i++)
+    a[i] = LIT2INT (ps->als[i]);
+
+  (void) picosat_sat (ps, -1);
+
+  //TODO short cut for 'picosat_res () == 10'?
+
+  if (ps->mtcls)
+    {
+      assert (picosat_res (ps) == 20);
+      res = 0;
+      goto DONE;
+    }
+
+  res = mss (ps, a, size);
+
+  if (ps->mtcls)
+    {
+      res = 0;
+      goto DONE;
+    }
+
+  for (p = res; (lit = *p); p++)
+    {
+      v = ps->vars + abs (lit);
+      if (lit < 0)
+	{
+	  assert (!v->msspos);
+	  v->mssneg = 1;
+	}
+      else
+	{
+	  assert (!v->mssneg);
+	  v->msspos = 1;
+	}
+    }
+
+  mssize = p - res;
+  mcsize = INT_MIN;
+
+  for (i = 0; i < size; i++)
+    {
+      lit = a[i];
+      v = ps->vars + abs (lit);
+      if (lit > 0 && v->msspos)
+	inmss = 1;
+      else if (lit < 0 && v->mssneg)
+	inmss = 1;
+      else
+	inmss = 0;
+
+      if (mssize < mcsize)
+	{
+	  if (inmss)
+	    picosat_add (ps, -lit);
+	}
+      else
+	{
+	  if (!inmss)
+	    picosat_add (ps, lit);
+	}
+
+      if (!inmss && mcs)
+	push_mcsass (ps, lit);
+    }
+  picosat_add (ps, 0);
+  if (mcs)
+    push_mcsass (ps, 0);
+
+  for (i = 0; i < size; i++)
+    {
+      lit = a[i];
+      v = ps->vars + abs (lit);
+      v->msspos = 0;
+      v->mssneg = 0;
+    }
+
+DONE:
+
+  reassume (ps, a, size);
+  DELETEN (a, size);
+
+  return res;
+}
+
+const int *
+picosat_next_maximal_satisfiable_subset_of_assumptions (PS * ps)
+{
+  const int * res;
+  enter (ps);
+  res = next_mss (ps, 0);
+  leave (ps);
+  return  res;
+}
+
+const int *
+picosat_next_minimal_correcting_subset_of_assumptions (PS * ps)
+{
+  const int * res, * tmp;
+  enter (ps);
+  tmp = next_mss (ps, 1);
+  res = tmp ? ps->mcsass : 0;
+  leave (ps);
+  return res;
+}
+
+const int *
+picosat_humus (PS * ps,
+               void (*callback)(void*state,int nmcs,int nhumus),
+	       void * state)
+{
+  int lit, nmcs, j, nhumus;
+  const int * mcs, * p;
+  unsigned i;
+  Var * v;
+  enter (ps);
+#ifndef NDEBUG
+  for (i = 1; i <= ps->max_var; i++)
+    {
+      v = ps->vars + i;
+      assert (!v->humuspos);
+      assert (!v->humusneg);
+    }
+#endif
+  nhumus = nmcs = 0;
+  while ((mcs = picosat_next_minimal_correcting_subset_of_assumptions (ps)))
+    {
+      for (p = mcs; (lit = *p); p++)
+	{
+	  v = ps->vars + abs (lit);
+	  if (lit < 0)
+	    {
+	      if (!v->humusneg)
+		{
+		  v->humusneg = 1;
+		  nhumus++;
+		}
+	    }
+	  else
+	    {
+	      if (!v->humuspos)
+		{
+		  v->humuspos = 1;
+		  nhumus++;
+		}
+	    }
+	}
+      nmcs++;
+      LOG ( fprintf (ps->out,
+             "%smcs %d of size %d humus %d\n",
+	     ps->prefix, nmcs, (int)(p - mcs), nhumus));
+      if (callback)
+	callback (state, nmcs, nhumus);
+    }
+  assert (!ps->szhumus);
+  ps->szhumus = 1;
+  for (i = 1; i <= ps->max_var; i++)
+    {
+      v = ps->vars + i;
+      if (v->humuspos)
+	ps->szhumus++;
+      if (v->humusneg)
+	ps->szhumus++;
+    }
+  assert (nhumus + 1 == ps->szhumus);
+  NEWN (ps->humus, ps->szhumus);
+  j = 0;
+  for (i = 1; i <= ps->max_var; i++)
+    {
+      v = ps->vars + i;
+      if (v->humuspos)
+	{
+	  assert (j < nhumus);
+	  ps->humus[j++] = (int) i;
+	}
+      if (v->humusneg)
+	{
+	  assert (j < nhumus);
+	  assert (i < INT_MAX);
+	  ps->humus[j++] = - (int) i;
+	}
+    }
+  assert (j == nhumus);
+  assert (j < ps->szhumus);
+  ps->humus[j] = 0;
+  leave (ps);
+  return ps->humus;
+}
+
+int
+picosat_usedlit (PS * ps, int int_lit)
+{
+  int res;
+  check_ready (ps);
+  check_sat_or_unsat_or_unknown_state (ps);
+  ABORTIF (!int_lit, "API usage: zero literal can not be used");
+  int_lit = abs (int_lit);
+  res = (int_lit <= (int) ps->max_var) ? ps->vars[int_lit].used : 0;
+  return res;
+}
+
+void
+picosat_write_clausal_core (PS * ps, FILE * file)
+{
+  check_trace_support_and_execute (ps, file, write_core_wrapper, 0);
+}
+
+void
+picosat_write_compact_trace (PS * ps, FILE * file)
+{
+  check_trace_support_and_execute (ps, file, write_trace,
+                                   COMPACT_TRACECHECK_TRACE_FMT);
+}
+
+void
+picosat_write_extended_trace (PS * ps, FILE * file)
+{
+  check_trace_support_and_execute (ps, file, write_trace,
+                                   EXTENDED_TRACECHECK_TRACE_FMT);
+}
+
+void
+picosat_write_rup_trace (PS * ps, FILE * file)
+{
+  check_trace_support_and_execute (ps, file, write_trace, RUP_TRACE_FMT);
+}
+
+size_t
+picosat_max_bytes_allocated (PS * ps)
+{
+  check_ready (ps);
+  return ps->max_bytes;
+}
+
+void
+picosat_set_propagation_limit (PS * ps, unsigned long long l)
+{
+  ps->lpropagations = l;
+}
+
+unsigned long long
+picosat_propagations (PS * ps)
+{
+  return ps->propagations;
+}
+
+unsigned long long
+picosat_visits (PS * ps)
+{
+  return ps->visits;
+}
+
+unsigned long long
+picosat_decisions (PS * ps)
+{
+  return ps->decisions;
+}
+
+int
+picosat_variables (PS * ps)
+{
+  check_ready (ps);
+  return (int) ps->max_var;
+}
+
+int
+picosat_added_original_clauses (PS * ps)
+{
+  check_ready (ps);
+  return (int) ps->oadded;
+}
+
+void
+picosat_stats (PS * ps)
+{
+#ifndef RCODE
+  unsigned redlits;
+#endif
+#ifdef STATS
+  check_ready (ps);
+  assert (ps->sdecisions + ps->rdecisions + ps->assumptions == ps->decisions);
+#endif
+  if (ps->calls > 1)
+     fprintf (ps->out, "%s%u calls\n", ps->prefix, ps->calls);
+  if (ps->contexts)
+    {
+       fprintf (ps->out, "%s%u contexts", ps->prefix, ps->contexts);
+#ifdef STATS
+       fprintf (ps->out, " %u internal variables", ps->internals);
+#endif
+       fprintf (ps->out, "\n");
+    }
+   fprintf (ps->out, "%s%u iterations\n", ps->prefix, ps->iterations);
+   fprintf (ps->out, "%s%u restarts", ps->prefix, ps->restarts);
+#ifdef STATS
+   fprintf (ps->out, " (%u skipped)", ps->skippedrestarts);
+#endif
+  fputc ('\n', ps->out);
+#ifndef NFL
+   fprintf (ps->out, "%s%u failed literals", ps->prefix, ps->failedlits);
+#ifdef STATS
+   fprintf (ps->out,
+           ", %u calls, %u rounds, %llu propagations",
+           ps->flcalls, ps->flrounds, ps->flprops);
+#endif
+  fputc ('\n', ps->out);
+#ifdef STATS
+   fprintf (ps->out,
+    "%sfl: %u = %.1f%% implicit, %llu oopsed, %llu tried, %llu skipped\n",
+    ps->prefix,
+    ps->ifailedlits, PERCENT (ps->ifailedlits, ps->failedlits),
+    ps->floopsed, ps->fltried, ps->flskipped);
+#endif
+#endif
+   fprintf (ps->out, "%s%u conflicts", ps->prefix, ps->conflicts);
+#ifdef STATS
+   fprintf (ps->out, " (%u uips = %.1f%%)\n", ps->uips, PERCENT(ps->uips,ps->conflicts));
+#else
+  fputc ('\n', ps->out);
+#endif
+#ifndef NADC
+   fprintf (ps->out, "%s%u adc conflicts\n", ps->prefix, ps->adoconflicts);
+#endif
+#ifdef STATS
+   fprintf (ps->out, "%s%llu dereferenced literals\n", ps->prefix, ps->derefs);
+#endif
+   fprintf (ps->out, "%s%u decisions", ps->prefix, ps->decisions);
+#ifdef STATS
+   fprintf (ps->out, " (%u random = %.2f%%",
+           ps->rdecisions, PERCENT (ps->rdecisions, ps->decisions));
+   fprintf (ps->out, ", %u assumptions", ps->assumptions);
+  fputc (')', ps->out);
+#endif
+  fputc ('\n', ps->out);
+#ifdef STATS
+   fprintf (ps->out,
+           "%s%u static phase decisions (%.1f%% of all variables)\n",
+	   ps->prefix,
+	   ps->staticphasedecisions, PERCENT (ps->staticphasedecisions, ps->max_var));
+#endif
+   fprintf (ps->out, "%s%u fixed variables\n", ps->prefix, ps->fixed);
+  assert (ps->nonminimizedllits >= ps->minimizedllits);
+#ifndef RCODE
+  redlits = ps->nonminimizedllits - ps->minimizedllits;
+#endif
+   fprintf (ps->out, "%s%u learned literals\n", ps->prefix, ps->llitsadded);
+   fprintf (ps->out, "%s%.1f%% deleted literals\n",
+     ps->prefix, PERCENT (redlits, ps->nonminimizedllits));
+
+#ifdef STATS
+#ifdef TRACE
+   fprintf (ps->out,
+	   "%s%llu antecedents (%.1f antecedents per clause",
+	   ps->prefix, ps->antecedents, AVERAGE (ps->antecedents, ps->conflicts));
+  if (ps->trace)
+     fprintf (ps->out, ", %.1f bytes/antecedent)", AVERAGE (ps->znts, ps->antecedents));
+  fputs (")\n", ps->out);
+#endif
+
+   fprintf (ps->out, "%s%llu propagations (%.1f propagations per decision)\n",
+           ps->prefix, ps->propagations, AVERAGE (ps->propagations, ps->decisions));
+   fprintf (ps->out, "%s%llu visits (%.1f per propagation)\n",
+	   ps->prefix, ps->visits, AVERAGE (ps->visits, ps->propagations));
+   fprintf (ps->out,
+           "%s%llu binary clauses visited (%.1f%% %.1f per propagation)\n",
+	   ps->prefix, ps->bvisits,
+	   PERCENT (ps->bvisits, ps->visits),
+	   AVERAGE (ps->bvisits, ps->propagations));
+   fprintf (ps->out,
+           "%s%llu ternary clauses visited (%.1f%% %.1f per propagation)\n",
+	   ps->prefix, ps->tvisits,
+	   PERCENT (ps->tvisits, ps->visits),
+	   AVERAGE (ps->tvisits, ps->propagations));
+   fprintf (ps->out,
+           "%s%llu large clauses visited (%.1f%% %.1f per propagation)\n",
+	   ps->prefix, ps->lvisits,
+	   PERCENT (ps->lvisits, ps->visits),
+	   AVERAGE (ps->lvisits, ps->propagations));
+   fprintf (ps->out, "%s%llu other true (%.1f%% of visited clauses)\n",
+	   ps->prefix, ps->othertrue, PERCENT (ps->othertrue, ps->visits));
+   fprintf (ps->out,
+           "%s%llu other true in binary clauses (%.1f%%)"
+	   ", %llu upper (%.1f%%)\n",
+           ps->prefix, ps->othertrue2, PERCENT (ps->othertrue2, ps->othertrue),
+	   ps->othertrue2u, PERCENT (ps->othertrue2u, ps->othertrue2));
+   fprintf (ps->out,
+           "%s%llu other true in large clauses (%.1f%%)"
+	   ", %llu upper (%.1f%%)\n",
+           ps->prefix, ps->othertruel, PERCENT (ps->othertruel, ps->othertrue),
+	   ps->othertruelu, PERCENT (ps->othertruelu, ps->othertruel));
+   fprintf (ps->out, "%s%llu ternary and large traversals (%.1f per visit)\n",
+	   ps->prefix, ps->traversals, AVERAGE (ps->traversals, ps->visits));
+   fprintf (ps->out, "%s%llu large traversals (%.1f per large visit)\n",
+	   ps->prefix, ps->ltraversals, AVERAGE (ps->ltraversals, ps->lvisits));
+   fprintf (ps->out, "%s%llu assignments\n", ps->prefix, ps->assignments);
+#else
+   fprintf (ps->out, "%s%llu propagations\n", ps->prefix, picosat_propagations (ps));
+   fprintf (ps->out, "%s%llu visits\n", ps->prefix, picosat_visits (ps));
+#endif
+   fprintf (ps->out, "%s%.1f%% variables used\n", ps->prefix, PERCENT (ps->vused, ps->max_var));
+
+  sflush (ps);
+   fprintf (ps->out, "%s%.1f seconds in library\n", ps->prefix, ps->seconds);
+   fprintf (ps->out, "%s%.1f megaprops/second\n",
+	   ps->prefix, AVERAGE (ps->propagations / 1e6f, ps->seconds));
+   fprintf (ps->out, "%s%.1f megavisits/second\n",
+	   ps->prefix, AVERAGE (ps->visits / 1e6f, ps->seconds));
+   fprintf (ps->out, "%sprobing %.1f seconds %.0f%%\n",
+           ps->prefix, ps->flseconds, PERCENT (ps->flseconds, ps->seconds));
+#ifdef STATS
+   fprintf (ps->out,
+	   "%srecycled %.1f MB in %u reductions\n",
+	   ps->prefix, ps->rrecycled / (double) (1 << 20), ps->reductions);
+   fprintf (ps->out,
+	   "%srecycled %.1f MB in %u simplifications\n",
+	   ps->prefix, ps->srecycled / (double) (1 << 20), ps->simps);
+#else
+   fprintf (ps->out, "%s%u simplifications\n", ps->prefix, ps->simps);
+   fprintf (ps->out, "%s%u reductions\n", ps->prefix, ps->reductions);
+   fprintf (ps->out, "%s%.1f MB recycled\n", ps->prefix, ps->recycled / (double) (1 << 20));
+#endif
+   fprintf (ps->out, "%s%.1f MB maximally allocated\n",
+	    ps->prefix, picosat_max_bytes_allocated (ps) / (double) (1 << 20));
+}
+
+#ifndef NGETRUSAGE
+#include <sys/time.h>
+#include <sys/resource.h>
+#include <sys/unistd.h>
+#endif
+
+double
+picosat_time_stamp (void)
+{
+  double res = -1;
+#ifndef NGETRUSAGE
+  struct rusage u;
+  res = 0;
+  if (!getrusage (RUSAGE_SELF, &u))
+    {
+      res += u.ru_utime.tv_sec + 1e-6 * u.ru_utime.tv_usec;
+      res += u.ru_stime.tv_sec + 1e-6 * u.ru_stime.tv_usec;
+    }
+#endif
+  return res;
+}
+
+double
+picosat_seconds (PS * ps)
+{
+  check_ready (ps);
+  return ps->seconds;
+}
+
+void
+picosat_print (PS * ps, FILE * file)
+{
+#ifdef NO_BINARY_CLAUSES
+  Lit * lit, *other, * last;
+  Ltk * stack;
+#endif
+  Lit **q, **eol;
+  Cls **p, *c;
+  unsigned n;
+
+  if (ps->measurealltimeinlib)
+    enter (ps);
+  else
+    check_ready (ps);
+
+  n = 0;
+  n +=  ps->alshead - ps->als;
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
+      n++;
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  last = int2lit (ps, -ps->max_var);
+  for (lit = int2lit (ps, 1); lit <= last; lit++)
+    {
+      stack = LIT2IMPLS (lit);
+      eol = stack->start + stack->count;
+      for (q = stack->start; q < eol; q++)
+	if (*q >= lit)
+	  n++;
+    }
+#endif
+
+  fprintf (file, "p cnf %d %u\n", ps->max_var, n);
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      c = *p;
+      if (!c)
+	continue;
+
+#ifdef TRACE
+      if (c->collected)
+	continue;
+#endif
+
+      eol = end_of_lits (c);
+      for (q = c->lits; q < eol; q++)
+	fprintf (file, "%d ", LIT2INT (*q));
+
+      fputs ("0\n", file);
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  last = int2lit (ps, -ps->max_var);
+  for (lit = int2lit (ps, 1); lit <= last; lit++)
+    {
+      stack = LIT2IMPLS (lit);
+      eol = stack->start + stack->count;
+      for (q = stack->start; q < eol; q++)
+	if ((other = *q) >= lit)
+	  fprintf (file, "%d %d 0\n", LIT2INT (lit), LIT2INT (other));
+    }
+#endif
+
+  {
+    Lit **r;
+    for (r = ps->als; r < ps->alshead; r++)
+      fprintf (file, "%d 0\n", LIT2INT (*r));
+  }
+
+  fflush (file);
+
+  if (ps->measurealltimeinlib)
+    leave (ps);
+}
+
+void
+picosat_enter (PS * ps)
+{
+  enter (ps);
+}
+
+void
+picosat_leave (PS * ps)
+{
+  leave (ps);
+}
+
+void
+picosat_message (PS * ps, int vlevel, const char * fmt, ...)
+{
+  va_list ap;
+
+  if (vlevel > ps->verbosity)
+    return;
+
+  fputs (ps->prefix, ps->out);
+  va_start (ap, fmt);
+  vfprintf (ps->out, fmt, ap);
+  va_end (ap);
+  fputc ('\n', ps->out);
+}
+
+int
+picosat_changed (PS * ps)
+{
+  int res;
+
+  check_ready (ps);
+  check_sat_state (ps);
+
+  res = (ps->min_flipped <= ps->saved_max_var);
+  assert (!res || ps->saved_flips != ps->flips);
+
+  return res;
+}
+
+void
+picosat_reset_phases (PS * ps)
+{
+  rebias (ps);
+}
+
+void
+picosat_reset_scores (PS * ps)
+{
+  Rnk * r;
+  ps->hhead = ps->heap + 1;
+  for (r = ps->rnks + 1; r <= ps->rnks + ps->max_var; r++)
+    {
+      CLR (r);
+      hpush (ps, r);
+    }
+}
+
+void
+picosat_remove_learned (PS * ps, unsigned percentage)
+{
+  enter (ps);
+  reset_incremental_usage (ps);
+  reduce (ps, percentage);
+  leave (ps);
+}
+
+void
+picosat_set_global_default_phase (PS * ps, int phase)
+{
+  check_ready (ps);
+  ABORTIF (phase < 0, "API usage: 'picosat_set_global_default_phase' "
+                      "with negative argument");
+  ABORTIF (phase > 3, "API usage: 'picosat_set_global_default_phase' "
+                      "with argument > 3");
+  ps->defaultphase = phase;
+}
+
+void
+picosat_set_default_phase_lit (PS * ps, int int_lit, int phase)
+{
+  unsigned newphase;
+  Lit * lit;
+  Var * v;
+
+  check_ready (ps);
+
+  lit = import_lit (ps, int_lit, 1);
+  v = LIT2VAR (lit);
+
+  if (phase)
+    {
+      newphase = (int_lit < 0) == (phase < 0);
+      v->defphase = v->phase = newphase;
+      v->usedefphase = v->assigned = 1;
+    }
+  else
+    {
+      v->usedefphase = v->assigned = 0;
+    }
+}
+
+void
+picosat_set_more_important_lit (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+  Rnk * r;
+
+  check_ready (ps);
+
+  lit = import_lit (ps, int_lit, 1);
+  v = LIT2VAR (lit);
+  r = VAR2RNK (v);
+
+  ABORTIF (r->lessimportant, "can not mark variable more and less important");
+
+  if (r->moreimportant)
+    return;
+
+  r->moreimportant = 1;
+
+  if (r->pos)
+    hup (ps, r);
+}
+
+void
+picosat_set_less_important_lit (PS * ps, int int_lit)
+{
+  Lit * lit;
+  Var * v;
+  Rnk * r;
+
+  check_ready (ps);
+
+  lit = import_lit (ps, int_lit, 1);
+  v = LIT2VAR (lit);
+  r = VAR2RNK (v);
+
+  ABORTIF (r->moreimportant, "can not mark variable more and less important");
+
+  if (r->lessimportant)
+    return;
+
+  r->lessimportant = 1;
+
+  if (r->pos)
+    hdown (ps, r);
+}
+
+#ifndef NADC
+
+unsigned
+picosat_ado_conflicts (PS * ps)
+{
+  check_ready (ps);
+  return ps->adoconflicts;
+}
+
+void
+picosat_disable_ado (PS * ps)
+{
+  check_ready (ps);
+  assert (!ps->adodisabled);
+  ps->adodisabled = 1;
+}
+
+void
+picosat_enable_ado (PS * ps)
+{
+  check_ready (ps);
+  assert (ps->adodisabled);
+  ps->adodisabled = 0;
+}
+
+void
+picosat_set_ado_conflict_limit (PS * ps, unsigned newadoconflictlimit)
+{
+  check_ready (ps);
+  ps->adoconflictlimit = newadoconflictlimit;
+}
+
+#endif
+
+void
+picosat_simplify (PS * ps)
+{
+  enter (ps);
+  reset_incremental_usage (ps);
+  simplify (ps, 1);
+  leave (ps);
+}
+
+int
+picosat_haveados (void)
+{
+#ifndef NADC
+  return 1;
+#else
+  return 0;
+#endif
+}
+
+void
+picosat_save_original_clauses (PS * ps)
+{
+  if (ps->saveorig) return;
+  ABORTIF (ps->oadded, "API usage: 'picosat_save_original_clauses' too late");
+  ps->saveorig = 1;
+}
+
+void picosat_set_interrupt (PicoSAT * ps,
+                            void * external_state,
+			    int (*interrupted)(void * external_state))
+{
+  ps->interrupt.state = external_state;
+  ps->interrupt.function = interrupted;
+}
+
+int
+picosat_deref_partial (PS * ps, int int_lit)
+{
+  check_ready (ps);
+  check_sat_state (ps);
+  ABORTIF (!int_lit, "API usage: can not partial deref zero literal");
+  ABORTIF (ps->mtcls, "API usage: deref partial after empty clause generated");
+  ABORTIF (!ps->saveorig, "API usage: 'picosat_save_original_clauses' missing");
+
+#ifdef STATS
+  ps->derefs++;
+#endif
+
+  if (!ps->partial)
+    minautarky (ps);
+
+  return pderef (ps, int_lit);
+}
-- 
2.39.2


