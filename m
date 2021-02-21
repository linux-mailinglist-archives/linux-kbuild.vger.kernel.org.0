Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB3E320A61
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 14:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhBUNEk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 08:04:40 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:58317 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhBUNEh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 08:04:37 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 11LD3L9j011207;
        Sun, 21 Feb 2021 22:03:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 11LD3L9j011207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613912601;
        bh=93cOihUj2rUnNcCpcoiAb0mZrnzHAhGNcUPEKrb6928=;
        h=From:To:Cc:Subject:Date:From;
        b=zvvB0dlTGF442fguOjj5H4/o2QHxpn/fhn5/1xlfk2KhaeBRPslNxnUsnZ3qGuByO
         /kqd6aoTMsxa++1VlbuVJHdnigyikJs4kh8LT/OApPKosnoZrosL1zL01ExLXms2l3
         6ht42CE50IUdBRMPO1jf/l+Gf9HrMbydijpflxAaxKTVqLx+WXddSz39E2eBopg64K
         9AgR6gcgkHKvBoV/zH/5FTuiDPs/GTF+Q7SmqccFzxvw/fXtvsMfS/yeaii6XJukiE
         T/cVAsvneTi3c6wHc1aUa3CUa5MdTW8UVXXVFZQATpHxpgv99OoJVM3WHl5elt8F6n
         SxuU4HjK1T4dw==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kconfig: fix 'invalid option' for help option
Date:   Sun, 21 Feb 2021 22:03:16 +0900
Message-Id: <20210221130318.160327-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/kconfig/conf supports -? option to show the help message.
This is not wired up to Makefile, so nobody would notice this, but
it also shows 'invalid option' message.

  $ ./scripts/kconfig/conf -?
  ./scripts/kconfig/conf: invalid option -- '?'
  Usage: ./scripts/kconfig/conf [-s] [option] <kconfig-file>
  [option] is _one_ of the following:
    --listnewconfig         List new options
    --helpnewconfig         List new options and help text
    --oldaskconfig          Start a new configuration using a line-oriented program
    ...

The reason is the '?' is missing in the short option list passed to
getopt_long().

While I fixed this issue, I also changed the option '?' to 'h'.
I prefer -h (or --help, if a long option is also desired).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3a98c9e0a7c8..37e17934b67a 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -494,7 +494,7 @@ int main(int ac, char **av)
 
 	tty_stdio = isatty(0) && isatty(1);
 
-	while ((opt = getopt_long(ac, av, "s", long_opts, NULL)) != -1) {
+	while ((opt = getopt_long(ac, av, "hs", long_opts, NULL)) != -1) {
 		if (opt == 's') {
 			conf_set_message_callback(NULL);
 			continue;
@@ -550,7 +550,7 @@ int main(int ac, char **av)
 		case yes2modconfig:
 		case mod2yesconfig:
 			break;
-		case '?':
+		case 'h':
 			conf_usage(progname);
 			exit(1);
 			break;
-- 
2.27.0

