Return-Path: <linux-kbuild+bounces-4084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD899CC7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8670328290C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0651F1ABEB4;
	Mon, 14 Oct 2024 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHl30zmo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CAF1AB512;
	Mon, 14 Oct 2024 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915243; cv=none; b=DNuwMFaWgxO8v11WC4UINlKEGI7l0SBKeYPHokI1H0Q0dEkAkvUip4iV8ExMfht+p4KCc7Cme0mpuJRfWGEYiOadoP/y0ZOgHJSEUIArMZE1QzPHl4a7JXybvCJ3+bGbRFTuHqUJPEsLNWT7MVHW5EMqp+Tj8NKd3px5NFyYoyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915243; c=relaxed/simple;
	bh=Em1qqY3YZk5Jj0WQkWEfPE/KSBa+c4a86KbWKTTSNZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psdAi1b/thDDzzRki0xjmOEwwt7DQ+NdAJbDopWKJrCpvs+NbAg2uuje7J6ratrfoV9lzj7vrxRYTgj5qPDD6ciqGGG3F68vaNURhEKtsqcE3HPmCBy23nB1tleD0s56Rc6sRe0etpJ5IoyePZZST79YlgE3Ztbv+SYoUkTEviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHl30zmo; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e292926104bso2154260276.0;
        Mon, 14 Oct 2024 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915241; x=1729520041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDGj+r4t1l+VeJOzAoFJcgus9t9arZh3YvstB1D+FOE=;
        b=dHl30zmoKg1duDqeuvnDRD5UROEXPc4ZTXjN2+ju5ImYweXfNQ+M0Nh03rkFMNB7lp
         D45K9FJbmCnnAj7ijskzNQ/MocQJhwswcny8wUKKzgCcLHypa0l+sjLmY6kQhss6MX+d
         sz3F0DAjquUOuvh72t0mzdTWS51yOgkD3whw2IpRcF+ea0nAlTvnnGWnxGjghoTQTymd
         KtB9wZytOG4E+4rPRxiHKDmoKjF9F7dK94dBuU8yBPLYwifzfxofQjU/BYWy5pZs9cxY
         mLoucYeruTU/ANJdOluBKAXXdgHeSOa8kIWWbUGLj5js1z+Q8txuOSDW7j/8i/PDnkM3
         ICxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915241; x=1729520041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDGj+r4t1l+VeJOzAoFJcgus9t9arZh3YvstB1D+FOE=;
        b=JlJffY9s3hjnoZGcjZ9hlqp6z0dq8YSJajd+5Lg8oV/OqAyya9s6VvbJJemQefugZ4
         RvFWjQJWXPb9ROcYskzVgZqFr5HA2/sqGW9X4oasNtJ62b516yZ0F7TJcS84vZi3NqE4
         2kBgNPgAI4gY3wrpXnVeZdjmsYLdm3XWMs53ia6OXa14usQuC6rL2Q4CR2lqGuiio8o6
         9so4aMgcNDjKOtp+M03jbtcP6CqFDHVZpt9sJ6njELNmpynbx0DSDR9qtfBl/wehpHCj
         a+O0S4ZS64v9hTMTwc0LF2T+c7+BTRzZdOAc6s+5D6DTrwbaCwxavSmAwBaCYJIiSSYY
         svaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh8ACtsj1qnQ9GNP8i+GWUW5iRk0sUdSUOPXeDyef0zqTLE+2YzFcdFa+2zyOCL+lKGgzQ3IpCBxZ9Z+iZ@vger.kernel.org, AJvYcCVgIjgekX2t/2YAikLPSlx2121KdolMNibX6tqzOD9vVQaQPogj1tRfzYfzad8xB2tUJQ/gS/tqCB52Fh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz947bW0elUCsqL5FdT0We0PvUp88nYh3HCPNT1NG0bbO5F1yGh
	+4BbaHCRxWWzahu6FSsvqjhsvXY2p+RIJdKQNFZhzx1rEBEY9Z8A
X-Google-Smtp-Source: AGHT+IFWNC/7vZpalbKxCBbKRBEMaJs4KTcmwhAc/Wn2YZFXXx7PxK/pRakGql6k81SGo14puZQQDQ==
X-Received: by 2002:a05:690c:6bc7:b0:6c7:a120:e10f with SMTP id 00721157ae682-6e347c68d1cmr60206817b3.29.1728915241277;
        Mon, 14 Oct 2024 07:14:01 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cade3fsm15417117b3.138.2024.10.14.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:14:01 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 3/7] streamline_config.pl: remove prompt warnings for configs with defaults
Date: Mon, 14 Oct 2024 10:13:33 -0400
Message-ID: <20241014141345.5680-4-david.hunter.linux@gmail.com>
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

Ignore process select warnings for config entries that have a default
option. Some config entries have no prompt, and nothing selects them, but
these config options are okay because they have a default option.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-7-david.hunter.linux@gmail.com/

V2 
	- changed subject
	- put a space between "if" and "(" 
---
 scripts/kconfig/streamline_config.pl | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 85f4712e2bf3..8e23faab5d22 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -144,6 +144,7 @@ my %selects;
 my %prompts;
 my %objects;
 my %config2kfile;
+my %defaults;
 my $var;
 my $iflevel = 0;
 my @ifdeps;
@@ -222,6 +223,7 @@ sub read_kconfig {
 	    $depends{$config} .= " " . $1;
 	} elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
 	    my $dep = $3;
+            $defaults{$config} = 1;
 	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
 		$dep =~ s/.*\sif\s+//;
 		$depends{$config} .= " " . $dep;
@@ -523,8 +525,16 @@ sub parse_config_selects
 
     # If no possible config selected this, then something happened.
     if (!defined($next_config)) {
-	print STDERR "WARNING: $config is required, but nothing in the\n";
-	print STDERR "  current config selects it.\n";
+
+	# Some config options have no prompt, and nothing selects them, but
+	# they stay turned on once the final checks for the configs
+	# are done. These configs have a default option, so turn off the
+	# warnings for configs with default options.
+	if (!defined($defaults{$config})) {
+	    print STDERR "WARNING: $config is required, but nothing in the\n";
+	    print STDERR "  current config selects it.\n";
+	}
+
 	return;
     }
 
-- 
2.43.0


