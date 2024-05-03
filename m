Return-Path: <linux-kbuild+bounces-1733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A08BA340
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 00:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EBF1C20B0D
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 22:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846568F5C;
	Thu,  2 May 2024 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IdyzE2iU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD61B960
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714689227; cv=none; b=Cdku+RnI1pUPuCFoo3TBPJRdkZB3wXwgB/AhMbqJuYbasImS4oaaVYwHBrhoHB+rUk4cTjWVnOZO+9LnMAdPsKZnW67Z9G2dvrKU3KCmaQG0mSOnPXZoHh0FO9hTD/99BT6rjVJx6gbjGfaMUgBO2FyzWMKfVqYFGjbL+oz6vF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714689227; c=relaxed/simple;
	bh=P8oJtedy3HXH20Pj7T8DcdEaOEqGIej1pz81IGBrmfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aHyAkCrLoN2VNgx9gK0AazbNqCxUiQcA0ZPWYZqwD9bUDRhnMoXH3eLaqame9XHnKh8NePBNQZem9VrKZ6mLbtGcR3R1iT4YUns0CbVmng1Do3XAviKA4yO8RH+HuDmkhXXrEywweTROmQ1i28tQBJ0p+CokwKt4i5p3OeyG1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IdyzE2iU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e5c7d087e1so74038435ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714689225; x=1715294025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syonTmYD8c0TYLT7ugjKF/sEjFnMsTQVi6C/fR41bxY=;
        b=IdyzE2iUNgNuVl5SDzOXszjPPyfM6BIpLvpDd3fgRvRReHLSybEKA2fgrw8R+XaaDN
         hAJiQi9hb+pk9VnFvinXfag9eyKjHc+c2UujHIhzKvvNEaJknwDbbwjhuMShWgb7ibY6
         KrG5/VwKfWO/qywEhttHeDLC3DTLIH3JWxiss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714689225; x=1715294025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syonTmYD8c0TYLT7ugjKF/sEjFnMsTQVi6C/fR41bxY=;
        b=NnisWLrM09CksfoFjP7Az4iRy0C3MAD/ovW0HRd51aFReA6DVnGItWQyOg4OpGomWp
         lyjbluDWUMpcg1fIONRDHL2EBFT3HtNWElfF/5xEGgZRaaMBUK3ChbS2xHALRAGBWSSv
         IyNdU5ymNaC5tpn+R1IsOKkuKOcbyiGnfiBvsTruJAVEYioeetw721CKAljNpX+nUWzu
         wc1GOjjK6eq9rY6Hd/xDTOQms7DYA23XPZVtW2LFSkDSedM0Rt5uZeNgOuDZy0FVixZ5
         zyIk+c3YUi+7dASLy1q6xoINEGScdP4VzkaejOfI4rdqFR0WpKJzy5EJy9OrwBHuJjHP
         p6PA==
X-Forwarded-Encrypted: i=1; AJvYcCXt60ihfNFcKx/vExLeln3vCDsn4NLsDXshcEosNLbgXXIo9FfNh8gFv14BTQKNASHb9fhndtLoAhsXL3W5+6kqvMsD6fixFczh+Ba2
X-Gm-Message-State: AOJu0YzNPh6kKh3fgkf1phm3yqisaaXHUaegqqkG/+m8IQ7PArzHwjZA
	+3v2FEEjak0YUjrBJkyG18DnhBaGFgKck5XEZK8S4tOycaoEmV0mjduA56i0AQ==
X-Google-Smtp-Source: AGHT+IEF0+ZDExdwzLRwfCmuME2rfDCoHX3a0jBuTtemcfZavKrmzhzYpowtSNcwJG7mXyaEXL+8xg==
X-Received: by 2002:a17:902:bb8d:b0:1e6:68d0:d6c1 with SMTP id m13-20020a170902bb8d00b001e668d0d6c1mr934693pls.40.1714689225425;
        Thu, 02 May 2024 15:33:45 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001eb2eac7012sm1885713pli.138.2024.05.02.15.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 15:33:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matt Atwood <matthew.s.atwood@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/5] drm/i915: Do not directly manipulate file->f_count
Date: Thu,  2 May 2024 15:33:38 -0700
Message-Id: <20240502223341.1835070-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502222252.work.690-kees@kernel.org>
References: <20240502222252.work.690-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418; i=keescook@chromium.org;
 h=from:subject; bh=P8oJtedy3HXH20Pj7T8DcdEaOEqGIej1pz81IGBrmfY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmNBTDTJYtS4zv8xaeAG0nbcBc+V98YhNpyJSpC
 aI+gh9aiHmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZjQUwwAKCRCJcvTf3G3A
 Jj8cD/oDPHTNltydyOxjPKQZBsKvSQLMCwHO4DniBHjFHb53bO32xnSinmbDfMMW6W+37gvrw8+
 HE6zUQkGh6uuZsI+sQEoqKgttjLhXt9oHFUm4OxoD0XufetWCTKTscDgXMU1JnsNj8DboYt4rpJ
 YmSi0hs6QUUf5hOHAUXAKfGs5W7DLp6tpj4rGdmFqMXpkgD3QrChXAj6i8RDdUrhyk9B2pBuY+4
 sLgAOFTS0sj9z31xdOO8K3DRa/huLmrWWbAxb8bM8wIR0JFY0lbyIDpDRceiptDZaIJ6SDuE+tn
 8hO23F2XRQBqC2khO22JbW5VDa0wCLX1gHTzNFPXb1tP/0vGKwSn9hsEgK1Cs4O8uH/j+XXx3Fu
 ERZsO42/LUneZufeL5Yn/IXSKnnFBz50uY0DLgUUDbyVaGRt5r41lZ6VS+ICzQdfv0Np/iFVmVj
 4QbPjG3GeAvApJNmze6/hNVFC53hBO3XzEb5rZp6CQ0esedaZROBpIP6JhlqTAT/UsP6lYFZCjN
 mf5dE8DHcNPFgiFNkrVlemIs+i2cWQzPwKMzqlMsJhnW3wYbbkhwnRCZcWpBFOiCxbnTuQiPXd0
 MQTHMYZNA3iJPXlf8SU5ArabrMEfY+TNTBgUTOjKDUiIcn8B6Ykj8rc7hA4qkFA9Q3afzMjfC7m Uvjb+C8zzpXuOpg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The correct helper for taking an f_count reference is get_file(). Use it
and check results.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index bccc3a1200bc..dc25e6dc884b 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -38,8 +38,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 	void *ptr;
 
 	if (i915_gem_object_is_shmem(obj)) {
-		file = obj->base.filp;
-		atomic_long_inc(&file->f_count);
+		file = get_file(obj->base.filp);
+		if (!file)
+			return ERR_PTR(-ESRCH);
 		return file;
 	}
 
-- 
2.34.1


