Return-Path: <linux-kbuild+bounces-2175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926B90C985
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7C8C286D4C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C6314A63C;
	Tue, 18 Jun 2024 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqMsA44s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60213A257;
	Tue, 18 Jun 2024 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706946; cv=none; b=DUzNEiWYXhPotHlfO1Kz76eRValnuNUWK7giVFe/1XU4iz0koPBbnmRnI33DDcDS+a8QAfQKLRCBRrmaSTUF1B2Dr+YO47/nd8uGf7VDQeCj61eTJRKID5AgKT4DmjY9+Q9SIpNE6QOBOV/OPeKgv5IIQnV1v1D6zn6JMeD0Sr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706946; c=relaxed/simple;
	bh=NKVPfkmNmxgzuheHKvWsyQsRCM22H6bOnVQ8r/1UlXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMQJD+HLqLYnY+RhKmGUHs82+pHmj4IjkRcBU/3EJCaDWMTIxAWKYmWbuNWNTltb7yleYWKfNSKwz0qWmPAfZQjvVh+DIW0BNFUzIfytF3nyiIYjrjclQ+hiHK80hqa4KniyZNcCZAky46H6rcACsfG0DbqYSH3hcEWkpIZF3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqMsA44s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7793C3277B;
	Tue, 18 Jun 2024 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706946;
	bh=NKVPfkmNmxgzuheHKvWsyQsRCM22H6bOnVQ8r/1UlXo=;
	h=From:To:Cc:Subject:Date:From;
	b=YqMsA44sJKxra1vTt4SFBkkEF8kfpw+ffa/OrlYJhYdYhpd03GNpLSW03DG/0063T
	 IG7N1ZI3U2Fv0mqplXHlKNiwgj/V1+ZtWcPzjJQWo8OPtS0o7fx+8NhdfKinQlyPu5
	 bxIgb/ZbiVbBooSTndsx7tdxPObqpOBO1dvWgvj41mjW2OHVqQAwYpLtZIoRun1S+y
	 VRWePr7Fkx15pBMfUvWo/aUfk+SNOcuT/wrprLcN0xGAWmtE0Y101CQQbS1m2VCcKc
	 pawkBy2l5Z8KdMBE/yk2jFlABRw7qb18fppnvX8gaVVAO1iLCjI4cOKIcXIxkUUYCe
	 Lw8hyHJsCvn3w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 00/12] kconfig: fix choice value calculation with misc cleanups
Date: Tue, 18 Jun 2024 19:35:19 +0900
Message-ID: <20240618103541.3508486-1-masahiroy@kernel.org>
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



Masahiro Yamada (12):
  kconfig: import list_move(_tail) and list_for_each_entry_reverse
    macros
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

 scripts/kconfig/conf.c      | 137 +++++++++++-------------
 scripts/kconfig/confdata.c  |  61 +++--------
 scripts/kconfig/expr.c      |  15 ---
 scripts/kconfig/expr.h      |  21 ++--
 scripts/kconfig/gconf.c     |   2 +-
 scripts/kconfig/list.h      |  53 ++++++++++
 scripts/kconfig/lkc.h       |  10 +-
 scripts/kconfig/lkc_proto.h |   1 -
 scripts/kconfig/mconf.c     |   6 +-
 scripts/kconfig/menu.c      |  25 +----
 scripts/kconfig/nconf.c     |   6 +-
 scripts/kconfig/parser.y    |   8 +-
 scripts/kconfig/qconf.cc    |   8 --
 scripts/kconfig/symbol.c    | 206 ++++++++++++++++++++----------------
 14 files changed, 272 insertions(+), 287 deletions(-)

-- 
2.43.0


