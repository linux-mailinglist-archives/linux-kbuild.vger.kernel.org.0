Return-Path: <linux-kbuild+bounces-3542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80F97867E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 582D61C2301C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD6E12BF25;
	Fri, 13 Sep 2024 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/RuwGeM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821884A3E;
	Fri, 13 Sep 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247575; cv=none; b=VqhSueTDL6HHQjRISn9ahrQ0dki9sEp7krKuR+H1e6ZokPAs8XkyID6ys4CJJU9aaPGey6Qcl3n3ondsgCtmQYAkuov/tHpf0Zf5dB6ztkffbzvIvRWLLSL/wrE2Pk1zeHRAHW2UXU59gDcTO87uR84302ZnppGGuUCD2PBMnsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247575; c=relaxed/simple;
	bh=TLzqV7JCetuMQpbKD8ox1HRkwL53yAAApRdw9uVgWe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dj9bdMxlUq65t6dQPOPGWbEWGEpGDCE/PgpuZ8CPXo2jPqihN+fpeQ7VjNqshGNKig16bwaLBnr7SpSXgao1cXzGYBxsxiaIHlfCa5Whyey5CNv/sBG6vjtGdygrhLhBWqNJBhQdLqwYwtq/ODIGJgo6EduRSHLIhTfu8rix+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/RuwGeM; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e1d74e6c8d8so2083228276.1;
        Fri, 13 Sep 2024 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247573; x=1726852373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TvV1jSvRh8sp3W0eroe8/faKX5tDFXGg0EdBYo0nkU=;
        b=i/RuwGeMEMbywXTljS7lUGIqC5F9h0+0nA5z5rojVyz9aTc7VQQr9eRJdz9ceIcNBT
         Hd2ASUqrVLx+TU2CzeAhA7aGg3avpuz9I8tcvmhUk/UCTQ0uIsHKY0ztgedCcXDeyUBi
         3vzWtIG6atWkZefbeRHTC67B4kg+p42exo5mhahm9u5jn8T07N63T6Slip5JRBDGw8m9
         nm7MLf4fKYTa20JmHzwlLUbVvjrB+dS3IK98UBOSu0XP2Ddja0fTSfm9saV7Ox2yVU1i
         hSu4NUzbbwyw+3JsBXrN1v8zSV+wS87uid6HVnLQHwsetAU0hNlas7QUK76nqnSe47TQ
         uezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247573; x=1726852373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TvV1jSvRh8sp3W0eroe8/faKX5tDFXGg0EdBYo0nkU=;
        b=MzbipSgY9DQLxX3IU7DWduhr5eGO2XFBt8mpLGHKnQBGdEgq5SgBRGI+J53j0A74Is
         PvCMhXIkAsObY8M0MKxoSSbL3h77PLGGrBYizrzbrAFg3VskUUpIIOeEzAzwF+Fwtb5r
         /ffmBEHTmeXymJq3JOQ1EYJGR0A0j0xYYROer1tohr2D8JLI+9pAU52XPuDbLD+jZjxB
         12vUz/ftf8PCN2kZPHbnZKzi0JB/qCPFou/j+AYwTB516koDQ6XzPN7EeyldkkznSBMs
         GmgGQ2KSbN4zDHFbXttmBJGCwOfLKK1UgWTj1Kp6O63Cky4roGIXJGxS/maFiyFHWqEh
         axYw==
X-Forwarded-Encrypted: i=1; AJvYcCUinJewP462ZCOTcf/p3aD7B00ooZ7WGNcZXRpr+aa4dhZ+NbcxHWOMqelrGBrxN4PNMMDMblzzLhQqsHrB@vger.kernel.org, AJvYcCVhESOCrfq+RWLUnRKUSu7KDN816FbCyDaIo1Vgk+hlPjQIV8ZkffgT0maaK3EXe8qDAayHPZQ+T/FRs30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57jiB00fNe9tH79LFBJkI7DBwppqBME03SED78LHHiugScvSE
	d7+utRXuViofEsOLS3cdGqW22yrxb3MBtrYVhZx8OHfs1ngaehO+
X-Google-Smtp-Source: AGHT+IGrIQauC18AGyz13ocW2nuLqlB0zfJ7U/6Fgg1mr4VhAvZhdgvQICFqmLKnpRU7hSW+w2Q8UQ==
X-Received: by 2002:a05:690c:a88:b0:6d6:aa50:9266 with SMTP id 00721157ae682-6dbb6b17febmr66123797b3.17.1726247573284;
        Fri, 13 Sep 2024 10:12:53 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db9642827csm14437667b3.27.2024.09.13.10.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:52 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 6/7] linux-kbuild: fix: configs with defaults do not need a prompt
Date: Fri, 13 Sep 2024 13:12:01 -0400
Message-ID: <20240913171205.22126-7-david.hunter.linux@gmail.com>
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

Ignore process select warnings for config entries that have a default
option. Some config entries have no prompt and nothing selects them, but
these config options are okay because they have a default option.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 593df824ead7..948437aac535 100755
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
@@ -239,6 +240,7 @@ sub read_kconfig {
 	    $depends{$config} .= " " . $1;
 	} elsif (($state eq "DEP" || $state eq "NEW") && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
 	    my $dep = $3;
+            $defaults{$config} = 1 ;
 	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
 		$dep =~ s/.*\sif\s+//;
 		$depends{$config} .= " " . $dep;
@@ -561,8 +563,16 @@ sub parse_config_selects
 
     # If no possible config selected this, then something happened.
     if (!defined($next_config)) {
-	print STDERR "WARNING: $config is required, but nothing in the\n";
-	print STDERR "  current config selects it.\n";
+
+	# Some config options have no prompt, and nothing selects them, but
+	# they stay turned on once the final checks for the configs
+	# are done. These configs have a default option, so turn off the
+	# warnings for configs with default options.
+	if(!defined($defaults{$config})) {
+	    print STDERR "WARNING: $config is required, but nothing in the\n";
+	    print STDERR "  current config selects it.\n";
+	}
+
 	return;
     }
 
-- 
2.43.0


