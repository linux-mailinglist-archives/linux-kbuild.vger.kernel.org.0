Return-Path: <linux-kbuild+bounces-2450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 675E892CB5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77ABFB22AF0
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADB4824AD;
	Wed, 10 Jul 2024 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEtdoQ0Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C27D08D;
	Wed, 10 Jul 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594475; cv=none; b=FaRZWBEVzCdLyJ+uhxba+Q+rqrJWqz8GMQzNKsPaRHOnrqKRIQpxxzV9pdoDdp4MIT8uOWB+6w7My1UtLfV8vOxAU9snI1Sz4TXNGVkEOK8lmXJ7z1vsqzP0+I7BGyW4CcD7DdseObvDpEKWSjEboQtxj6nYSWZpDen1GxOcbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594475; c=relaxed/simple;
	bh=C0i0Id+Pod2d4JSyM+yBmlGJVPSKsses0II3ACP6tuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwCXQjkhXdrBRKlkv1Vr5/hzLeojHimQKqexmz9uvmREs/W9S/gn4HCxJvv3UBrftwFif5TR6kMngIROIudNB8Gx6NdHxabjBr8KXxfBEOpb1HtSINfhPlOExBWgIu8ozKHDMhxzkLejBc2ySO+TD1QcenoXpjGCS+wzw61AL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEtdoQ0Q; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58b447c519eso7443214a12.3;
        Tue, 09 Jul 2024 23:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594470; x=1721199270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/t6qURsGsAE8QpAoUge5Z6l4uQMEArrGYVpLcJiBCY=;
        b=nEtdoQ0QTMvxtwJFdvtBnLXm0I6TeM/x876HqAjXYE4tfl7uzHOkLVRMuVNXkO2qQ3
         XCGS57BK8QmWvt40jy6p2JvWKfZmnhiySxtnC9GiIEj4cCvMPC7rI1W281Z+pR6+BsLs
         PSoSN8DaD1ngiWG4z7lOfUJHgjL/vTcfUtJ5GiVfi1q5YiMn/+fsEz29oG5LUAJWMMVq
         H4pRg5IDY9vtpALC9S/QxUpG6BYW4Sa3FxSLDlK21S4DkzkF/YMWR5+djWd1uUjrO2qQ
         fEcBVOC8ENzFpf0v7qeI5wQ1iBIbAU4uTAO4ke1OeqjRlojSDTi1WFxd+DDlxJ24AVA+
         yLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594470; x=1721199270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/t6qURsGsAE8QpAoUge5Z6l4uQMEArrGYVpLcJiBCY=;
        b=ILFnQpqFi0oRiWtQd2ZzXKpLjrnthFCm4p0INncsyqDr4H2RMP2mckuQIacZozO3w8
         gjG5wc/RxGD42OqqSyuJmnPlxgEHp0rm1wynlJNJl6KicR72KvZ5Yl2LhLoO1+CuVD0/
         U3NOsyYo9f87qYYnXrT22BLQAN9xF+qEnbKiwaYdgtWjx3yRtw73B0puAz/8r1Q4LBRs
         HDtCtM0suOTgCksCt8Bo/uM1YQs5dexCGLMyiYwfaP+A54h8Jp/T9W66+4O5LJ6MxSLY
         5umb0Zxq1s6sNizFLrRvdTsMkD4Oy3xcDV19WFUrmjjYQjY3wbR9VhwwsKvKY162U2v8
         22uA==
X-Forwarded-Encrypted: i=1; AJvYcCXPeTHbhadQ69DtFKhbU+J4wboHTC75LTOrPS1dJLkt/7F2WV6gXzPBP3FyTXyIV+yBWRPtSik8Sa/42slenFM+oBDm3eMxheQ8/C+9
X-Gm-Message-State: AOJu0YzO4UrmcOZTtmh9FjtkG5AIN6dwr98rMkMyCdkSQQbIQ+EUIAZb
	qDZCN60rl+UjCVRCcPLXSE14k1fTbCUSDNDvYDUDhj3ONtTMIbXoeXbw9A==
X-Google-Smtp-Source: AGHT+IGdV9a/atlqycXz7zdtKMAE8S0Cdd3VVAVfbxYmjeAPCgiydWzLqWo0PIALDyMOi/sPE/xBhw==
X-Received: by 2002:aa7:d897:0:b0:57d:10db:488e with SMTP id 4fb4d7f45d1cf-594bb86a798mr2558411a12.30.1720594469550;
        Tue, 09 Jul 2024 23:54:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:29 -0700 (PDT)
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
Subject: [PATCH v4 03/12] kconfig: Add picosat.c (2/3)
Date: Wed, 10 Jul 2024 08:52:46 +0200
Message-Id: <20240710065255.10338-4-ole0811sch@gmail.com>
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

The second part of picosat.c

Signed-off-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/picosat.c | 3000 +++++++++++++++++++++++++++++++++++++
 1 file changed, 3000 insertions(+)

diff --git a/scripts/kconfig/picosat.c b/scripts/kconfig/picosat.c
index 872a38b335c4..c183dffb89a3 100644
--- a/scripts/kconfig/picosat.c
+++ b/scripts/kconfig/picosat.c
@@ -2998,3 +2998,3003 @@ unassign (PS * ps, Lit * lit)
 	  {
 	    other = p->lits[1];
 	    q = p->next + 1;
+	  }
+	else
+	  {
+	    assert (p->lits[1] == lit);
+	    q = p->next;
+	  }
+
+	next = *q;
+	*q = *LIT2HTPS (other);
+	*LIT2HTPS (other) = p;
+	p = next;
+      }
+  }
+#endif
+
+#ifndef NADC
+  if (v->adotabpos)
+    {
+      assert (ps->nadotab);
+      assert (*v->adotabpos == v->ado);
+
+      *v->adotabpos = 0;
+      v->adotabpos = 0;
+
+      ps->nadotab--;
+    }
+#endif
+}
+
+static Cls *
+var2reason (PS * ps, Var * var)
+{
+  Cls * res = var->reason;
+#ifdef NO_BINARY_CLAUSES
+  Lit * this, * other;
+  if (ISLITREASON (res))
+    {
+      this = VAR2LIT (var);
+      if (this->val == FALSE)
+	this = NOTLIT (this);
+
+      other = REASON2LIT (res);
+      assert (other->val == TRUE);
+      assert (this->val == TRUE);
+      res = setimpl (ps, NOTLIT (other), this);
+    }
+#else
+  (void) ps;
+#endif
+  return res;
+}
+
+static void
+mark_clause_to_be_collected (Cls * c)
+{
+  assert (!c->collect);
+  c->collect = 1;
+}
+
+static void
+undo (PS * ps, unsigned new_level)
+{
+  Lit *lit;
+  Var *v;
+
+  while (ps->thead > ps->trail)
+    {
+      lit = *--ps->thead;
+      v = LIT2VAR (lit);
+      if (v->level == new_level)
+	{
+	  ps->thead++;		/* fix pre decrement */
+	  break;
+	}
+
+      unassign (ps, lit);
+    }
+
+  ps->LEVEL = new_level;
+  ps->ttail = ps->thead;
+  ps->ttail2 = ps->thead;
+#ifndef NADC
+  ps->ttailado = ps->thead;
+#endif
+
+#ifdef NO_BINARY_CLAUSES
+  if (ps->conflict == &ps->cimpl)
+    resetcimpl (ps);
+#endif
+#ifndef NADC
+  if (ps->conflict && ps->conflict == ps->adoconflict)
+    resetadoconflict (ps);
+#endif
+  ps->conflict = ps->mtcls;
+  if (ps->LEVEL < ps->adecidelevel)
+    {
+      assert (ps->als < ps->alshead);
+      ps->adecidelevel = 0;
+      ps->alstail = ps->als;
+    }
+  LOG ( fprintf (ps->out, "%sback to level %u\n", ps->prefix, ps->LEVEL));
+}
+
+#ifndef NDEBUG
+
+static int
+clause_satisfied (Cls * c)
+{
+  Lit **p, **eol, *lit;
+
+  eol = end_of_lits (c);
+  for (p = c->lits; p < eol; p++)
+    {
+      lit = *p;
+      if (lit->val == TRUE)
+	return 1;
+    }
+
+  return 0;
+}
+
+static void
+original_clauses_satisfied (PS * ps)
+{
+  Cls **p, *c;
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
+      assert (clause_satisfied (c));
+    }
+}
+
+static void
+assumptions_satisfied (PS * ps)
+{
+  Lit *lit, ** p;
+
+  for (p = ps->als; p < ps->alshead; p++)
+    {
+      lit = *p;
+      assert (lit->val == TRUE);
+    }
+}
+
+#endif
+
+static void
+sflush (PS * ps)
+{
+  double now = picosat_time_stamp ();
+  double delta = now - ps->entered;
+  delta = (delta < 0) ? 0 : delta;
+  ps->seconds += delta;
+  ps->entered = now;
+}
+
+static double
+mb (PS * ps)
+{
+  return ps->current_bytes / (double) (1 << 20);
+}
+
+static double
+avglevel (PS * ps)
+{
+  return ps->decisions ? ps->levelsum / ps->decisions : 0.0;
+}
+
+static void
+rheader (PS * ps)
+{
+  assert (ps->lastrheader <= ps->reports);
+
+  if (ps->lastrheader == ps->reports)
+    return;
+
+  ps->lastrheader = ps->reports;
+
+   fprintf (ps->out, "%s\n", ps->prefix);
+   fprintf (ps->out, "%s %s\n", ps->prefix, ps->rline[0]);
+   fprintf (ps->out, "%s %s\n", ps->prefix, ps->rline[1]);
+   fprintf (ps->out, "%s\n", ps->prefix);
+}
+
+static unsigned
+dynamic_flips_per_assignment_per_mille (PS * ps)
+{
+  assert (FFLIPPEDPREC >= 1000);
+  return ps->sdflips / (FFLIPPEDPREC / 1000);
+}
+
+#ifdef NLUBY
+
+static int
+high_agility (PS * ps)
+{
+  return dynamic_flips_per_assignment_per_mille (ps) >= 200;
+}
+
+static int
+very_high_agility (PS * ps)
+{
+  return dynamic_flips_per_assignment_per_mille (ps) >= 250;
+}
+
+#else
+
+static int
+medium_agility (PS * ps)
+{
+  return dynamic_flips_per_assignment_per_mille (ps) >= 230;
+}
+
+#endif
+
+static void
+relemdata (PS * ps)
+{
+  char *p;
+  int x;
+
+  if (ps->reports < 0)
+    {
+      /* strip trailing white space
+       */
+      for (x = 0; x <= 1; x++)
+	{
+	  p = ps->rline[x] + strlen (ps->rline[x]);
+	  while (p-- > ps->rline[x])
+	    {
+	      if (*p != ' ')
+		break;
+
+	      *p = 0;
+	    }
+	}
+
+      rheader (ps);
+    }
+  else
+    fputc ('\n', ps->out);
+
+  ps->RCOUNT = 0;
+}
+
+static void
+relemhead (PS * ps, const char * name, int fp, double val)
+{
+  int x, y, len, size;
+  const char *fmt;
+  unsigned tmp, e;
+
+  if (ps->reports < 0)
+    {
+      x = ps->RCOUNT & 1;
+      y = (ps->RCOUNT / 2) * 12 + x * 6;
+
+      if (ps->RCOUNT == 1)
+	sprintf (ps->rline[1], "%6s", "");
+
+      len = strlen (name);
+      while (ps->szrline <= len + y + 1)
+	{
+	  size = ps->szrline ? 2 * ps->szrline : 128;
+	  ps->rline[0] = resize (ps, ps->rline[0], ps->szrline, size);
+	  ps->rline[1] = resize (ps, ps->rline[1], ps->szrline, size);
+	  ps->szrline = size;
+	}
+
+      fmt = (len <= 6) ? "%6s%10s" : "%-10s%4s";
+      sprintf (ps->rline[x] + y, fmt, name, "");
+    }
+  else if (val < 0)
+    {
+      assert (fp);
+
+      if (val > -100 && (tmp = val * 10.0 - 0.5) > -1000.0)
+	{
+	   fprintf (ps->out, "-%4.1f ", -tmp / 10.0);
+	}
+      else
+	{
+	  tmp = -val / 10.0 + 0.5;
+	  e = 1;
+	  while (tmp >= 100)
+	    {
+	      tmp /= 10;
+	      e++;
+	    }
+
+	   fprintf (ps->out, "-%2ue%u ", tmp, e);
+	}
+    }
+  else
+    {
+      if (fp && val < 1000 && (tmp = val * 10.0 + 0.5) < 10000)
+	{
+	   fprintf (ps->out, "%5.1f ", tmp / 10.0);
+	}
+      else if (!fp && (tmp = val) < 100000)
+	{
+	   fprintf (ps->out, "%5u ", tmp);
+	}
+      else
+	{
+	  tmp = val / 10.0 + 0.5;
+	  e = 1;
+
+	  while (tmp >= 1000)
+	    {
+	      tmp /= 10;
+	      e++;
+	    }
+
+	   fprintf (ps->out, "%3ue%u ", tmp, e);
+	}
+    }
+
+  ps->RCOUNT++;
+}
+
+inline static void
+relem (PS * ps, const char *name, int fp, double val)
+{
+  if (name)
+    relemhead (ps, name, fp, val);
+  else
+    relemdata (ps);
+}
+
+static unsigned
+reduce_limit_on_lclauses (PS * ps)
+{
+  unsigned res = ps->lreduce;
+  res += ps->llocked;
+  return res;
+}
+
+static void
+report (PS * ps, int replevel, char type)
+{
+  int rounds;
+
+#ifdef RCODE
+  (void) type;
+#endif
+
+  if (ps->verbosity < replevel)
+    return;
+
+  sflush (ps);
+
+  if (!ps->reports)
+    ps->reports = -1;
+
+  for (rounds = (ps->reports < 0) ? 2 : 1; rounds; rounds--)
+    {
+      if (ps->reports >= 0)
+	 fprintf (ps->out, "%s%c ", ps->prefix, type);
+
+      relem (ps, "seconds", 1, ps->seconds);
+      relem (ps, "level", 1, avglevel (ps));
+      assert (ps->fixed <=  ps->max_var);
+      relem (ps, "variables", 0, ps->max_var - ps->fixed);
+      relem (ps, "used", 1, PERCENT (ps->vused, ps->max_var));
+      relem (ps, "original", 0, ps->noclauses);
+      relem (ps, "conflicts", 0, ps->conflicts);
+      // relem (ps, "decisions", 0, ps->decisions);
+      // relem (ps, "conf/dec", 1, PERCENT(ps->conflicts,ps->decisions));
+      // relem (ps, "limit", 0, reduce_limit_on_lclauses (ps));
+      relem (ps, "learned", 0, ps->nlclauses);
+      // relem (ps, "limit", 1, PERCENT (ps->nlclauses, reduce_limit_on_lclauses (ps)));
+      relem (ps, "limit", 0, ps->lreduce);
+#ifdef STATS
+      relem (ps, "learning", 1, PERCENT (ps->llused, ps->lladded));
+#endif
+      relem (ps, "agility", 1, dynamic_flips_per_assignment_per_mille (ps) / 10.0);
+      // relem (ps, "original", 0, ps->noclauses);
+      relem (ps, "MB", 1, mb (ps));
+      // relem (ps, "lladded", 0, ps->lladded);
+      // relem (ps, "llused", 0, ps->llused);
+
+      relem (ps, 0, 0, 0);
+
+      ps->reports++;
+    }
+
+  /* Adapt this to the number of rows in your terminal.
+   */
+  #define ROWS 25
+
+  if (ps->reports % (ROWS - 3) == (ROWS - 4))
+    rheader (ps);
+
+  fflush (ps->out);
+}
+
+static int
+bcp_queue_is_empty (PS * ps)
+{
+  if (ps->ttail != ps->thead)
+    return 0;
+
+  if (ps->ttail2 != ps->thead)
+    return 0;
+
+#ifndef NADC
+  if (ps->ttailado != ps->thead)
+    return 0;
+#endif
+
+  return 1;
+}
+
+static int
+satisfied (PS * ps)
+{
+  assert (!ps->mtcls);
+  assert (!ps->failed_assumption);
+  if (ps->alstail < ps->alshead)
+    return 0;
+  assert (!ps->conflict);
+  assert (bcp_queue_is_empty (ps));
+  return ps->thead == ps->trail + ps->max_var;	/* all assigned */
+}
+
+static void
+vrescore (PS * ps)
+{
+  Rnk *p, *eor = ps->rnks + ps->max_var;
+  for (p = ps->rnks + 1; p <= eor; p++)
+    if (p->score != INFFLT)
+      p->score = mulflt (p->score, ps->ilvinc);
+  ps->vinc = mulflt (ps->vinc, ps->ilvinc);;
+#ifdef VISCORES
+  ps->nvinc = mulflt (ps->nvinc, ps->lscore);;
+#endif
+}
+
+static void
+inc_score (PS * ps, Var * v)
+{
+  Flt score;
+  Rnk *r;
+
+#ifndef NFL
+  if (ps->simplifying)
+    return;
+#endif
+
+  if (!v->level)
+    return;
+
+  if (v->internal)
+    return;
+
+  r = VAR2RNK (v);
+  score = r->score;
+
+  assert (score != INFFLT);
+
+  score = addflt (score, ps->vinc);
+  assert (score < INFFLT);
+  r->score = score;
+  if (r->pos > 0)
+    hup (ps, r);
+
+  if (score > ps->lscore)
+    vrescore (ps);
+}
+
+static void
+inc_activity (PS * ps, Cls * c)
+{
+  Act *p;
+
+  if (!c->learned)
+    return;
+
+  if (c->size <= 2)
+    return;
+
+  p = CLS2ACT (c);
+  *p = addflt (*p, ps->cinc);
+}
+
+static unsigned
+hashlevel (unsigned l)
+{
+  return 1u << (l & 31);
+}
+
+static void
+push (PS * ps, Var * v)
+{
+  if (ps->dhead == ps->eod)
+    ENLARGE (ps->dfs, ps->dhead, ps->eod);
+
+  *ps->dhead++ = v;
+}
+
+static Var *
+pop (PS * ps)
+{
+  assert (ps->dfs < ps->dhead);
+  return *--ps->dhead;
+}
+
+static void
+analyze (PS * ps)
+{
+  unsigned open, minlevel, siglevels, l, old, i, orig;
+  Lit *this, *other, **p, **q, **eol;
+  Var *v, *u, **m, *start, *uip;
+  Cls *c;
+
+  assert (ps->conflict);
+
+  assert (ps->ahead == ps->added);
+  assert (ps->mhead == ps->marked);
+  assert (ps->rhead == ps->resolved);
+
+  /* First, search for First UIP variable and mark all resolved variables.
+   * At the same time determine the minimum decision level involved.
+   * Increase activities of resolved variables.
+   */
+  q = ps->thead;
+  open = 0;
+  minlevel = ps->LEVEL;
+  siglevels = 0;
+  uip = 0;
+
+  c = ps->conflict;
+
+  for (;;)
+    {
+      add_antecedent (ps, c);
+      inc_activity (ps, c);
+      eol = end_of_lits (c);
+      for (p = c->lits; p < eol; p++)
+	{
+	  other = *p;
+
+	  if (other->val == TRUE)
+	    continue;
+
+	  assert (other->val == FALSE);
+
+	  u = LIT2VAR (other);
+	  if (u->mark)
+	    continue;
+
+	  u->mark = 1;
+	  inc_score (ps, u);
+	  use_var (ps, u);
+
+	  if (u->level == ps->LEVEL)
+	    {
+	      open++;
+	    }
+	  else
+	    {
+	      push_var_as_marked (ps, u);
+
+	      if (u->level)
+		{
+		  /* The statistics counter 'nonminimizedllits' sums up the
+		   * number of literals that would be added if only the
+		   * 'first UIP' scheme for learned clauses would be used
+		   * and no clause minimization.
+		   */
+		  ps->nonminimizedllits++;
+
+		  if (u->level < minlevel)
+		    minlevel = u->level;
+
+		  siglevels |= hashlevel (u->level);
+		}
+	      else
+		{
+		  assert (!u->level);
+		  assert (u->reason);
+		}
+	    }
+	}
+
+      do
+	{
+	  if (q == ps->trail)
+	    {
+	      uip = 0;
+	      goto DONE_FIRST_UIP;
+	    }
+
+	  this = *--q;
+	  uip = LIT2VAR (this);
+	}
+      while (!uip->mark);
+
+      uip->mark = 0;
+
+      c = var2reason (ps, uip);
+#ifdef NO_BINARY_CLAUSES
+      if (c == &ps->impl)
+	resetimpl (ps);
+#endif
+     open--;
+     if ((!open && ps->LEVEL) || !c)
+	break;
+
+     assert (c);
+    }
+
+DONE_FIRST_UIP:
+
+  if (uip)
+    {
+      assert (ps->LEVEL);
+      this = VAR2LIT (uip);
+      this += (this->val == TRUE);
+      ps->nonminimizedllits++;
+      ps->minimizedllits++;
+      add_lit (ps, this);
+#ifdef STATS
+      if (uip->reason)
+	ps->uips++;
+#endif
+    }
+  else
+    assert (!ps->LEVEL);
+
+  /* Second, try to mark more intermediate variables, with the goal to
+   * minimize the conflict clause.  This is a DFS from already marked
+   * variables backward through the implication graph.  It tries to reach
+   * other marked variables.  If the search reaches an unmarked decision
+   * variable or a variable assigned below the minimum level of variables in
+   * the first uip learned clause or a level on which no variable has been
+   * marked, then the variable from which the DFS is started is not
+   * redundant.  Otherwise the start variable is redundant and will
+   * eventually be removed from the learned clause in step 4.  We initially
+   * implemented BFS, but then profiling revelead that this step is a bottle
+   * neck for certain incremental applications.  After switching to DFS this
+   * hot spot went away.
+   */
+  orig = ps->mhead - ps->marked;
+  for (i = 0; i < orig; i++)
+    {
+      start = ps->marked[i];
+
+      assert (start->mark);
+      assert (start != uip);
+      assert (start->level < ps->LEVEL);
+
+      if (!start->reason)
+	continue;
+
+      old = ps->mhead - ps->marked;
+      assert (ps->dhead == ps->dfs);
+      push (ps, start);
+
+      while (ps->dhead > ps->dfs)
+	{
+	  u = pop (ps);
+	  assert (u->mark);
+
+	  c = var2reason (ps, u);
+#ifdef NO_BINARY_CLAUSES
+	  if (c == &ps->impl)
+	    resetimpl (ps);
+#endif
+	  if (!c ||
+	      ((l = u->level) &&
+	       (l < minlevel || ((hashlevel (l) & ~siglevels)))))
+	    {
+	      while (ps->mhead > ps->marked + old)	/* reset all marked */
+		(*--ps->mhead)->mark = 0;
+
+	      ps->dhead = ps->dfs;		/* and DFS stack */
+	      break;
+	    }
+
+	  eol = end_of_lits (c);
+	  for (p = c->lits; p < eol; p++)
+	    {
+	      v = LIT2VAR (*p);
+	      if (v->mark)
+		continue;
+
+	      mark_var (ps, v);
+	      push (ps, v);
+	    }
+	}
+    }
+
+  for (m = ps->marked; m < ps->mhead; m++)
+    {
+      v = *m;
+
+      assert (v->mark);
+      assert (!v->resolved);
+
+      use_var (ps, v);
+
+      c = var2reason (ps, v);
+      if (!c)
+	continue;
+
+#ifdef NO_BINARY_CLAUSES
+      if (c == &ps->impl)
+	resetimpl (ps);
+#endif
+      eol = end_of_lits (c);
+      for (p = c->lits; p < eol; p++)
+	{
+	  other = *p;
+
+	  u = LIT2VAR (other);
+	  if (!u->level)
+	    continue;
+
+	  if (!u->mark)		/* 'MARKTEST' */
+	    break;
+	}
+
+      if (p != eol)
+	continue;
+
+      add_antecedent (ps, c);
+      v->resolved = 1;
+    }
+
+  for (m = ps->marked; m < ps->mhead; m++)
+    {
+      v = *m;
+
+      assert (v->mark);
+      v->mark = 0;
+
+      if (v->resolved)
+	{
+	  v->resolved = 0;
+	  continue;
+	}
+
+      this = VAR2LIT (v);
+      if (this->val == TRUE)
+	this++;			/* actually NOTLIT */
+
+      add_lit (ps, this);
+      ps->minimizedllits++;
+    }
+
+  assert (ps->ahead <= ps->eoa);
+  assert (ps->rhead <= ps->eor);
+
+  ps->mhead = ps->marked;
+}
+
+static void
+fanalyze (PS * ps)
+{
+  Lit ** eol, ** p, * lit;
+  Cls * c, * reason;
+  Var * v, * u;
+  int next;
+
+#ifndef RCODE
+  double start = picosat_time_stamp ();
+#endif
+
+  assert (ps->failed_assumption);
+  assert (ps->failed_assumption->val == FALSE);
+
+  v = LIT2VAR (ps->failed_assumption);
+  reason = var2reason (ps, v);
+  if (!reason) return;
+#ifdef NO_BINARY_CLAUSES
+  if (reason == &ps->impl)
+    resetimpl (ps);
+#endif
+
+  eol = end_of_lits (reason);
+  for (p = reason->lits; p != eol; p++)
+    {
+      lit = *p;
+      u = LIT2VAR (lit);
+      if (u == v) continue;
+      if (u->reason) break;
+    }
+  if (p == eol) return;
+
+  assert (ps->ahead == ps->added);
+  assert (ps->mhead == ps->marked);
+  assert (ps->rhead == ps->resolved);
+
+  next = 0;
+  mark_var (ps, v);
+  add_lit (ps, NOTLIT (ps->failed_assumption));
+
+  do
+    {
+      v = ps->marked[next++];
+      use_var (ps, v);
+      if (v->reason)
+	{
+	  reason = var2reason (ps, v);
+#ifdef NO_BINARY_CLAUSES
+	  if (reason == &ps->impl)
+	    resetimpl (ps);
+#endif
+	  add_antecedent (ps, reason);
+	  eol = end_of_lits (reason);
+	  for (p = reason->lits; p != eol; p++)
+	    {
+	      lit = *p;
+	      u = LIT2VAR (lit);
+	      if (u == v) continue;
+	      if (u->mark) continue;
+	      mark_var (ps, u);
+	    }
+	}
+      else
+	{
+	  lit = VAR2LIT (v);
+	  if (lit->val == TRUE) lit = NOTLIT (lit);
+	  add_lit (ps, lit);
+	}
+    }
+  while (ps->marked + next < ps->mhead);
+
+  c = add_simplified_clause (ps, 1);
+  v = LIT2VAR (ps->failed_assumption);
+  reason = v->reason;
+#ifdef NO_BINARY_CLAUSES
+  if (!ISLITREASON (reason))
+#endif
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
+#ifdef NO_BINARY_CLAUSES
+  if (c == &ps->impl)
+    {
+      c = impl2reason (ps, NOTLIT (ps->failed_assumption));
+    }
+  else
+#endif
+    {
+      assert (c->learned);
+      assert (!c->locked);
+      c->locked = 1;
+      if (c->size > 2)
+	{
+	  ps->llocked++;
+	  assert (ps->llocked > 0);
+	}
+    }
+
+  v->reason = c;
+
+  while (ps->mhead > ps->marked)
+    (*--ps->mhead)->mark = 0;
+
+  if (ps->verbosity)
+     fprintf (ps->out, "%sfanalyze took %.1f seconds\n",
+	     ps->prefix, picosat_time_stamp () - start);
+}
+
+/* Propagate assignment of 'this' to 'FALSE' by visiting all binary clauses in
+ * which 'this' occurs.
+ */
+inline static void
+prop2 (PS * ps, Lit * this)
+{
+#ifdef NO_BINARY_CLAUSES
+  Lit ** l, ** start;
+  Ltk * lstk;
+#else
+  Cls * c, ** p;
+  Cls * next;
+#endif
+  Lit * other;
+  Val tmp;
+
+  assert (this->val == FALSE);
+
+#ifdef NO_BINARY_CLAUSES
+  lstk = LIT2IMPLS (this);
+  start = lstk->start;
+  l = start + lstk->count;
+  while (l != start)
+    {
+      /* The counter 'visits' is the number of clauses that are
+       * visited during propagations of assignments.
+       */
+      ps->visits++;
+#ifdef STATS
+      ps->bvisits++;
+#endif
+      other = *--l;
+      tmp = other->val;
+
+      if (tmp == TRUE)
+	{
+#ifdef STATS
+	  ps->othertrue++;
+	  ps->othertrue2++;
+	  if (LIT2VAR (other)->level < ps->LEVEL)
+	    ps->othertrue2u++;
+#endif
+	  continue;
+	}
+
+      if (tmp != FALSE)
+	{
+	  assign_forced (ps, other, LIT2REASON (NOTLIT(this)));
+	  continue;
+	}
+
+      if (ps->conflict == &ps->cimpl)
+	resetcimpl (ps);
+      ps->conflict = setcimpl (ps, this, other);
+    }
+#else
+  /* Traverse all binary clauses with 'this'.  Head/Tail pointers for binary
+   * clauses do not have to be modified here.
+   */
+  p = LIT2IMPLS (this);
+  for (c = *p; c; c = next)
+    {
+      ps->visits++;
+#ifdef STATS
+      ps->bvisits++;
+#endif
+      assert (!c->collect);
+#ifdef TRACE
+      assert (!c->collected);
+#endif
+      assert (c->size == 2);
+
+      other = c->lits[0];
+      if (other == this)
+	{
+	  next = c->next[0];
+	  other = c->lits[1];
+	}
+      else
+	next = c->next[1];
+
+      tmp = other->val;
+
+      if (tmp == TRUE)
+	{
+#ifdef STATS
+	  ps->othertrue++;
+	  ps->othertrue2++;
+	  if (LIT2VAR (other)->level < ps->LEVEL)
+	    ps->othertrue2u++;
+#endif
+	  continue;
+	}
+
+      if (tmp == FALSE)
+	ps->conflict = c;
+      else
+	assign_forced (ps, other, c);	/* unit clause */
+    }
+#endif /* !defined(NO_BINARY_CLAUSES) */
+}
+
+#ifndef NDSC
+static int
+should_disconnect_head_tail (PS * ps, Lit * lit)
+{
+  unsigned litlevel;
+  Var * v;
+
+  assert (lit->val == TRUE);
+
+  v = LIT2VAR (lit);
+  litlevel = v->level;
+
+  if (!litlevel)
+    return 1;
+
+#ifndef NFL
+  if (ps->simplifying)
+    return 0;
+#endif
+
+  return litlevel < ps->LEVEL;
+}
+#endif
+
+inline static void
+propl (PS * ps, Lit * this)
+{
+  Lit **l, *other, *prev, *new_lit, **eol;
+  Cls *next, **htp_ptr, **new_htp_ptr;
+  Cls *c;
+#ifdef STATS
+  unsigned size;
+#endif
+
+  htp_ptr = LIT2HTPS (this);
+  assert (this->val == FALSE);
+
+  /* Traverse all non binary clauses with 'this'.  Head/Tail pointers are
+   * updated as well.
+   */
+  for (c = *htp_ptr; c; c = next)
+    {
+      ps->visits++;
+#ifdef STATS
+      size = c->size;
+      assert (size >= 3);
+      ps->traversals++;	/* other is dereferenced at least */
+
+      if (size == 3)
+	ps->tvisits++;
+      else if (size >= 4)
+	{
+	  ps->lvisits++;
+	  ps->ltraversals++;
+	}
+#endif
+#ifdef TRACE
+      assert (!c->collected);
+#endif
+      assert (c->size > 0);
+
+      other = c->lits[0];
+      if (other != this)
+	{
+	  assert (c->size != 1);
+	  c->lits[0] = this;
+	  c->lits[1] = other;
+	  next = c->next[1];
+	  c->next[1] = c->next[0];
+	  c->next[0] = next;
+	}
+      else if (c->size == 1)	/* With assumptions we need to
+	                         * traverse unit clauses as well.
+			         */
+	{
+	  assert (!ps->conflict);
+	  ps->conflict = c;
+	  break;
+	}
+      else
+	{
+	  assert (other == this && c->size > 1);
+	  other = c->lits[1];
+	  next = c->next[0];
+	}
+      assert (other == c->lits[1]);
+      assert (this == c->lits[0]);
+      assert (next == c->next[0]);
+      assert (!c->collect);
+
+      if (other->val == TRUE)
+	{
+#ifdef STATS
+	  ps->othertrue++;
+	  ps->othertruel++;
+#endif
+#ifndef NDSC
+	  if (should_disconnect_head_tail (ps, other))
+	    {
+	      new_htp_ptr = LIT2DHTPS (other);
+	      c->next[0] = *new_htp_ptr;
+	      *new_htp_ptr = c;
+#ifdef STATS
+	      ps->othertruelu++;
+#endif
+	      *htp_ptr = next;
+	      continue;
+	    }
+#endif
+	  htp_ptr = c->next;
+	  continue;
+	}
+
+      l = c->lits + 1;
+      eol = (Lit**) c->lits + c->size;
+      prev = this;
+
+      while (++l != eol)
+	{
+#ifdef STATS
+	  if (size >= 3)
+	    {
+	      ps->traversals++;
+	      if (size > 3)
+		ps->ltraversals++;
+	    }
+#endif
+	  new_lit = *l;
+	  *l = prev;
+	  prev = new_lit;
+	  if (new_lit->val != FALSE) break;
+	}
+
+      if (l == eol)
+	{
+	  while (l > c->lits + 2)
+	    {
+	      new_lit = *--l;
+	      *l = prev;
+	      prev = new_lit;
+	    }
+	  assert (c->lits[0] == this);
+
+	  assert (other == c->lits[1]);
+	  if (other->val == FALSE)	/* found conflict */
+	    {
+	      assert (!ps->conflict);
+	      ps->conflict = c;
+	      return;
+	    }
+
+	  assign_forced (ps, other, c);		/* unit clause */
+	  htp_ptr = c->next;
+	}
+      else
+	{
+	  assert (new_lit->val == TRUE || new_lit->val == UNDEF);
+	  c->lits[0] = new_lit;
+	  // *l = this;
+	  new_htp_ptr = LIT2HTPS (new_lit);
+	  c->next[0] = *new_htp_ptr;
+	  *new_htp_ptr = c;
+	  *htp_ptr = next;
+	}
+    }
+}
+
+#ifndef NADC
+
+static unsigned primes[] = { 996293, 330643, 753947, 500873 };
+
+#define PRIMES ((sizeof primes)/sizeof *primes)
+
+static unsigned
+hash_ado (PS * ps, Lit ** ado, unsigned salt)
+{
+  unsigned i, res, tmp;
+  Lit ** p, * lit;
+
+  assert (salt < PRIMES);
+
+  i = salt;
+  res = 0;
+
+  for (p = ado; (lit = *p); p++)
+    {
+      assert (lit->val);
+
+      tmp = res >> 31;
+      res <<= 1;
+
+      if (lit->val > 0)
+	res |= 1;
+
+      assert (i < PRIMES);
+      res *= primes[i++];
+      if (i == PRIMES)
+	i = 0;
+
+      res += tmp;
+    }
+
+  return res & (ps->szadotab - 1);
+}
+
+static unsigned
+cmp_ado (Lit ** a, Lit ** b)
+{
+  Lit ** p, ** q, * l, * k;
+  int res;
+
+  for (p = a, q = b; (l = *p); p++, q++)
+    {
+      k = *q;
+      assert (k);
+      if ((res = (l->val - k->val)))
+	return res;
+    }
+
+  assert (!*q);
+
+  return 0;
+}
+
+static Lit ***
+find_ado (PS * ps, Lit ** ado)
+{
+  Lit *** res, ** other;
+  unsigned pos, delta;
+
+  pos = hash_ado (ps, ado, 0);
+  assert (pos < ps->szadotab);
+  res = ps->adotab + pos;
+
+  other = *res;
+  if (!other || !cmp_ado (other, ado))
+    return res;
+
+  delta = hash_ado (ps, ado, 1);
+  if (!(delta & 1))
+    delta++;
+
+  assert (delta & 1);
+  assert (delta < ps->szadotab);
+
+  for (;;)
+    {
+      pos += delta;
+      if (pos >= ps->szadotab)
+	pos -= ps->szadotab;
+
+      assert (pos < ps->szadotab);
+      res = ps->adotab + pos;
+      other = *res;
+      if (!other || !cmp_ado (other, ado))
+	return res;
+    }
+}
+
+static void
+enlarge_adotab (PS * ps)
+{
+  /* TODO make this generic */
+
+  ABORTIF (ps->szadotab,
+           "internal: all different objects table needs larger initial size");
+  assert (!ps->nadotab);
+  ps->szadotab = 10000;
+  NEWN (ps->adotab, ps->szadotab);
+  CLRN (ps->adotab, ps->szadotab);
+}
+
+static int
+propado (PS * ps, Var * v)
+{
+  Lit ** p, ** q, *** adotabpos, **ado, * lit;
+  Var * u;
+
+  if (ps->LEVEL && ps->adodisabled)
+    return 1;
+
+  assert (!ps->conflict);
+  assert (!ps->adoconflict);
+  assert (VAR2LIT (v)->val != UNDEF);
+  assert (!v->adotabpos);
+
+  if (!v->ado)
+    return 1;
+
+  assert (v->inado);
+
+  for (p = v->ado; (lit = *p); p++)
+    if (lit->val == UNDEF)
+      {
+	u = LIT2VAR (lit);
+	assert (!u->ado);
+	u->ado = v->ado;
+	v->ado = 0;
+
+	return 1;
+      }
+
+  if (4 * ps->nadotab >= 3 * ps->szadotab)	/* at least 75% filled */
+    enlarge_adotab (ps);
+
+  adotabpos = find_ado (ps, v->ado);
+  ado = *adotabpos;
+
+  if (!ado)
+    {
+      ps->nadotab++;
+      v->adotabpos = adotabpos;
+      *adotabpos = v->ado;
+      return 1;
+    }
+
+  assert (ado != v->ado);
+
+  ps->adoconflict = new_clause (ps, 2 * llength (ado), 1);
+  q = ps->adoconflict->lits;
+
+  for (p = ado; (lit = *p); p++)
+    *q++ = lit->val == FALSE ? lit : NOTLIT (lit);
+
+  for (p = v->ado; (lit = *p); p++)
+    *q++ = lit->val == FALSE ? lit : NOTLIT (lit);
+
+  assert (q == ENDOFCLS (ps->adoconflict));
+  ps->conflict = ps->adoconflict;
+  ps->adoconflicts++;
+  return 0;
+}
+
+#endif
+
+static void
+bcp (PS * ps)
+{
+  int props = 0;
+  assert (!ps->conflict);
+
+  if (ps->mtcls)
+    return;
+
+  for (;;)
+    {
+      if (ps->ttail2 < ps->thead)	/* prioritize implications */
+	{
+	  props++;
+	  prop2 (ps, NOTLIT (*ps->ttail2++));
+	}
+      else if (ps->ttail < ps->thead)	/* unit clauses or clauses with length > 2 */
+	{
+	  if (ps->conflict) break;
+	  propl (ps, NOTLIT (*ps->ttail++));
+	  if (ps->conflict) break;
+	}
+#ifndef NADC
+      else if (ps->ttailado < ps->thead)
+	{
+	  if (ps->conflict) break;
+	  propado (ps, LIT2VAR (*ps->ttailado++));
+	  if (ps->conflict) break;
+	}
+#endif
+      else
+	break;		/* all assignments propagated, so break */
+    }
+
+  ps->propagations += props;
+}
+
+static unsigned
+drive (PS * ps)
+{
+  unsigned res, vlevel;
+  Lit **p;
+  Var *v;
+
+  res = 0;
+  for (p = ps->added; p < ps->ahead; p++)
+    {
+      v = LIT2VAR (*p);
+      vlevel = v->level;
+      assert (vlevel <= ps->LEVEL);
+      if (vlevel < ps->LEVEL && vlevel > res)
+	res = vlevel;
+    }
+
+  return res;
+}
+
+#ifdef VISCORES
+
+static void
+viscores (PS * ps)
+{
+  Rnk *p, *eor = ps->rnks + ps->max_var;
+  char name[100], cmd[200];
+  FILE * data;
+  Flt s;
+  int i;
+
+  for (p = ps->rnks + 1; p <= ps->eor; p++)
+    {
+      s = p->score;
+      if (s == INFFLT)
+	continue;
+      s = mulflt (s, ps->nvinc);
+      assert (flt2double (s) <= 1.0);
+    }
+
+  sprintf (name, "/tmp/picosat-viscores/data/%08u", ps->conflicts);
+  sprintf (cmd, "sort -n|nl>%s", name);
+
+  data = popen (cmd, "w");
+  for (p = ps->rnks + 1; p <= ps->eor; p++)
+    {
+      s = p->score;
+      if (s == INFFLT)
+	continue;
+      s = mulflt (s, ps->nvinc);
+      fprintf (data, "%lf %d\n", 100.0 * flt2double (s), (int)(p - ps->rnks));
+    }
+  fflush (data);
+  pclose (data);
+
+  for (i = 0; i < 8; i++)
+    {
+      sprintf (cmd, "awk '$3%%8==%d' %s>%s.%d", i, name, name, i);
+      system (cmd);
+    }
+
+  fprintf (ps->fviscores, "set title \"%u\"\n", ps->conflicts);
+  fprintf (ps->fviscores, "plot [0:%u] 0, 100 * (1 - 1/1.1), 100", ps->max_var);
+
+  for (i = 0; i < 8; i++)
+    fprintf (ps->fviscores,
+             ", \"%s.%d\" using 1:2:3 with labels tc lt %d",
+	     name, i, i + 1);
+
+  fputc ('\n', ps->fviscores);
+  fflush (ps->fviscores);
+#ifndef WRITEGIF
+  usleep (50000);		/* refresh rate of 20 Hz */
+#endif
+}
+
+#endif
+
+static void
+crescore (PS * ps)
+{
+  Cls **p, *c;
+  Act *a;
+  Flt factor;
+  int l = log2flt (ps->cinc);
+  assert (l > 0);
+  factor = base2flt (1, -l);
+
+  for (p = ps->lclauses; p != ps->lhead; p++)
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
+      assert (c->learned);
+
+      if (c->size <= 2)
+	continue;
+
+      a = CLS2ACT (c);
+      *a = mulflt (*a, factor);
+    }
+
+  ps->cinc = mulflt (ps->cinc, factor);
+}
+
+static void
+inc_vinc (PS * ps)
+{
+#ifdef VISCORES
+  ps->nvinc = mulflt (ps->nvinc, ps->fvinc);
+#endif
+  ps->vinc = mulflt (ps->vinc, ps->ifvinc);
+}
+
+inline static void
+inc_max_var (PS * ps)
+{
+  Lit *lit;
+  Rnk *r;
+  Var *v;
+
+  assert (ps->max_var < ps->size_vars);
+
+  if (ps->max_var + 1 == ps->size_vars)
+    enlarge (ps, ps->size_vars + 2*(ps->size_vars + 3) / 4); /* +25% */
+
+  ps->max_var++;			/* new index of variable */
+  assert (ps->max_var);			/* no unsigned overflow */
+
+  assert (ps->max_var < ps->size_vars);
+
+  lit = ps->lits + 2 * ps->max_var;
+  lit[0].val = lit[1].val = UNDEF;
+
+  memset (ps->htps + 2 * ps->max_var, 0, 2 * sizeof *ps->htps);
+#ifndef NDSC
+  memset (ps->dhtps + 2 * ps->max_var, 0, 2 * sizeof *ps->dhtps);
+#endif
+  memset (ps->impls + 2 * ps->max_var, 0, 2 * sizeof *ps->impls);
+  memset (ps->jwh + 2 * ps->max_var, 0, 2 * sizeof *ps->jwh);
+
+  v = ps->vars + ps->max_var;		/* initialize variable components */
+  CLR (v);
+
+  r = ps->rnks + ps->max_var;		/* initialize rank */
+  CLR (r);
+
+  hpush (ps, r);
+}
+
+static void
+force (PS * ps, Cls * c)
+{
+  Lit ** p, ** eol, * lit, * forced;
+  Cls * reason;
+
+  forced = 0;
+  reason = c;
+
+  eol = end_of_lits (c);
+  for (p = c->lits; p < eol; p++)
+    {
+      lit = *p;
+      if (lit->val == UNDEF)
+	{
+	  assert (!forced);
+	  forced = lit;
+#ifdef NO_BINARY_CLAUSES
+	  if (c == &ps->impl)
+	    reason = LIT2REASON (NOTLIT (p[p == c->lits ? 1 : -1]));
+#endif
+	}
+      else
+	assert (lit->val == FALSE);
+    }
+
+#ifdef NO_BINARY_CLAUSES
+  if (c == &ps->impl)
+    resetimpl (ps);
+#endif
+  if (!forced)
+    return;
+
+  assign_forced (ps, forced, reason);
+}
+
+static void
+inc_lreduce (PS * ps)
+{
+#ifdef STATS
+  ps->inclreduces++;
+#endif
+  ps->lreduce *= FREDUCE;
+  ps->lreduce /= 100;
+  report (ps, 1, '+');
+}
+
+static void
+backtrack (PS * ps)
+{
+  unsigned new_level;
+  Cls * c;
+
+  ps->conflicts++;
+  LOG ( fprintf (ps->out, "%sconflict ", ps->prefix); dumpclsnl (ps, ps->conflict));
+
+  analyze (ps);
+  new_level = drive (ps);
+  // TODO: why not? assert (new_level != 1  || (ps->ahead - ps->added) == 2);
+  c = add_simplified_clause (ps, 1);
+  undo (ps, new_level);
+  force (ps, c);
+
+  if (
+#ifndef NFL
+      !ps->simplifying &&
+#endif
+      !--ps->lreduceadjustcnt)
+    {
+      /* With FREDUCE==110 and FREDADJ=121 we stir 'lreduce' to be
+       * proportional to 'sqrt(conflicts)'.  In earlier version we actually
+       * used  'FREDADJ=150', which results in 'lreduce' to approximate
+       * 'conflicts^(log(1.1)/log(1.5))' which is close to the fourth root
+       * of 'conflicts', since log(1.1)/log(1.5)=0.235 (as observed by
+       * Donald Knuth). The square root is the same we get by a Glucose
+       * style increase, which simply adds a constant at every reduction.
+       * This would be way simpler to implement but for now we keep the more
+       * complicated code using the adjust increments and counters.
+       */
+      ps->lreduceadjustinc *= FREDADJ; ps->lreduceadjustinc /= 100; ps->lreduceadjustcnt
+      = ps->lreduceadjustinc;
+      inc_lreduce (ps);
+    }
+
+  if (ps->verbosity >= 4 && !(ps->conflicts % 1000))
+    report (ps, 4, 'C');
+}
+
+static void
+inc_cinc (PS * ps)
+{
+  ps->cinc = mulflt (ps->cinc, ps->fcinc);
+  if (ps->lcinc < ps->cinc)
+    crescore (ps);
+}
+
+static void
+incincs (PS * ps)
+{
+  inc_vinc (ps);
+  inc_cinc (ps);
+#ifdef VISCORES
+  viscores (ps);
+#endif
+}
+
+static void
+disconnect_clause (PS * ps, Cls * c)
+{
+  assert (c->connected);
+
+  if (c->size > 2)
+    {
+      if (c->learned)
+	{
+	  assert (ps->nlclauses > 0);
+	  ps->nlclauses--;
+
+	  assert (ps->llits >= c->size);
+	  ps->llits -= c->size;
+	}
+      else
+	{
+	  assert (ps->noclauses > 0);
+	  ps->noclauses--;
+
+	  assert (ps->olits >= c->size);
+	  ps->olits -= c->size;
+	}
+    }
+
+#ifndef NDEBUG
+  c->connected = 0;
+#endif
+}
+
+static int
+clause_is_toplevel_satisfied (PS * ps, Cls * c)
+{
+  Lit *lit, **p, **eol = end_of_lits (c);
+  Var *v;
+
+  for (p = c->lits; p < eol; p++)
+    {
+      lit = *p;
+      if (lit->val == TRUE)
+	{
+	  v = LIT2VAR (lit);
+	  if (!v->level)
+	    return 1;
+	}
+    }
+
+  return 0;
+}
+
+static int
+collect_clause (PS * ps, Cls * c)
+{
+  assert (c->collect);
+  c->collect = 0;
+
+#ifdef TRACE
+  assert (!c->collected);
+  c->collected = 1;
+#endif
+  disconnect_clause (ps, c);
+
+#ifdef TRACE
+  if (ps->trace && (!c->learned || c->used))
+    return 0;
+#endif
+  delete_clause (ps, c);
+
+  return 1;
+}
+
+static size_t
+collect_clauses (PS * ps)
+{
+  Cls *c, **p, **q, * next;
+  Lit * lit, * eol;
+  size_t res;
+  int i;
+
+  res = ps->current_bytes;
+
+  eol = ps->lits + 2 * ps->max_var + 1;
+  for (lit = ps->lits + 2; lit <= eol; lit++)
+    {
+      for (i = 0; i <= 1; i++)
+	{
+	  if (i)
+	    {
+#ifdef NO_BINARY_CLAUSES
+	      Ltk * lstk = LIT2IMPLS (lit);
+	      Lit ** r, ** s;
+	      r = lstk->start;
+	      if (lit->val != TRUE || LIT2VAR (lit)->level)
+		for (s = r; s < lstk->start + lstk->count; s++)
+		  {
+		    Lit * other = *s;
+		    Var *v = LIT2VAR (other);
+		    if (v->level ||
+		        other->val != TRUE)
+		      *r++ = other;
+		  }
+	      lstk->count = r - lstk->start;
+	      continue;
+#else
+	      p = LIT2IMPLS (lit);
+#endif
+	    }
+	  else
+	    p = LIT2HTPS (lit);
+
+	  for (c = *p; c; c = next)
+	    {
+	      q = c->next;
+	      if (c->lits[0] != lit)
+		q++;
+
+	      next = *q;
+	      if (c->collect)
+		*p = next;
+	      else
+		p = q;
+	    }
+	}
+    }
+
+#ifndef NDSC
+  for (lit = ps->lits + 2; lit <= eol; lit++)
+    {
+      p = LIT2DHTPS (lit);
+      while ((c = *p))
+	{
+	  Lit * other = c->lits[0];
+	  if (other == lit)
+	    {
+	      q = c->next + 1;
+	    }
+	  else
+	    {
+	      assert (c->lits[1] == lit);
+	      q = c->next;
+	    }
+
+	  if (c->collect)
+	    *p = *q;
+	  else
+	    p = q;
+	}
+    }
+#endif
+
+  for (p = SOC; p != EOC; p = NXC (p))
+    {
+      c = *p;
+
+      if (!c)
+	continue;
+
+      if (!c->collect)
+	continue;
+
+      if (collect_clause (ps, c))
+	*p = 0;
+    }
+
+#ifdef TRACE
+  if (!ps->trace)
+#endif
+    {
+      q = ps->oclauses;
+      for (p = q; p < ps->ohead; p++)
+	if ((c = *p))
+	  *q++ = c;
+      ps->ohead = q;
+
+      q = ps->lclauses;
+      for (p = q; p < ps->lhead; p++)
+	if ((c = *p))
+	  *q++ = c;
+      ps->lhead = q;
+    }
+
+  assert (ps->current_bytes <= res);
+  res -= ps->current_bytes;
+  ps->recycled += res;
+
+  LOG ( fprintf (ps->out, "%scollected %ld bytes\n", ps->prefix, (long)res));
+
+  return res;
+}
+
+static int
+need_to_reduce (PS * ps)
+{
+  return ps->nlclauses >= reduce_limit_on_lclauses (ps);
+}
+
+#ifdef NLUBY
+
+static void
+inc_drestart (PS * ps)
+{
+  ps->drestart *= FRESTART;
+  ps->drestart /= 100;
+
+  if (ps->drestart >= MAXRESTART)
+    ps->drestart = MAXRESTART;
+}
+
+static void
+inc_ddrestart (PS * ps)
+{
+  ps->ddrestart *= FRESTART;
+  ps->ddrestart /= 100;
+
+  if (ps->ddrestart >= MAXRESTART)
+    ps->ddrestart = MAXRESTART;
+}
+
+#else
+
+static unsigned
+luby (unsigned i)
+{
+  unsigned k;
+  for (k = 1; k < 32; k++)
+    if (i == (1u << k) - 1)
+      return 1u << (k - 1);
+
+  for (k = 1;; k++)
+    if ((1u << (k - 1)) <= i && i < (1u << k) - 1)
+      return luby (i - (1u << (k-1)) + 1);
+}
+
+#endif
+
+#ifndef NLUBY
+static void
+inc_lrestart (PS * ps, int skip)
+{
+  unsigned delta;
+
+  delta = 100 * luby (++ps->lubycnt);
+  ps->lrestart = ps->conflicts + delta;
+
+  if (ps->waslubymaxdelta)
+    report (ps, 1, skip ? 'N' : 'R');
+  else
+    report (ps, 2, skip ? 'n' : 'r');
+
+  if (delta > ps->lubymaxdelta)
+    {
+      ps->lubymaxdelta = delta;
+      ps->waslubymaxdelta = 1;
+    }
+  else
+    ps->waslubymaxdelta = 0;
+}
+#endif
+
+static void
+init_restart (PS * ps)
+{
+#ifdef NLUBY
+  /* TODO: why is it better in incremental usage to have smaller initial
+   * outer restart interval?
+   */
+  ps->ddrestart = ps->calls > 1 ? MINRESTART : 1000;
+  ps->drestart = MINRESTART;
+  ps->lrestart = ps->conflicts + ps->drestart;
+#else
+  ps->lubycnt = 0;
+  ps->lubymaxdelta = 0;
+  ps->waslubymaxdelta = 0;
+  inc_lrestart (ps, 0);
+#endif
+}
+
+static void
+restart (PS * ps)
+{
+  int skip;
+#ifdef NLUBY
+  char kind;
+  int outer;
+
+  inc_drestart (ps);
+  outer = (ps->drestart >= ps->ddrestart);
+
+  if (outer)
+    skip = very_high_agility (ps);
+  else
+    skip = high_agility (ps);
+#else
+  skip = medium_agility (ps);
+#endif
+
+#ifdef STATS
+  if (skip)
+    ps->skippedrestarts++;
+#endif
+
+  assert (ps->conflicts >= ps->lrestart);
+
+  if (!skip)
+    {
+      ps->restarts++;
+      assert (ps->LEVEL > 1);
+      LOG ( fprintf (ps->out, "%srestart %u\n", ps->prefix, ps->restarts));
+      undo (ps, 0);
+    }
+
+#ifdef NLUBY
+  if (outer)
+    {
+      kind = skip ? 'N' : 'R';
+      inc_ddrestart (ps);
+      ps->drestart = MINRESTART;
+    }
+  else  if (skip)
+    {
+      kind = 'n';
+    }
+  else
+    {
+      kind = 'r';
+    }
+
+  assert (ps->drestart <= MAXRESTART);
+  ps->lrestart = ps->conflicts + ps->drestart;
+  assert (ps->lrestart > ps->conflicts);
+
+  report (outer ? 1 : 2, kind);
+#else
+  inc_lrestart (ps, skip);
+#endif
+}
+
+inline static void
+assign_decision (PS * ps, Lit * lit)
+{
+  assert (!ps->conflict);
+
+  ps->LEVEL++;
+
+  LOG ( fprintf (ps->out, "%snew level %u\n", ps->prefix, ps->LEVEL));
+  LOG ( fprintf (ps->out,
+		 "%sassign %d at level %d <= DECISION\n",
+		 ps->prefix, LIT2INT (lit), ps->LEVEL));
+
+  assign (ps, lit, 0);
+}
+
+#ifndef NFL
+
+static int
+lit_has_binary_clauses (PS * ps, Lit * lit)
+{
+#ifdef NO_BINARY_CLAUSES
+  Ltk* lstk = LIT2IMPLS (lit);
+  return lstk->count != 0;
+#else
+  return *LIT2IMPLS (lit) != 0;
+#endif
+}
+
+static void
+flbcp (PS * ps)
+{
+#ifdef STATS
+  unsigned long long propagaions_before_bcp = ps->propagations;
+#endif
+  bcp (ps);
+#ifdef STATS
+  ps->flprops += ps->propagations - propagaions_before_bcp;
+#endif
+}
+
+inline static int
+cmp_inverse_rnk (PS * ps, Rnk * a, Rnk * b)
+{
+  (void) ps;
+  return -cmp_rnk (a, b);
+}
+
+inline static Flt
+rnk2jwh (PS * ps, Rnk * r)
+{
+  Flt res, sum, pjwh, njwh;
+  Lit * plit, * nlit;
+
+  plit = RNK2LIT (r);
+  nlit = plit + 1;
+
+  pjwh = *LIT2JWH (plit);
+  njwh = *LIT2JWH (nlit);
+
+  res = mulflt (pjwh, njwh);
+
+  sum = addflt (pjwh, njwh);
+  sum = mulflt (sum, base2flt (1, -10));
+  res = addflt (res, sum);
+
+  return res;
+}
+
+static int
+cmp_inverse_jwh_rnk (PS * ps, Rnk * r, Rnk * s)
+{
+  Flt a = rnk2jwh (ps, r);
+  Flt b = rnk2jwh (ps, s);
+  int res = cmpflt (a, b);
+
+  if (res)
+    return -res;
+
+  return cmp_inverse_rnk (ps, r, s);
+}
+
+static void
+faillits (PS * ps)
+{
+  unsigned i, j, old_trail_count, common, saved_count;
+  unsigned new_saved_size, oldladded = ps->ladded;
+  unsigned long long limit, delta;
+  Lit * lit, * other, * pivot;
+  Rnk * r, ** p, ** q;
+  int new_trail_count;
+  double started;
+
+  if (ps->plain)
+    return;
+
+  if (ps->heap + 1 >= ps->hhead)
+    return;
+
+  if (ps->propagations < ps->fllimit)
+    return;
+
+  sflush (ps);
+  started = ps->seconds;
+
+  ps->flcalls++;
+#ifdef STATSA
+  ps->flrounds++;
+#endif
+  delta = ps->propagations/10;
+  if (delta >= 100*1000*1000) delta = 100*1000*1000;
+  else if (delta <= 100*1000) delta = 100*1000;
+
+  limit = ps->propagations + delta;
+  ps->fllimit = ps->propagations;
+
+  assert (!ps->LEVEL);
+  assert (ps->simplifying);
+
+  if (ps->flcalls <= 1)
+    SORT (Rnk *, cmp_inverse_jwh_rnk, ps->heap + 1, ps->hhead - (ps->heap + 1));
+  else
+    SORT (Rnk *, cmp_inverse_rnk, ps->heap + 1, ps->hhead - (ps->heap + 1));
+
+  i = 1;		/* NOTE: heap starts at position '1' */
+
+  while (ps->propagations < limit)
+    {
+      if (ps->heap + i == ps->hhead)
+	{
+	  if (ps->ladded == oldladded)
+	    break;
+
+	  i = 1;
+#ifdef STATS
+	  ps->flrounds++;
+#endif
+	  oldladded = ps->ladded;
+	}
+
+      assert (ps->heap + i < ps->hhead);
+
+      r = ps->heap[i++];
+      lit = RNK2LIT (r);
+
+      if (lit->val)
+	continue;
+
+      if (!lit_has_binary_clauses (ps, NOTLIT (lit)))
+	{
+#ifdef STATS
+	  ps->flskipped++;
+#endif
+	  continue;
+	}
+
+#ifdef STATS
+      ps->fltried++;
+#endif
+      LOG ( fprintf (ps->out, "%strying %d as failed literal\n",
+	    ps->prefix, LIT2INT (lit)));
+
+      assign_decision (ps, lit);
+      old_trail_count = ps->thead - ps->trail;
+      flbcp (ps);
+
+      if (ps->conflict)
+	{
+EXPLICITLY_FAILED_LITERAL:
+	  LOG ( fprintf (ps->out, "%sfound explicitly failed literal %d\n",
+		ps->prefix, LIT2INT (lit)));
+
+	  ps->failedlits++;
+	  ps->efailedlits++;
+
+	  backtrack (ps);
+	  flbcp (ps);
+
+	  if (!ps->conflict)
+	    continue;
+
+CONTRADICTION:
+	  assert (!ps->LEVEL);
+	  backtrack (ps);
+	  assert (ps->mtcls);
+
+	  goto RETURN;
+	}
+
+      if (ps->propagations >= limit)
+	{
+	  undo (ps, 0);
+	  break;
+	}
+
+      lit = NOTLIT (lit);
+
+      if (!lit_has_binary_clauses (ps, NOTLIT (lit)))
+	{
+#ifdef STATS
+	  ps->flskipped++;
+#endif
+	  undo (ps, 0);
+	  continue;
+	}
+
+#ifdef STATS
+      ps->fltried++;
+#endif
+      LOG ( fprintf (ps->out, "%strying %d as failed literals\n",
+	    ps->prefix, LIT2INT (lit)));
+
+      new_trail_count = ps->thead - ps->trail;
+      saved_count = new_trail_count - old_trail_count;
+
+      if (saved_count > ps->saved_size)
+	{
+	  new_saved_size = ps->saved_size ? 2 * ps->saved_size : 1;
+	  while (saved_count > new_saved_size)
+	    new_saved_size *= 2;
+
+	  RESIZEN (ps->saved, ps->saved_size, new_saved_size);
+	  ps->saved_size = new_saved_size;
+	}
+
+      for (j = 0; j < saved_count; j++)
+	ps->saved[j] = ps->trail[old_trail_count + j];
+
+      undo (ps, 0);
+
+      assign_decision (ps, lit);
+      flbcp (ps);
+
+      if (ps->conflict)
+	goto EXPLICITLY_FAILED_LITERAL;
+
+      pivot = (ps->thead - ps->trail <= new_trail_count) ? lit : NOTLIT (lit);
+
+      common = 0;
+      for (j = 0; j < saved_count; j++)
+	if ((other = ps->saved[j])->val == TRUE)
+	  ps->saved[common++] = other;
+
+      undo (ps, 0);
+
+      LOG (if (common)
+	     fprintf (ps->out,
+		      "%sfound %d literals implied by %d and %d\n",
+		      ps->prefix, common,
+		      LIT2INT (NOTLIT (lit)), LIT2INT (lit)));
+
+#if 1 // set to zero to disable 'lifting'
+      for (j = 0;
+	   j < common
+	  /* TODO: For some Velev benchmarks, extracting the common implicit
+	   * failed literals took quite some time.  This needs to be fixed by
+	   * a dedicated analyzer.  Up to then we bound the number of
+	   * propagations in this loop as well.
+	   */
+	   && ps->propagations < limit + delta
+	   ; j++)
+	{
+	  other = ps->saved[j];
+
+	  if (other->val == TRUE)
+	    continue;
+
+	  assert (!other->val);
+
+	  LOG ( fprintf (ps->out,
+			"%sforcing %d as forced implicitly failed literal\n",
+			ps->prefix, LIT2INT (other)));
+
+	  assert (pivot != NOTLIT (other));
+	  assert (pivot != other);
+
+	  assign_decision (ps, NOTLIT (other));
+	  flbcp (ps);
+
+	  assert (ps->LEVEL == 1);
+
+	  if (ps->conflict)
+	    {
+	      backtrack (ps);
+	      assert (!ps->LEVEL);
+	    }
+	  else
+	    {
+	      assign_decision (ps, pivot);
+	      flbcp (ps);
+
+	      backtrack (ps);
+
+	      if (ps->LEVEL)
+		{
+		  assert (ps->LEVEL == 1);
+
+		  flbcp (ps);
+
+		  if (ps->conflict)
+		    {
+		      backtrack (ps);
+		      assert (!ps->LEVEL);
+		    }
+		  else
+		    {
+		      assign_decision (ps, NOTLIT (pivot));
+		      flbcp (ps);
+		      backtrack (ps);
+
+		      if (ps->LEVEL)
+			{
+			  assert (ps->LEVEL == 1);
+			  flbcp (ps);
+
+			  if (!ps->conflict)
+			    {
+#ifdef STATS
+			      ps->floopsed++;
+#endif
+			      undo (ps, 0);
+			      continue;
+			    }
+
+			  backtrack (ps);
+			}
+
+		      assert (!ps->LEVEL);
+		    }
+
+		  assert (!ps->LEVEL);
+		}
+	    }
+	  assert (!ps->LEVEL);
+	  flbcp (ps);
+
+	  ps->failedlits++;
+	  ps->ifailedlits++;
+
+	  if (ps->conflict)
+	    goto CONTRADICTION;
+	}
+#endif
+    }
+
+  ps->fllimit += 9 * (ps->propagations - ps->fllimit);	/* 10% for failed literals */
+
+RETURN:
+
+  /* First flush top level assigned literals.  Those are prohibited from
+   * being pushed up the heap during 'faillits' since 'simplifying' is set.
+   */
+  assert (ps->heap < ps->hhead);
+  for (p = q = ps->heap + 1; p < ps->hhead; p++)
+    {
+      r = *p;
+      lit = RNK2LIT (r);
+      if (lit->val)
+        r->pos = 0;
+      else
+	*q++ = r;
+    }
+
+  /* Then resort with respect to EVSIDS score and fix positions.
+   */
+  SORT (Rnk *, cmp_inverse_rnk, ps->heap + 1, ps->hhead - (ps->heap + 1));
+  for (p = ps->heap + 1; p < ps->hhead; p++)
+    (*p)->pos = p - ps->heap;
+
+  sflush (ps);
+  ps->flseconds += ps->seconds - started;
+}
+
+#endif
+
+static void
+simplify (PS * ps, int forced)
+{
+  Lit * lit, * notlit, ** t;
+  unsigned collect, delta;
+#ifdef STATS
+  size_t bytes_collected;
+#endif
+  int * q, ilit;
+  Cls **p, *c;
+  Var * v;
+
+#ifndef NDEDBUG
+  (void) forced;
+#endif
+
+  assert (!ps->mtcls);
+  assert (!satisfied (ps));
+  assert (forced || ps->lsimplify <= ps->propagations);
+  assert (forced || ps->fsimplify <= ps->fixed);
+
+  if (ps->LEVEL)
+    undo (ps, 0);
+#ifndef NFL
+  ps->simplifying = 1;
+  faillits (ps);
+  ps->simplifying = 0;
+
+  if (ps->mtcls)
+    return;
+#endif
+
+  if (ps->cils != ps->cilshead)
+    {
+      assert (ps->ttail == ps->thead);
+      assert (ps->ttail2 == ps->thead);
+      ps->ttail = ps->trail;
+      for (t = ps->trail; t < ps->thead; t++)
+	{
+	  lit = *t;
+	  v = LIT2VAR (lit);
+	  if (v->internal)
+	    {
+	      assert (LIT2INT (lit) < 0);
+	      assert (lit->val == TRUE);
+	      unassign (ps, lit);
+	    }
+	  else
+	    *ps->ttail++ = lit;
+	}
+      ps->ttail2 = ps->thead = ps->ttail;
+
+      for (q = ps->cils; q != ps->cilshead; q++)
+	{
+	  ilit = *q;
+	  assert (0 < ilit && ilit <= (int) ps->max_var);
+	  v = ps->vars + ilit;
+	  assert (v->internal);
+	  v->level = 0;
+	  v->reason = 0;
+	  lit = int2lit (ps, -ilit);
+	  assert (lit->val == UNDEF);
+	  lit->val = TRUE;
+	  notlit = NOTLIT (lit);
+	  assert (notlit->val == UNDEF);
+	  notlit->val = FALSE;
+	}
+    }
+
+  collect = 0;
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
+      if (c->locked)
+	continue;
+
+      assert (!c->collect);
+      if (clause_is_toplevel_satisfied (ps, c))
+	{
+	  mark_clause_to_be_collected (c);
+	  collect++;
+	}
+    }
+
+  LOG ( fprintf (ps->out, "%scollecting %d clauses\n", ps->prefix, collect));
+#ifdef STATS
+  bytes_collected =
+#endif
+  collect_clauses (ps);
+#ifdef STATS
+  ps->srecycled += bytes_collected;
+#endif
+
+  if (ps->cils != ps->cilshead)
+    {
+      for (q = ps->cils; q != ps->cilshead; q++)
+	{
+	  ilit = *q;
+	  assert (0 < ilit && ilit <= (int) ps->max_var);
+	  assert (ps->vars[ilit].internal);
+	  if (ps->rilshead == ps->eorils)
+	    ENLARGE (ps->rils, ps->rilshead, ps->eorils);
+	  *ps->rilshead++ = ilit;
+	  lit = int2lit (ps, -ilit);
+	  assert (lit->val == TRUE);
+	  lit->val = UNDEF;
+	  notlit = NOTLIT (lit);
+	  assert (notlit->val == FALSE);
+	  notlit->val = UNDEF;
+	}
+      ps->cilshead = ps->cils;
+    }
+
+  delta = 10 * (ps->olits + ps->llits) + 100000;
+  if (delta > 2000000)
+    delta = 2000000;
+  ps->lsimplify = ps->propagations + delta;
+  ps->fsimplify = ps->fixed;
+  ps->simps++;
+
+  report (ps, 1, 's');
+}
+
+static void
+iteration (PS * ps)
+{
+  assert (!ps->LEVEL);
+  assert (bcp_queue_is_empty (ps));
+  assert (ps->isimplify < ps->fixed);
+
+  ps->iterations++;
+  report (ps, 2, 'i');
+#ifdef NLUBY
+  ps->drestart = MINRESTART;
+  ps->lrestart = ps->conflicts + ps->drestart;
+#else
+  init_restart (ps);
+#endif
+  ps->isimplify = ps->fixed;
+}
+
+static int
+cmp_glue_activity_size (PS * ps, Cls * c, Cls * d)
+{
+  Act a, b, * p, * q;
+
+  (void) ps;
+
+  assert (c->learned);
+  assert (d->learned);
+
+  if (c->glue < d->glue)		// smaller glue preferred
+    return 1;
+
+  if (c->glue > d->glue)
+    return -1;
+
+  p = CLS2ACT (c);
+  q = CLS2ACT (d);
+  a = *p;
+  b = *q;
+
+  if (a < b)				// then higher activity
+    return -1;
+
+  if (b < a)
+    return 1;
+
+  if (c->size < d->size)		// then smaller size
+    return 1;
+
+  if (c->size > d->size)
+    return -1;
+
+  return 0;
+}
+
+static void
+reduce (PS * ps, unsigned percentage)
+{
+  unsigned redcount, lcollect, collect, target;
+#ifdef STATS
+  size_t bytes_collected;
+#endif
+  Cls **p, *c;
+
+  assert (ps->rhead == ps->resolved);
+
+  ps->lastreduceconflicts = ps->conflicts;
+
+  assert (percentage <= 100);
+  LOG ( fprintf (ps->out,
+                "%sreducing %u%% learned clauses\n",
+		ps->prefix, percentage));
+
+  while (ps->nlclauses - ps->llocked > (unsigned)(ps->eor - ps->resolved))
+    ENLARGE (ps->resolved, ps->rhead, ps->eor);
+
+  collect = 0;
+  lcollect = 0;
+
+  for (p = ((ps->fsimplify < ps->fixed) ? SOC : ps->lclauses); p != EOC; p = NXC (p))
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
+      if (c->locked)
+	continue;
+
+      assert (!c->collect);
+      if (ps->fsimplify < ps->fixed && clause_is_toplevel_satisfied (ps, c))
+	{
+	  mark_clause_to_be_collected (c);
+	  collect++;
+
+	  if (c->learned && c->size > 2)
+	    lcollect++;
+
+	  continue;
+	}
+
+      if (!c->learned)
+	continue;
+
+      if (c->size <= 2)
+	continue;
+
+      assert (ps->rhead < ps->eor);
+      *ps->rhead++ = c;
+    }
+  assert (ps->rhead <= ps->eor);
+
+  ps->fsimplify = ps->fixed;
+
+  redcount = ps->rhead - ps->resolved;
+  SORT (Cls *, cmp_glue_activity_size, ps->resolved, redcount);
+
+  assert (ps->nlclauses >= lcollect);
+  target = ps->nlclauses - lcollect + 1;
+
+  target = (percentage * target + 99) / 100;
+
+  if (target >= redcount)
+    target = redcount;
+
+  ps->rhead = ps->resolved + target;
+  while (ps->rhead > ps->resolved)
+    {
+      c = *--ps->rhead;
+      mark_clause_to_be_collected (c);
+
+      collect++;
+      if (c->learned && c->size > 2)	/* just for consistency */
+	lcollect++;
+    }
+
+  if (collect)
+    {
+      ps->reductions++;
+#ifdef STATS
+      bytes_collected =
+#endif
+      collect_clauses (ps);
+#ifdef STATS
+      ps->rrecycled += bytes_collected;
+#endif
+      report (ps, 2, '-');
+    }
+
+  if (!lcollect)
+    inc_lreduce (ps);		/* avoid dead lock */
+
+  assert (ps->rhead == ps->resolved);
+}
+
+static void
+init_reduce (PS * ps)
+{
+  // lreduce = loadded / 2;
+  ps->lreduce = 1000;
+
+  if (ps->lreduce < 100)
+    ps->lreduce = 100;
+
+  if (ps->verbosity)
+     fprintf (ps->out,
+             "%s\n%sinitial reduction limit %u clauses\n%s\n",
+	     ps->prefix, ps->prefix, ps->lreduce, ps->prefix);
+}
+
+static unsigned
+rng (PS * ps)
+{
+  unsigned res = ps->srng;
+  ps->srng *= 1664525u;
+  ps->srng += 1013904223u;
+  NOLOG ( fprintf (ps->out, "%srng () = %u\n", ps->prefix, res));
+  return res;
+}
+
+static unsigned
+rrng (PS * ps, unsigned low, unsigned high)
+{
+  unsigned long long tmp;
+  unsigned res, elements;
+  assert (low <= high);
+  elements = high - low + 1;
+  tmp = rng (ps);
+  tmp *= elements;
+  tmp >>= 32;
+  tmp += low;
+  res = tmp;
+  NOLOG ( fprintf (ps->out, "%srrng (ps, %u, %u) = %u\n", ps->prefix, low, high, res));
+  assert (low <= res);
+  assert (res <= high);
+  return res;
+}
+
+static Lit *
+decide_phase (PS * ps, Lit * lit)
+{
+  Lit * not_lit = NOTLIT (lit);
+  Var *v = LIT2VAR (lit);
+
+  assert (LIT2SGN (lit) > 0);
+  if (v->usedefphase)
+    {
+      if (v->defphase)
+	{
+	  /* assign to TRUE */
+	}
+      else
+	{
+	  /* assign to FALSE */
+	  lit = not_lit;
+	}
+    }
+  else if (!v->assigned)
+    {
+#ifdef STATS
+      ps->staticphasedecisions++;
+#endif
+      if (ps->defaultphase == POSPHASE)
+	{
+	  /* assign to TRUE */
+	}
+      else if (ps->defaultphase == NEGPHASE)
+	{
+	  /* assign to FALSE */
+	  lit = not_lit;
+	}
+      else if (ps->defaultphase == RNDPHASE)
+	{
+	  /* randomly assign default phase */
+	  if (rrng (ps, 1, 2) != 2)
+	    lit = not_lit;
+	}
+      else if (*LIT2JWH(lit) <= *LIT2JWH (not_lit))
+	{
+	  /* assign to FALSE (Jeroslow-Wang says there are more short
+	   * clauses with negative occurence of this variable, so satisfy
+	   * those, to minimize BCP)
+	   */
+	  lit = not_lit;
+	}
+      else
+	{
+	  /* assign to TRUE (... but strictly more positive occurrences) */
+	}
+    }
+  else
+    {
+      /* repeat last phase: phase saving heuristic */
+
+      if (v->phase)
+	{
+	  /* assign to TRUE (last phase was TRUE as well) */
+	}
+      else
+	{
+	  /* assign to FALSE (last phase was FALSE as well) */
+	  lit = not_lit;
+	}
+    }
+
+  return lit;
+}
+
+static unsigned
+gcd (unsigned a, unsigned b)
+{
+  unsigned tmp;
+
+  assert (a);
+  assert (b);
+
+  if (a < b)
+    {
+      tmp = a;
+      a = b;
+      b = tmp;
+    }
+
+  while (b)
+    {
+      assert (a >= b);
+      tmp = b;
+      b = a % b;
+      a = tmp;
+    }
+
+  return a;
+}
+
+static Lit *
+rdecide (PS * ps)
+{
+  unsigned idx, delta, spread;
+  Lit * res;
+
+  spread = RDECIDE;
+  if (rrng (ps, 1, spread) != 2)
+    return 0;
+
+  assert (1 <= ps->max_var);
+  idx = rrng (ps, 1, ps->max_var);
+  res = int2lit (ps, idx);
+
+  if (res->val != UNDEF)
+    {
+      delta = rrng (ps, 1, ps->max_var);
+      while (gcd (delta, ps->max_var) != 1)
+	delta--;
+
+      assert (1 <= delta);
+      assert (delta <= ps->max_var);
+
+      do {
+	idx += delta;
+	if (idx > ps->max_var)
+	  idx -= ps->max_var;
+	res = int2lit (ps, idx);
+      } while (res->val != UNDEF);
+    }
+
+#ifdef STATS
+  ps->rdecisions++;
+#endif
+  res = decide_phase (ps, res);
+  LOG ( fprintf (ps->out, "%srdecide %d\n", ps->prefix, LIT2INT (res)));
+
+  return res;
+}
+
+static Lit *
+sdecide (PS * ps)
+{
+  Lit *res;
+  Rnk *r;
+
+  for (;;)
+    {
+      r = htop (ps);
+      res = RNK2LIT (r);
+      if (res->val == UNDEF) break;
+      (void) hpop (ps);
+      NOLOG ( fprintf (ps->out,
+                      "%shpop %u %u %u\n",
+		      ps->prefix, r - ps->rnks,
+		      FLTMANTISSA(r->score),
+		      FLTEXPONENT(r->score)));
+    }
+
+#ifdef STATS
+  ps->sdecisions++;
+#endif
+  res = decide_phase (ps, res);
+
+  LOG ( fprintf (ps->out, "%ssdecide %d\n", ps->prefix, LIT2INT (res)));
+
+  return res;
+}
+
+static Lit *
+adecide (PS * ps)
+{
+  Lit *lit;
+  Var * v;
+
+  assert (ps->als < ps->alshead);
+  assert (!ps->failed_assumption);
+
+  while (ps->alstail < ps->alshead)
+    {
+      lit = *ps->alstail++;
+
+      if (lit->val == FALSE)
+	{
+	  ps->failed_assumption = lit;
+	  v = LIT2VAR (lit);
+
+	  use_var (ps, v);
+
+	  LOG ( fprintf (ps->out, "%sfirst failed assumption %d\n",
+			ps->prefix, LIT2INT (ps->failed_assumption)));
+	  fanalyze (ps);
+	  return 0;
+	}
+
+      if (lit->val == TRUE)
+	{
+	  v = LIT2VAR (lit);
+	  if (v->level > ps->adecidelevel)
+	    ps->adecidelevel = v->level;
+	  continue;
+	}
+
+#ifdef STATS
+      ps->assumptions++;
+#endif
+      LOG ( fprintf (ps->out, "%sadecide %d\n", ps->prefix, LIT2INT (lit)));
+      ps->adecidelevel = ps->LEVEL + 1;
+
+      return lit;
+    }
+
+  return 0;
+}
+
+static void
+decide (PS * ps)
+{
+  Lit * lit;
+
+  assert (!satisfied (ps));
+  assert (!ps->conflict);
+
+  if (ps->alstail < ps->alshead && (lit = adecide (ps)))
+    ;
+  else if (ps->failed_assumption)
+    return;
+  else if (satisfied (ps))
+    return;
+  else if (!(lit = rdecide (ps)))
+    lit = sdecide (ps);
+
+  assert (lit);
+  assign_decision (ps, lit);
+
+  ps->levelsum += ps->LEVEL;
+  ps->decisions++;
+}
+
+static int
+sat (PS * ps, int l)
+{
+  int count = 0, backtracked;
+
+  if (!ps->conflict)
+    bcp (ps);
+
+  if (ps->conflict)
+    backtrack (ps);
+
+  if (ps->mtcls)
+    return PICOSAT_UNSATISFIABLE;
+
+  if (satisfied (ps))
+    goto SATISFIED;
+
+  if (ps->lsimplify <= ps->propagations)
+    simplify (ps, 0);
+
+  if (ps->mtcls)
+    return PICOSAT_UNSATISFIABLE;
+
+  if (satisfied (ps))
+    goto SATISFIED;
+
+  init_restart (ps);
+
+  if (!ps->lreduce)
+    init_reduce (ps);
+
+  ps->isimplify = ps->fixed;
+  backtracked = 0;
+
+  for (;;)
+    {
+      if (!ps->conflict)
+	bcp (ps);
+
+      if (ps->conflict)
+	{
+	  incincs (ps);
+	  backtrack (ps);
+
+	  if (ps->mtcls)
+	    return PICOSAT_UNSATISFIABLE;
+	  backtracked = 1;
+	  continue;
+	}
+
+      if (satisfied (ps))
+	{
+SATISFIED:
+#ifndef NDEBUG
+	  original_clauses_satisfied (ps);
+	  assumptions_satisfied (ps);
+#endif
+	  return PICOSAT_SATISFIABLE;
+	}
+
+      if (backtracked)
+	{
+	  backtracked = 0;
+	  if (!ps->LEVEL && ps->isimplify < ps->fixed)
+	    iteration (ps);
+	}
+
+      if (l >= 0 && count >= l)		/* decision limit reached ? */
+	return PICOSAT_UNKNOWN;
+
+      if (ps->interrupt.function &&		/* external interrupt */
+	  count > 0 && !(count % INTERRUPTLIM) &&
+	  ps->interrupt.function (ps->interrupt.state))
+	return PICOSAT_UNKNOWN;
+
+      if (ps->propagations >= ps->lpropagations)/* propagation limit reached ? */
+	return PICOSAT_UNKNOWN;
+
+#ifndef NADC
+      if (!ps->adodisabled && ps->adoconflicts >= ps->adoconflictlimit)
+	{
+	  assert (bcp_queue_is_empty (ps));
+	  return PICOSAT_UNKNOWN;
+	}
+#endif
+
+      if (ps->fsimplify < ps->fixed && ps->lsimplify <= ps->propagations)
+	{
+	  simplify (ps, 0);
+	  if (!bcp_queue_is_empty (ps))
+	    continue;
+#ifndef NFL
+	  if (ps->mtcls)
+	    return PICOSAT_UNSATISFIABLE;
+
+	  if (satisfied (ps))
+	    return PICOSAT_SATISFIABLE;
+
+	  assert (!ps->LEVEL);
+#endif
+	}
+
+      if (need_to_reduce (ps))
+	reduce (ps, 50);
-- 
2.39.2


