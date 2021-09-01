Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8263FE054
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Sep 2021 18:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344150AbhIAQvI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Sep 2021 12:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344169AbhIAQvH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Sep 2021 12:51:07 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A162EC061575;
        Wed,  1 Sep 2021 09:50:10 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso117974wmc.5;
        Wed, 01 Sep 2021 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8MyIsdgA5KIZjl0zzly0Kpk8tSTOvLttUpP4Sw/Hmk=;
        b=kl/okPfBUIdSmH0wOZRFIMbyFtHFEVDKLTMQCKqq0RiOAY8gTqvoDUIr3kuWZv3NX2
         mRb+YW6QEkJgB2/LoysciVXavGzEL+b7xX7OvFeBMSC9pG3pPIw2qFyTotFMRgcW+qZC
         wHl4b0UXX2CFEJuFAvqecbnsweTF3M4ZbbUZ/MILt5qlG7TQ8qMJdTbQuEh18R9asc2y
         nvFE0MMd8W2bjhYbEOqTWaWqsk73zRomZzEdtI4hc4FDN8RhzHn1Zo8SCOJWV0lL8eXS
         RWniBlDCMbTZb19FRrYJZO9S8F8XXQ+OCDumW9tJR178z5AnlbjF24n5glfELUt/9JEY
         L5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8MyIsdgA5KIZjl0zzly0Kpk8tSTOvLttUpP4Sw/Hmk=;
        b=WZ54qBSrN8+od9MaLvPqhnpSD+nDc+qQxinTMBFbuhK39v79bvQsUc429wxyKC6Ew6
         zloiqRbUVC1l6VmhEYlAI9nvWHogyMvTF0vpt1whR26u/8tW6YUYOvkzf9+Ti1EtmVMf
         zeKDDGqnhlkUoNUKT98kWjFwN/SLJF2qdr1pME2hi1vzljFW0R1lw2JykoPH4bwImMTB
         DyrE5G0bLa82U+6sHhlhZyJNURtoWh24amkr7t84RkXXY8snl6Gu9S55X5gKweY1XQiR
         XdSqYOQNmIeJ0znutyQgWs1vTOy3lr1rynFZL1l8pMEk034mFDr1JhsNPrqsVT1GyLm4
         8sJA==
X-Gm-Message-State: AOAM533+9fVeXLWnchR43zjSoPqWht7fIKGSE7QRFYs7WQnV03lFGPZA
        xql2FgEeRGPe/4WnNb/i5cY=
X-Google-Smtp-Source: ABdhPJxNVzCpxzumP4psu/qnGdKFuffDBPPE3NGWQ10IJEFi0CIT5N9c0Z2Q3XDOOnB4BQ83oVr1Rw==
X-Received: by 2002:a05:600c:b4e:: with SMTP id k14mr443670wmr.139.1630515009240;
        Wed, 01 Sep 2021 09:50:09 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id s205sm61798wme.4.2021.09.01.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 09:50:08 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
To:     masahiroy@kernel.org, valentinrothberg@gmail.com
Cc:     arielmarcovitch@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] checkkconfigsymbols.py: Remove skipping of help lines in parse_kconfig_file
Date:   Wed,  1 Sep 2021 19:49:52 +0300
Message-Id: <20210901164952.538834-1-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When parsing Kconfig files to find symbol definitions and references,
lines after a 'help' line are skipped until a new config definition
starts.

However, Kconfig statements can actually be after a help section, as
long as these have shallower indentation. These are skipped by the
parser.

This means that symbols referenced in this kind of statements are
ignored by this function and thus are not considered undefined
references in case the symbol is not defined.

Remove the 'skip' logic entirely, as it is not needed if we just use the
STMT regex to find the end of help lines.

However, this means that keywords that appear as part of the help
message (i.e. with the same indentation as the help lines) it will be
considered as a reference/definition. This can happen now as well, but
only with REGEX_KCONFIG_DEF lines. Also, the keyword must have a SYMBOL
after it, which probably means that someone referenced a config in the
help so it seems like a bonus :)

The real solution is to keep track of the indentation when a the first
help line in encountered and then handle DEF and STMT lines only if the
indentation is shallower.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/checkkconfigsymbols.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index b9b0f15e5880..4f9dc98f3f60 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -34,7 +34,6 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
 REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
-REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
@@ -432,7 +431,6 @@ def parse_kconfig_file(kfile):
     lines = []
     defined = []
     references = []
-    skip = False
 
     if not os.path.exists(kfile):
         return defined, references
@@ -448,12 +446,6 @@ def parse_kconfig_file(kfile):
         if REGEX_KCONFIG_DEF.match(line):
             symbol_def = REGEX_KCONFIG_DEF.findall(line)
             defined.append(symbol_def[0])
-            skip = False
-        elif REGEX_KCONFIG_HELP.match(line):
-            skip = True
-        elif skip:
-            # ignore content of help messages
-            pass
         elif REGEX_KCONFIG_STMT.match(line):
             line = REGEX_QUOTES.sub("", line)
             symbols = get_symbols_in_line(line)

base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
-- 
2.25.1

