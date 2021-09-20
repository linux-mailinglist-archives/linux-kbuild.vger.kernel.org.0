Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80869412871
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 23:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhITVwk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 17:52:40 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:35470 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbhITVuj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 17:50:39 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Sep 2021 17:50:39 EDT
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 8715D6169BCC;
        Mon, 20 Sep 2021 23:40:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FrKaLuZiFFX7; Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id A0D3E616E131;
        Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id k65h5FpABQpK; Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from blindfold.corp.sigma-star.at (213-47-184-186.cable.dynamic.surfer.at [213.47.184.186])
        by lithops.sigma-star.at (Postfix) with ESMTPSA id 0BBF86169BC6;
        Mon, 20 Sep 2021 23:40:09 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     masahiroy@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] kconfig: Deny command substitution in string values
Date:   Mon, 20 Sep 2021 23:39:57 +0200
Message-Id: <20210920213957.1064-2-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210920213957.1064-1-richard@nod.at>
References: <20210920213957.1064-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The post processed .config file will get included in shell
and makefiles. So make sure that a string does not contain
symbols that allow command substitution.
If such a malformed string is found, return empty string
and report it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 scripts/kconfig/symbol.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 4a31bb943f79..1035ecdddc99 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -880,6 +880,11 @@ const char *sym_escape_string(struct symbol *sym)
=20
 	in =3D sym_get_string_value(sym);
=20
+	if (strspn(in, "`$")) {
+		fprintf(stderr, "%s: invalid characters in string found\n", sym->name)=
;
+		return xstrdup("\"\"");
+	}
+
 	reslen =3D strlen(in) + strlen("\"\"") + 1;
=20
 	p =3D in;
--=20
2.26.2

