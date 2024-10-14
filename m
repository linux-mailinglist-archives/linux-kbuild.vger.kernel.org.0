Return-Path: <linux-kbuild+bounces-4082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63099CC78
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D7F4B234E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C32F1AAE2B;
	Mon, 14 Oct 2024 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGOd9jaZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA419F43B;
	Mon, 14 Oct 2024 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915241; cv=none; b=M+c54BjIgLTrCwc1xqd2Z+4c2noiPyxZD/0ZtsDCEiCFveArDU/uwYIW3cDzQ42NxeGJY3jkx6pwRuUkelA8hIlDUc7YnD00NrMEckHjuJSNJtHCwFMfV+CNcZ16DKvoaMuDewNrEUbQeICWLbjuUXfQyesSVJdWIEj4P6hHwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915241; c=relaxed/simple;
	bh=5+B+94kuRZvyNX2qEupS3kQ/Jzgkt73OhhJnzBzzB8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8XpG2s94XVI1bxhvnYL87DVe7pxtgpoR/xvS0uTO65sLLu4PdWNAt6gbGeI/aKWtxdYTi3xToaJCqVHIO8l49lJNsMQrmgy3DxWpTgNtM4TTxOfFGjze1ptFu0Dm7eZq8lak5VuLTyMyOmaTtAFUy6Cy9kn9yk0g8IZr8edwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGOd9jaZ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso3615682276.3;
        Mon, 14 Oct 2024 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915239; x=1729520039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri0LHLGarX1BO6YHRIU6aF9lhqxJiLUP305ntwvuFnQ=;
        b=DGOd9jaZkn/vG0gEsH/kbE1Wfi8nbFHuwwh3uUcMxhJzOahe2oXveYn2SGbY3+x88t
         RCyT+gr0Q0oBQjs4BNEzbcm6zwPCvOjO7IG8LlVvB97kQjIXKqIMZSTiqnscdJlZk/+g
         lxNgpVD96o5J8/At10ZsgV9PQZuOiP4P78bFc96YrrgX+LOk2kqjFrZg7ahQm3XnmUx3
         treo2ZSmfcL7YdKXwzkC0ZZX3hR9716Gxay2SbPVUM4jpgJRo6aes+QltfUpX+i0pcZn
         3lukxx/MMWyO5QhivD76kGo20X8vi46c0iwy7mffQer/uN7MVrSKxlHzc++jhKhG29GY
         P26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915239; x=1729520039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri0LHLGarX1BO6YHRIU6aF9lhqxJiLUP305ntwvuFnQ=;
        b=TXZn90/IC3Em2gIpKJtwB/PvXWUWhuyHNYXeNxVKFhPMYqZELP08kZF/uMSMPV0Pqc
         A+/76kyHF3uK6BSJdIKrsM1M0bHe4WkHTi5Xu/M5VeKJv2cvzPlM0ccPure2yY7+Z8xM
         zhhEt/3xAcURizwhll3awfzWadwTWj/4pkdfl4f24kR4Uf3nWgtwTP3Mb/JC84qtYGeU
         a4bnTXf8pneBdmB3I+AaC5IWX89+WoTBeXdo2Ypv/Na188BVgVBUR7SHjU9Dd3/uwHKn
         66tZwXIfGADb/k6jHQOv7q1A28E6t1lYF8gnZvS3/gC9BAZU+n/bBnCrrahK+xt+b3PW
         Hc/A==
X-Forwarded-Encrypted: i=1; AJvYcCVjLyP3o+uNPn1Zvc81iEF8IvdQnJHa7IZc85WKvvBsL4IoZ70pcbKvHSIiV8lIACSqEVAbAtXounhG58o=@vger.kernel.org, AJvYcCX5SdyyxRW1HRmhuU6Qmkh3dTHI7VceA0l7LEqvBr/K4sT5JBj/huu4hqiO+XtFXTCpqzyuDFG8NwiMQ3pq@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnB1OEI6WktNa72QWWo4c5+0GyDwG/nkFluOWK8ShoG3vASD1
	jwIzTJTwcjk0sEiEwNlsHkNlRX3olsGFS78ZTOH1jS/o7nS6YnBoqcuBVQ==
X-Google-Smtp-Source: AGHT+IEl6xqHp+bxtuvuDbxs2LjhCZ6szsW3vZXr5WOk7e5246Ojkbw2gC9m1P91gq5SjFpmGKqr7A==
X-Received: by 2002:a05:6902:2688:b0:e26:8e8:b29d with SMTP id 3f1490d57ef6-e2919ff46a4mr8750329276.53.1728915238978;
        Mon, 14 Oct 2024 07:13:58 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ee16d5fsm2438839276.29.2024.10.14.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:13:58 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 1/7] streamline_config.pl: fix missing variable operator in debug print
Date: Mon, 14 Oct 2024 10:13:31 -0400
Message-ID: <20241014141345.5680-2-david.hunter.linux@gmail.com>
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

Put in the dollar sign for the variable '$config'. That way, the debug
message has more meaning.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-3-david.hunter.linux@gmail.com/

V2
	- changed the subject
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index d51cd7ac15d2..a85d6a3108a1 100755
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


