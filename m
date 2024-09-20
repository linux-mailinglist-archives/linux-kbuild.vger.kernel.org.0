Return-Path: <linux-kbuild+bounces-3652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCA97D328
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 10:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12FC41C221E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 08:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA08114A61B;
	Fri, 20 Sep 2024 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOHCaIaS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226014389F;
	Fri, 20 Sep 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822629; cv=none; b=ovXxl3CU6rjdmwsAC/gFTEK/Vy8GPls8A2OEPVumxnI/J52uasZ3Om/mJAbD9R2gN60g/wTtdWutIFv11SdTPURxkhlU9VsJTcz9/LNf5l7Jkihw92acp5bTSJgrmKbgzWyvd5+t2gN0vW0J1vchviZZwLNh3dqmjFri9K8YNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822629; c=relaxed/simple;
	bh=61QQlySFa5pEM/vWncsXNN6TckBPFGjbzEUDyKZyDc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ir+L5Aj+MwTvlnfBuI3vcF0mQab0Mi7mY7kgo0wjNUcRdpqDcOXjKck/2YXHtm35i9syBafjs5ViUqOJgzf1UryA7lSKn8+A6O+jAtKNfSV88LOxwCP5l2rc9PbATVpIiXl25X1Z/qNjyTgtTFzgEQByt4sNaQwZTEEBEDp0x6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOHCaIaS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso5584626a12.0;
        Fri, 20 Sep 2024 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726822626; x=1727427426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSINRI5oDb/ENez5X3KtVyvqwsHbg24jiAO3lEAztlo=;
        b=kOHCaIaSpgZWXiZ9+vgEvPmpepvaizZoPtxT9SIEXmvmAoXb+kABCNLN3AQUOtzYmZ
         fr+pSnFnoQqAF0x5XgeG5y+bBsc6KIn5tGmx1p2g8sxEORgw3e0de3JCl8WcXFLIsqSy
         yznSATMCy/j/SWwdqnRAar0IXXCNvydOroSF2n4zpjkf61YiU2S/7kRksw7yYC3ychBo
         YyROAEbcdU4OpvcwkwsoH/iVktPtrjdA3GiLO0sEarDAvCPk75/wHD+FLwnhoDBuXag5
         NZxU0/oJxhsUTvLqOLkyqGAszf+vLaVPN28hgM7i+ksI9L+SmZQSZqeka9n/OEgHQWpl
         Jy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822626; x=1727427426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSINRI5oDb/ENez5X3KtVyvqwsHbg24jiAO3lEAztlo=;
        b=kQuyaUu29dEYwGI89xTkL0ElOb4zcWsUIRUmICzEBIDJwoHXZ+N22QYYL8QRvcUnpo
         cwFP+6DjXgg5k3Pt/24yqnJEVg9jYEo2UDnQfR4IJ1U6TJEfcqweCILWTDeoS76mC+7O
         AVGDwUMbJf89I/TqpgyEbkg8bNAGXJLPpGzxjwmEs+QJ57+dEXG7t2hXNbD7lK7EBWIr
         ACk1MtEQ22WaeKVnXrksho8ST2haFkTDZ+2++8fEZ+sy73BSvz/Gv9H4XML0R66GdybZ
         DJeuq6xrYODZlKXveEFXq8w1LpZIItrUkbXcpiTwBuHkKVKX5+TytUGDxpxZgWcyBi/j
         /W3g==
X-Forwarded-Encrypted: i=1; AJvYcCUFhcoe064oAtRc0dJx5qkO94eDeFMrrMpRHeaxyAGbsf9zC2Z0t7SjIdNA+h11KXGfUx88DhmquDPzCXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrnMKHYH2p0trb7fUg5gChXXSY8z28gn0hwlh7qVPWkLKk6dS7
	WtPDxbicwXB57h7wz6W+wVN5rhzesbaymDYpqcRRjYAcjUTevDiCYrmiog==
X-Google-Smtp-Source: AGHT+IGuwGV0NYWs6KD4S9AxG15tOLMKgs3Qp/ORAsqck2unCK7XvXylU8DwIZvSn3gjAMvKYfLS/g==
X-Received: by 2002:a17:907:3f27:b0:a8d:59d7:f92b with SMTP id a640c23a62f3a-a90c1e545c7mr570196566b.30.1726822625560;
        Fri, 20 Sep 2024 01:57:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109637esm817861866b.40.2024.09.20.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:57:05 -0700 (PDT)
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
Subject: [PATCH v5 11/11] kconfig: Add documentation for the conflict resolver
Date: Fri, 20 Sep 2024 10:56:28 +0200
Message-Id: <20240920085628.51863-12-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920085628.51863-1-ole0811sch@gmail.com>
References: <20240920085628.51863-1-ole0811sch@gmail.com>
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
 Documentation/kbuild/kconfig.rst | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index fc4e845bc249..6a606c83d8e9 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -285,6 +285,59 @@ Searching in xconfig:
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
+    Other::
+
+        sudo scripts/kconfig/install-picosat.sh
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
2.39.2


