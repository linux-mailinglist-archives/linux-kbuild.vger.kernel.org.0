Return-Path: <linux-kbuild+bounces-4088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612C99CC84
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1655DB23EBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52571B4F02;
	Mon, 14 Oct 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kadbf4Dq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A41AE006;
	Mon, 14 Oct 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915248; cv=none; b=TAQ1J9XE1n93xFhystfdZPzCO2BsFfjxrd3EF1qHTecMPID8XEAA7kvSQreb93c/NXMdYNIz1lOizDb9qUIUkG9myuhlIHvif2rSH0D3CBb8klL2d/jskXDTm0BL2YDawKq6PecTSM8jBE/2TQRSDFFYzptwdyEojReYZ/OCFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915248; c=relaxed/simple;
	bh=hJarxn2Y1zVQhCmZDCe2jd66Z7ijIydSZICRs7ZM8lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQ995Sh1IFwRP8CQpVliumJGhJMdRobfGRZb5O4uHf2+zFUoQcOS8diA9uRnWWYcciHkPg+ocGxhcVVLtESujobQRubWdYao8YD42UqAggMmTOGVJHjsU+Zp0Rx2mt5igpG1gKyYPx4VuJb82sLBSwja7ns7GXXOdyFpHXHGBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kadbf4Dq; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2914e73ea4so2946537276.3;
        Mon, 14 Oct 2024 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915246; x=1729520046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGa7q+R5O0ISTIPA10Zf/oodDHDm2UNZhh4hDXYuXxM=;
        b=Kadbf4DqJuLLFqY9eUX3AieUh+i91CQhlilxZz6UbEA0VUzDqpqH7Pwuk03V3Q+IH4
         83FyQmX0CRdbqJP6ht5z8wzrHYjA9cHkVq3xdOyohA22FGlZERSM1D80yYKvAqWTrSN3
         KSEFa5ttgGKjkq0vpNHi8JAK678PwwVd9TWRRvSd0C3g1cjAiJZ6qrtOE56VM+2rwpUi
         uEwSL+yioX7SvWcIsmtO2iIG0FK7UX9k2erpW8J722vALe0IGCGDPezp4adPegd+rrX7
         3ysbWxYyJ1nys+hc4B5HuVW1LaEsD4+gIZkJ0OArMKL8kbjA66LXF57Kkxbkuw0KE7Hd
         D/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915246; x=1729520046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGa7q+R5O0ISTIPA10Zf/oodDHDm2UNZhh4hDXYuXxM=;
        b=Ct+OLDrtFTlOYp+Pfz/ztr77r8qEwxbxI+3a0Nf8pSdUUJQYcUqyuEKC2UFyLpGvJi
         EPdtcShDpzyFMdeLvwcmITXWkvhuC6zIm4H+E4JDBZrzEQ5/MRtpFLs4x/zcNQW8wRHQ
         eM+qSt7j9YDlqatNVpidhgGQmhHiITJO2cRouedhFfORLgSQycFmHS40ppNKEN9gtJn+
         AJishw8LYhXtd+OlPHP3IbktxOYRw1VeAFzcu/eF/Jwip61M5t76qT+Le304epnQfyS6
         H6r9Y5qtFK6PGIljxzaQDl+vMfx/HeXpX915O9+l+tnoqFoPSCueWkJQU4iNsE2o65JU
         rVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPois2oPCP/GgF1pXSi0w9mhlftRxtx0bfwzrEQ0ehWZ3Oo2K6HZKcIBrS1HuumlHONxuRpFPeX38F48RY@vger.kernel.org, AJvYcCVyVbVwbq3lAqiAnM38uyvY+IPBPV8SDXIsul0Lbo+fq9GV0/RcwjpWe8YO/hyzjb2YLgfbiIBTyx0XH2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0INwTFVek+Z44IkYZ20/ddNdHBVK351OerX7dlE+NRjQQcTbp
	0ChalyeHaa2HUKUUsQcgC7St0DS+3KXPzbDht9BXsry5ZqAc9+7QFvUtJw==
X-Google-Smtp-Source: AGHT+IHlFTRwJlflqpvWkywQCD3Duna3aG647rvmp9jsRWkEF+921voUiZX9u+JHbF7nOYfMzeDUyA==
X-Received: by 2002:a05:6902:18cc:b0:e28:fdd7:b902 with SMTP id 3f1490d57ef6-e2919deebd2mr8508168276.37.1728915246089;
        Mon, 14 Oct 2024 07:14:06 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef5df1csm2442824276.50.2024.10.14.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:14:05 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 7/7] streamline_config.pl: check prompt for bool options
Date: Mon, 14 Oct 2024 10:13:37 -0400
Message-ID: <20241014141345.5680-8-david.hunter.linux@gmail.com>
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

Select configs that do not have a prompt. Config options can be bool or
tristate. Ensure that bool options are also selected.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-2-david.hunter.linux@gmail.com/

V2
	- changed patch subject
	- changed the order of this patch in the series patch
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 4038afed2926..8c75ab888f87 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -273,7 +273,7 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
+	} elsif ($state ne "NONE" && /^\s*((bool|tristate)\s+\S|prompt\b)/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
-- 
2.43.0


