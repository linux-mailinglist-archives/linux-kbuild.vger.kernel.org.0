Return-Path: <linux-kbuild+bounces-1763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 173208BBDB3
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487C51C20ED1
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDE384FC9;
	Sat,  4 May 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFv7KZVg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75DD84FBE;
	Sat,  4 May 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847655; cv=none; b=E4E48fPxYc9w5FNhWfzCZ+DPwy8IM5pSSF2TlA5pWSk769TvJoTLSMajn677B83tYl2iQ3HllTY2vcnv0y7gWGUTSA64NeRWhLPfsakZbeoYzH15l8X9hJNrU7R5i+FEkr2JdfVle58u9CPiWXC7NeizDdxbwTmsJUQ39iRVLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847655; c=relaxed/simple;
	bh=1loWNNMJbgdISYcGMWi4T/QUodY2ppau9yw5McZ9ioc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oE6YBPfI8r8pfO2cRfgUqq+jyPG3fTI36l3+L/jiu5hf7rJAaJ5ptBPXaScgTNCdQul1JPNS7CNj9mqKXszKbDG8lDduek91WDHYTnof90D0+rgUiBOfwFp6JdIAkjLPX/WfWd6JwfUnryRNYJWmPDf0ttk+/4A+x+F3RrEst98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFv7KZVg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B078C4AF66;
	Sat,  4 May 2024 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847655;
	bh=1loWNNMJbgdISYcGMWi4T/QUodY2ppau9yw5McZ9ioc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFv7KZVgWm34At1/vHc5cyybcWeTpVpjPVlUrbaQ1w98TMdfSK1ZVIA6kgvq5w5Lc
	 69oiKciVnkyr5dyQwS97WwzY8Th/adKPCRkFOauvSiVvRw1Ex+Adq5LSxPxmll0/UI
	 Y/KqSKAmKQc5W3H5WjFKuPYOYoW/4zaZB1EWD4ugm8krXDKLWm3bo7WDSQOS6ckl+K
	 ePPK3qly2RqJ6qCUpsL63kqQtO5CIVp548HHWfshp7fJPKPhNvLhyPN/xpmjQhEdf3
	 ITz15Ja7lQC6zuDkn5mUB/y7b76cygF4jbC+9VbQ7M4frHc87u6oWssO8wjtOEwOYL
	 83Rgcsi3v3MzA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 06/10] kconfig: use sym_get_choice_menu() in conf_write_defconfig()
Date: Sun,  5 May 2024 03:33:29 +0900
Message-Id: <20240504183333.2031860-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504183333.2031860-1-masahiroy@kernel.org>
References: <20240504183333.2031860-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Choices and their members are associated via the P_CHOICE property.

Currently, prop_get_symbol(sym_get_choice_prop()) is used to obtain
the choice of the given choice member.

Replace it with sym_get_choice_menu(), which retrieves the choice
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 5caec434e6f4..e68890bbc035 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -794,6 +794,8 @@ int conf_write_defconfig(const char *filename)
 	sym_clear_all_valid();
 
 	menu_for_each_entry(menu) {
+		struct menu *choice_menu;
+
 		sym = menu->sym;
 		if (sym && !sym_is_choice(sym)) {
 			sym_calc_value(sym);
@@ -811,12 +813,11 @@ int conf_write_defconfig(const char *filename)
 			 * If symbol is a choice value and equals to the
 			 * default for a choice - skip.
 			 */
-			if (sym_is_choice_value(sym)) {
-				struct symbol *cs;
+			choice_menu = sym_get_choice_menu(sym);
+			if (choice_menu) {
 				struct symbol *ds;
 
-				cs = prop_get_symbol(sym_get_choice_prop(sym));
-				ds = sym_choice_default(cs);
+				ds = sym_choice_default(choice_menu->sym);
 				if (sym == ds) {
 					if ((sym->type == S_BOOLEAN) &&
 					    sym_get_tristate_value(sym) == yes)
-- 
2.40.1


