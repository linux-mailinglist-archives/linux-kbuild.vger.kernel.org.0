Return-Path: <linux-kbuild+bounces-5936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B792A4AE1A
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 23:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019703B4EB0
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 22:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293831C5D59;
	Sat,  1 Mar 2025 22:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWrWeOu8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C516F271;
	Sat,  1 Mar 2025 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740866768; cv=none; b=YSfnAutsy/Su7afi41o0DYIMx7YCCdDllV+aHebgzGYwPMD2i2FUq3A2Kxp1Q1wGkPFK+DvvB/D153JXSqCB/ICaZE93WVpUW5QTVNgH5LvBKHHhGE1jQVWTdSnOaPpuAE+HYxwyauU+BHHXlyVcB9gWizCNaAvAoDKIh4P+kho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740866768; c=relaxed/simple;
	bh=k0IF4TI1s27h+CuL7qGATdK6mdl2VzdYKRR18nSNV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Safk/JyVx+zBERx+h3xByTWv8Yy48LEsLAw424b+1lGE44wdDvvpYI9G30f/EcxpuF7wbMjIFcx37Ow0pcz9cP6IsX4XkNYeuV0LNAQoG3tAuWP4Due6nqouo8wZQ1OOvUmLwN9BSR66+Vf7ZJm+iJpuz0+cIZQU/xTt6Gze0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWrWeOu8; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46c8474d8daso29282511cf.3;
        Sat, 01 Mar 2025 14:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740866765; x=1741471565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgbfyzwgi4YaDDp7Z2cDbzPB9by/mlp/Ew++4xg1OP4=;
        b=jWrWeOu8fcYohFzfOUkZ7j3lijnQJBVcOc2SintVVkxPoKqdNozQF89s2gvvUqG1HW
         5NFwrqv4cs1QRzjiKSp7tVi1auHXlJQSa1JyrFB1X2WdaSC2l4d+YO8UWYCfqh2RzYYs
         NiVREbhPSTm3JqjwAfPEj6S4izneC/MUrgu7JNT/WuPOGrYadGM4IgpyNK20f4FOKmXI
         O5dZZgqhe8lNJ+zZhlWhynUd3HAewYGp5REWqR2nyPc/cWK5dvt8Mr+56aOEM1H07nhS
         qysqNU8sMGlNBWZfpQ4Sgyiw/2xALZN+CupuIYrnJtMCnmYKO2DDVloBLNJa3yPyMfDH
         agfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740866765; x=1741471565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kgbfyzwgi4YaDDp7Z2cDbzPB9by/mlp/Ew++4xg1OP4=;
        b=TI+dVC9OSQVWSGdeT5tSU1K4lO4Z5EsQAtv3xhLzCivqg1c3/jExti7+OhMkYxIApn
         2yJG3FHe+uAwvVc4vBwGxXCrb/DHZ75IHG+sweTKmeGZ4ZEB+6UemcRz9pTOZUXnXjJq
         zQlKXoPaL8m4BOEqbNwg48Nnh+uuIEX0rK50y4c1ywgrrmhzf76jFeHxlRa+qTz8nqAz
         R1Rx1lmA2oHqxR89KYLgO/B8/pqN4HG7yIGvnmQN/7jbCVmRvpJoFR03CaGwKimeOXJq
         RCCAZdLfrhDhgpCHc5etV0L6h+p1yuxcuZ6zdIe1yEI+MQ0hjd+T2yRWNk68Va4mh0/Q
         UhHA==
X-Forwarded-Encrypted: i=1; AJvYcCXUayXaeLIlutyGGLeq2Vuz4gYgTj4xvMGuempqga2G0K4pC74LuD9I3aFmBxx55RvQLbv20f4xn96k0zU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75X1XIksfTlPXhDIwiCjQD9zgFpSvq0ToRDW2tAlaDfYSnFHM
	LByHCPRejYJ1wSZr4UnEFkh880wAPrJ8HqUMZn5L9uQXLWZlIIhF
X-Gm-Gg: ASbGnctgnb4ZOWHUtEoQAilhoyQETh2JL74H8mc4jCJvi+v4AXenuctJ7iYOJpYaXU/
	fPS5Sx/18kVzazENm9mwqdlRYe6yhdv1YlVfarF+5jwjOVkUmsXRvjkQrdX3Klr8ttoFFw+GRSh
	AC9FlKLZrQJclPupECWJCVVQ/Z7/6pDYbJM2C4P6VPW7r2POZcET6hW4/nUd46jDziU/EZp3bQQ
	dWXCxZiDHA3P0tyThosWF5SFQDIkknwQH/79jPxRdNLGajaTIkSOKzs53TK0pBr2TBBWlDP8dys
	nEm/2pef14EKGh8KG4uE/He8CdkKAHsY2Xu+ZHGzlQ4yhA==
X-Google-Smtp-Source: AGHT+IERib8erINFgErq49CXeKJmSuKuQ7NCMtX/7SMSnrTvjs7UzYWAhGUNb1ifruF+bJ9bv1JRDQ==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9feb:76e6 with SMTP id 6a1803df08f44-6e8a0d2c8f1mr140249656d6.16.1740866765463;
        Sat, 01 Mar 2025 14:06:05 -0800 (PST)
Received: from iman-pc.home ([142.198.73.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec158sm36549756d6.119.2025.03.01.14.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 14:06:05 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] kbuild: fix argument parsing to properly handle --file
Date: Sat,  1 Mar 2025 17:07:02 -0500
Message-ID: <20250301220702.16055-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script previously assumed --file was always the first argument,
which caused issues when it appeared later. This patch updates the
parsing logic to scan all arguments to find --file, sets the config
file correctly, and resets the argument list with the remaining
commands.

It also fixes --refresh to respect --file by passing KCONFIG_CONFIG=$FN
to make oldconfig.

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 scripts/config | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/scripts/config b/scripts/config
index ff88e2faefd3..ea475c07de28 100755
--- a/scripts/config
+++ b/scripts/config
@@ -32,6 +32,7 @@ commands:
                              Disable option directly after other option
 	--module-after|-M beforeopt option
                              Turn option into module directly after other option
+	--refresh            Refresh the config using old settings
 
 	commands can be repeated multiple times
 
@@ -124,16 +125,22 @@ undef_var() {
 	txt_delete "^# $name is not set" "$FN"
 }
 
-if [ "$1" = "--file" ]; then
-	FN="$2"
-	if [ "$FN" = "" ] ; then
-		usage
+FN=.config
+CMDS=()
+while [[ $# -gt 0 ]]; do
+	if [ "$1" = "--file" ]; then
+		if [ "$2" = "" ]; then
+			usage
+		fi
+		FN="$2"
+		shift 2
+	else
+		CMDS+=("$1")
+		shift
 	fi
-	shift 2
-else
-	FN=.config
-fi
+done
 
+set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
 fi
@@ -217,9 +224,8 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
 		;;
 
-	# undocumented because it ignores --file (fixme)
 	--refresh)
-		yes "" | make oldconfig
+		yes "" | make oldconfig KCONFIG_CONFIG=$FN
 		;;
 
 	*)
-- 
2.48.1


