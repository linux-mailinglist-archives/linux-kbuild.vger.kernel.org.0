Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3760C3F4129
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Aug 2021 21:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbhHVTXh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Aug 2021 15:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhHVTXg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Aug 2021 15:23:36 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B4BC061575;
        Sun, 22 Aug 2021 12:22:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id d11so32125427eja.8;
        Sun, 22 Aug 2021 12:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k+ZHwWAAohsZAJsgkPVSkbIuUTEMZCWegHO2zbiIHh4=;
        b=LRL20NM9k2d4LbTROqQT+Dm3dKt0LVfwE8O96A2DHPbkJim5z9SsFiVjDNZEy802VY
         YX8tlk99XMTfAyAvUP2fzVSc7ZjG/8ZsNFiz44hZauErVx7BxjklcVuYobmdIz4btTsJ
         bzS7Qv4yCb5ecsbzrFyYtDTaY77uX7FzRLNjODT3FxUAf/W5xVA9SKgOEK3TNfbVmXiP
         cr4bc6d5J+4YInMpa4/3gOBfSmmeS7/cKS0Zx+WSi1DjtGrmGIExO73gR0nNSFCJoVQc
         AkSR2KluoqpNtchwqMr3704CvgxwV4/ugTqwvVRKoE0iWq1QAjNULzn1FvfcV8cIRlEl
         6Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k+ZHwWAAohsZAJsgkPVSkbIuUTEMZCWegHO2zbiIHh4=;
        b=Psy5LKqJ0BFx1O3jpMJd8Y9NrxIVQG4iYiLnvgTEdU42b231Fk2bIkIchbACaIZjmF
         gB8MS3ypi9REca5CgCWYFcMqpGSsgxRW+TB8fXrp3EtslV70LAGU5xGiwJ9Jya5M31SK
         cNhb698jcchLYxvFUh44LIq0G/0Vb3C290ef2QGEhoPeGYdVj+Axb5w7krj1RRNwBr9C
         zBbihjtwb1/GRQYlJLOQ6NcripPregmcE2AHfdVZ/XM/DgVWKFO2uv4TGakOoPLjTpIJ
         CYGkq2is7qLiyAePRK36n1pP+aPE3bmsC/5gp4NssLalE2ZepKBnpZamOJYH1FG63glG
         Jyjg==
X-Gm-Message-State: AOAM533Qedsf5PzzWTg8EZJQc+wIodH5ckea/krasu86Jf/BN9bfNNgr
        n8pK1NrxV0uTVqIvaWTT1Q4=
X-Google-Smtp-Source: ABdhPJwOdr6xdUEPYHUpb/+ujmfH1eFDwNAmicufdw2gj5qdu7kDZx+ZXmAa/xyrcD/BLzkfjtHSvw==
X-Received: by 2002:a17:906:a382:: with SMTP id k2mr31814962ejz.454.1629660173239;
        Sun, 22 Aug 2021 12:22:53 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id o6sm1577950eje.6.2021.08.22.12.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:22:52 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Ariel Marcovitch <arielmarcovitch@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] checkkconfigsymbols.py: Fix Kconfig parsing to find 'if' lines
Date:   Sun, 22 Aug 2021 22:22:02 +0300
Message-Id: <20210822192205.43210-3-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822192205.43210-1-arielmarcovitch@gmail.com>
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When parsing Kconfig files to find symbol definitions and references,
lines after a 'help' line are skipped until a new config definition
starts.

However, it is quite common to define a config and then make some other
configs depend on it by adding an 'if' line. This kind of kconfig
statement usually appears after a config definition which might contain
a 'help' section. The 'if' line is skipped in parse_kconfig_file()
because it is not a config definition.

This means that symbols referenced in this kind of statements are
ignored by this function and thus are not considered undefined
references in case the symbol is not defined.

The REGEX_KCONFIG_STMT regex can't be used because the other types of
statements can't break help lines.

Define a new regex for matching 'if' statements and stop the 'help'
skipping in case it is encountered.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/checkkconfigsymbols.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index b9b0f15e5880..875e9a2c14b2 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -26,6 +26,7 @@ EXPR = r"(?:" + OPERATORS + r"|\s|" + SYMBOL + r")+"
 DEFAULT = r"default\s+.*?(?:if\s.+){,1}"
 STMT = r"^\s*(?:if|select|imply|depends\s+on|(?:" + DEFAULT + r"))\s+" + EXPR
 SOURCE_SYMBOL = r"(?:\W|\b)+[D]{,1}CONFIG_(" + SYMBOL + r")"
+IF_LINE = r"^\s*(?:if)\s+" + EXPR
 
 # regex objects
 REGEX_FILE_KCONFIG = re.compile(r".*Kconfig[\.\w+\-]*$")
@@ -35,11 +36,11 @@ REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
 REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
+REGEX_KCONFIG_IF_LINE = re.compile(IF_LINE)
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
 
-
 def parse_options():
     """The user interface of this module."""
     usage = "Run this tool to detect Kconfig symbols that are referenced but " \
@@ -445,6 +446,11 @@ def parse_kconfig_file(kfile):
         line = line.strip('\n')
         line = line.split("#")[0]  # ignore comments
 
+        # 'if EXPR' lines can be after help lines
+        # The if line itself is handled later
+        if REGEX_KCONFIG_IF_LINE.match(line):
+            skip = False
+
         if REGEX_KCONFIG_DEF.match(line):
             symbol_def = REGEX_KCONFIG_DEF.findall(line)
             defined.append(symbol_def[0])
-- 
2.25.1

