Return-Path: <linux-kbuild+bounces-4361-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626119B23B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854901C21552
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006418E77D;
	Mon, 28 Oct 2024 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Auo9mzGr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB018E038;
	Mon, 28 Oct 2024 03:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087431; cv=none; b=WxmATiK/D+MzvGzIQkutXolCPDsmPAbqX7D5HPQojLEl07oF8ql72GjBHAEtTPq1DQ7nq0bbqZtIberGJs7nGX0j9NTz3tRU8eNbytMBTDRGrBNtA1/KA0PtLebkniEbmmJATeUVLQh0oWuwTS5kg+fx6MDxfLHdrxNgkWrTj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087431; c=relaxed/simple;
	bh=xGwi4psJJOZC8oqFMX4FH7oNE+Fjw6HTeW5J9RMFR3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfsS4U9y4WhyJnetWVLJ8tv4+BTgRkY2Ups8Z1HzXCnHcB7TZnrCd8Y7mEbBMwp1R1RXEXuoaXycvlCqoSGCsRuNWRCMoMbjxrfdwcj9JQYJVAwkHdffcNE52J5FQWOOY9VtkYI3Wnkxlje0Lg+SO5kJu5Gpgz2ZKd9YCEPwnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Auo9mzGr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cbb6166c06so3063047a12.0;
        Sun, 27 Oct 2024 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087427; x=1730692227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGngZIwfO/jqpHla3vwHAdrO/yliWLs6xLpeLI2Xezk=;
        b=Auo9mzGrM4x5M8+FX0AL3SIsENh1vjDKFjy9CLTRPVBzBj2JZuw27KTApDJxaXKXcO
         JskGYT2xEfeh7q4xUhbjk2QhdDl/Gz2Fhw71oL+967xRNy2AAe6iXtO1TYGSSq5KUDR0
         XFFa3mlEcv2B73/0vN60lXQ+ZgWCSeWZilzjIPaAIuuipwoc8g6F3LMMgZaziFQfWGIN
         eZwqL018VKLf5JHiuhVF87Fs++Koz7Ew6g2YHPl6vj0bPPBA8Vqczkt+lyMAJQIFSv5t
         qpU+/ehmVJn2Lt4e9rxH5UzOBEaD08b5HkklH0g/Qd2/xHmpLSDtsyXCpyqOaPZ1wv7H
         C5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087427; x=1730692227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGngZIwfO/jqpHla3vwHAdrO/yliWLs6xLpeLI2Xezk=;
        b=LRdMpoKH8Eego6jiogbHQIyQytAu/7EaYdWwTTh1PNPa8QPjhk40zFf5Wz7RN8Jbee
         dKpSbD6x7IdIcNgFKVhcTBa+AdeXpbj7lhC0qDMN7A9TQq5CiuoqimG73YB+neB6FZNJ
         bVPUAfDy6Z6l7TYZTafgkG6i+cm2yuJfRExnjrno/6fbi2xQAS25OVMUnBxVzps4SCWV
         KQl7GXSexymHer2QRSSl+0xGmVnsXfXWL3pw+FdnduJ1SIPPk1fkNHxBaDaLb16FtgXj
         R2rUQjPaT8CXzhoJ5qpw/j2LWpvAuaxtrAfHOnpkc30MnVZ086CwBUxKhZh9II9Zshiv
         Spcg==
X-Forwarded-Encrypted: i=1; AJvYcCV9aIo11UKNBkJYj7r5RschTus7VF/gz7PeYAkWbX4qDmpq1du4d372A7ZV0qXBhxxsFexnkAu6tp4VhYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP97Bht1ATUWF1nDqj/dsx1kax0/Rc7SogN8SLUdNfTzGIXwTS
	t82dnv1w9wBbWPnlMex4NVwoRcieK7lpl+6wpV7/9sMxtpu/bSGfeSr+ww==
X-Google-Smtp-Source: AGHT+IHMClniOpjo8Gx0250GBhDj14kOzacMomo6b2Lbb6wULifLkWN21LVHSugZd/m+oD2cDO+l7w==
X-Received: by 2002:a17:907:7d8a:b0:a9a:122b:e545 with SMTP id a640c23a62f3a-a9de5f26cd7mr577554066b.32.1730087426913;
        Sun, 27 Oct 2024 20:50:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:26 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v6 11/11] kconfig: Add documentation for the conflict resolver
Date: Mon, 28 Oct 2024 04:49:49 +0100
Message-Id: <20241028034949.95322-12-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the interface of the conflict resolver and
instructions for installing PicoSAT. The target audience is everyone
using xconfig, in particular, kernel developers, end users, system
administrators, and distributors.

Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 Documentation/kbuild/kconfig.rst | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index fc4e845bc249..d49ab303e757 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -285,6 +285,62 @@ Searching in xconfig:
     You can also enter a different search string without having
     to return to the main menu.
 
+Conflict resolution
+-------------------
+
+    xconfig has support for conflict resolution. A conflict is in this case any
+    situation where you want to change the value of a symbol, but
+    unfulfilled dependencies prevent this. You can create a list of symbols
+    and their desired values, and the conflict resolver will calculate a series
+    of changes in xconfig, which allows setting the symbols to their desired
+    values.
+
+Requirements:
+
+    To use the conflict resolver, PicoSAT needs to be installed as a library.
+
+    Debian-based distributions::
+
+        sudo apt install picosat
+
+    Fedora::
+
+        sudo dnf install picosat
+
+    You can also build PicoSAT yourself from the `sources
+    <https://fmv.jku.at/picosat/picosat-965.tar.gz>`_. The conflict resolver
+    requires that PicoSAT is built with tracing enabled (e.g., using the
+    configure.sh script with the "--trace" option). It expects the shared
+    library to be named "libpicosat-trace.so", "libpicosat-trace.so.0" or
+    "libpicosat-trace.so.1".
+
+Usage:
+
+    To add a symbol to the list of symbols whose values should be changed (that
+    is, the 'conflict'), you select the symbol in the main view of xconfig. With
+    the button "Add symbol" you add the symbol to the conflict, which makes it
+    appear in a table below the main view. You need to switch to "Show Prompt
+    Options" under the tab "Option" if the symbol is hidden in the main view.
+    You can set the desired value of a symbol by either clicking on the
+    corresponding cell in the column "Wanted Value," or by selecting the
+    symbol's row and using one of the buttons above the table.
+
+    Once the 'conflict' is declared, the solutions can be calculated using the
+    button "Calculate Fixes". Once calculated, they appear in the menu on the
+    bottom right. You can select a solution from up to three candidates. The
+    solutions are presented in a table that shows which values the symbols need
+    to have to resolve the conflict. Using the button "Apply selected solution"
+    the indicated changes can automatically be applied. If you want to change
+    the values manually, the symbols are color-coded to indicate the order in
+    which they need to be set: Green means that a symbol is already set to the
+    calculated value. Gray means that a symbol cannot yet be set to the
+    calculated value and that other symbols' values need to be changed first.
+    Red means that a symbol is not yet set to the calculated value, but that you
+    can set it to the calculated value.
+
+    Note that in rare cases the conflict resolver cannot resolve the conflict
+    even when a solution exists, it suggests unnecessary changes, or it suggests
+    changes that do not resolve the conflict.
 
 gconfig
 =======
-- 
2.39.5


