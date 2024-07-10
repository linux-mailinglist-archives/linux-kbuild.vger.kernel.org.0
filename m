Return-Path: <linux-kbuild+bounces-2459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7077D92CB6F
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9437D1C22501
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A544384D25;
	Wed, 10 Jul 2024 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk09tq4Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0284E0A;
	Wed, 10 Jul 2024 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594490; cv=none; b=WPA/PevUCUf4dCG9C54JsrQz/br3dM2svk3AmlNFy6vx15spEBI9ZVnWmU/hlTQcneZ/WmyKbU0w5YodDdnqOgs7J4/NfSFCZzvEPRN20OdQGLXgin3y/TACWH+ZPtwfLwa2w1i2PDGqLsHvA3mlzO8cRzu5u9639D3ZxLyqo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594490; c=relaxed/simple;
	bh=XhD3n1oKeM/YS/k/7zTXEhb/l9FjVtgQrMSbjSE/4w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFRdpJMrF5VOHnoIbMgHCx+E5oLjp5wBYgAma5xNNCmgo7RNbxmmaBq6mISqoHviHn8O54JlO/t2ZmBeKXz4oAhuF7jGsfTkcpP5f4rRFWmzdLTv4Y/Zs/7dMCi7uCtlMqImUVkqvm00rMMFGP9jE+s4n6W46lhEa9VQ5Oqnthw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk09tq4Q; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58d24201934so849673a12.0;
        Tue, 09 Jul 2024 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594486; x=1721199286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYIGl18k/y2SUEw9ZkPuau+unS2SVmeP6xXXwBwy8Dg=;
        b=gk09tq4QiylivHQgTXNadRa6xk1ym/UL7Edxe7kbzoaJSjX6Xmpi0z4Dy99NxQ0l/0
         /8pIWluwJjU97C/2RZNAnU0feQBEWDmzGvspBA9JUvxjbsXilEqIbE+0mZrWOg3pHL/G
         xK39+8tJXvUrhJduuVCygevl59osnefiw5PGMipKg1DzZYZcDU+tV/aTqDbJHufFrzNi
         oKSHOS0N0okLHpTkOmFhbJ7KiJ/iTltBC2B3lt3EkOEJ/bCVoqcDA66TLTOs/DyuzH+7
         QSOsOsiydRtRng1OJj3Ix5uNIyZ+TALtkZPtrIyqHoGEJnhfIcJqEybUafonoqOTggu/
         AJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594486; x=1721199286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYIGl18k/y2SUEw9ZkPuau+unS2SVmeP6xXXwBwy8Dg=;
        b=kSmmqszMgXUaB6Hub0oyUdBrrChNdHRqGWfLKGTKt/4yk8w5jE7jSl3RIudl/B8fiR
         FmeMwAuC4uoVrHnHedRUfzIau27q1YU0QFWpki2uEnWba/A/WV4kM3a0eQHH2flaLMSW
         oltJDuElq8OwSAQAxOUKCbzk62/Lo8vYJp4O2L8IF1Jc9pixhwVUtuNur0aY+CRlIzGp
         Ozh7qgLprFN16Dc3M7t9uga8zodJK/43i2SgQlRTR3Na7DFdzCQWIdg80/jpGtyo3MTE
         7PMH1mHwJJ6biQEanIjyfSwTde+vLAK+NArKfYgZwAr+wacFKHocN2eZeUogYVPyWfBN
         9zNA==
X-Forwarded-Encrypted: i=1; AJvYcCVcmI+QsSqXaxK5zQ2EDvuNkr7C/PizwffdmNFcr9UVfOGJonH0ZaE3Sm5/AzEsJmdhgrFdJ8HnFhzcNc+Dw5aVStGPfhnTp3YIiDyb
X-Gm-Message-State: AOJu0YwtnpVBj/XeChQ60QHqXIn18BzJvLy9C0MnMbCtFqphku05xh9m
	AnIyyUSyyla43K67/7ek2uO/od2zf+y2ky9BIcVgdHBaDruzD9jxhdR7Tg==
X-Google-Smtp-Source: AGHT+IHADHtERmwQctkFO6pCMEleszVe02a9IEsQ4zEQ15SuAWZrtkejSmI+QA/V7pJkmUj9cVXrbQ==
X-Received: by 2002:a05:6402:5256:b0:57c:9eef:e54 with SMTP id 4fb4d7f45d1cf-594dc997facmr3287574a12.5.1720594486559;
        Tue, 09 Jul 2024 23:54:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:46 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/12] kconfig: Add loader.gif
Date: Wed, 10 Jul 2024 08:52:55 +0200
Message-Id: <20240710065255.10338-13-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710065255.10338-1-ole0811sch@gmail.com>
References: <20240710065255.10338-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GIF used as the loading indicator.

We created the file from scratch using GIMP. It's also available at
https://github.com/delta-one/linux/blob/configfix_20240607-patches-5/scripts/kconfig/loader.gif

Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/loader.gif | Bin 0 -> 4177 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 scripts/kconfig/loader.gif

diff --git a/scripts/kconfig/loader.gif b/scripts/kconfig/loader.gif
new file mode 100644
index 0000000000000000000000000000000000000000..54c8bc76cc037ab04dc1d37ddc34384f9714284e
GIT binary patch
literal 4177
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

literal 0
HcmV?d00001

-- 
2.39.2


