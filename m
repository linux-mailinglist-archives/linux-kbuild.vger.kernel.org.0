Return-Path: <linux-kbuild+bounces-3543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E800978681
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD0D0B2525E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1078784D0E;
	Fri, 13 Sep 2024 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGBlSBYB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E6C81AD7;
	Fri, 13 Sep 2024 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247581; cv=none; b=io8FjfRorMQbe6t3lWWO6vmsVBDR4q4H3kAiLe7H19qHu/2Ku9U5owG8evtDVhrHVBNDnIYP7WFG6IZgMS/o9HKw0/Y8gbp6dTNsgLn9jQHnD41+1cv6uwg4i5Hq5PAIc+WNZejYSEzyTnX0pK3e8kdMtL1pahXTctTxO58n6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247581; c=relaxed/simple;
	bh=h2FS9wwlMOv3wwf7neE4FpMtuEaNqT5ZsukaE4Ktdyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeI4JhjAkctaQc+ec8TZyyrFeaCY5PJ29/IvNaN0R5jpdP0xjU3COydCOysoURaoX8tpkrgaloklnInI5vSK1SvVk44AVMYQlcEEwRNPOkXjRRqkwdDoeDyI7G7Lmg+6SYNko8rqTt0UwjxKtXpyJX0CbCgZOSfxseRCjYdj6Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGBlSBYB; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-68518bc1407so12498967b3.2;
        Fri, 13 Sep 2024 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247578; x=1726852378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lodPUkw76M0wAYUAWlmowp4aeuvIBGM0yxAx9nJPMd8=;
        b=cGBlSBYBR/SV+Ph88pNTKmVLFOIsbxXsvTbljGFVqqIO9dD17sWQiwPaNqxSaUTN0V
         IBqSQt3Hv0GMecShVJICjZytsleG9MTH1JOb0aPLfNvt2Os7qassAXd5hSfShHzVrHWR
         gTBv/LQXPYNzMNx6XrPNuOph4jyaOAbfn0Hs/wtTXBC6ZSYGJ0eO3yC5/9K0fZ7FMLoo
         XHREygbccNLFjYxb9CmLnNcCgjihYlebbOZ9V2YFkPbI4onpl6mkop7sSwRwI4nRT/Qw
         HNAy+RdZCJ5fDjxAqEOj+Ewbkcv/VlJDnuXbOI/pS97mVndphjNrtHyy/cUF4MVHEL3h
         TiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247578; x=1726852378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lodPUkw76M0wAYUAWlmowp4aeuvIBGM0yxAx9nJPMd8=;
        b=u/TCzRN3mCFlFLI9EUj3+W1XnLlxbhprsISiG0S+1wKeFZCeUF4LNWpCHNjPW3JE18
         wf37gOq0zBGzQJsOCL9l5uSHcEeooCV4cOPX/+4ey5wdLMiARaVDTTA/g2eUXFXu63ns
         Y+KqiyzUysh4zsXHkP2Zh0xkc/QrV5TGxpZgQv9d6AFsMBaRsIW6fxczdTrFiAQLn0nu
         cX7R3yIDyudczkqEYKy1C/2olaC8YDa8LEp+D5eTZ1cc1rFRhNWiau1D66ERFvJ6Gdly
         aPHb7ryMMsa5bHYivFu4hFedEEl2y+zp5aeBFDqJYIBFHmFvrgfIjybvYE5couHa3Hhh
         UBog==
X-Forwarded-Encrypted: i=1; AJvYcCV4biVfaFf2+hd9cayToO3Clv9rb8lUTTTeor0802EtqfdJ/xq/7HiaD1trhvw//cysBk9X1O64qQ/HbzI=@vger.kernel.org, AJvYcCX2iw+h/3sC0+t3mAanC8zAQ6HLIYHgetkAAlzcTwFllxK4akh51V2/jJwz70iXX6sMbSdA66S5jmDg4ZPu@vger.kernel.org
X-Gm-Message-State: AOJu0YxyduXTpBcp8Ny87K5scEx7lRweRjUIiWS7petRqZZmcPm06W3/
	zIAk3hEGKaOe+vbsmdQzpzpqkyx396FgrM07gewwDs9k+kh4MRFq
X-Google-Smtp-Source: AGHT+IGuj4Rn/rdl6gaT3L62kE+18YqQTACYO1y2rAI4rwYpCNJoWUqwgYsIAvywKbqcCbRqeUPKjg==
X-Received: by 2002:a05:690c:1d:b0:66a:ba89:d671 with SMTP id 00721157ae682-6dbcc5565bdmr35564967b3.35.1726247578555;
        Fri, 13 Sep 2024 10:12:58 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db9642d024sm14632357b3.4.2024.09.13.10.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:58 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 7/7] linux-kbuild: fix: process config options set to "y"
Date: Fri, 13 Sep 2024 13:12:02 -0400
Message-ID: <20240913171205.22126-8-david.hunter.linux@gmail.com>
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

The goal of "make localmodconfig" is to turn off modules that are not
necessary. Some modules are necessary because they are depended on by
config options set with a "y."

Process configs set to "y" so that the modules that are depended on
will not be turned off later.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 948437aac535..762bf80408c7 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -466,6 +466,11 @@ foreach my $line (@config_file) {
 
     if (/(CONFIG_[$valid]*)=(m|y)/) {
 	$orig_configs{$1} = $2;
+	# all configs options set to 'y' need to be processed
+	if($2 eq "y") {
+            $configs{$1}= $2;
+        }
+
     }
 }
 
@@ -596,9 +601,11 @@ sub loop_depend {
       forloop:
 	foreach my $config (keys %configs) {
 
-	    # If this config is not a module, we do not need to process it
-	    if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
-		next forloop;
+           # If this config is not set in the original config,
+	    # we do not need to process it
+           if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m"
+		    	&& $orig_configs{$config} ne "y")  {
+		    next forloop;
 	    }
 
 	    $config =~ s/^CONFIG_//;
-- 
2.43.0


