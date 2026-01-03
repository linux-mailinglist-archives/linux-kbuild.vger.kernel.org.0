Return-Path: <linux-kbuild+bounces-10409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3DCEFDD1
	for <lists+linux-kbuild@lfdr.de>; Sat, 03 Jan 2026 11:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B779A30204B3
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Jan 2026 10:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED42258CCC;
	Sat,  3 Jan 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwgzKfIY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DA14F9D6
	for <linux-kbuild@vger.kernel.org>; Sat,  3 Jan 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767434577; cv=none; b=I1IzcbGBOGpd79Ge3FuzfGS9o1egExWq1b9YtzSe7oOtthTjQLtKBOZf35UYJaocOJ/V+IogSty5/kQoe8R0+q1ddyLowTW9e6iD5sJQTBcWOXI0geVUoyF4ss1k0Z4j4+N3ia2GyTsZAlR2PQMKZPKKnizbBrPWLjCOOpsRZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767434577; c=relaxed/simple;
	bh=qPbRsMMm0OalGU9qVWShgfi/u94dI5ZvzdhcCM49xKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0509y/ujl7GYz8ysdkHuFX+xp2noLUt7H+JKuuXvCvwJ6IL/oMoo/op5hvx4Iv1o4DzcTFOBCkhybEaC3bP5uA706MPUGpfQxoEgmUzK3pRQUt+o2VfQTFcTtwgdiVr2/LLNKRwkdyun4kB+YJySg01bGubaPb10yq6Kni6luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwgzKfIY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432777da980so3447780f8f.0
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2026 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434574; x=1768039374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
        b=FwgzKfIYM1ex2C/PxtpeVUnJAA+ULw7L2VMcXJqrCfix8tgyA4w/nOGqo/3NUkQn8J
         lDo6qrMLDBd+lORO2LSqRhF0ScNbvTaSN9oy4v/o6M3wGRBhFDQ1MPNjt3ib6iIqIu5+
         +O1YrMfn9B8Jjr2xunyKhHpJSpltlfDN+eZ87dpNmt4l+k0CDH7pYiihKqcXZuPHY2sx
         dSak1ir4ZQ4hftt/bGNrtkQXvm4zBQnxSN5iL+qH3hTAxAFwo0eCvbJ7OrIGnV88OQL6
         Ukdr8zFlwE67pOXI7CVx0wND88xAQ2g7mhVxR3ca/pIkESKER5mjgewzbuInPc2F2aYN
         wHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434574; x=1768039374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
        b=Wj9gr6PT8cT4uaP0PoiAce3/wBuivQBtXJ6U16CbHupDO/W7Z5NVVdF8mBi/6lA1gM
         TFCOlapqVTS19mb5l5sh78dfKPOwriv3oRyLn1LO9AHcdomgc+8/8mkedLwGwEtg/nM/
         F3Vr7LKlBGIKqNIKZVtE323qNi6e0Pr39UmPEO8Xq305MagJW9mVJwMkSLm5kk03yXYB
         3eXxA91+2+ytUe+VhgzTBHWGd9emp0/Uws21pYeL1x7nQtMUzDCpMFnutL4/WdpRPmR3
         Fr4ZSdcpIhzozz2xvehfxfKQuSF+eUvgd2vujLiz3siwVQQ3UaA0wZaW3YKjMTy2rncW
         erdg==
X-Forwarded-Encrypted: i=1; AJvYcCVRPRyBVxFcpmw2TWcja3LivXctybHSI0ABeOmVzK7pNEk8rvQcPvmGXGoOa0y9e3tYYg5mM63jfvNPRZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTkmjup9qjuVn4zKpt0PiGPAZ9wACEItF+gklknce/ZMD3cz0H
	Njs41/hgmhH/32a/pJfZP2GXi+jxPEmqeW+1s7rvO3tYGjxMNG22/zIGkODFFiEVUSU=
X-Gm-Gg: AY/fxX4yl+P1XURk+8zaPXOaO+gtImCFU0QqboGuj9cwDaBpbgo9xNffBxvDQj/EjbA
	msPk3RTLD9dPHYRVHvwQNMWNPf9hHYnYWN11hsWXBXzeIOuy82EfhS/dCJS8+12/BOh8xE8ARxi
	jriG2rbAVz/EodUTHnMlXhJ8+H98uOKg1b6xwKQzWMlx8HyzRonfZ0X54lLU2dmWpBxVvzyqHs1
	LXkyZ4DqmiotVCtnuORcD6j7P42reZPm7gHqwCGGPWO9o8+p2G/zsyCkvZ/ADsR4oOf3J0k3yon
	aNTSmuA3ZSzebCcAKSMni/IK2SASNqkj48oicNCt5+NpaRPj2Fa85lo1/mgLc6gFKWK3NOWxvPS
	EkByWJ/VBVoSfdLwxqseVUlKLsZdPNPfcURPb/+bVnjSSOmGobiuxqGFovGt0ZcB8q8L8nZuABt
	x1zvzS4/CnAI2G+LUwNjaSWOS3mw==
X-Google-Smtp-Source: AGHT+IFPkanq3RHUbcsbNCpasG6Z313jdsfGQVH9J5om8n/FtqWwK7E4sTbdu6zUmursa5ksRK1pIw==
X-Received: by 2002:a05:6000:3113:b0:42f:bb4a:9989 with SMTP id ffacd0b85a97d-4324e4d0fc1mr49661835f8f.28.1767434573075;
        Sat, 03 Jan 2026 02:02:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2a94sm89174903f8f.43.2026.01.03.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 02:02:52 -0800 (PST)
Date: Sat, 3 Jan 2026 13:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>

Thanks Randy, for sending this to me.  I'm on the sparse list, but
I've been on vacation and haven't caught up with my email.  I can
easily silence this in Smatch.

regards,
dan carpenter

diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
index bfeb3261f91d..ac3e650704ce 100644
--- a/check_unsigned_lt_zero.c
+++ b/check_unsigned_lt_zero.c
@@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
 	    strcmp(macro, "STRTO_H") == 0 ||
 	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
 	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
-	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
+	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
+	    strcmp(macro, "check_shl_overflow") == 0)
 		return true;
 	return false;
 }

