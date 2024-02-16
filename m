Return-Path: <linux-kbuild+bounces-976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B2857ED6
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Feb 2024 15:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC1F2874E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Feb 2024 14:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFEA12CDB2;
	Fri, 16 Feb 2024 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKRl41NG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C212CDAF
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Feb 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092622; cv=none; b=gfRDY0JXRCtlE2vlui9iK71R8RsyBvePY9i67/Ww3p5CH4DzabFQJcatmD2xb5/RJWZJfeo7fo643DxdYlDuE5EiLU5nckXmIJylC8R7VD4zTOmOZpSmUtFT5D0SKvHdq+RvSkNmZyBpqtaX/w/rbV4ZlWQXCH1SHfg38vyn1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092622; c=relaxed/simple;
	bh=PUSa2FgbEzAWogy8ObRN4jfxiehvZLF15DNWOcC8EOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=am55kNXOG/yJPBM33MLom4B76QXyvjeLajTFYgAelKyIBh8mMTTBniWv2ElseMmZaXT8WICl2EP0ZGmlnpvDf9d6X2kcq6byfwAbSubrnnieTgmQo/jV1TQZl/ifAlZ8od1kcaPlJWxDgZmPqvF9blkazg1r9lIIGsaNPclwHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKRl41NG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d0aabed735so26092571fa.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Feb 2024 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708092619; x=1708697419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPknmNXU4Sym92K+bKNGDdKMmaL2sbcBLI/iKL0xa7k=;
        b=hKRl41NG+Lg4EwEdE1ZOAvHh6mrRL3NH1H2wKaXvSLM834tHLHkgvKlfprZpQYKLlm
         2gWiqzuDKnB0+BaymkrQ8ZgS2GBCXuyptlvQyXutH+irkCEsGZ548g/KHk1GioBo0VNL
         9L/+w5gZIO73+RMpWt5wORta4tQhhMhzUlESO6BqLByEnhxu98Ss7gTm3B91ErPOvG1X
         7kcFWBL70PFr/jgo8lsRZ4aHgZ6LBJjjhpZmaSD2DeXUpmcb8fEs3fWF8teqAqIeuUu0
         u36dje6GmGJZOb+9pVo7UbbkEve7wZIp1AVkpJO49oBIpVmuaU4LEiNus1KzIWmuWpsQ
         fG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092619; x=1708697419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPknmNXU4Sym92K+bKNGDdKMmaL2sbcBLI/iKL0xa7k=;
        b=iysUluD4N0dBMHiNgvKgBKLD9CPvt/hkI9UIqWS+581A8F+T3nr102IwKraJYHFu+m
         rkxJj1R6YJxwSTdSLT24TczYC0jY8Ez2xUtuS2EM2ZXhL9D4ajYrS94dszDGUT+0nVTO
         IcTe3e8WYE9KGbLiKkSdfEh3/O+kzWWzfXdrpYijk1184IF678sfC9Pon81ghBu13KFo
         j1nag6FdsRZs/eJDCWGorjlycZkTLMM/nBf2REVvvi5JUDzoHz3L7S2+MUFpzmxFnnDO
         t5WnmIXbWGUp6Tc/l3wS5PlG5b/uvg3+ZY7sbgM4Hef5qfhYt+dNaS7NWQL6HaDW1FWw
         VItQ==
X-Gm-Message-State: AOJu0Yw08MEh6r5DAVrs3Kur+d+D6bI5MySRzlkFFi2OqvOQtEd48VhT
	5ipEdcy6jOoib13ByfL8oI0YowTXElc0RPCcCZZ1D22XAxEsb15c+Ku0/G0u
X-Google-Smtp-Source: AGHT+IGDvP32wzJVT6pDuc1Y6Za9KjWRuZh/kmepFhSXvWaU4JF+vywIucdx/ZDWMRtsg8hQJLeUpw==
X-Received: by 2002:a2e:740c:0:b0:2d0:dfb2:421 with SMTP id p12-20020a2e740c000000b002d0dfb20421mr3711488ljc.7.1708092618560;
        Fri, 16 Feb 2024 06:10:18 -0800 (PST)
Received: from localhost.localdomain ([178.252.71.110])
        by smtp.gmail.com with ESMTPSA id f12-20020a2eb38c000000b002d0b162b024sm640497lje.14.2024.02.16.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:10:18 -0800 (PST)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: lxdialog: fixed cursor render in checklist
Date: Fri, 16 Feb 2024 17:10:14 +0300
Message-ID: <20240216141016.11425-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a checklist is opened, the cursor is rendered in a wrong position
(after the last list element on the screen). You can observe it by
opening any checklist in menuconfig.

Added wmove() to set the cursor in the proper position, just like in
menubox.c. Removed wnoutrefresh(dialog) because dialog window has
already been updated in print_buttons(). Replaced wnoutrefresh(list) and
doupdate() calls with one wrefresh(list) call.

Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
 scripts/kconfig/lxdialog/checklist.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index fd161cfff121..31d0a89fbeb7 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -188,9 +188,8 @@ int dialog_checklist(const char *title, const char *prompt, int height,
 
 	print_buttons(dialog, height, width, 0);
 
-	wnoutrefresh(dialog);
-	wnoutrefresh(list);
-	doupdate();
+	wmove(list, choice, check_x + 1);
+	wrefresh(list);
 
 	while (key != KEY_ESC) {
 		key = wgetch(dialog);
-- 
2.43.0


