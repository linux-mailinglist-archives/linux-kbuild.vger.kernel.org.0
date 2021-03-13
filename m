Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B732333A0AB
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhCMTtn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:43 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39823 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef6018162;
        Sun, 14 Mar 2021 04:48:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef6018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664924;
        bh=h3F3H4TpPQMU1VnkGCdtUB17Y+6ggqHMTu1Ki1YibYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dehNiYPR3QYeQ8tsOF1IADNIuxe2EUJcK9CqInAJHgi0U311hjEujE3KvqElp63Q6
         4Isjm2rehQOPsgFA8dN0LFTNyxc0gCo6kNGLtuQz8m37PEaV81D/IiC7X6PzJtdokr
         QQ3C+v9+gEsa7ZiI6ra/3WkmAffAXKU4UPROFHIzBdRzJHRtHZyx+KQx83fICNjqAp
         UX8fMcTUTGglbGDW8c6/Z+ZXAyywVL8sQXUUzS3Q2N+Q087q4PwSI4ItEo3q9pKzM4
         RMqYz2I4axvEhrhtiY+CNxkDhVgTxXDQljkDDRqWiOp73EAxe1srDa7Hhez7SLwWyT
         wbMsF4t63TVQw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] kconfig: move conf_set_all_new_symbols() to conf.c
Date:   Sun, 14 Mar 2021 04:48:30 +0900
Message-Id: <20210313194836.372585-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function is only used in conf.c. Move it there together with the
randomize_choice_values() helper.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c     | 183 +++++++++++++++++++++++++++++++++++++
 scripts/kconfig/confdata.c | 176 -----------------------------------
 scripts/kconfig/lkc.h      |   1 -
 3 files changed, 183 insertions(+), 177 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 89c9ba83f9e7..caad875da483 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -112,6 +112,189 @@ static void set_randconfig_seed(void)
 	srand(seed);
 }
 
+static bool randomize_choice_values(struct symbol *csym)
+{
+	struct property *prop;
+	struct symbol *sym;
+	struct expr *e;
+	int cnt, def;
+
+	/*
+	 * If choice is mod then we may have more items selected
+	 * and if no then no-one.
+	 * In both cases stop.
+	 */
+	if (csym->curr.tri != yes)
+		return false;
+
+	prop = sym_get_choice_prop(csym);
+
+	/* count entries in choice block */
+	cnt = 0;
+	expr_list_for_each_sym(prop->expr, e, sym)
+		cnt++;
+
+	/*
+	 * find a random value and set it to yes,
+	 * set the rest to no so we have only one set
+	 */
+	def = rand() % cnt;
+
+	cnt = 0;
+	expr_list_for_each_sym(prop->expr, e, sym) {
+		if (def == cnt++) {
+			sym->def[S_DEF_USER].tri = yes;
+			csym->def[S_DEF_USER].val = sym;
+		} else {
+			sym->def[S_DEF_USER].tri = no;
+		}
+		sym->flags |= SYMBOL_DEF_USER;
+		/* clear VALID to get value calculated */
+		sym->flags &= ~SYMBOL_VALID;
+	}
+	csym->flags |= SYMBOL_DEF_USER;
+	/* clear VALID to get value calculated */
+	csym->flags &= ~SYMBOL_VALID;
+
+	return true;
+}
+
+static bool conf_set_all_new_symbols(enum conf_def_mode mode)
+{
+	struct symbol *sym, *csym;
+	int i, cnt;
+	/*
+	 * can't go as the default in switch-case below, otherwise gcc whines
+	 * about -Wmaybe-uninitialized
+	 */
+	int pby = 50; /* probability of bool     = y */
+	int pty = 33; /* probability of tristate = y */
+	int ptm = 33; /* probability of tristate = m */
+	bool has_changed = false;
+
+	if (mode == def_random) {
+		int n, p[3];
+		char *env = getenv("KCONFIG_PROBABILITY");
+
+		n = 0;
+		while (env && *env) {
+			char *endp;
+			int tmp = strtol(env, &endp, 10);
+
+			if (tmp >= 0 && tmp <= 100) {
+				p[n++] = tmp;
+			} else {
+				errno = ERANGE;
+				perror("KCONFIG_PROBABILITY");
+				exit(1);
+			}
+			env = (*endp == ':') ? endp + 1 : endp;
+			if (n >= 3)
+				break;
+		}
+		switch (n) {
+		case 1:
+			pby = p[0];
+			ptm = pby / 2;
+			pty = pby - ptm;
+			break;
+		case 2:
+			pty = p[0];
+			ptm = p[1];
+			pby = pty + ptm;
+			break;
+		case 3:
+			pby = p[0];
+			pty = p[1];
+			ptm = p[2];
+			break;
+		}
+
+		if (pty + ptm > 100) {
+			errno = ERANGE;
+			perror("KCONFIG_PROBABILITY");
+			exit(1);
+		}
+	}
+
+	for_all_symbols(i, sym) {
+		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID)
+			continue;
+		switch (sym_get_type(sym)) {
+		case S_BOOLEAN:
+		case S_TRISTATE:
+			has_changed = true;
+			switch (mode) {
+			case def_yes:
+				sym->def[S_DEF_USER].tri = yes;
+				break;
+			case def_mod:
+				sym->def[S_DEF_USER].tri = mod;
+				break;
+			case def_no:
+				if (sym->flags & SYMBOL_ALLNOCONFIG_Y)
+					sym->def[S_DEF_USER].tri = yes;
+				else
+					sym->def[S_DEF_USER].tri = no;
+				break;
+			case def_random:
+				sym->def[S_DEF_USER].tri = no;
+				cnt = rand() % 100;
+				if (sym->type == S_TRISTATE) {
+					if (cnt < pty)
+						sym->def[S_DEF_USER].tri = yes;
+					else if (cnt < pty + ptm)
+						sym->def[S_DEF_USER].tri = mod;
+				} else if (cnt < pby)
+					sym->def[S_DEF_USER].tri = yes;
+				break;
+			default:
+				continue;
+			}
+			if (!(sym_is_choice(sym) && mode == def_random))
+				sym->flags |= SYMBOL_DEF_USER;
+			break;
+		default:
+			break;
+		}
+
+	}
+
+	sym_clear_all_valid();
+
+	/*
+	 * We have different type of choice blocks.
+	 * If curr.tri equals to mod then we can select several
+	 * choice symbols in one block.
+	 * In this case we do nothing.
+	 * If curr.tri equals yes then only one symbol can be
+	 * selected in a choice block and we set it to yes,
+	 * and the rest to no.
+	 */
+	if (mode != def_random) {
+		for_all_symbols(i, csym) {
+			if ((sym_is_choice(csym) && !sym_has_value(csym)) ||
+			    sym_is_choice_value(csym))
+				csym->flags |= SYMBOL_NEED_SET_CHOICE_VALUES;
+		}
+	}
+
+	for_all_symbols(i, csym) {
+		if (sym_has_value(csym) || !sym_is_choice(csym))
+			continue;
+
+		sym_calc_value(csym);
+		if (mode == def_random)
+			has_changed |= randomize_choice_values(csym);
+		else {
+			set_all_choice_values(csym);
+			has_changed = true;
+		}
+	}
+
+	return has_changed;
+}
+
 static void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
 {
 	struct symbol *sym;
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index a828622cb2d0..198f70957fbf 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1127,54 +1127,6 @@ void conf_set_changed_callback(void (*fn)(void))
 	conf_changed_callback = fn;
 }
 
-static bool randomize_choice_values(struct symbol *csym)
-{
-	struct property *prop;
-	struct symbol *sym;
-	struct expr *e;
-	int cnt, def;
-
-	/*
-	 * If choice is mod then we may have more items selected
-	 * and if no then no-one.
-	 * In both cases stop.
-	 */
-	if (csym->curr.tri != yes)
-		return false;
-
-	prop = sym_get_choice_prop(csym);
-
-	/* count entries in choice block */
-	cnt = 0;
-	expr_list_for_each_sym(prop->expr, e, sym)
-		cnt++;
-
-	/*
-	 * find a random value and set it to yes,
-	 * set the rest to no so we have only one set
-	 */
-	def = (rand() % cnt);
-
-	cnt = 0;
-	expr_list_for_each_sym(prop->expr, e, sym) {
-		if (def == cnt++) {
-			sym->def[S_DEF_USER].tri = yes;
-			csym->def[S_DEF_USER].val = sym;
-		}
-		else {
-			sym->def[S_DEF_USER].tri = no;
-		}
-		sym->flags |= SYMBOL_DEF_USER;
-		/* clear VALID to get value calculated */
-		sym->flags &= ~SYMBOL_VALID;
-	}
-	csym->flags |= SYMBOL_DEF_USER;
-	/* clear VALID to get value calculated */
-	csym->flags &= ~(SYMBOL_VALID);
-
-	return true;
-}
-
 void set_all_choice_values(struct symbol *csym)
 {
 	struct property *prop;
@@ -1194,131 +1146,3 @@ void set_all_choice_values(struct symbol *csym)
 	/* clear VALID to get value calculated */
 	csym->flags &= ~(SYMBOL_VALID | SYMBOL_NEED_SET_CHOICE_VALUES);
 }
-
-bool conf_set_all_new_symbols(enum conf_def_mode mode)
-{
-	struct symbol *sym, *csym;
-	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
-					 * pty: probability of tristate = y
-					 * ptm: probability of tristate = m
-					 */
-
-	pby = 50; pty = ptm = 33; /* can't go as the default in switch-case
-				   * below, otherwise gcc whines about
-				   * -Wmaybe-uninitialized */
-	if (mode == def_random) {
-		int n, p[3];
-		char *env = getenv("KCONFIG_PROBABILITY");
-		n = 0;
-		while( env && *env ) {
-			char *endp;
-			int tmp = strtol( env, &endp, 10 );
-			if( tmp >= 0 && tmp <= 100 ) {
-				p[n++] = tmp;
-			} else {
-				errno = ERANGE;
-				perror( "KCONFIG_PROBABILITY" );
-				exit( 1 );
-			}
-			env = (*endp == ':') ? endp+1 : endp;
-			if( n >=3 ) {
-				break;
-			}
-		}
-		switch( n ) {
-		case 1:
-			pby = p[0]; ptm = pby/2; pty = pby-ptm;
-			break;
-		case 2:
-			pty = p[0]; ptm = p[1]; pby = pty + ptm;
-			break;
-		case 3:
-			pby = p[0]; pty = p[1]; ptm = p[2];
-			break;
-		}
-
-		if( pty+ptm > 100 ) {
-			errno = ERANGE;
-			perror( "KCONFIG_PROBABILITY" );
-			exit( 1 );
-		}
-	}
-	bool has_changed = false;
-
-	for_all_symbols(i, sym) {
-		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
-			continue;
-		switch (sym_get_type(sym)) {
-		case S_BOOLEAN:
-		case S_TRISTATE:
-			has_changed = true;
-			switch (mode) {
-			case def_yes:
-				sym->def[S_DEF_USER].tri = yes;
-				break;
-			case def_mod:
-				sym->def[S_DEF_USER].tri = mod;
-				break;
-			case def_no:
-				if (sym->flags & SYMBOL_ALLNOCONFIG_Y)
-					sym->def[S_DEF_USER].tri = yes;
-				else
-					sym->def[S_DEF_USER].tri = no;
-				break;
-			case def_random:
-				sym->def[S_DEF_USER].tri = no;
-				cnt = rand() % 100;
-				if (sym->type == S_TRISTATE) {
-					if (cnt < pty)
-						sym->def[S_DEF_USER].tri = yes;
-					else if (cnt < (pty+ptm))
-						sym->def[S_DEF_USER].tri = mod;
-				} else if (cnt < pby)
-					sym->def[S_DEF_USER].tri = yes;
-				break;
-			default:
-				continue;
-			}
-			if (!(sym_is_choice(sym) && mode == def_random))
-				sym->flags |= SYMBOL_DEF_USER;
-			break;
-		default:
-			break;
-		}
-
-	}
-
-	sym_clear_all_valid();
-
-	/*
-	 * We have different type of choice blocks.
-	 * If curr.tri equals to mod then we can select several
-	 * choice symbols in one block.
-	 * In this case we do nothing.
-	 * If curr.tri equals yes then only one symbol can be
-	 * selected in a choice block and we set it to yes,
-	 * and the rest to no.
-	 */
-	if (mode != def_random) {
-		for_all_symbols(i, csym) {
-			if ((sym_is_choice(csym) && !sym_has_value(csym)) ||
-			    sym_is_choice_value(csym))
-				csym->flags |= SYMBOL_NEED_SET_CHOICE_VALUES;
-		}
-	}
-
-	for_all_symbols(i, csym) {
-		if (sym_has_value(csym) || !sym_is_choice(csym))
-			continue;
-
-		sym_calc_value(csym);
-		if (mode == def_random)
-			has_changed |= randomize_choice_values(csym);
-		else {
-			set_all_choice_values(csym);
-			has_changed = true;
-		}
-	}
-
-	return has_changed;
-}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index f946ab49ef50..d0d5acecb530 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -57,7 +57,6 @@ const char *zconf_curname(void);
 const char *conf_get_configname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
-bool conf_set_all_new_symbols(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
 /* confdata.c and expr.c */
-- 
2.27.0

