Return-Path: <linux-kbuild+bounces-2624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FB938BBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 11:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897191F211A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 09:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD7D16B385;
	Mon, 22 Jul 2024 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQ10Z+bS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1774E16B38E
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721639236; cv=none; b=laV2JCxrkZfsbATHxhM/STcJ0NBFRWmQcnqnwvoCfprmhvXIITA3G9gD0nVywoLwbGI3iYahXOwT8aOSXhnJb+nrCFkRu9ClC9WHPW1oyfgqe9+RbZr6dOUI7w1DXbpqhcztxEt/tEElhvteBKaSpUujAtFCAYYPD4TCag1oABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721639236; c=relaxed/simple;
	bh=J9TwGknNWjs/N9deiPaq5k+uLL6PXCMwbiv/oe6XZ94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YWrRKYFrMn77K8fFB9QFQu2qJ+YTZXXctKa+pAc++IIODXSltQpHVmpod3CQfurdQ8hRyLgkkfAOrVhIdUbXCoEwu181Eb4uvMg80psnsX5/WF7Cspcz45kNcRnsJmsM5/MClS/ehKc8WZ04aPFn/OLPcZ+CdQIlztuPAP539Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQ10Z+bS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso8989671fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721639233; x=1722244033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/F0ZmP17hObUGx93Q7otIls3wWDQaOtJ+irX03aguA=;
        b=HQ10Z+bSAbtFT8HdmzvO55SF5l1Z8FImaPwOkvWAp0fuUGZyJrCoPh/UAS3ddbrqks
         Ob9MxFSHD7y0wEvPO20Iq7SmYsd4m+LSqv74tJ7AjA3v1oSGSIC4FlmDCLQ7hyAVhAyI
         l0b0JnQZl0+eDnE1aJhZbcjJcQ0NkoQAFy45fIA0Rt4HSzxPJZnrYCE/C6BU0e6Ek7Zs
         J9CeOoOcLiTO3gT3DlFqYJGKwtZsf2WuIdbQOqYubBTjuuH5AnZCjxklL+TKSrOe5w83
         iSQoBR7YKhuXgFwPCBkpSO5v0m81jLdzshjBXoc1fSA/Q4lCLaYhCURTEoo9sM67O6dA
         9vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639233; x=1722244033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/F0ZmP17hObUGx93Q7otIls3wWDQaOtJ+irX03aguA=;
        b=uxXb3mRVsgLj2/GauHsIk+0h5WNkmrkW0BqsRQ+/7fujiEMXtp90Gw1p0nGt4Q5OV5
         kC6EyLftsSkVKiUGTsVEEvc78XyueBqKFtKYCtWN37xHy5symbgmA+8WFU/kxkDoW9wp
         D2DuuQeAQmCA3yXCCBM3GTfp351rPqh6rvx2VInIRaIZ/YP8PNpW2oMhCLtiXm/Y6gqM
         54/3Mhd+Y7iYlPYzdZfpuKMO2ZpwIw72W9Oz7sgQYyWtqYS5FugvahLCP27D9gwDrQjD
         liFm0z0jzLE86q+n9G2ojbo6j9JLYfJewzQqb3uMuxJRAS2yljreSlv4tpcUdaln0vo5
         o2dg==
X-Forwarded-Encrypted: i=1; AJvYcCVzB7Wej0UWg6DuZcBa1sH/oRr/DKvBfwtKBEDVbqgqsC9RgV8WxFlj3cEEocIjQE8Hptj9ZwhbxDAKw5p1gyWB+5MRkuKtGv0JEjLv
X-Gm-Message-State: AOJu0YxhgexrlZPJ6YpvTq03qibg6UNFiA6SSDJBQep8E9KpQiyelZdl
	9CACEctzj46rEwlJk5ZfEIywAjp8jivaA+bTx/Zpw7DG1CfaLfSYa+lwsU7TWfs=
X-Google-Smtp-Source: AGHT+IFCPNC5SoKT5EINogEfHSqyN/UbbcWJnoEmhmIjj22SyV1kqmShS7JNJ5O4PLkhW1QWWrFjrg==
X-Received: by 2002:a2e:8789:0:b0:2ef:2d8b:7cdb with SMTP id 38308e7fff4ca-2ef2d8b7ea9mr21511281fa.22.1721639233272;
        Mon, 22 Jul 2024 02:07:13 -0700 (PDT)
Received: from dhcp161.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7753abeasm7534290a91.48.2024.07.22.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:07:12 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 2/2] module: Clean up the description of MODULE_SIG_<type>
Date: Mon, 22 Jul 2024 11:06:22 +0200
Message-Id: <20240722090622.16524-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240722090622.16524-1-petr.pavlu@suse.com>
References: <20240722090622.16524-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MODULE_SIG_<type> config choice has an inconsistent prompt styled as
a question and lengthy option names.

Simplify the prompt and option names to be consistent with other module
options.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index bb7f7930fef6..ccdbd1bc12aa 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -228,7 +228,7 @@ comment "Do not forget to sign required modules with scripts/sign-file"
 	depends on MODULE_SIG_FORCE && !MODULE_SIG_ALL
 
 choice
-	prompt "Which hash algorithm should modules be signed with?"
+	prompt "Hash algorithm to sign modules"
 	depends on MODULE_SIG || IMA_APPRAISE_MODSIG
 	help
 	  This determines which sort of hashing algorithm will be used during
@@ -238,31 +238,31 @@ choice
 	  the signature on that module.
 
 config MODULE_SIG_SHA1
-	bool "Sign modules with SHA-1"
+	bool "SHA-1"
 	select CRYPTO_SHA1
 
 config MODULE_SIG_SHA256
-	bool "Sign modules with SHA-256"
+	bool "SHA-256"
 	select CRYPTO_SHA256
 
 config MODULE_SIG_SHA384
-	bool "Sign modules with SHA-384"
+	bool "SHA-384"
 	select CRYPTO_SHA512
 
 config MODULE_SIG_SHA512
-	bool "Sign modules with SHA-512"
+	bool "SHA-512"
 	select CRYPTO_SHA512
 
 config MODULE_SIG_SHA3_256
-	bool "Sign modules with SHA3-256"
+	bool "SHA3-256"
 	select CRYPTO_SHA3
 
 config MODULE_SIG_SHA3_384
-	bool "Sign modules with SHA3-384"
+	bool "SHA3-384"
 	select CRYPTO_SHA3
 
 config MODULE_SIG_SHA3_512
-	bool "Sign modules with SHA3-512"
+	bool "SHA3-512"
 	select CRYPTO_SHA3
 
 endchoice
-- 
2.35.3


