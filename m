Return-Path: <linux-kbuild+bounces-3537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B5978673
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F351C23124
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206B5558A5;
	Fri, 13 Sep 2024 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NP5vOEx4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4D826289;
	Fri, 13 Sep 2024 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247554; cv=none; b=OK77OCMdy3KkTg+DlQp5Nk8GBreghB/+yyuOEJAMVApbFyYmhBT1BU4KZtai6lV02I78cYlCERsu++hJ0YvX4LTRmNKi6wHkpLfhEnM22WH3X5BJ4Kx+0uPQR1J5z5wChW6cWuI/BWqVE2FadjyA19cNKzlx2ILn78WApTG/Av4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247554; c=relaxed/simple;
	bh=5s4pHxScMXinrqMWKPx8Wxitl3qhy7p2inOOujWbj+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUNFXk9Cy5bWQFrjF2qRfhluQ59nlZH4g9LgU60/mLw7k8M+oWlQlqwe+SSIzvKfSeRJVOPabHtCwshj3N0/zQbP8V6zenpD183tXR2QkNucBTmTRvimGOc4sRQtcp1luj48Q2pyftpiG3i5kgbbE+rUxT6Zqqdj0KD9ua05E5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NP5vOEx4; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6d3f017f80eso10114787b3.1;
        Fri, 13 Sep 2024 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247551; x=1726852351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OStyQo3RAb1kmIIdt9oQl7TguiBZ/JW1YDsQDt08JLc=;
        b=NP5vOEx4P7C9xGTICIZIgttiRc4wH+G5ZdF/xPw4t41HcrwOasmEJsSl3eiIwGWPjK
         fh4fI4e9eOMMh138OT2g8aKUD8piU/s38W30CLFQWYVkmemGanNHSy/JRjtzBe5rcaRv
         3KcQ/RjyYQlrmacY2LjhLZWUiuEkLMg6FyODMOmuN/AyMxFZ+/B0ujyfm6hIN36rYwHX
         IiFv91rEDRMjlOe6mwFUp6YVKjkBxqI23mgiH9XcyKu0WmeQoK5Acfg7+p/PH3G3/4Ie
         JHuHLuBMJTLE8B7NiYRopStMjXZSNweEAdxyvRCmZ5zAzJvlyvYvKNEPRcQxyAjEonuw
         xGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247551; x=1726852351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OStyQo3RAb1kmIIdt9oQl7TguiBZ/JW1YDsQDt08JLc=;
        b=OlWqRMRj3N2Y4IT/pz3dWf4JWgIx7HPIe29mU+hOInUMaxI7daOc0R7OPbUkKUiVCu
         WsdpRhoebMf+1Ru+0HeF/boHxmFmrgvxey5ceR8QwPRUa5T+YTGYsLqq431NZhT+MxJG
         w1/+qHlV2mj9VsbslBciUeMVJSufRDz/+6iSMuHsYLdR/gCUTZLXq7XHv4YK55cqGXPf
         Bv3HosBkIY0ek+LN+jNOtKfZ04EIUF6t7n9Qsl/V9KfqYLfVbVrq/Ixlhl4HEGCXbcGe
         FDr7BHXsos8lE8ho+CJ14LbHXKdsw/SZ3g+o4m9hAKjm0CB0e+6j7pIqKxV5gra0lrEy
         IThw==
X-Forwarded-Encrypted: i=1; AJvYcCUFTeX3hAQ3NxSpVHDx0EoKkFnYORosxeiZ6IuJlOpzxBduiyXhj5v/Mk/XTWJXv245Ykv1E8B2jLpoeFk=@vger.kernel.org, AJvYcCVvvKNS16G37H365hE6sdu8rtpJ/aEYm/HFPr3vsUifplqoe1eCV9DKuKKRWDAXT9cB32hieXfW2kfG/XaS@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp4hdJ02Ny7PA+mQov39eJtaf7l689v6MZte9L8vGYJVyrsap
	7M/pFzhkkMDROdMS7czxx46VKnNXP1piLR1AsAOMTH0QgEZLY8DbeH3/uw==
X-Google-Smtp-Source: AGHT+IE3UaUfr+CoRIBNfq9UYZkK2yz/E+INkWVGrTf4grW78eSWFs1+xYfj/AKtlW1aHrIXQBoRgA==
X-Received: by 2002:a05:690c:2f0e:b0:6d1:f545:3d55 with SMTP id 00721157ae682-6dbcc2613f0mr27867117b3.12.1726247551461;
        Fri, 13 Sep 2024 10:12:31 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbbf1f38fbsm5778907b3.22.2024.09.13.10.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:31 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 1/7] linux-kbuild: fix: config option can be bool
Date: Fri, 13 Sep 2024 13:11:56 -0400
Message-ID: <20240913171205.22126-2-david.hunter.linux@gmail.com>
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

Select configs that do not have a prompt. Config options can be bool or
tristate. Ensure that bool options are also selected.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index d51cd7ac15d2..a828d7ab7e26 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -238,7 +238,7 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
+	} elsif ($state ne "NONE" && /^\s*((bool|tristate)\s+\S|prompt\b)/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
-- 
2.43.0


