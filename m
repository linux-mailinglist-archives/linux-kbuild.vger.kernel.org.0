Return-Path: <linux-kbuild+bounces-2007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C208FD496
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 19:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8DC01C21616
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 17:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0341A291;
	Wed,  5 Jun 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnpEbSg9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5F19D8B8
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610367; cv=none; b=h4D6jXPhDDGwRSfQ13uKr3MU3sYdQxvBZHvxy7M6KUTOiab6597gvyEgDCY0zl28qSN5V8RjoYZHESkjIYWFQVp4CKIcRioInhUwzSaH9VXrfGhOvZpYC/753PFrxvcIysDWtB2pPgZFn680FZ4Rrk4oQiiABXcTBk8/qjRM56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610367; c=relaxed/simple;
	bh=pt8SwmDVMxAUy1cwJIU8aDgkKUe4lnAmrVH6rEN81nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4MloLmISbG95wi2e+39oRPYigFJVrbalePcljwMMSZH8Fmapzcv3FuqD/SA1HDsJxt1M2jtIj1zss2h42JMWKQrDDwbDvdhII2tK4ALcoT8/f4lu9dQYwlPUWJJ9kUa5ybXIaaq3i7PafWstGhzF8tuyLaGfQXX7ho3aoH61fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnpEbSg9; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792e4c2a002so3316185a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Jun 2024 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717610365; x=1718215165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhfk+eU18EQKvjc30JroO+wyxIgCWrEK/r6s1ncbrqU=;
        b=nnpEbSg9fUE9nb38hIFHYqHZsVSH03INvpdbTBnG1iC4oUgTKX9sKpcycC7PKZ+6T8
         gmhSTXzz5hKrw8xLygvvNfwEgJ/MxDB7fXggsdJGMVTl8uyBYtzfZvH8KVfqt1DKq7Zl
         XcI6nfOD7FgMWBf0MuUWJA0oXqIgRFw6A4X+K2ur0wg07N+1Eb0hjt6DDDpvtAmSZiP8
         14ou0Y2OHOh5iDFRRpgwu3QPnRUbdOi0MbUdt5W1lrQCJYEiWEvuQDsOOG5q+5qS/Y9z
         Ykg/jLeh4WtOD3zFXbHqHA/29RaofFjg2GQsuAC6fIFMrbTrUs408zBHYZlGLWVBfPoL
         uI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610365; x=1718215165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhfk+eU18EQKvjc30JroO+wyxIgCWrEK/r6s1ncbrqU=;
        b=H8Jd/YtjVvaOUJVycR5ChQdX9r+VSWU4GqJ3uOCiaruX0QXI3LPt6ACOaOaKESzUBG
         gxwgIuj6LphMzBKpPtbMaK6k99H4HEnWgT7scZgUDIWAoOSBxrvPk3VkiualcQ7ciVWT
         oEP5qYeZ8jcHb1hrYNsZymw49nTt0mofd7d+D/JZxf3MAY2ilyTtxKXCrJowJwwZ0jQf
         W6GgadRpIxvy5jN5FbbOL4wW/ZQxYxxhd4anN0rhe9JVWhV6MxcACYqn7hf5Rcfr4NFa
         tkkyEh9AUHhGY/VDsOqzDaOeOxKe9jfWfsJvfAwy5q1VRjpjnB2Tg/C97e5kDzhI8xwH
         sUXg==
X-Forwarded-Encrypted: i=1; AJvYcCX4U1MbGv8W7X+RkJErAm/LYHRy+y6U+r+l7qq5Db2GfLg3cQmJKgjPQv0eVgvNu6952GZEEHoUszDijFXVAxZcpOAT8lPI6MMI7Ml+
X-Gm-Message-State: AOJu0Yxa+M5M/OgknXMoAA0115JEX+a+glGmcvLURBBsjAoPGnrbUHrY
	IrNe2xD1WTCruYyKytOc3y3CIVHMZyrqbKf+p4yztTIPnx0zGGhB
X-Google-Smtp-Source: AGHT+IHUwhiziNeBYFcCazL6pjo8FXEebZXvTsye2nEZPWko03JQMXem2aan5/wcv8B/Tho8hIoDCw==
X-Received: by 2002:ae9:c119:0:b0:795:18f2:afa7 with SMTP id af79cd13be357-79523fc1920mr315581185a.55.1717610364634;
        Wed, 05 Jun 2024 10:59:24 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7952eec4595sm11879385a.108.2024.06.05.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:59:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kbuild@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH -next v2] kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh
Date: Wed,  5 Jun 2024 13:58:09 -0400
Message-ID: <20240605175807.106447-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
script"), the mksysmap script was transformed into a sed script,
made directly executable with "#!/bin/sed -f". Apparently, the path to
sed is different on NixOS.

The shebang can't use the env command, otherwise the "sed -f" command
would be treated as a single argument. This can be solved with the -S
flag, but that is a GNU extension. Explicitly use sed instead of relying
on the executable shebang to fix NixOS builds without breaking build
environments using Busybox.

Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 46ce5d04dbeb..518c70b8db50 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -193,7 +193,7 @@ kallsyms_step()
 mksysmap()
 {
 	info NM ${2}
-	${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
+	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
 }
 
 sorttable()
-- 
2.45.2


