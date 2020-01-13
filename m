Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF7B139D2C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2020 00:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgAMXWY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 18:22:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:59698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbgAMXWY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 18:22:24 -0500
Received: from localhost (mobile-166-170-223-177.mycingular.net [166.170.223.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58B2720678;
        Mon, 13 Jan 2020 23:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578957743;
        bh=xEznJFqeeT1ImYVestHD9WJ/EAJX/f+/Jfxd/hiidPU=;
        h=From:To:Cc:Subject:Date:From;
        b=daua9Jq07fRQqwZodxe9/EgTVJnWHewSuOyf2G5ys0ufJN0Q1FKIU04oMNEkxukw2
         lSODtmcSmGhz3/tGebILdUN+fL+eJpalAge5yQ4AxeSAcTfIbrjNXRCRZkN2mB7wzN
         uWiKRBvAUMby99yeUIwvBERuvytYyElYrFKrFaS4=
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] kconfig: fix documentation typos
Date:   Mon, 13 Jan 2020 17:22:11 -0600
Message-Id: <20200113232212.138327-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix a couple typos in kconfig-language documentation.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/kbuild/kconfig-language.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 74bef19f69f0..f547720bd82d 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
 Documentation/kbuild/Kconfig.recursion-issue-02.
 
 Below is a list of examples of prior fixes for these types of recursive issues;
-all errors appear to involve one or more select's and one or more "depends on".
+all errors appear to involve one or more "selects" and one or more "depends on".
 
 ============    ===================================
 commit          fix
@@ -656,7 +656,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
 the deduced semantics matches our intended Kconfig design goals.
 
 Having well defined semantics can be useful for tools for practical
-evaluation of depenencies, for instance one such use known case was work to
+evaluation of dependencies, for instance one such case was work to
 express in boolean abstraction of the inferred semantics of Kconfig to
 translate Kconfig logic into boolean formulas and run a SAT solver on this to
 find dead code / features (always inactive), 114 dead features were found in
@@ -683,7 +683,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
 boolean formulas and run a SAT solver on it [5]_. Another known related project
 is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
 has been introduced first with [9]_.  The basic concept of undertaker is to
-exract variability models from Kconfig, and put them together with a
+extract variability models from Kconfig and put them together with a
 propositional formula extracted from CPP #ifdefs and build-rules into a SAT
 solver in order to find dead code, dead files, and dead symbols. If using a SAT
 solver is desirable on Kconfig one approach would be to evaluate repurposing
-- 
2.25.0.rc1.283.g88dfdc4193-goog

