Return-Path: <linux-kbuild+bounces-4086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996B99CC80
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07A281F23228
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1FA1AD41F;
	Mon, 14 Oct 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERBR5poT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38C1AC420;
	Mon, 14 Oct 2024 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915246; cv=none; b=hMWKYMeX1YnfN0CVovxhipVp57mMkYxd90Y059Kua7m9+iMrGKmwe1oz7zQYRDjcqnAI3kZhEmhs636R6XHGsva0FpwDiBroahwqGEGrHRortgFhIWa+IZbSbVy6KItujCyCrtcypDMcUI2gASKI4QBBCibbUW00h4HNoHmkTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915246; c=relaxed/simple;
	bh=Oy+ZjNKZJycKHYpmUUCO9ZqpSRZty69I59ZUzaivuis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYFge/sogfQq5H3d6YgG9aCfIWt1eNYEkpkCHGD0Rj9B3GWfgJuzf81eDXb1+quNBtNjIG135wlJOO6m4cERWl4uZTrc3myUri8y4z+TWaBzpxyz4oKJfqVjjYXYOfTa8NmFCbmrPkz6+YIz4fZWtbAOXRTi3ou6UQ1hp77/TbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERBR5poT; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e20a8141c7so35005057b3.0;
        Mon, 14 Oct 2024 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915244; x=1729520044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbJLZsdjvPc/i2T92zlmC+SINaRjPA8nN1oxgEAP1UA=;
        b=ERBR5poTu0SyD/KtEDze+AyfQaiR4PAo+8FV/AIRyQgOc6USfyqZ4kJ7aaUnJlfV2H
         z9PhBFaLJbGJlWzwdt2pWpT5yNuKPZmACfObJSwaB6GDoDN81qHI14GWBAa0YXLEK6VC
         9lZCymny9RCBc04Dzz7n2cQD3q9j7JlceqTbNZZWyxdNQZTG9pcL1DSo7tEueuprds/4
         FCwqX1VaARlibonAq6/jqC1d8Xdn5OJZrfxV8FajxJEVuL0EDJJ+18R9QB5Zhf1qNCns
         4nPhg6FluQNcM2Gc89kjyMoJDTPFfOaSi9Aeqtl14JiXSnt1Lt1vDEQe3lrWcPU7VRzO
         xzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915244; x=1729520044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbJLZsdjvPc/i2T92zlmC+SINaRjPA8nN1oxgEAP1UA=;
        b=MkChk2fuqv6kSYPz96EsYmUvO6OITpgvxZNTaj3TDkha9AvVGgFTxH7xEx2gsA0hCj
         jqEUiU9leZXtCQnLhryu0AEz3zndizFWklbe/cXqM9S1YpBv6DrIe86Mgo7/jWHyAli8
         8chsG/P9Lf2WWYRwp3wcVvLDSBTf2Oz00CP2ldOaU+Nm4z/OuBDUXTYW83D7Mp+96OYM
         yBOsDCv/AzECkYWjslT4Lw+cx/Q8KM5meTGFQ+4ZTJBYyNMleE943PofRCuqNlUr118z
         6wQPF+ab9FX2Jbae+Y7ce5DL7n0xLXm9M9B1zDNAbosE23N5cKthPA2vIulFN+/FQ3Zy
         mIbg==
X-Forwarded-Encrypted: i=1; AJvYcCVpMeNKDvKQvqB152rmBaSW+E3PuSkgz6ubFsdAFiTZ/0vy9S90WD9NJqFjJvc1o8UqxDFGDbBC4NRlntGz@vger.kernel.org, AJvYcCXL4R/prO0Gcyqqncq7Whppe/W0//c3/fdL2CNQysFM9IDwC6t5wZmNHCY/fY598VQCYTkTGBLfGdmHeZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxiV/zxIyuXMNx1BXmpx38Jd5DgL9LQMiDBtPPNGE1AE/HTyDh
	T0tfhyE5XtKVM1Nyy8OCTyohtyUOfZQ1yuCWL8XB/yqJ/e1HXoke
X-Google-Smtp-Source: AGHT+IGKaHHjmKk1Lns9ucqPxOGx3HlXakTkzd3CdDzuCn1AV5H+0euu8q3mS4N/MCqdnKg8V/a/qA==
X-Received: by 2002:a05:690c:56ca:b0:6e3:2aba:3503 with SMTP id 00721157ae682-6e3479c2b10mr59098257b3.21.1728915243686;
        Mon, 14 Oct 2024 07:14:03 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cabf37sm15553787b3.129.2024.10.14.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:14:03 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 5/7] streamline_config.pl: fix: implement choice for kconfigs
Date: Mon, 14 Oct 2024 10:13:35 -0400
Message-ID: <20241014141345.5680-6-david.hunter.linux@gmail.com>
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

Properly implement the config entries that are within the choice keyword
for kconfig. Currently, the script only stops the previous config entry
when a choice keyword is encountered.

When the keyword "choice" is encountered, do the following:
        - distribute the lines immediately following the "choice"
          keyword to each config entry inside the "choice" section.
        - process the config entries with the distributed lines.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-6-david.hunter.linux@gmail.com/

V2 
	- changed the subject prefix
	- changed the method for storing and distributing the choice
	  block. No longer using temp file. 
---
 scripts/kconfig/streamline_config.pl | 47 ++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index b7ed79c5e070..4149c4b344db 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -149,6 +149,34 @@ my $var;
 my $iflevel = 0;
 my @ifdeps;
 
+# distributes choice entries to different config options
+sub set_hash_value {
+    my %htable = %{$_[0]};
+    my $tmp_config = $_[1];
+    my $current_config = $_[2];
+    if (defined($htable{$tmp_config})) {
+	${$_[0]}{$current_config} = $htable{$tmp_config};
+    }
+}
+
+# distribute choice config entries
+sub copy_configs {
+    my $tmp_config = "TMP_CONFIG";
+    my $choice_config = $_[0];
+    set_hash_value (\%depends, $tmp_config, $choice_config);
+    set_hash_value (\%selects, $tmp_config, $choice_config);
+    set_hash_value (\%prompts, $tmp_config, $choice_config);
+    set_hash_value (\%defaults, $tmp_config, $choice_config);
+}
+
+sub delete_temp_config {
+    my $tmp_config = "TMP_CONFIG";
+    $depends{$tmp_config} = undef;
+    $selects{$tmp_config} = undef;
+    $prompts{$tmp_config} = undef;
+    $defaults{$tmp_config} = undef;
+}
+
 # prevent recursion
 my %read_kconfigs;
 
@@ -163,6 +191,7 @@ sub read_kconfig {
 
     my $source = "$ksource/$kconfig";
     my $last_source = "";
+    my $choice_activated = 0;
 
     # Check for any environment variables used
     while ($source =~ /\$\((\w+)\)/ && $last_source ne $source) {
@@ -205,9 +234,13 @@ sub read_kconfig {
 	    $config = $2;
 	    $config2kfile{"CONFIG_$config"} = $kconfig;
 
+	    if ($choice_activated) {
+		copy_configs $config;
+	    }
+
 	    # Add depends for 'if' nesting
 	    for (my $i = 0; $i < $iflevel; $i++) {
-		if ($i) {
+		if (defined($depends{$config})) {
 		    $depends{$config} .= " " . $ifdeps[$i];
 		} else {
 		    $depends{$config} = $ifdeps[$i];
@@ -260,8 +293,18 @@ sub read_kconfig {
 	    $iflevel-- if ($iflevel);
 
 	# stop on "help" and keywords that end a menu entry
-	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|choice|menu)\b/) {
+	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|menu)\b/) {
 	    $state = "NONE";
+
+	# for choice, distribute the lines before each config entry to
+	# each config entry
+	} elsif (/^\s*choice\b/) {
+	    $choice_activated = 1;
+	    $config = "TMP_CONFIG";
+	    $state = "NEW";
+	} elsif (/^\s*endchoice/) {
+	    delete_temp_config;
+	    $choice_activated = 0;
 	}
     }
     close($kinfile);
-- 
2.43.0


