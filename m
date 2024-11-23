Return-Path: <linux-kbuild+bounces-4825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBE9D693F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 14:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E5BAB224F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17A3192D87;
	Sat, 23 Nov 2024 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVLw7AVR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08423098E;
	Sat, 23 Nov 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732368167; cv=none; b=HhLVR12IPMsHsjW0RJJVrcnJ8nD+AVwX8qD1uCrEEnr8/dHymRZLkBCUKxMdC9ih1qmYpLmP39jtottCsfMHVL4YXl1uM8Rhpq7LW7xlBhupTGJjI1keJ/5G3aqAEEVFMKgVvN+xxbsKVfb96J/nm7HtiifocKTTuUtkHtNAnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732368167; c=relaxed/simple;
	bh=u+xU6hF2ALpBqo27jd57izIusLQG0j5UFpBEq8h+J+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEQap2NM721awvgvJdFBNvR8r+Xe3PC/89Nunn2kTs7d1DuKirL449s+Cawzx+JP6G33HOq8wSc0I7COPiIEW9VVMzdy9ome/DO6gVykLbyhSdC6Fw4Jp/Szah6d+sRg08BAFsvEb2xjp6/iZpQzRce54M2jQpik3yObHXxN+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVLw7AVR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so3418499a12.1;
        Sat, 23 Nov 2024 05:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732368164; x=1732972964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IGzf9BRRTcrEVcKS6ohYpvMWrqtdZPRubCJXMVA5TA=;
        b=TVLw7AVRMlT2FN0V/VC7NlW/QCHRgjgvIZ9p5Dmdv3LV32kINUdDav5qycvHZkws5C
         irwiChSuLTaNt9IoGhXZmKrmr1JI1dKGpDdT1rbiMu6vNU9e8QZNUxzFzAQQExIk27Wc
         9kUg4QX3AwcxE236l/KEfN7xqu/O9NFG/uDYZzWTSsHA6fiE+wTD+tozaj+zXcpt6Ubu
         NhHtR5WVp3j25u99MU69Srs6XiCMkgebmvejiOUcOfI6oGstKi1otF7fMddzC2CFRIo/
         NrGfeGXWpyj0E9lvnZikw6XFRvHmX92xCRNmWfE4WJY4YCJqX8/aiYxmxS/CKG8qgruC
         Q6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732368164; x=1732972964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IGzf9BRRTcrEVcKS6ohYpvMWrqtdZPRubCJXMVA5TA=;
        b=ikHh6+mRwFdRJxrS3yatWNkXaCm7HSh0Ib+bNNGkWiQo4spTodZQZ7J+9JvVE55wg8
         NuSObhnAR2gUf/cA9x7CeP0I7hlCM0/tXB+TXkn7OKrGdH//ODDA1NZdZI/lvT34+MkK
         PLqmu4pg46/WINKVlyro6OhC8PBUeRExi11TOGGsurfvUOepBTRsLCXAyC6B01Wm9vv0
         1RoKKYfvCos4FsNMg8X+bzzTY5QF4ed7loLREwQI2URU3JxdS5o7MdsQ09cOgvd6Eh4B
         iC6xSPOK4zOorveWUkhjwmAmSvqkEBz/T47/xqltF8bzYgMjDEJ+akqPjf3hXUtZKqMi
         GMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHdvPQLjxSLWrfAD5vG7TG1UDqoPmVOgeerfoDVyzofaBIzwBPW6AJq4cWdtihT4eN+3ayXKkZ7PK/VhE=@vger.kernel.org, AJvYcCXqGr/KOulACZBcXDUL7QDVSkiKchrv8paj+fqWtJ5idNFKNEoJR4Ri16n6ERoVdVEZOjcQcYYgBcYvs//b@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJuTIQeI/reQ1ltVhvBC9e3vXcsl8bEJ+t8HM3dpkXf2grKgZ
	fadswTg9bMQGN9wRZ+wPos8is9YvddINxIlEUiNDkUz+IrGXaKFN1i63PdFc
X-Gm-Gg: ASbGncsVmWWqn406WanLD7zkhcQc6W+6qdhbAtm5cIaxIzDa5WvEQl6zRcFKE8ekKaY
	6NUH3BKweIa5VbXDU2gDOfLJ1hKQ8UYn3dKFWeU8Les1g/ZBgLCCeH7lxLOwS2GTHeDbWKfYieF
	9AYR2PJJ2+qjcEd+w579aQQGqYupcD3796amKWr8zTOd2QQb4UISfm/aS2IlHDI0IodgPJ72hbj
	2NI20yl+Os6MB8TbUVDTqRxv2R39A8vj8F11hwC0Ly7gCS2leJGv2gqjb6SRmECCg==
X-Google-Smtp-Source: AGHT+IFa0qQOCFwGqNOj/5C+CzSywUmQYaGfQnGL1L8+BYthI4cRV7YXIWRdAGedrN9LNCvqiEfDjQ==
X-Received: by 2002:a05:6402:28a4:b0:5d0:214b:8f80 with SMTP id 4fb4d7f45d1cf-5d0214b8fffmr4367714a12.21.1732368164100;
        Sat, 23 Nov 2024 05:22:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:3030:a:6268:4624:5b8b:5eeb:b500])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a3bfdsm2016514a12.5.2024.11.23.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 05:22:43 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH] kbuild: Fix names of .tmp_vmlinux kallsyms files
Date: Sat, 23 Nov 2024 14:22:05 +0100
Message-ID: <20241123132237.15700-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For details, see thread "kbuild-next: .tmp vmlinux syms files"

INFO: This patch is against Linux v6.12.

Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm4vSVKkXPTg+Q@mail.gmail.com/

Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 scripts/link-vmlinux.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a9b3f34a78d2..c9088436baff 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -203,8 +203,8 @@ kallsymso=
 strip_debug=
 
 if is_enabled CONFIG_KALLSYMS; then
-	true > .tmp_vmlinux.kallsyms0.syms
-	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
+	true > .tmp_vmlinux0.kallsyms.syms
+	kallsyms .tmp_vmlinux0.kallsyms.syms .tmp_vmlinux0.kallsyms
 fi
 
 if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
 	# Generate section listing all symbols and add it into vmlinux
 	# It's a four step process:
 	# 0)  Generate a dummy __kallsyms with empty symbol list.
-	# 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sections,
+	# 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and sections,
 	#     with a dummy __kallsyms.
-	#     Running kallsyms on that gives us .tmp_kallsyms1.o with
+	#     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.o with
 	#     the right size
-	# 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms section of
+	# 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms section of
 	#     the right size, but due to the added section, some
 	#     addresses have shifted.
-	#     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
+	#     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
 	# 3)  That link may have expanded the kernel image enough that
 	#     more linker branch stubs / trampolines had to be added, which
 	#     introduces new names, which further expands kallsyms. Do another
-- 
2.45.2


