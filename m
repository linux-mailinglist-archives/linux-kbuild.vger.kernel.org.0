Return-Path: <linux-kbuild+bounces-7735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF586AECF9F
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F95C174031
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181DC1C6FF4;
	Sun, 29 Jun 2025 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOsOPJA/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9619B5B1;
	Sun, 29 Jun 2025 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222759; cv=none; b=ZQw72EI0PdMtx+oaAt7Pi7WNP0lFfi7CFJZh02XTsZTZM8+oYbkS493Zs/O9UaQI3CFRGm5IOs4CyCxKrfaaR7z0SVuFpMEo9F+2e2Zcu8U0ZbupG7+UkAD73OGtuEwBFjL/ZVltP2k0aw0gikA7vJOCFMiAUOod8pDiirefrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222759; c=relaxed/simple;
	bh=cfQXpd35MpSvNvNbg1atgyvG6iYU0T5oU/tfIHmnZeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ff6TRh6WB5pGPfAvy29oAYeIcuKfCXlYJbI6YCdbRpmOD9fURdeZkPyRhpyTPy6vlGbeafCr1egjrpTfJds4lFyFGiqbLbOo29IweNvAMCeCmIAWk6oB9rRqkYdeYh7PK65y+ICnKs0jYNsZDSKfGsdQTnpVwJxCmKW4flkvi3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOsOPJA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79615C4CEEB;
	Sun, 29 Jun 2025 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222758;
	bh=cfQXpd35MpSvNvNbg1atgyvG6iYU0T5oU/tfIHmnZeo=;
	h=From:To:Cc:Subject:Date:From;
	b=MOsOPJA/sNONYLOZpgm6fOqxkP/kteXu89h3o1vGPZvp/g//mpxq5+wyz9WhTvccv
	 ssIu6sckfeqIOD7cHKyls+AxGdmz/GdJf1Acln8nkwwIE1yNt++yg1vrIR4Evm1dLy
	 dDIiD+pSA4kYZzfOr8YpjM3PnBT6QyHmoKYl0juyDq09aXdi7kRwRsqo6RhvOY5ztj
	 b7TjLyJGmcLUo56ApJtNv1ZY3vdI/xtc01vqsPQSuYNccUkhJrpO5gEWyLjRSP74k9
	 WEJZFfY5J+YgiAc8fSWD5cMKpcMaziFgFXMrpG6MJAMveWiNeuIPkQf8QOAcekLD3r
	 nsfW04FCwWSlQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] kconfig: improve gconfig
Date: Mon, 30 Jun 2025 03:43:26 +0900
Message-ID: <20250629184554.407497-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Code refactoring
- Migrate GTK 2 to GTK3
- Fix all compile warnings


Masahiro Yamada (9):
  kconfig: gconf: fix behavior of a menu under a symbol in split view
  kconfig: gconf: use configure-event handler to adjust pane separator
  kconfig: gconf: rename display_tree_part()
  kconfig: gconf: rename gconf.glade to gconf.ui
  kconfig: gconf: migrate to GTK 3
  kconfig: gconf: replace GtkVbox with GtkBox
  kconfig: gconf: replace GdkColor with GdkRGBA
  kconfig: gconf: replace GtkHPaned and GtkVPaned with GtkPaned
  kconfig: gconf: show GTK version in About dialog

 scripts/kconfig/gconf-cfg.sh              |  11 +-
 scripts/kconfig/gconf.c                   | 146 ++++++++--------
 scripts/kconfig/{gconf.glade => gconf.ui} | 202 +++++++++++-----------
 3 files changed, 171 insertions(+), 188 deletions(-)
 rename scripts/kconfig/{gconf.glade => gconf.ui} (83%)

-- 
2.43.0


