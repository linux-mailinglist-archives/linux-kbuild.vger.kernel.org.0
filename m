Return-Path: <linux-kbuild+bounces-3116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C16958C7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 18:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E561C224D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 16:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9831AE04F;
	Tue, 20 Aug 2024 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CozGDtWj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2C195F17
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172038; cv=none; b=G3kjG/Tck2zacEOSou38MHlF+D/CxCATDjAwe/rDBYK2kZVgbmYWmlio2x+zyAX6pJNQV5Xc8mABPzGW6FXNYGRXoi+lNnBGQqimEUROXC+W0cg55g6Ba66nwJdngHQlZkHasIb4BdTRYw8i3Q4tFimbMSEQhqbF4UUyqTsc5GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172038; c=relaxed/simple;
	bh=Px4o3ybZn+EhCvnxZ9ITUU05sxboY1gwiT/t/n47Eqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CX+XUm1sT1i/YgdENSrCUFfzvub0sc187BsUxjlAHhRw8ybAkDBfSEHQisDK27eic7BxAdpR6cijmV8tKgAT7V0rD0jhbBwNFaROorzAlGjt5ZjYbMKkQGo2Cnar6rBJrubjsh2QaTnHPBQ/UgJlIj9UtgOmyVDk9NhP/ENI1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CozGDtWj; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70949118d26so4682999a34.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724172034; x=1724776834; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENlu+2a9FTwR4Z9MjTmktYFRdqAIvmAoZoo/YtZ/k3k=;
        b=CozGDtWjwIJ476MERE3u9kGiN8FrLX49tQkKhySZgKX9k+N1ra09wYRPDNNDXx4ov2
         98ev9PwtjaBNW1eRbwdiEmpgvnWGfB7IuQyEGUJFaAVIdgflL0sHunzVccG9iNCVaoFG
         fsLyyypfchCDN4DGL5AsoibDllurcSbW7R1WK4jP9uGg1ywEqcc0+QNHUtxSHHvzCQ6C
         f3oBW21VM5l6H1L3acl2ocJMKQex3prg4N4f+DJcWzY0yAqTiKZfQHSvbvy1fg+5XpaA
         KqFR7jLw2PxAPRPkIHFH13oOj6iHbc64t7RislmuIi8QsxPN1qntxvYdKEbzBT/M/BbC
         /yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724172034; x=1724776834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENlu+2a9FTwR4Z9MjTmktYFRdqAIvmAoZoo/YtZ/k3k=;
        b=Jt0qV4GRirHBa5fjDkA8+GHIdnzxMJt1DcoNFRcspu6eJgdoocHff4EohMi/aUD+wn
         CFfCJI4U/U1mrgWs6u/mb+ZmHwnFiH9regfGNlbFtSk52ZW9jkZKE15rNS8+cVoYJiQE
         8BH+vWwmxncgLKYa9W75zJzXc00rcKnZMd6SRlKZ0UQVxj5ExRNGnuHFFxrb0TEX1aHR
         ntE8Gk2WndB4ax56Sbk14fPieX4pBo0A29NJmyLrRhV18CXL3C/0Z5riCKWmaPYSzp1x
         3xnXmkSSMhrvOawz/NIvtYL4qxJ0nNLji49eLoHHngc8YCZdbSG+iyYyzuyUl4z024vx
         P5aQ==
X-Gm-Message-State: AOJu0Yxd3307yej/iVJ/nFWByVNk4dluMmn6vAAd6Jl28wRB9BsCyPeU
	UsZTTvSy7vBxBMXDiGRKgRzHIPLSTSA4HubLPxb6DRI7TwummGLdKmbWhqPxLoY=
X-Google-Smtp-Source: AGHT+IFVJZjcS3gy5aFpaFbN6ZaTMn6rqWk2HDYqa3JCl5e37bRbj4pfKSVj1FgMIXRY++ii3OPnbA==
X-Received: by 2002:a05:6870:9a12:b0:261:23f6:78d with SMTP id 586e51a60fabf-2701c574ec9mr19099932fac.41.1724172034199;
        Tue, 20 Aug 2024 09:40:34 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2706f8a3ca2sm1270456fac.49.2024.08.20.09.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 09:40:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 20 Aug 2024 11:40:18 -0500
Subject: [PATCH] scripts/get_abi.pl: more strict matching of [XYZ]
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-scripts-fix-get_abi-xyz-v1-1-6f6aea9b638b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPHGxGYC/x2M2wpAQBBAf0XzbGpscvsVSbsM5gXtSIv8u83jq
 XPOA8peWKFJHvB8isq2RsjSBIbFrjOjjJHBkMmpMoQ6eNkPxUkCznz01gmG60ayjlztClNmNcR
 69xyV/9x27/sBPS7wlGkAAAA=
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.1

When using `scripts/get_abi.pl undefined --search-string=iio` to try to
find undocumented ABI's in the IIO subsystem, no matches were found.

This was due to the fact that we have documented a directory naming
pattern:

	What: /sys/bus/iio/devices/iio:deviceX

which gets translated to the regex

	/sys/.*/iio\:device.*

which matches everything under every iio:device directory, causing any
attributes below this directory to incorrectly be filtered out as
already documented.

This patch makes the matching more strict by changing the replacement
for [XYZ] from .* to [^/]* so that we don't match the directory
separator. This way documenting directories won't filter out everything
contained in the directory as already being documented.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
get_maintainers.pl didn't pick up any matches for this patch, so I guess
this would go through the kbuild tree? (Since MAINTAINERS says:
"KERNEL BUILD + files below scripts/ (unless maintained elsewhere)")
---
 scripts/get_abi.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index de1c0354b50c..f65158694852 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -867,7 +867,7 @@ sub undefined_symbols {
 			$what =~ s/\{[^\}]+\}/.*/g;
 			$what =~ s/\[[^\]]+\]/.*/g;
 
-			$what =~ s/[XYZ]/.*/g;
+			$what =~ s/[XYZ]/[^\/]*/g;
 
 			# Recover [0-9] type of patterns
 			$what =~ s/\xf4/[/g;

---
base-commit: 521b1e7f4cf0b05a47995b103596978224b380a8
change-id: 20240820-scripts-fix-get_abi-xyz-0ab0b9b62719

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


