Return-Path: <linux-kbuild+bounces-2783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BF945DFE
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 14:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A84E4B212F3
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEDA1E288E;
	Fri,  2 Aug 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qT9vfXZe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7D14AD38
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Aug 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602570; cv=none; b=tdzOc8snNIkYMgUW/u6gsssrdGarv3ySpLhHxdcooSMxvtnQou2Uv8wuSlGI4fw9QuTJDXMhQ+nbiJoVqwxsO2jrIJqPuDOOv4FxhIXhFHFQK2OoTpUHkihMMKO3SPa8Mn53RmX2hIlyyrkQLpK+gDMgz1XiU52Dvqn0ou4jhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602570; c=relaxed/simple;
	bh=JQbHb3wb9GmZbLb2lP1xsq9he0gRLzjMXI3ALAcuAVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ajh8bOF7hYZ/8bquHnd8FPxEMrb4o/jGUFK/BUoYPdsgYMYmG7WPzcv4a4rZ4zVRGst/VbEJiHQxE207kLOcvxreITOcceJEDSIHxDFILvQFFOa73OH8PLc9YPRo7cI3gaC7rigRaUy4zYFKfB4IDHbghdAzIg9CywCFCfkPkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qT9vfXZe; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1051360so89579041fa.0
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Aug 2024 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722602566; x=1723207366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CrcFEM9bWKbHe8BdVEa2eoVCT4l9ZPX9mDywu3rn/YQ=;
        b=qT9vfXZe+gRDZbXS+i9Eg0fV0n/SguvHQbm6LBUZRkMCLCu2Uh4/mUuh8QGjl75tN6
         RIorNPNdNB9nWRvmhUJ9HIWJT7SXyyHwGDkziSu5FlWB7kClz+LnxVZo461bT1/d2sCr
         mCf15e6pJQNsG1l8ZTXVeYaJZTbO9BXlD+Cw0HIfTRKRhe40xiKLXT4cARPfYrrRjUN8
         Z9CeWzYTe07yQ2OZaUcFvZnpI+OrQN85CqT/DpowoZw++909B7cZ/0G8JbWhcmPBY3tR
         Y6uwxTdWH2tVjpbh/a1JvsarmpsNsKETXLiLn4LGDasU4MuZSe9ik05woQbJM7jkEgzv
         XfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722602566; x=1723207366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrcFEM9bWKbHe8BdVEa2eoVCT4l9ZPX9mDywu3rn/YQ=;
        b=WfqYdG6ktcE/uVBo0ST2UxXPCSpr0urGg1T/ZHcU1gmEW4nvIj73/JUcMzW32HgDKM
         1Rcm8lJ6NCLwYo1pMIuUESKk9Lvt3SU1kV7un7PAx8mWht2CtCHOBXwP1c988M9FBT+p
         sGHEDvTSdsYl/HZZHluAELJuRtk7trGx3uXWBCFfh2sAoEF24ekjfls6nWd5QZQO9TS7
         SzOj4iF5EaFqV0cyKvfAKub/W7BrYMc75GtMhOD+OiBvtr1IbysgEtzlRcWJggbw4dsx
         k5IXfZYtKqJ1+a+btqnzIHU2LTDH0uqZlGRqfHT8e2DBkl1tQ0Pk1hD9SE9XkcZB8q+d
         NDtg==
X-Gm-Message-State: AOJu0YwZvBrlJ91v5m7474YrfsIaABFXrcdkuQ44FR3PaICt5ml5dPfZ
	fJW4okbBwU4ZDpeJt4VA25vx36t5WtCFkizB9sNEda7vH2I9QbGXFmxnemLDcdE=
X-Google-Smtp-Source: AGHT+IFFlN2cMSr0vXkJIVvYd6FpLrCrmugN2ZmipRM2wW30hpHdftDoxaWrrrkBjnMizoNqG6qvKA==
X-Received: by 2002:a2e:2e03:0:b0:2ef:2543:457c with SMTP id 38308e7fff4ca-2f15aab06f2mr22014211fa.24.1722602565947;
        Fri, 02 Aug 2024 05:42:45 -0700 (PDT)
Received: from localhost (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e1864ebsm1512601fa.26.2024.08.02.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:42:45 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] scripts: kconfig: merge_config: config files: add a trailing newline
Date: Fri,  2 Aug 2024 14:42:36 +0200
Message-ID: <20240802124236.2895857-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When merging files without trailing newlines a the end of the file, two
config fragments end up at the same row if file1.config doens't have a
trailing newline at the end of the file.

file1.config "CONFIG_1=y"
file2.config "CONFIG_2=y"
./scripts/kconfig/merge_config.sh -m .config file1.config file2.config

this will generate a .config lookingn like this.
cat .config
...
CONFIG_1=yCONFIG_2=y"

Making sure so we add a newline at the end of every config file that is
passed into the script.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 902eb429b9db..ce1b77ee043b 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -136,7 +136,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
-	cat $ORIG_MERGE_FILE > $MERGE_FILE
+	cat $ORIG_MERGE_FILE | sed -e '$a\' > $MERGE_FILE
 	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
-- 
2.43.0


