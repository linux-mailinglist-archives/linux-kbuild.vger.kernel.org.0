Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4521333A0A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhCMTtM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:12 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39824 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef0018162;
        Sun, 14 Mar 2021 04:48:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef0018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664921;
        bh=gELG/qoLtW+S5vljxInuvWff31OUAj6+Z4rl0JLX8rY=;
        h=From:To:Cc:Subject:Date:From;
        b=03s7oGoGTOAoZwluB90rT5VTyK0IEZB+8CkikmOWJLQfm9ao3SfF1mC8B8Ur175UQ
         vn5msh1rnE7IH5I8TVN894M1/tPy2DHoS8MRT3FkG1E+v76TMK2vtxZ39xj6BMU5yj
         hSvBfj7egD44ifnzszLHPbU+BYvoI6Vj8VI79qXDkwaq97ArBc6/6POZE//lEFO/VS
         CAgHYslTeqVZfo+BkjuiQuH1KxmhiHzDsjqy4hy5h7SqYI4p7Z+4xzbymUQdcLLP+3
         y+0CNUrrOrNl2pwN4GBJfghgLLd+8IIn9fWj7fU36cP2pU0XBr9mBCAPD/6gOq4cDQ
         Ld7n1YLa59iyA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] kconfig: split randconfig setup code into set_randconfig_seed()
Date:   Sun, 14 Mar 2021 04:48:24 +0900
Message-Id: <20210313194836.372585-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This code is too big to be placed in the switch statement.

Move the code into a new helper function. I slightly refactor the code
without changing the behavior.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 54 ++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 957d2a0832f7..063c9e7a34c1 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -82,6 +82,36 @@ static void xfgets(char *str, int size, FILE *in)
 		printf("%s", str);
 }
 
+static void set_randconfig_seed(void)
+{
+	unsigned int seed;
+	char *env;
+	bool seed_set = false;
+
+	env = getenv("KCONFIG_SEED");
+	if (env && *env) {
+		char *endp;
+
+		seed = strtol(env, &endp, 0);
+		if (*endp == '\0')
+			seed_set = true;
+	}
+
+	if (!seed_set) {
+		struct timeval now;
+
+		/*
+		 * Use microseconds derived seed, compensate for systems where it may
+		 * be zero.
+		 */
+		gettimeofday(&now, NULL);
+		seed = (now.tv_sec + 1) * (now.tv_usec + 1);
+	}
+
+	printf("KCONFIG_SEED=0x%X\n", seed);
+	srand(seed);
+}
+
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	if (!sym_has_value(sym))
@@ -515,30 +545,8 @@ int main(int ac, char **av)
 			defconfig_file = optarg;
 			break;
 		case randconfig:
-		{
-			struct timeval now;
-			unsigned int seed;
-			char *seed_env;
-
-			/*
-			 * Use microseconds derived seed,
-			 * compensate for systems where it may be zero
-			 */
-			gettimeofday(&now, NULL);
-			seed = (unsigned int)((now.tv_sec + 1) * (now.tv_usec + 1));
-
-			seed_env = getenv("KCONFIG_SEED");
-			if( seed_env && *seed_env ) {
-				char *endp;
-				int tmp = (int)strtol(seed_env, &endp, 0);
-				if (*endp == '\0') {
-					seed = tmp;
-				}
-			}
-			fprintf( stderr, "KCONFIG_SEED=0x%X\n", seed );
-			srand(seed);
+			set_randconfig_seed();
 			break;
-		}
 		case oldaskconfig:
 		case oldconfig:
 		case allnoconfig:
-- 
2.27.0

