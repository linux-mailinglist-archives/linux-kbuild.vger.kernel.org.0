Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC4C2F8997
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 00:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbhAOXoj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 18:44:39 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:64010 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbhAOXoc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 18:44:32 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10FNhKIC008447;
        Sat, 16 Jan 2021 08:43:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10FNhKIC008447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610754202;
        bh=5hso9mkcyiBBIkZT6co7/OGxeCIo9O6ZtegLVDOCJeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a78FDuqmEAxUg6ebGpbe6NVe5s4ynkh+6nihokOEaGYyVczrL9pbxEMqUhzznNjD1
         dNlTyUU8rZQV69PjGNLz36WbChS/pbiYjj3U1SU5qfoITbMHWsfeAjyeiwBKe63WaF
         IarcXF/6MmLTxc+4vCO5u0xB+FlNz8k28JCEd6rz1kqAFlrBSgIPuT8Q6h/aQwZrWh
         DQwKw8lxnZ4TYBnNqrljhHe9uMMgM3Xdhn9iyr8TDVQKyXeSc54snIa3Z8jH0qOuSG
         1yBqh945rxfuECnku+MKzOrl70MYpp+okMNBUgaHkgR5Y6A9Xubdpkm4KCMWX9E2tK
         FeGBpD0Z9T+Sg==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] genksyms: remove useless case DOTS
Date:   Sat, 16 Jan 2021 08:43:04 +0900
Message-Id: <20210115234305.87205-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210115234305.87205-1-masahiroy@kernel.org>
References: <20210115234305.87205-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This switch statement does not list out all the cases. Since the
'default' covers all the rest, the 'DOTS' case is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/lex.l | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index 9cb075cf6a34..a4d7495eaf75 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -234,7 +234,6 @@ repeat:
 	  lexstate = ST_EXPRESSION;
 	  break;
 
-	case DOTS:
 	default:
 	  APP;
 	  break;
-- 
2.27.0

