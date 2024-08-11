Return-Path: <linux-kbuild+bounces-2934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518694E147
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Aug 2024 14:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2C71F217A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Aug 2024 12:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B24647F64;
	Sun, 11 Aug 2024 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQynGlmc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6C441F;
	Sun, 11 Aug 2024 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723380749; cv=none; b=JiwlaEFypLmXoZRTCPtBB+hMuXxp3236MGmUkokMOwELlzoF86VAI5auBOimKpLpRtB+nqNfLMyqLANBHRmUMDQuAh8ab2W3NU00dAG2XT3LNyBNINQkIxIjqeINx0aJGtlhCtJ0pWWdnwdQ86bNsW9nldkclXSk3H98cxt5ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723380749; c=relaxed/simple;
	bh=WdElzGY7aR8mZowAM8w3IRVv2J4wkevPaljOjQZKnmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HbRL0S3vob0Bula/KmB4Byww8Co/Ac8+xB9Pl3biS95R1+8Wy+QFrAKh+rDisbjN5g3bQlZ+OxWzdnj6zexV0hcGNiPSHmjhjXPNghBbIPIzAYTaBubkaxfA6a0EX2ohtY0cUdwBW15Eh2lVAqmMXhYaCPAPuIeaoURkIviyMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQynGlmc; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093ba310b0so1524471a34.2;
        Sun, 11 Aug 2024 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723380746; x=1723985546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTfzU28ds2lhNVbW5LCx1QfX8jZBtBYy6jG1aASeDKs=;
        b=eQynGlmcGX4AdsriClVSHMEl8SwOz/GcK7maliUNHcckldLbvzO78iYb04YIXcK+Sq
         XqoRha2yw9H5L03yti/N9P/YkrJuDnA6IrBToM1csBHpDe+DWjzEkBWMsuFkT36zGKk7
         +R7diFXJATNo9iFITX5Ie3YRwVT0yUQgyUiubLmeGz+XI/roFjlDOMVZWjQjRNaFU4sE
         Axij+irf9s2kU205f9i6cb0xtnsO3i4sAaIpXgLgh62XqOUuzbrFmWzkQ+mDKhl7LM17
         BB75/uyi52/ae0yN2Imqw/CU7gzU276yal2jNJLdymioj/Btcm1fQP/c4+r9x4mKvap0
         AcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723380746; x=1723985546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTfzU28ds2lhNVbW5LCx1QfX8jZBtBYy6jG1aASeDKs=;
        b=Zv0OCCezPZ3aJEXgBoc542rzUqIs7etN5pLlkBMzAD6jKEvTYsZ1wwfNNoUjh8lGi2
         zqNoL8DQKIvRQG/afVIZ31p384qJzNAY6pUtPggHK85G90pLLX07vpQvdAZci683m4mq
         jWr0FO8ETLb5lnMRioIE+KYev2EDHRmIf8CXXx3hTQfkcWjhDzQn3TsQR48SGABtYc+Q
         LopRfqwPkI4G3OaFTreIZqS4H/FEApMiOqQHIV+Cdtgjsq2AuoEgIS8xbJSm0Z8gKEy0
         3EXo1uod59HrWlT4pi5t/DvTdtsk/5hT0yLQJlnqVJNRSeAkY1+lCG2rcTYxqcPUzLry
         Gnfw==
X-Forwarded-Encrypted: i=1; AJvYcCWDq3oSIWhWRLpNTQw3+nLR2au9qqcQdrVKdKfzLIOW87pNONUT8LjmO+YkD8fNdu5BSHA1Rw/CxnZF8xD2UYzimqWOOp49RXw13jg9My3qRsgRIh00GHLD6kcSjG2f9sP1YLx1XIYMEDJ/
X-Gm-Message-State: AOJu0YxbBL4h4C/jo8BhXbM9F5MZLpGPxp+Ps7gUv/JJIl0U3S/pa9FE
	qgRnvx4HSy7Ct5ngpOobU+3WobKcvg9HLxFoZbxUMbWKMH0f0uYOAP8xS2fp
X-Google-Smtp-Source: AGHT+IHuaKVgZDTiOIXFNwyqCYMJa9aukyn1bY7sx8VIIMzAYBrrWz42nwWEjA3wYgs2tkEnrgvwyg==
X-Received: by 2002:a05:6830:6285:b0:704:466b:15a2 with SMTP id 46e09a7af769-70b7483729dmr8755701a34.20.1723380746331;
        Sun, 11 Aug 2024 05:52:26 -0700 (PDT)
Received: from dev0.. ([49.43.168.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c64b14sm6413126a91.5.2024.08.11.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 05:52:26 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	Abhinav Jain <jain.abhinav177@gmail.com>
Subject: [PATCH] scripts: Enhance vmlinux checks as per TODO
Date: Sun, 11 Aug 2024 12:52:18 +0000
Message-Id: <20240811125218.45759-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add checks for ELF validity, critical sections, symbols and static
linkage.
Zero warnings/errors as per scripts/checkpatch.pl for this patch.

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 scripts/extract-vmlinux | 68 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
index 8995cd304e6e..2c35dde8a8ce 100755
--- a/scripts/extract-vmlinux
+++ b/scripts/extract-vmlinux
@@ -12,12 +12,70 @@
 
 check_vmlinux()
 {
-	# Use readelf to check if it's a valid ELF
-	# TODO: find a better to way to check that it's really vmlinux
-	#       and not just an elf
-	readelf -h $1 > /dev/null 2>&1 || return 1
+	# Use readelf/nm to check if it's a valid ELF
+	# Check for valid ELF, critical sections, symbols, static linking
 
-	cat $1
+	# Check if the file is a valid ELF file
+	if ! readelf -h "$file" > /dev/null 2>&1; then
+		echo "Error: File is not a valid ELF file."
+		return 1
+	fi
+
+	# Check the ELF type (should be ET_EXEC for executable)
+	if ! readelf -h "$file" | grep -q "Type:\s*EXEC (Executable file)"; then
+		echo "Error: ELF file is not an executable type."
+		return 1
+	fi
+
+	# Check for the presence of key kernel sections
+	if ! readelf -S "$file" | grep -q '\.text'; then
+		echo "Error: File does not contain a .text section, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! readelf -S "$file" | grep -q '\.data'; then
+		echo "Error: File does not contain a .data section, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! readelf -S "$file" | grep -q '\.bss'; then
+		echo "Error: File does not contain a .bss section, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! readelf -S "$file" | grep -q '\.rodata'; then
+		echo "Error: File does not contain a .rodata section, not a valid vmlinux file."
+		return 1
+	fi
+
+	# Check for the presence of key kernel symbols
+	if ! nm "$file" | grep -q ' T start_kernel'; then
+		echo "Error: File does not contain the start_kernel symbol, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! nm "$file" | grep -q ' T _stext'; then
+		echo "Error: File does not contain the _stext symbol, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! nm "$file" | grep -q ' D _sdata'; then
+		echo "Error: File does not contain the _sdata symbol, not a valid vmlinux file."
+		return 1
+	fi
+
+	if ! nm "$file" | grep -q ' B __bss_start'; then
+		echo "Error: File does not contain the __bss_start symbol, not a valid vmlinux file."
+		return 1
+	fi
+
+	# Check for the absence of dynamic linking sections
+	if readelf -d "$file" 2>/dev/null | grep -q 'Shared library'; then
+		echo "Error: File contains dynamic linking information, not a valid vmlinux file."
+		return 1
+	fi
+
+	echo "File is a valid vmlinux file."
 	exit 0
 }
 
-- 
2.34.1


