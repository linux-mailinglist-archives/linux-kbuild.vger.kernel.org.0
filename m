Return-Path: <linux-kbuild+bounces-3538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93A978676
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAF641F25925
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8668A81AD7;
	Fri, 13 Sep 2024 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZlS1ZC5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3984A57;
	Fri, 13 Sep 2024 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247558; cv=none; b=ixn5k1gruI5EKDmJM4a9CRmeFUQuld8B4NjQswyx1bXK1B9YAvxU+Tlawfs9ckomtuoqC7Hqe+COpmmRtZW2eZcCftvz1Ypzwwfs7dnXuaphi18ESkm7fO7DV+JH2ektj/oZHeUKFZb9l2azDypHJfB69cs0gPNmV0D2Mq5Ftkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247558; c=relaxed/simple;
	bh=gfIBBX5HQovdeZCeeMgLJiHeNO4lHGit5OFph2ZVRA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEKXHXSOSbUhyT7nRT7ZvGkhPVJ2HkD430pLZ3bxP5R0BXhb+Yfx/KqF0FFuIp0w+VJN+gC0SD2ZNlniSE06xjvy7W6KAAR/AOz8yNK9OOq9vPyh2Z3PXa5+uMZxzVBY84YcpO0t94bW6EfzxjwIBx2nVjRZuzpSmzGBrl9OdHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZlS1ZC5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b5b65b1b9fso19247557b3.2;
        Fri, 13 Sep 2024 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247556; x=1726852356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M7ObXrMB4UkFb/Zj7afK7ol0HldwVxv8ot4KGpGZhM=;
        b=ZZlS1ZC58jAg3iM9yQUDhMreMZVAiRti345WMa4zJ3mfifIEl7r0qnWQI3AOlMfG2v
         KqyVAcFLj4K4fWUi5RN/De/gzWoBWxw+W5PXUW/clNrw2aZ7k+u59FQLTMwa6Eebj/nS
         HG6qIQ22holflTpCAXkjTvIFkXI1oMU1JfCRmW0/Hf8U9wh6Y090rf28w3K9FnbIFmFD
         F0shPkBkAsq/QjvdKXlhhQEcnWzSLPDFq/auPlZ/dc893gYnHnhTLKz60dFxk1pqBmXp
         ltMUSjPMYiz3fCQISA9f/2lrVuJIyE5NFqPMnbP6Wyyi7tuGfuH8AJXYlEh1V8cJWVEO
         8cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247556; x=1726852356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M7ObXrMB4UkFb/Zj7afK7ol0HldwVxv8ot4KGpGZhM=;
        b=kNxiUHnlPnhjl+JywkVHUfixU5f2KUU8evLca6ELVNIc6N+bPb6ioCA/lQ4EVmR8Ji
         r47lbswzy1pfpohFZqPmb0mV5CvpTqfmY1OcF9qfA9zfCxdvHrpZeSeQbGfPdG7qcQ3C
         rxEdmG1nalp7xMhiOq1E5q2I3Q7UQNcd8POFFKv9ORs5zlBO4dNxjdvPR+VTfsAW7iDV
         uradqKN+vp4ipwznDKEeLkPv2H/f0qQRQ9BU/8BxUNee/xS3mJUx/QpHbczFg2eMnOMf
         O4fmraeVQfE34TSkM2JMg/IIlwYPvMxPO225BQJUgMqFoNbvDegBkIFdVS2XJIGMSLqq
         KUaw==
X-Forwarded-Encrypted: i=1; AJvYcCVA2G3hGAThS39cli8tfM85R2hqvumkFAKvIqy+2fBsPFgw74+dQBSLVRydljse547HzxouNTpxamq9G84=@vger.kernel.org, AJvYcCVoX5vKjONPoRBJFy/4T0rfP7Gx677yHSG2w3M0LTXSpJiBaHupjkvWql50+4x5nKbpYVpV2zTzZSHPVl4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YoAXt1cNbAYOx3hMP98rKcWdhMtGmzUITIiLjNUyb+G87fTN
	6HiRfWDNUnrTz4HeGpOF477+f95NzcciOSuSraF3pVE6hEbtNAtJSBfmiA==
X-Google-Smtp-Source: AGHT+IFtOACW0/KpsabaZnrciDKM1vzyAvGZ9qu/Rw6QnhquvvPkXsqmZ+RfKX9+dtugQX6DPuEspw==
X-Received: by 2002:a05:690c:6a87:b0:6db:d776:5e29 with SMTP id 00721157ae682-6dbd7765ec8mr18053087b3.17.1726247555904;
        Fri, 13 Sep 2024 10:12:35 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbcd85f5d2sm3215067b3.60.2024.09.13.10.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:35 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 2/7] linux-kbuild: fix: missing variable operator
Date: Fri, 13 Sep 2024 13:11:57 -0400
Message-ID: <20240913171205.22126-3-david.hunter.linux@gmail.com>
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

Put in the dollar sign for the variable '$config'. That way, the debug
message has more meaning.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index a828d7ab7e26..ddc630f2264a 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -503,7 +503,7 @@ sub parse_config_selects
 
 	    # Check if something other than a module selects this config
 	    if (defined($orig_configs{$conf}) && $orig_configs{$conf} ne "m") {
-		dprint "$conf (non module) selects config, we are good\n";
+		dprint "$conf (non module) selects $config, we are good\n";
 		# we are good with this
 		return;
 	    }
-- 
2.43.0


