Return-Path: <linux-kbuild+bounces-2064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C25459042D7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B531F23328
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4A154F8C;
	Tue, 11 Jun 2024 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW18L2NV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A473D388;
	Tue, 11 Jun 2024 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128560; cv=none; b=MM7HnLZXqhX9eD+mz8Bb6fGRH4AcAVG9Z9whrm9LJwtYZkh7H/d5BlRhzmn2LFZp77x8jDKsjcBCO60wZ2uH4FlFjlJeebabSslNrWTCF0w2xv9MboWcG2i2r0DsR1qOf8YVFvELgRg2vZP5P7yHXl4Yvr3R29MQUF70IQzQXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128560; c=relaxed/simple;
	bh=pvVj711f7FBwfnAlWPNSTyvI0x2SydV/QyMxLOpP2oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhLIXKkFUwXHQjMTgx4Fx6UUpUp1hmETex/aoSxLch/TKycL/pmJbAE1IOvSN+DyYkxn8zdq4WPsTFllc1UEyFQDZBmJ2qv0UYUWPQlmZpm18wCIFahf/KOFJDWIW228uqbMmM2XvcVtOUzC9gyAywTLU9NdrRRz8oRRBZxugwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW18L2NV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C28C32786;
	Tue, 11 Jun 2024 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128560;
	bh=pvVj711f7FBwfnAlWPNSTyvI0x2SydV/QyMxLOpP2oI=;
	h=From:To:Cc:Subject:Date:From;
	b=QW18L2NVU1eajdx3zWvrlhRbTcy4TWNj2Yyfe+QgJEsXkBKYk9ZUojVeaYzAbFnF0
	 bikYpJ5AkKqMjBY9BsY2edtrpblnQP4ewN1qR5CkNQr8z7fBvgr/xVsIP0337EZsHk
	 +v33eTTb3246+fSxuNmd4w1mgI4vllU1RV6/gIy5uTuItjoDeny4c+ATFQ+ZvLWHKt
	 OsDZ8P9lgICmsgYGkYKMW2AIZWp3dSPz9wvuPbquhzilrzomiWhE+OJde2N9s+zrQ5
	 sZJcVOZ4BM4O8mKfMkFD7NR1XMjLwgWqphhVrXhqNCYEUWnv/Vg3sA5fA7v660EaWk
	 fqeM+qoXuaaFg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/16] kconfig: fix choice value calculation with misc cleanups.
Date: Wed, 12 Jun 2024 02:55:09 +0900
Message-ID: <20240611175536.3518179-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The main patch for this series is:
  "kconfig: refactor choice value calculation"
This rewrites the handling of user values for choices.

The others are misc cleanups.



Masahiro Yamada (16):
  kconfig: remove unneeded code in expr_compare_type()
  kconfig: add fallthrough comments to expr_compare_type()
  kconfig: introduce choice_set_value() helper
  kconfig: remember the current choice while parsing the choice block
  kconfig: import list_move() and list_move_tail()
  kconfig: refactor choice value calculation
  kconfig: remove sym_get_choice_value()
  kconfig: remove conf_unsaved in conf_read_simple()
  kconfig: change sym_choice_default() to take the choice menu
  kconfig: use menu_list_for_each_sym() in sym_choice_default()
  kconfig: remove expr_list_for_each_sym() macro
  kconfig: use sym_get_choice_menu() in sym_check_print_recursive()
  kconfig: use sym_get_choice_menu() in sym_check_choice_deps()
  kconfig: use sym_get_choice_menu() in sym_check_deps()
  kconfig: remove P_CHOICE property
  kconfig: remove E_LIST expression type

 scripts/kconfig/conf.c      | 139 ++++++++++----------
 scripts/kconfig/confdata.c  |  61 ++-------
 scripts/kconfig/expr.c      |  23 +---
 scripts/kconfig/expr.h      |  21 ++-
 scripts/kconfig/gconf.c     |   2 +-
 scripts/kconfig/list.h      |  23 ++++
 scripts/kconfig/lkc.h       |  10 +-
 scripts/kconfig/lkc_proto.h |   2 +-
 scripts/kconfig/mconf.c     |   8 +-
 scripts/kconfig/menu.c      |  25 +---
 scripts/kconfig/nconf.c     |   8 +-
 scripts/kconfig/parser.y    |  18 ++-
 scripts/kconfig/qconf.cc    |   8 --
 scripts/kconfig/symbol.c    | 252 +++++++++++++++++++++---------------
 14 files changed, 285 insertions(+), 315 deletions(-)

-- 
2.43.0


