Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726772B7B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 May 2019 16:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfE0OiS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 10:38:18 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:41816 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfE0OiN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:38:13 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x4REc8ho015915;
        Mon, 27 May 2019 23:38:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4REc8ho015915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558967889;
        bh=DU9a+ehsGx3Okk9wjGD1G/rqyMEkh0yNSRINEJbKkGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qZ4WTgT62CY/O7HwwuI3OU8GBdXaqZElwEPEujDnHxzCVkxzBz4HmF5Bwrmlf+4h7
         6W2GSuz2p1ZvvLmczd0raa75n9mxJgEg4mBJgZrxg/H6hU5n/xeJQlK3DJfY+uImCY
         u+OBXhZRLMH/Nt0dfhUFS4k5/oDJasGwG4czVRn3N7StHtJgKZ1XlBWrSqh0/sOUdE
         hrZqrKmZYNRshkbimd+TZvIzNLP8oEiWPhZEcYP4zs1CFDuaGTt91NIxwMwbrs56uF
         cJwI0OMuo4dBy58LY8IEola0tUSYXUdnqmrk6Rf02+RZCEBlZvfSq58ZTCpCs/wgGu
         6dfZ4aiZeAyHQ==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kconfig: add static qualifier to expand_string()
Date:   Mon, 27 May 2019 23:37:23 +0900
Message-Id: <20190527143725.12542-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now expand_string() is only used in preprocess.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/lkc_proto.h  | 1 -
 scripts/kconfig/preprocess.c | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 86c267540ccc..38a32b1c1a28 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -58,7 +58,6 @@ void env_write_dep(FILE *f, const char *auto_conf_name);
 void variable_add(const char *name, const char *value,
 		  enum variable_flavor flavor);
 void variable_all_del(void);
-char *expand_string(const char *in);
 char *expand_dollar(const char **str);
 char *expand_one_token(const char **str);
 
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 592dfbfa9fb3..0243086fb168 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -15,6 +15,7 @@
 #define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
 
 static char *expand_string_with_args(const char *in, int argc, char *argv[]);
+static char *expand_string(const char *in);
 
 static void __attribute__((noreturn)) pperror(const char *format, ...)
 {
@@ -550,7 +551,7 @@ static char *expand_string_with_args(const char *in, int argc, char *argv[])
 	return __expand_string(&in, is_end_of_str, argc, argv);
 }
 
-char *expand_string(const char *in)
+static char *expand_string(const char *in)
 {
 	return expand_string_with_args(in, 0, NULL);
 }
-- 
2.17.1

