Return-Path: <linux-kbuild+bounces-4087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210399CC82
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FF57B23E79
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C061AE017;
	Mon, 14 Oct 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpSmbDVC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF01ACDE8;
	Mon, 14 Oct 2024 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915247; cv=none; b=AaPoE16WVygmBQ03wiiq/oAclUiAmdk2PRj6bsJk4hhTqe1Z36Qekpd/SycF2Io6xOiqxDuXJtSpckTipwUpFKAtU18dn16BUgalpAfPyrVTt6VQHzusxPod4JrFoM4Z8MR2bCHc1Hd7L9D4cHxbnJR6gIDvpGQh5Vyg9UqUPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915247; c=relaxed/simple;
	bh=7EsehB4TQIQznK/fwIRTcRdgmqehKGCyrgydthidHvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOpc5l/7fyURytVJjULplxfjaaif+26ApQaVbcyslxiNh8BTzJ3a8NnIweOyH82eNLFhFKUG8UCSnF3qhJfYZBS6WPOGY+WM6A2ONE7+/+sgjHeNndAgh8PSKxPqLyeMFzfVKK/dXgNFCFFcrzABA+e87cgyZSIBrkfUJ6XyN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpSmbDVC; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6dbb24ee2ebso44594537b3.1;
        Mon, 14 Oct 2024 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915245; x=1729520045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM8ijJVXVu9oJKfrm/n4jAf4cvVmRxwxcsbBzjaYOyQ=;
        b=MpSmbDVCcQQsx2Fo9sbCOMwn3oD1cIcha22k4MtBup/ZIcEQonufVVeSHnHSHvKvqN
         iyBLSAiIupzuZia4OsuyPiF3J7fNd6NdQAwoZrlmytinJHI3zVKP9fGzUM5PPSZ1qji9
         hr3/ZxplumYG+wnEfX1CFTxm6A7E5bEkbJ35Asm7AmI/3LwqdGU4dppdmvMEjbpvdE4j
         F9/oN3lAadGoBqCefo1n4F5x2t89TF36LDhnjcV0AYOKmyiHtPdMnA9ClZgIAb0F70UZ
         zpI6KjKAspkobEYBI9nQdO285dK6BCYBJHtX8ee3mDzaX7QVMQy3PsDQ97vo4yHglkZm
         yzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915245; x=1729520045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM8ijJVXVu9oJKfrm/n4jAf4cvVmRxwxcsbBzjaYOyQ=;
        b=va1PNFKvEKKBC7z2tGvVvvnJow1gM4ksBCAZyHL4W0+znvEjxJNcHbI7fscM3j+5QZ
         qjGfT1HOcu8EIgt0U1ZlxAhxaKUdxta8m97h0EDqwy5MTYydJZSifzCLDBaTxDH0wnNZ
         0QytXYQnDfpHu0rjCK9SE+SMvYvpPR5J7jbEdP2EQdWu6DgKzEaOOkstLwalxDlW8vB9
         oa91PlvKRgiquIMUwNwbFJ9pnF6mtCnelMxntU/gZ9/acgcuzS2LqasZKfShwBd+1mgG
         8iMIBksWD0GZH5M3G2d1IIQZhggqljOrgpQjSOjxFI1Fj4FtWilzQ7ZbB5Gwz+Oi2O+F
         c2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJqBD1n95nt0M9FXqXTfZ1BPIryta/oYyl6AoQy2a2xCHmFsY2T4TzeeWa2F/ln+EXaD8Lhx0nqEyxzP8=@vger.kernel.org, AJvYcCWFu48quC2rwc6tL7GfhOTJIW7970xU0n/OJ4JOFa3IEWSu68pAvyQ+QjTkhdlyAZ/ZvOmc6GaSOq7RI7hF@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtCePICGwkPvj5kjPca0BY5HEdux8eCmubnrT+/v0u/JNsk+7
	jI/ZEaLv2zJmufrVCjr+mN/SdHrYJEKkn2Zxu99oQi7IjlTtdkXM8IN1Sw==
X-Google-Smtp-Source: AGHT+IECkPu3D+s7ADbBKpqE8Om8rDwhCKAn/xhD3/pGA/gnSbaoQgwKeI10mXPkhw1YYzigpCvePQ==
X-Received: by 2002:a05:690c:ed2:b0:6e2:1842:c2b1 with SMTP id 00721157ae682-6e3471e8cf2mr90783327b3.0.1728915244819;
        Mon, 14 Oct 2024 07:14:04 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c27cd5sm15160497b3.102.2024.10.14.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:14:04 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 6/7] streamline_config.pl: process config options set to "y"
Date: Mon, 14 Oct 2024 10:13:36 -0400
Message-ID: <20241014141345.5680-7-david.hunter.linux@gmail.com>
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

An assumption made in this script is that the config options do not need
to be processed because they will simply be in the new config file. This
assumption is incorrect.

Process the config entries set to "y" because those config entries might
have dependencies set to "m". If a config entry is set to "m" and is not
loaded directly into the machine, the script will currently turn off
that config entry; however, if that turned off config entry is a
dependency for a "y" option. that means the config entry set to "y"
will also be turned off later when the conf executive file is called.

Here is a model of the problem (arrows show dependency):

Original config file
Config_1 (m) <-- Config_2 (y)

Config_1 is not loaded in this example, so it is turned off.
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y)

After  scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n)

It should also be noted that any module in the dependency chain will
also be turned off, even if that module is loaded directly onto the
computer. Here is an example:

Original config file
Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)

Config_3 will be loaded in this example.
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y) <-- Config_3 (m)

After scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n) <-- Config_3 (n)

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-8-david.hunter.linux@gmail.com/

V2
        - change subject
        - changed part of the code that only processed config options 
          set to "m" so that config options set to "y" are processed. I
          forgot to put this in v1 when making the series patch.
        - removed an unneccessary condition that would have skipped a
          dependency loop.
---
 scripts/kconfig/streamline_config.pl | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 4149c4b344db..c3b434220c9f 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -473,6 +473,11 @@ foreach my $line (@config_file) {
 
     if (/(CONFIG_[$valid]*)=(m|y)/) {
 	$orig_configs{$1} = $2;
+	# all configs options set to 'y' need to be processed
+	if ($2 eq "y") {
+            $configs{$1}= $2;
+        }
+
     }
 }
 
@@ -499,8 +504,8 @@ sub parse_config_depends
 
 	    $p =~ s/^[^$valid]*[$valid]+//;
 
-	    # We only need to process if the depend config is a module
-	    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
+	    # Make sure that this config exists in the current .config file
+	    if (!defined($orig_configs{$conf})) {
 		next;
 	    }
 
@@ -600,12 +605,6 @@ sub loop_depend {
 
       forloop:
 	foreach my $config (keys %configs) {
-
-	    # If this config is not a module, we do not need to process it
-	    if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
-		next forloop;
-	    }
-
 	    $config =~ s/^CONFIG_//;
 	    $depconfig = $config;
 
-- 
2.43.0


