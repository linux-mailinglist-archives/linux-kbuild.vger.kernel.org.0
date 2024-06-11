Return-Path: <linux-kbuild+bounces-2089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB8904630
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 23:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D9B2881C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 21:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB2B152E17;
	Tue, 11 Jun 2024 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeIOsShS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0D152780;
	Tue, 11 Jun 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140752; cv=none; b=b5yedKImMlB3PsqkHDLN8deu6c59c9/Fwz+y+OawNjWYZXmxrnwU/YTRkjBTBOIvegO18ue2+ryIfgAUwLWhv7aeHfZ2QogIuUhvFhM8CPR7jeUeGVMmxQqvg0YozrtLtAUwGXLHP1lFPRlg+ezx6AUoMM73YzWULSyEyV4uVhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140752; c=relaxed/simple;
	bh=0YwnHVeYnnYkqsFj5yR3rkt1qZKqz5UK80yyjBNKra4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPk5nfcT6WnWaYkRrlj+YPezBBYerd8f65e1tBe3TbxbxMy+B/760Ylfo5uvUedOW0yumGeaxd4cM+Kq+UEuMhXqjE6KoH0LD732OBLGJnzfVV2POyOCWZqHxb09fmNiofYAtd82DIoB87A7LLU7vGub+Wbh1tU27ERDxZDByJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeIOsShS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718140749; x=1749676749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0YwnHVeYnnYkqsFj5yR3rkt1qZKqz5UK80yyjBNKra4=;
  b=OeIOsShSj+OmhtvYIRCMmBhWq8pLH6YgqLcHptYNstuR1hp2dB+kqFFF
   bxZbMzrvkE+VImNZQ74EiWWaLgeAdbU2+jTQSXUxqwOQT9o02lw4TxZuZ
   lmrhNyoVgUwB8KB9NhzWJjATEL6xxEHnn5jQ00CIpRDFDnmtx3Jb84GkS
   NoHQtpNp+JyiUGmu0miHrdyC+UxUex9OXtH8WMTkxnf8fFstLd0VUsA2b
   8/7Oc/CgytTk8coP5hBW0IMG7MxcQy4BrXUAgnQOEqknM25zUOebbwS4E
   BoT5mIpsF+4zMpB73KVzs6j7zqvhFGQLJVJAZjOi20bq1ekN5FXEXrM3T
   g==;
X-CSE-ConnectionGUID: EaKROKOgSXWvky4+cumGBA==
X-CSE-MsgGUID: AHEUNgXvSpWH8O2BEzc94Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18712984"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="18712984"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 14:19:09 -0700
X-CSE-ConnectionGUID: dV/LxXVrT/uRvw9vFAqaKA==
X-CSE-MsgGUID: x64uxm5cS6KQn0xEwm3WFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44517960"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 14:19:08 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH8tV-0000uM-1h;
	Tue, 11 Jun 2024 21:19:05 +0000
Date: Wed, 12 Jun 2024 05:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 06/16] kconfig: refactor choice value calculation
Message-ID: <202406120445.P5QmPYgD-lkp@intel.com>
References: <20240611175536.3518179-7-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611175536.3518179-7-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/kbuild]
[also build test WARNING on masahiroy-kbuild/for-next next-20240611]
[cannot apply to masahiroy-kbuild/fixes linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kconfig-remove-unneeded-code-in-expr_compare_type/20240612-020202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
patch link:    https://lore.kernel.org/r/20240611175536.3518179-7-masahiroy%40kernel.org
patch subject: [PATCH 06/16] kconfig: refactor choice value calculation
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406120445.P5QmPYgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120445.P5QmPYgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kconfig/symbol.c:448:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     448 |                 struct menu *choice_menu = sym_get_choice_menu(sym);
         |                 ^
   1 warning generated.


vim +448 scripts/kconfig/symbol.c

   398	
   399	void sym_calc_value(struct symbol *sym)
   400	{
   401		struct symbol_value newval, oldval;
   402		struct property *prop;
   403	
   404		if (!sym)
   405			return;
   406	
   407		if (sym->flags & SYMBOL_VALID)
   408			return;
   409	
   410		sym->flags |= SYMBOL_VALID;
   411	
   412		oldval = sym->curr;
   413	
   414		newval.tri = no;
   415	
   416		switch (sym->type) {
   417		case S_INT:
   418			newval.val = "0";
   419			break;
   420		case S_HEX:
   421			newval.val = "0x0";
   422			break;
   423		case S_STRING:
   424			newval.val = "";
   425			break;
   426		case S_BOOLEAN:
   427		case S_TRISTATE:
   428			newval.val = "n";
   429			break;
   430		default:
   431			sym->curr.val = sym->name;
   432			sym->curr.tri = no;
   433			return;
   434		}
   435		sym->flags &= ~SYMBOL_WRITE;
   436	
   437		sym_calc_visibility(sym);
   438	
   439		if (sym->visible != no)
   440			sym->flags |= SYMBOL_WRITE;
   441	
   442		/* set default if recursively called */
   443		sym->curr = newval;
   444	
   445		switch (sym_get_type(sym)) {
   446		case S_BOOLEAN:
   447		case S_TRISTATE:
 > 448			struct menu *choice_menu = sym_get_choice_menu(sym);
   449	
   450			if (choice_menu) {
   451				sym_calc_choice(choice_menu);
   452				newval.tri = sym->curr.tri;
   453			} else {
   454				if (sym->visible != no) {
   455					/* if the symbol is visible use the user value
   456					 * if available, otherwise try the default value
   457					 */
   458					if (sym_has_value(sym)) {
   459						newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
   460								      sym->visible);
   461						goto calc_newval;
   462					}
   463				}
   464				if (sym->rev_dep.tri != no)
   465					sym->flags |= SYMBOL_WRITE;
   466				if (!sym_is_choice(sym)) {
   467					prop = sym_get_default_prop(sym);
   468					if (prop) {
   469						newval.tri = EXPR_AND(expr_calc_value(prop->expr),
   470								      prop->visible.tri);
   471						if (newval.tri != no)
   472							sym->flags |= SYMBOL_WRITE;
   473					}
   474					if (sym->implied.tri != no) {
   475						sym->flags |= SYMBOL_WRITE;
   476						newval.tri = EXPR_OR(newval.tri, sym->implied.tri);
   477						newval.tri = EXPR_AND(newval.tri,
   478								      sym->dir_dep.tri);
   479					}
   480				}
   481			calc_newval:
   482				if (sym->dir_dep.tri < sym->rev_dep.tri)
   483					sym_warn_unmet_dep(sym);
   484				newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
   485			}
   486			if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
   487				newval.tri = yes;
   488			break;
   489		case S_STRING:
   490		case S_HEX:
   491		case S_INT:
   492			if (sym->visible != no && sym_has_value(sym)) {
   493				newval.val = sym->def[S_DEF_USER].val;
   494				break;
   495			}
   496			prop = sym_get_default_prop(sym);
   497			if (prop) {
   498				struct symbol *ds = prop_get_symbol(prop);
   499				if (ds) {
   500					sym->flags |= SYMBOL_WRITE;
   501					sym_calc_value(ds);
   502					newval.val = ds->curr.val;
   503				}
   504			}
   505			break;
   506		default:
   507			;
   508		}
   509	
   510		sym->curr = newval;
   511		sym_validate_range(sym);
   512	
   513		if (memcmp(&oldval, &sym->curr, sizeof(oldval))) {
   514			sym_set_changed(sym);
   515			if (modules_sym == sym) {
   516				sym_set_all_changed();
   517				modules_val = modules_sym->curr.tri;
   518			}
   519		}
   520	
   521		if (sym_is_choice(sym))
   522			sym->flags &= ~SYMBOL_WRITE;
   523	}
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

