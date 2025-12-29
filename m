Return-Path: <linux-kbuild+bounces-10350-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B1CE6972
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 12:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB93B302ABA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 11:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3032D47ED;
	Mon, 29 Dec 2025 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PL/4fliV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAAD30DED8
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008720; cv=none; b=p/6TE8YKX8iPu6cpQJ1NlQZNd6MV1S4XOlxZ5NzTJiTYheMkvFc+xak4+OAK2ZA5hk9p1RuQ3fnu+oicD1mmxoCoZNZeFxgUrZp/NBdt9GC6JPw28+IGyJtsF++S17wDvsrCWaNjwgXIKPsI9JKxtB+7YahS4LvzQ9Tl9J1CsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008720; c=relaxed/simple;
	bh=U17CiipV99tJxb5bl3yvI3ODUrvvhu+idhOO+vgSEdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/SB0BcL1A9FPDFWXUbN5IntUzC/2w0HmEVU8U/7kGhF7aVZMFSCaqiIh4O9oGRwbYzmieK4RLqCW83ibDCZxqsYp0V3lNntKFMC6qnSWdqMtqAO/iz7sGNnxNpqNrxacAv9dDX6SlD9zLGhTK3z0GV9OsRlzK1eCZtlFNQfl08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PL/4fliV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5957db5bdedso10369815e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767008714; x=1767613514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+j2RfmhG2P7RkXIgKc8NiLZhEGOPPRK3h8OXTdV5pA=;
        b=PL/4fliVmjJWYm2mDf51iWFKwz0kgE/AxWizKkAdFiCQi7haGOK4AEzLmzMrzw0Mdm
         lwHfZIszU8b/AoPRYZWlRQKAHg0fcAoGI7OLhd/NHNTlCEuDdvDi+u02axULEOQwcl+D
         EqK0hSzSVqPiyafC7a3WonohzK/urW8zhuzDjMv0R745L14O5QA0Gxj4WB+DxGUalEKw
         Bmc6MKmUu2xDM3Rifs7m1UBupqs26aaBsTJM5aPxj0f5tPayikAQWkKzTOok28sUTmsw
         fCxfgD1tEHI/bM5T8AFegjN9YvCId+qGtl37KK8xlIfuMXc+1DnbcNn+ZbbQ3n165aly
         Cj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008714; x=1767613514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+j2RfmhG2P7RkXIgKc8NiLZhEGOPPRK3h8OXTdV5pA=;
        b=JIE3sYjmyNTDoNHJ+HxKR3wuh8c0t9gIJ1qULn61i3YZJDcrYFXXAz3pEZAb3/mjD8
         +pr+akMf2zo+PpzhwnZnwyJ1iGbvg5/AZZRmywWrLYyPtIo63mDHcG5yrekB9iQNdQfc
         riPiC7j1wKaCo4aRhaf+De1hacchvLY/snak35UooNewCKgo1JVhOfMAqCBMgcAGPe+F
         R0ksO1iHMznQuh6DG2WhLI3sFF9XbhiAw2pD49OiaDRb178Gyjbg5pOp9qVrDXeU8WT3
         JfINfgMSejZeDda0rw9nFvOjkbnUTX94aPzISSmLSp6BgHDzxqiFKnyct5aoFjScsuXP
         O7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXayiaSQ7JQaNWaNp8qgv+t87kE2zylisgomaal5a0+78LuIgRvWynYw1O/ziL/Wm7SC54BqryZJQNWcJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZtWqEY8/7Afyo+vYPqafsr2kYjQtWdeEN+hB+T6Qt3Gk+klv
	3i/biPpqM3udiE61HStEFw3q+MDlnvWlDc1cvqeMdMM8YlIw8YeKblM/qpKQDuwkK3Q=
X-Gm-Gg: AY/fxX60epDtYzi3yKijA9PAN+cZhm7TvwZ3fAaWAvj5i9QTkeIw4859bzgEF9OqLMd
	3xEjYszKW2TxFAr0UMUgK0C+jbgVjj1vvoDV8qV3gkBfJoQTn4lhAfv/zs+YjMavNZj3ZzBtxwQ
	MqI52FK0mwNsb4SBh1Zpc1u8dsnpTdmNsV7Up9cT8FQgKbtBqGiXf6jn2SZFYmBJXrEBpa5LwCB
	cGrikQK9SFxbxleZ6Mhmh+ZiMl8LZFJ4NBwm9SNFf+nykPyWdm0+o3x0nRKo3IdDA9iPJzw54E7
	9pYmeMeKn+thXKmzsdCshN+yzBMbzAgCMDT3diYd/sljqCBD1vhxmhS0MgkVi6mGbdbILuIFFbR
	0HI10tfRzQpaOjbn13GN9fYxc+cJub7WI+HdBMaDFd4aPAuM18fr6eAu7+rBSIyTjouUCZpys2L
	JiWpUJCSquS7UQ4j3A8oxRUnEkNdxZsnrggVwMOpLTk7us
X-Google-Smtp-Source: AGHT+IF17Yhf8RbxeDAoPczyvZrBsuXq49KKZ+PuMJ+YskyyFNVG7eBi4v7E+ourdAITJ38fOOFtVg==
X-Received: by 2002:a05:6512:3191:b0:598:8f92:c340 with SMTP id 2adb3069b0e04-59a17d7768amr10594632e87.52.1767008714356;
        Mon, 29 Dec 2025 03:45:14 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d59sm9239711e87.61.2025.12.29.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:45:14 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] scripts: kconfig: merge_config.sh: warn on duplicate input files
Date: Mon, 29 Dec 2025 13:44:47 +0200
Message-ID: <20251229114447.45236-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251229114447.45236-1-mikko.rapeli@linaro.org>
References: <20251229114447.45236-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

External scripts like yocto kernel scc may provide
same input config fragment multiple times. This may
be a bug since processing same fragments multiple times
can be time consuming.

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index bc6b5d0a69bc..0996bf118325 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -128,6 +128,8 @@ trap clean_up EXIT
 
 cat $INITFILE > $TMP_FILE
 
+PROCESSED_FILES=""
+
 # Merge files, printing warnings on overridden values
 for ORIG_MERGE_FILE in $MERGE_LIST ; do
 	echo "Merging $ORIG_MERGE_FILE"
@@ -135,6 +137,14 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
+
+	# Check for duplicate input files
+	case " $PROCESSED_FILES " in
+		*" $ORIG_MERGE_FILE "*)
+			${WARNOVERRIDE} "WARNING: Input file provided multiple times: $ORIG_MERGE_FILE"
+			;;
+	esac
+
 	# Use awk for single-pass processing instead of per-symbol grep/sed
 	if ! awk -v prefix="$CONFIG_PREFIX" \
 		-v warnoverride="$WARNOVERRIDE" \
@@ -256,6 +266,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		STRICT_MODE_VIOLATED=true
 	fi
 	mv "${TMP_FILE}.new" "$TMP_FILE"
+	PROCESSED_FILES="$PROCESSED_FILES $ORIG_MERGE_FILE"
 done
 if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "The fragment redefined a value and strict mode had been passed."
-- 
2.34.1


