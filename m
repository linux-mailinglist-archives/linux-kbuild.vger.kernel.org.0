Return-Path: <linux-kbuild+bounces-4085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C099CC7E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 053511C22DC3
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CB31AC447;
	Mon, 14 Oct 2024 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evCeyza/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802841ABEA1;
	Mon, 14 Oct 2024 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915245; cv=none; b=Nrv4hwUF3949eBcQYGj6HMcS7mD7OF0fPj2jedgCbdr+fJftgMnAPO06PoCUr5vYbbpD4eK+KVmnJj/WNNqnHqkXuCuzMs1BVzfeBhNADpvRwFfSiSKTtCm+jU830NrH5zLpvSZN5/o+g6JZJWcCI/RZDcw0GQ1Dh76Tb/ZKzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915245; c=relaxed/simple;
	bh=V2TJKur96MQBAsiBAIRuq4SPj6UoJEDjYMMuC2O7z2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Db1FI64bkcADK55CUQtPZvs8l6w7pg4in3GZfKRnMTOynN23WxNCsmDT1Cs3paEprpRvXSWBBv1Y5YHcGEtmwH+Fdkg/xJmtdeEp7FIX0JEev8DUTziGlbCZhCmh4DwPW1IZkBFYJ9UwgmWZzBsxt8qGyT/P8C2cPjjLaHttbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evCeyza/; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso3574636276.2;
        Mon, 14 Oct 2024 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915242; x=1729520042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ModGDwAVNaT898Y7/KmRR4uIfWf8h5q3e45n0nGhtz4=;
        b=evCeyza/iCMT9vDPNe62W4fCQDxvRa62qg+o8lP1S6SFTtZwE60YxCPks+zy/teL+Q
         ZX70a30Q09X6AKJPj7XWv1sWgvkEgEoF9Xmf+M6+OK34BbGe3/62HZ81WEGlE4tc2h/+
         BNAXzZxqBeB3wjMfG0uobMeXnjeSX0S9Z8ToSJ+d930jPI0T2WAWMvc//kuhpVYTgz5L
         ElE6NIQ3YQmqZvu9GNmAxsfn68JNUDKrvBss7xNBZTy54JuKFC6ZZG9Jiyrq2FW9XAVO
         z8B9hFbOqAEpjmWcjIrtZ3QnDJgKGzbCH5gtVrh9CVq9DJdW06Yf86AaOryT1LJWSTAm
         Rtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915242; x=1729520042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ModGDwAVNaT898Y7/KmRR4uIfWf8h5q3e45n0nGhtz4=;
        b=w6/xjJbdafWXWLL+qhL8V6hICyZamvHUpcgpkM3RLMaoQWcQSe7R85HJah8DjWbsJ7
         GBwNuR1/FfFHpuPZ2iZ/fAHDbbYmUigxpEoRiGEAmpXozhLtygb0v/5XqZa29SjVrf+n
         IAZ38k+EZKRIZPrfChIyBsnRn6RMlfHrQfL651aq6+ugTEodKISK15BNsnya+lNASFPK
         xHVxUb7wf1QwZ2F8g8V3OB89IXSuFV9eIV35/EKpFQldLEjyyxU36rHtXiONsvlc6ATm
         WOP0MdKCPxCuhNU3zXMCzgWRPE8DvWJ0UA74dKSpCNeDNUsYpM5zkqZR3If/RNSK6gKE
         A0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz8O5MD/mSbBRrfPkDqnwcz3jHN+kErjQm6Sm9nYRbA3jheBL8w4NZXboxuvaKH/pK/FTewxPd0jjyIPU3@vger.kernel.org, AJvYcCXfxcTMX5EXX22red7Y6HvjIogbx47DISvyvjeARbEdlOj065P7UEiLwBIC/kbeWoL5uLrSDl4B4WOaYk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8l3xkMd9SHMzX0IRiAys0f4lP5+ic1wgzXY/ysQFawiBRQOjZ
	YkSwT52hpYbSG6+SzIjgj6UQQRKOIOlLvOtT4N1mFCONz+RBdhmC1jG40A==
X-Google-Smtp-Source: AGHT+IExOMlVqsd/HgALwQFnv+8NBWh8x67EbTyQUKO6xFYBa6JOotQB7N+5TBO8o5wO57a5Ead3Vw==
X-Received: by 2002:a05:6902:f81:b0:e29:2e6b:f830 with SMTP id 3f1490d57ef6-e292e6bfad0mr6308033276.57.1728915242529;
        Mon, 14 Oct 2024 07:14:02 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ee00675sm2449601276.22.2024.10.14.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:14:02 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v1 4/7] streamline_config.pl: include tool to learn about a config option
Date: Mon, 14 Oct 2024 10:13:34 -0400
Message-ID: <20241014141345.5680-5-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014141345.5680-1-david.hunter.linux@gmail.com>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include a debugging tool that can help developers find out about a
particular config option.

It can be challenging to find out what is going on behind the scenes of
the script due to the vast amount of config options and the ways the
config options interact with each other.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index f5a07b3a1922..bbcd5a6e9726 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -713,4 +713,53 @@ foreach my $module (keys(%modules)) {
     }
 }
 
+# the following tool can be used to check a particular config option.
+# You can read the output if the variable "debugprint" is set to "1."
+# Here is a sample way to use the tool:
+# dprintvar("INET_ESP");
+#
+sub dprintvar {
+    if ($debugprint) {
+	my $dconfig = $_[0];
+	my $fconfig = "CONFIG_$dconfig";
+	my $con_found = "";
+	my $dep_found = "";
+	my $def_found = "";
+	my $sel_found = "";
+	my $prom_found = "";
+	my $ori_found = "";
+	my $proc_found = "";
+
+        if (defined($configs{$fconfig})) {
+            $con_found = $configs{$fconfig};
+        }
+        if (defined($depends{$dconfig})) {
+            $dep_found = $depends{$dconfig};
+        }
+        if (defined($defaults{$dconfig})) {
+            $def_found = $defaults{$dconfig};
+        }
+        if (defined($selects{$dconfig})) {
+            $sel_found = $selects{$dconfig};
+        }
+        if (defined($prompts{$dconfig})) {
+            $prom_found = $prompts{$dconfig};
+        }
+        if (defined($orig_configs{$fconfig})) {
+            $ori_found = $orig_configs{$fconfig};
+        }
+        if (defined($process_selects{$dconfig})) {
+            $proc_found = $process_selects{$dconfig};
+        }
+
+        dprint "config: $dconfig\n";
+        dprint "config found: $con_found\n";
+        dprint "depends: $dep_found\n";
+        dprint "defaults: $def_found\n";
+        dprint "selects: $sel_found\n";
+        dprint "prompts: $prom_found\n";
+        dprint "in original config: $ori_found\n";
+	dprint "process selected: $proc_found\n";
+    }
+}
 # vim: softtabstop=4
-- 
2.43.0


