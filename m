Return-Path: <linux-kbuild+bounces-964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1185659A
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Feb 2024 15:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E039B1C2154D
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Feb 2024 14:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D5131758;
	Thu, 15 Feb 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="cdCVBnDZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D1130ADA
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Feb 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006424; cv=none; b=Y0w9mtbY5Ut+Cb07poIfdwOuZ2f7jlvWn7MaltncwWtfeoek8ypY9le4s/i7E8S/AXRRe70lsKAH+at7Dudz9Y0e4AdcdV+Vz6klkiLSGfAXWsvLNQR6lfHaK/3n0cfvQ5Ta0Kj8G32lAiWG1RCeF8AADVcdgU0z3j705I2VKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006424; c=relaxed/simple;
	bh=Y6qeuARksgU+rEgbZqHNJm3BXr+2VBnjsm2duHdLWIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O1V77vit624T+u++lpX9qyhrHj8wNt7sJ9ewSgUTPiMBjQfXYsYWg29ruMWtL8wDg+TPmgQUGL1+JfQsrs7YCcT+pQAlHEHBfhx0spoFb8cmnrRchewvYoPoadcAlGYahnbumZvL6k7abBi32bk07klSaztHXAwrwDwbcUWO8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=cdCVBnDZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3d002bc6f7so86881966b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Feb 2024 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1708006419; x=1708611219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZLd9NX3ymKq7wMa9QaV0cpLQd+CyTlNqfrZR5Cx3Qk=;
        b=cdCVBnDZffml7fx5wZG0IJJ9LetSwIKOOQy7Zay4w9XW+nog88Ia5Q9G/RMVBlgYPn
         mjyyrNx0YHUWlpcoTW+VSLgP12+WpoZT2tw/5PHRub6x185I871lJj8rpBauMKabPh0y
         SPuyUSsMm63M+yEELILU45siOPiZleS3AMK3bqh0AUTVHYhcjcZhKh8gIMZGWqHWoonx
         2rO5xHBTm5j/RI6/+VMSy735CtO2OX0HJTlO+aDnctz/OW+rJ+4ccFQGpeKsdqCeWKcw
         Z+PIPnl2IYlz8pUgNI/gGuNIrSi49JMYEmAr8Cr23fkTdJwIeayn/TigL6DU2Qm67bik
         hOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006419; x=1708611219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZLd9NX3ymKq7wMa9QaV0cpLQd+CyTlNqfrZR5Cx3Qk=;
        b=vJvVZi5XhaYOqDHqCSxP/PqKloP9f+ml/0YHMYPDb58q+ctUGBzdo8zbt5pOSKyDj6
         KPCFYHli6596I4E9zZcH6kHz+JBhh908AnOe2rNnCjlh88BW4dkIBeuEe242b0dOSLMi
         WOeP6g7wCTTW5jySHGLV5LkNSetbEyoXd9LyKB0I5IzJ14/4iWTfpP0C8MliGDBKTzZK
         FxA6t1AF3obJ7xAiFWW+5wZAAguZNK8muuvmBNyk3+H0sIn54JWyE2hxyQ6gx1fx+73w
         TVHvKS9163IGKsc8KXw0zqn+LNtNR9n8+HjQAOsxnp8iMVFrrKGXxr96mjChc3PJG0Ym
         hpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVax/VftAjD2o0CREBqHvNJPUyOSQRycYKm9Ktt597rgoNqiIGSmH0Vg7aLOKXSi7W5cPIbbbFbsM3zCBIR84UcO9C1/uIt81Z5kXL2
X-Gm-Message-State: AOJu0YyLyaxvozY+STewvU/W1HyLzrYdXdHlaypcTYfWW/v53BdKzrHx
	nWW8H8nqs6Jb3k+JZ9inzAQbVIiQtbIFnhQw7c3xYfEA5wPbposkVCmlMwW8eSY=
X-Google-Smtp-Source: AGHT+IHmjoDEsfh6SH1SQF7H9GfynfhHdXsJTtUo7vetxOSexyYXzCfklwZRaLSMAQLoh20x9Vvu3A==
X-Received: by 2002:a17:906:3ca:b0:a3d:b60a:3701 with SMTP id c10-20020a17090603ca00b00a3db60a3701mr330019eja.41.1708006419575;
        Thu, 15 Feb 2024 06:13:39 -0800 (PST)
Received: from raven.blarg.de (p200300dc6f267100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f26:7100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id gs36-20020a1709072d2400b00a3d0a094574sm585985ejc.66.2024.02.15.06.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:13:39 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] scripts/mod/modpost: fix null pointer dereference
Date: Thu, 15 Feb 2024 15:13:21 +0100
Message-Id: <20240215141321.899675-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the find_fromsym() call fails and returns NULL, the warn() call
will dereference this NULL pointer and cause the program to crash.

This happened when I tried to build with "test_user_copy" module.
With this fix, it prints lots of warnings like this:

 WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x4 (section: .text.fixup) -> (unknown) (section: .init.text)

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 scripts/mod/modpost.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bf7c4b4b5ff4..6b37039c9e92 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1050,7 +1050,9 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	sec_mismatch_count++;
 
 	warn("%s: section mismatch in reference: %s+0x%x (section: %s) -> %s (section: %s)\n",
-	     modname, fromsym, (unsigned int)(faddr - from->st_value), fromsec, tosym, tosec);
+	     modname, fromsym,
+	     (unsigned int)(faddr - (from ? from->st_value : 0)),
+	     fromsec, tosym, tosec);
 
 	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
 		if (match(tosec, mismatch->bad_tosec))
-- 
2.39.2


