Return-Path: <linux-kbuild+bounces-3541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FC97867C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919471F25F2C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038F184A2B;
	Fri, 13 Sep 2024 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALxmBjNW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57095762DF;
	Fri, 13 Sep 2024 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247571; cv=none; b=arNm+v+Znl+d5/2SBQufB3KutXbyRqUeGFT9trsvUk7sGpP2KA0Pmq11oKq+kWV4U4I2o+L7wHKiLGticg/CkBx8EJKOxGqOAmK/w/RSfoqVVwX4c8UlFox3hCkZwD/fiSp8y7DpAYNvSCWy+UfpVwU1K7u+UEYEFPFITxXqtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247571; c=relaxed/simple;
	bh=iKiZGOlY0P3Ifn3hVDmvpWc1e64qyBJUtKhvcTfCY28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhReid1CN53EeUsr4vjkx0HMfG20QDO4PCnVir1UHZIFxVWiSe18EP0Ojg8Xx6OSqyz4qm1J20FOI2j5mvRA90Y0ZgYejLdRKlU0mU3AZVSqfBACY6JQRLWqkRDkAKYGXpCwXDbTfIghWnp67Z4kTXRktGe4sUIRHFe9L3ypNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALxmBjNW; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1a9dc3f0a3so2423945276.0;
        Fri, 13 Sep 2024 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247569; x=1726852369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krJcDs9wAiY/y/9z3DHqKaf2fJkxI7RljuOApVnY2pM=;
        b=ALxmBjNWbJ1GZMW0B7yFuVUt5jayD8thNXUrEyGLeiG4Q7OeWnckN17bLyXYleGeZM
         i+keyp/q+x1P1kIwI5fy6csYEPHAKL3Js5yYCalOH/sARKs0XGW5qhrwvq53RO6uom1h
         62DCq7Do6p6l9lcyEwvblxHf+JpVv59srRT70lnmgL851EWUSKWLts27T1xHO5CTLtVc
         kELLIfyQOVgV3dQjjvKVtTFAY9QeE6DshwdVTHRAZ9AQH4lvXoJ5Ltzy/ioH2OrYCQGO
         2b15CJ7Pu+ztXJDu3JPKxFKrBae3RQMvgyquuT0u9mvmOleHuksa7mikoh72efBiQlli
         8Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247569; x=1726852369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krJcDs9wAiY/y/9z3DHqKaf2fJkxI7RljuOApVnY2pM=;
        b=fL5PN5FS4YoukmeP1/7vk9+PP6xoXk4haRPndjHKPjRL4mjJjErlzPE1c1LbyFwevR
         roqDw168nMY5rYgzdH3i8pK8Rvk6qfD/2mjlh6AcLLzGh7oMcl50Ntj3F8Ek3O4hNV9v
         1TQd709yGHmjL1B6b7zPOq65HiPT5gvc0LTPU5eB36WbgIA3eTmgr9a4S6cpqpw2J38x
         WL2B0VRQG9eIM8xfShHgPAMlOzFkckToBDxPw18AxZqdfWpUDeZdmlRKBrW7Jf7d3g/z
         zmgM6c6bGsqvwXcutx1BArAxnxl56NypWzr0lIougSYPR+HO8qbPnsvzxPateZRWXfJz
         92Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVjpG1apnFvjbrEGoErMP+rWbmwXXx9fBKmsmasrEC2GHPpZlIReqygj8AWlBgmHe707B4EB1qvPFhwK2tq@vger.kernel.org, AJvYcCVzPgHgaX/gHAS9sdpwudRpnSkNf8pNEAhFUjWgmr4vLY3H6FVFv4ShDYkkO4GvPtggkrVybE5Q01pGZ4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZ4CAb8nBGUXf1wEINI8v4C4nlYqv716mAlwEJ2uklH2s7n/8
	MSJ7uloL4isY+x/j6y9h2wPbP/4B/YjThEt9YkCBDu9KXfGrqDz+
X-Google-Smtp-Source: AGHT+IHBPR22iib2eCJp1QtXctX0T2ZoVFyQ8tmwZePQ1rvLgcLzh+N/y0MR0u9sqFeIHjQDKdia6A==
X-Received: by 2002:a25:660a:0:b0:e1d:a2ac:2791 with SMTP id 3f1490d57ef6-e1da2ac2aa2mr4323539276.4.1726247568999;
        Fri, 13 Sep 2024 10:12:48 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7bb96cccsm1464259276.50.2024.09.13.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:48 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 5/7] linux-kbuild: fix: implement choice for kconfigs
Date: Fri, 13 Sep 2024 13:12:00 -0400
Message-ID: <20240913171205.22126-6-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913171205.22126-1-david.hunter.linux@gmail.com>
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properly implement the config entries that are within the choice keyword
for kconfig. Currently, the script only stops the previous config entry
when a choice keyword is encountered.

When the keyword "choice" is encountered, do the following:
	- distribute the lines immediately following the "choice"
	  keyword to each config entry inside the "choice" section.
	- process the config entries with the distributed lines.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 40 ++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 26e544744579..593df824ead7 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -162,6 +162,10 @@ sub read_kconfig {
 
     my $source = "$ksource/$kconfig";
     my $last_source = "";
+    my $choice_activated = 0;
+    my $distribute = 0;
+    my $dist_string;
+
 
     # Check for any environment variables used
     while ($source =~ /\$\((\w+)\)/ && $last_source ne $source) {
@@ -214,6 +218,19 @@ sub read_kconfig {
 		$state = "DEP";
 	    }
 
+           if($choice_activated) {
+               $distribute = 0;
+               my $config_lines = "$_\n" . "$dist_string";
+               my $tmpconfig = ".choice.kconfig";
+               open (my $FH, '>', $tmpconfig);
+               print $FH $config_lines;
+               close($FH);
+
+               read_kconfig($tmpconfig);
+               unlink($tmpconfig) or die "Can't delete $tmpconfig: $!\n";
+           }
+
+
 	# collect the depends for the config
 	} elsif ($state eq "NEW" && /^\s*depends\s+on\s+(.*)$/) {
 	    $state = "DEP";
@@ -258,8 +275,27 @@ sub read_kconfig {
 	    $iflevel-- if ($iflevel);
 
 	# stop on "help" and keywords that end a menu entry
-	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|choice|menu)\b/) {
-	    $state = "NONE";
+	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|menu)\b/) {
+            $state = "NONE";
+
+	# for choice, distribute the lines before each config entry
+	# to each config entry
+	} elsif (/^\s*choice\b/) {
+	    $state = "CHOICE";
+	    $choice_activated = 1;
+	    $distribute = 1;
+	} elsif(/^\s*endchoice/) {
+	    $choice_activated = 0;
+	    $dist_string = "";
+	}
+
+	if($choice_activated && $distribute) {
+	    # do not put 'choice' inside of string to distribute
+	    if($state eq "CHOICE") {
+		    $state = "NONE";
+	    } else {
+		$dist_string .= "$_\n";
+	    }
 	}
     }
     close($kinfile);
-- 
2.43.0


