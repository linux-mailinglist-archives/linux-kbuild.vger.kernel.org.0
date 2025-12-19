Return-Path: <linux-kbuild+bounces-10288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE7CD216F
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 23:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B52B93001BCC
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA10199949;
	Fri, 19 Dec 2025 22:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfNtDWjf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122291487F6
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 22:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766182712; cv=none; b=sQKvBngK7O+fdvTIK5+0tvl7NK7UslyIcuC1obcnwSm35dPrrNMYn83fa1vZLzAxnQfio0RpNM5f0RSPYu30IpnpUlWTLR0FqdRnSbIxvlUDhh8JIOGcJar0OVy3BgRkk9LiEw9ZmRXGyoGKGk3BYtBT6Er8JaW1OmaCw8pxx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766182712; c=relaxed/simple;
	bh=dyggFKYkHATvculCCrZqdJ7slx1kC+rp+7uwz1762FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdGoohT/CIJhEUmTmoA0rCyCaIr5FAq3jqM0oCG73roX/z+nApnyGvhxA6CulytXjZhzE5TRY2/56wWdTpTcusQP7T6tXQ4KrQdcwnE+jKCr6M4aMPF03ESw69Yr0/xPk2R2wrwBTW3NMKpeKfZ0oJ8VtSmWTmAfu8/MQM+8k2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfNtDWjf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so15789685e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 14:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766182709; x=1766787509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQJwxRPUK/2OdlbcMPnKVt7Hxg5Z9WKk/zQoAYjwUJg=;
        b=VfNtDWjf5gNz7F36axc1Q16+fl51vYdDyDnKGjXERcfv/1hKAxwMlGKbh0hD2ct9o8
         HW6q8pnfBZAnRugtOJdIX6AJkV7vKHFyO4uZmVV3JyxW/l0ctliKdSK8iy9Pd1z0eFpB
         LoUnnXPV8ETMALHWDJWvR/WOwTnhCVNOCmwC6yfPwzIR4P70yXdQQEXZljMSr44547Ue
         MoPyRf7AMMPk3RfqCZI45xYzdNLqsb86ufaIEbf1T5glqjsc0BDDA922WGKfL+jDa3fG
         WbcrEdJpSYdZAKS/x1c03TvDhNwnLNGNnP3zTGlPZ7XvKQbRfeyvgu6so7pjn1AWb3LN
         8kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766182709; x=1766787509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQJwxRPUK/2OdlbcMPnKVt7Hxg5Z9WKk/zQoAYjwUJg=;
        b=L8hsGELSoMS5KFlA4pB+kDzVmc5IlytCba9Oe279Lp3eto0EeId16FN+uhRdNJY+PE
         46btBkbOSNg93EyK79Jsdy/404PdM6OiKH/iGAMm+aw4juAhSkrQe3UWH0dU+YYzO+HY
         nd7x2lSLuQ4xuxhVben6xwU2MHUojDX5Hu+AFKfBEIjo6lSUQPYsmGhDDjqkLLc0u9X4
         0Cdl3mw5lUzqG/0Y/aMiiodmZWaCGvdiieXlqv32wV6qQxCdWbTSBuAtUAFfRFz2KDTH
         +n+IlS/YQrWlcJXuSIy+W6qIaUHyzhr5q3fawgQ8l29N5fF+ensXCkfFMeVjGieWwgtl
         mMQA==
X-Forwarded-Encrypted: i=1; AJvYcCXdXDgJNlzCH0lg+kNM9E6EERE1S/MVreY7r2rz9jYOZ02e5gL+4QlfNAx70KX0PRt/J7kBOzOMKDHzNKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuUlhwVkLauTC64+Vk/PVC7Hpw8/ntH43xgn8zxbSzI3VgTgf
	OY1YRrz8znL0dT9OAWWjEp3/vL0hXrDc8fHT6GHaHpcmVOkDzHqKvjxY
X-Gm-Gg: AY/fxX4Zb2ihB2bSdC/GeB+mhc1xOmoMxNMbo/uxP1Sdm301aSLPanf61WZCLMegWN9
	udbpevHLLHzBLnZ8Sba+7SgeE19fPw6Xaqm6ywFwc9oj7MkXcsP9SDyfBSvkoEwd9FarNY5P0av
	mT1gIiiqEziXwveCk7towk39SsGt81ckJ7vGxWb2YPwsFwYniDjKXJRKnoDQ8Ctm2bIWLsQBumr
	JLcGK2OqhA42k4aHBLkExJwSuRntYoMcBA6/SiqWui2e1vLnEIZtCzz171HY7RocNb4Ti0rPOHF
	tQK8P6Or6v79+1QGcpHhz7jTiKlkHR8FZhKnzm8zqjowznaBjaa1M+QXrrjnAevkubJR2rhoHbQ
	Rd/qRmYSnvMBPQ70EqKz2ZXSRdX9duNkKDWp12nwY6JlDTXVBnT1UG8Zuuk2JZJ58jwnDPGDY8u
	gnmKyxebsV630ILe5FKmHbmZZ/wTEFFkDZ6LQz+j7MmxO0dES6wtOS
X-Google-Smtp-Source: AGHT+IFdbfX2VjooFC/IeancJMkqD9QDu6TZQT1ikcQ+IhMWuXDbEwCH7uHHpiyYXaqd725Qq4HkAw==
X-Received: by 2002:a05:600c:8216:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d19549a07mr45741515e9.1.1766182709164;
        Fri, 19 Dec 2025 14:18:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm129944585e9.2.2025.12.19.14.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 14:18:28 -0800 (PST)
Date: Fri, 19 Dec 2025 22:18:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Message-ID: <20251219221827.4efa210c@pumpkin>
In-Reply-To: <20251219201231.GB1404453@ax162>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
	<20251219201231.GB1404453@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 13:12:31 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi David,
> 
> On Sun, Dec 14, 2025 at 01:15:28PM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > The kernel code style is to use !(expr) rather that (expr) == 0.
> > But clang complains that converting some constant expressions
> > (eg (0xffffu << 16)) to a boolean always evalutes to true.
> > This happens often in the validity checks in #defines.
> > Move tautological-constant-out-of-range-compare to W=2 (along with the
> > similar type-limits).
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> 
> I would like Arnd to comment on this before applying because the
> reasoning of this change does not feel good enough to disable this
> warning. It is not like '== 0' is inherently uncommon in the kernel or
> hard to write to avoid the implicit conversion warning. To be honest, I
> am a bit surprised -Wtautological-constant-out-of-range-compare fires
> for that instead of some sort of -Wconversion warning...

Somewhere I got confused and must have looked at the wrong email (or just
failed to separate two very long warning names).
The actual warning was:

>> drivers/gpu/drm/xe/xe_guc.c:639:19: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]  
     639 |                 klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
         |                                 ^
   drivers/gpu/drm/xe/xe_guc_klv_helpers.h:62:2: note: expanded from macro 'PREP_GUC_KLV_TAG'
      62 |         PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
         |         ^
   drivers/gpu/drm/xe/xe_guc_klv_helpers.h:38:20: note: expanded from macro 'PREP_GUC_KLV_CONST'
      38 |         (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
         |                           ^
   drivers/gpu/drm/xe/abi/guc_klvs_abi.h:36:35: note: expanded from macro 'GUC_KLV_0_KEY'
      36 | #define GUC_KLV_0_KEY                           (0xffffu << 16)

Inside FIELD_PREP_CONST(mask, val) there is (with the patch, and if I've
typed it correctly):
	BUILD_BUG_ON_ZERO(!(mask) || (mask) & ((mask) + ((mask) & -(mask)))))
to check the mask is non-zero and contiguous bits.

But this all reminds me of a compiler I once used that would generate a
warning for 'constant in conditional context'.

	David

