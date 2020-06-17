Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48551FC55B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2020 06:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgFQEoK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jun 2020 00:44:10 -0400
Received: from smtprelay0231.hostedemail.com ([216.40.44.231]:52636 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725814AbgFQEoK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jun 2020 00:44:10 -0400
X-Greylist: delayed 444 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jun 2020 00:44:09 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id A37FE18008256
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2020 04:36:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 6A500182CED28;
        Wed, 17 Jun 2020 04:36:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2908:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3876:3877:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:6114:6642:9025:10004:10400:10848:11026:11232:11473:11658:11914:12043:12297:12438:12555:12679:12740:12760:12895:12986:13439:14181:14659:14721:21080:21433:21611:21627:21740:21990:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: view80_460276a26e04
X-Filterd-Recvd-Size: 2996
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Wed, 17 Jun 2020 04:36:43 +0000 (UTC)
Message-ID: <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
Subject: Re: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over
 '---help---'"
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 16 Jun 2020 21:36:42 -0700
In-Reply-To: <20200617030220.34733-2-masahiroy@kernel.org>
References: <20200617030220.34733-1-masahiroy@kernel.org>
         <20200617030220.34733-2-masahiroy@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2020-06-17 at 12:02 +0900, Masahiro Yamada wrote:
> This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.

Also: https://lore.kernel.org/patchwork/patch/1255848/
---
 scripts/checkkconfigsymbols.py | 2 +-
 scripts/checkpatch.pl          | 6 +-----
 scripts/kconfig/lexer.l        | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 00a10a293f4f..1548f9ce4682 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
 REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
-REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
+REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 524df88f9364..738bb3fcf202 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3044,11 +3044,7 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
-					if ($lines[$ln - 1] =~ "---help---") {
-						WARN("CONFIG_DESCRIPTION",
-						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
-					}
+				} elsif ($lines[$ln - 1] =~ /^\+\s*help\s*$/) {
 					$length = -1;
 				}
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 6354c905b006..4b7339ff4c8b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
 "endchoice"		return T_ENDCHOICE;
 "endif"			return T_ENDIF;
 "endmenu"		return T_ENDMENU;
-"help"|"---help---"	return T_HELP;
+"help"			return T_HELP;
 "hex"			return T_HEX;
 "if"			return T_IF;
 "imply"			return T_IMPLY;


