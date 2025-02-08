Return-Path: <linux-kbuild+bounces-5687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CDA2D786
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E622D1889D28
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C141F3B87;
	Sat,  8 Feb 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPtRdjJn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45D244AFE;
	Sat,  8 Feb 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032899; cv=none; b=R2Qjza/aRSSHrgXextK3YrGWvOrr4YMJ5mp5YVW+811ZU/lu2WZbVKoYJe+neN6OuRkiwjayqk2Bb38YEf/k1pbS6w7MelpteLVg3wEYWkfQh6l/e4+u/Q0pP0hbxbtwJRO+lidjCkqQpO1vEqlQwkwY+IrDLISacFchb7nQpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032899; c=relaxed/simple;
	bh=xGwi4psJJOZC8oqFMX4FH7oNE+Fjw6HTeW5J9RMFR3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=trlpi29d81PhFx7eKccJ6c5QUUvxSKNYZHsGhafK3n8quddyCFDKD84rpXu8Xrby9iAdDA3syRq7bSUoiIqfZt8I+l2MTJmARtyh5/rmuPLSZcGL2tgb54SwHdWdZLfi9Z/+914Cu4WkcPXsxeML3f5xCvtzcw0d12ygzcMfrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPtRdjJn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab795eba976so197538666b.0;
        Sat, 08 Feb 2025 08:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032896; x=1739637696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGngZIwfO/jqpHla3vwHAdrO/yliWLs6xLpeLI2Xezk=;
        b=NPtRdjJnB6FjK4eD918bzHRBEdXPsNZ3HtYbfujqesbwh//se6nm/CVMoTyJy3qAnM
         rmEAnHgqdr1Ipv8yGJLoyTKIQqjV3DKZeBBFrXRGuTjEsoAv0JPZ5GHVF3RsZTkQrAWB
         V8rzMAyQhR6UVI2XtKadsjq3xqDpINTMK9QsAj2wHC6P2xUOP9llP+iBkGCFoIEsdDf6
         LY1oslx6gXYFHZZPXdcjppDIK66dXIWAEVtUNDAiAF+vfCR7pPIIOLAkI+S5jFcjd2Nh
         uTw4wscQiXhVArKGInMDWqKh37X/IjorxRJ56IKie1JqrK5CDqencqEQDW4CwcIc4Bhj
         6cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032896; x=1739637696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGngZIwfO/jqpHla3vwHAdrO/yliWLs6xLpeLI2Xezk=;
        b=Vm4FiGMKQopfYkKlrOuoWd+9ScVyQNlFlIf4LaQ7rcpiYQtpnl2ITc1EGGVHU6E6x6
         YGYXKquO7lRUFFSzcT5xqYheqe1SRejGta+8V50s3az89foEsVSryW8eBoRlrGB4UHfm
         yu/e5NXchu56ZCZFdJ43CwC4RBt3PeD8iYT0tOyUsXwZO/FuO8yqKX7ipLzn7+SFCVTi
         ItLN/Ok5uV2lXwJ9ZHFB554PVfdufpEqTAq+XePMoI1HTt6Zu7DmkLp5QKZzYdHo8jft
         23ASt2iRijn8506i+OZwreyYx5cW5SdqgzNjWsX6LrzaSO3mHEI/5cnZEY7KFaNZiTlt
         fejg==
X-Forwarded-Encrypted: i=1; AJvYcCUk/5AalFnzcQ9IutXx9Fs9URelyIufFkelknuCNsKRD70b72Jl0N/pHSbjdtQDlXMYaeMM+ZQrWS9lmKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jP09y57XHzExkRK0OjI6yYldRNVKXuYLWrx20NoDBsxr2xU1
	BLJijFFoEZ3aACkS1bKiWjuUZF4OxOO5Odr5Arc78H1ymlezpKcC8NG2mg==
X-Gm-Gg: ASbGnctZuGCv10Wrq3Wc7D+qxbLmnyEGhwSqZO5zF/A4Bai4y/GDrilw8aYZkJP6IA7
	AhKpN7gB3nz6CRSjiyaRzif+lVevKHBF7/4oknDNogDeYCJafV1VTNYknk5oTF7kY6lLItZvnNn
	AkIolILhDI4LBBiVvW6hMXkn0Zw6jk4F1w1sC5c6KPv2AV04sEYi1YV3BYPjzUuGJfcYmkzQ7xa
	Z2U+ISMua15t1apXcWEbGFxd1dW+HWlOruTKq4/JJwBuRV8D+V+xISDzk3wJtlSutlXjE3Q/08h
	Cjgt5VbVLAuTVGbT+sN29/OV2FS9sA==
X-Google-Smtp-Source: AGHT+IE40RmfH5zbhEsfUF13K2v7/nQmB6Wqch1RrLCWdbjL7yzGlcwxlJXoUNgWH7NMbbpApzXXew==
X-Received: by 2002:a17:907:d03:b0:ab3:a4f6:7551 with SMTP id a640c23a62f3a-ab76e8cc47fmr1269835966b.13.1739032895654;
        Sat, 08 Feb 2025 08:41:35 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:41:35 -0800 (PST)
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
Subject: [PATCH v7 11/11] kconfig: Add documentation for the conflict resolver
Date: Sat,  8 Feb 2025 17:39:59 +0100
Message-Id: <20250208163959.3973163-12-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
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


