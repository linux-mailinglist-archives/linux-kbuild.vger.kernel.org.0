Return-Path: <linux-kbuild+bounces-7464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CFAD696B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 09:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2822D7A5DBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B1D1E51EB;
	Thu, 12 Jun 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIeXCLuF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B386342
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2025 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714494; cv=none; b=PmBH7dPJOikq2oipe9z/IXVn5nVJcwryG4FzXXCg3xacFeDNcsEzdHsrBeF6pg98rJSJch3GV/fFJjmrAGJrPfK0srbelR98dHukWELBreH6QIqyPGak+8ShMRSEAfCYGUm4o7T55MEhzGALpG+s1Ao2VX+LB3bqnpDvWmHTaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714494; c=relaxed/simple;
	bh=n+1f09E92CxLCgLqjC+6pPSLsQ/6pMQ81Wh9dF5bJuA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dfP3uGCDlQki2TI5GngtzsyNPeJ/Z+D9+JzwG27z4lU6CzNxm7rBdJY5vUZ5tBtUJQw+lo+XPg3x8UV9SQxmFn+YI0rhBcs1Dec50cxUmkGcLUf3FJutKlW/kmGZzhFk9wDAHk/niprDU8+jtdQTnaqIJxh+2hHkyTu/JmnU19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIeXCLuF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2352e3db62cso5914335ad.2
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2025 00:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714492; x=1750319292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUhdqf/fExeaVnn2CQ3kIOypz5HwDANmHHHRrEiESKg=;
        b=UIeXCLuF+uORbaY5m7l9wuiG2lBgJwEbjty7mCM4Dit3K33mQTIEPX5a+OEORa/tXl
         FppMcanDefy6MnKmocF9+7VICOmg2xdcv6cR0AyjMli5/82cTZyzYQClFz0WUphnTK56
         3IzHhQPKYu4n7Wwybhroy2tsHUMB2F1cejZCGTDixsNe19mycnD1oAp9Ttl09tIth78W
         vVav7e/d8EMI5pgfG7EVRJHpxB8H/xE+1CI9ZVdVyB94Em7dCdbLooKYz5idDeB/lX/d
         bDIi6x3zRIyqsB3xUMoYouQ/498ZeT2Wt7ZSH1E0EIBHw4OefOG0mD1bItTOr+kapKwE
         skQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714492; x=1750319292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUhdqf/fExeaVnn2CQ3kIOypz5HwDANmHHHRrEiESKg=;
        b=v9tklJCpd+tnk6bYEXvnXavT9mr91JxgfwDKuZomfIg3ic5WbmfDl/4WbGuEMF+NNR
         Q94ckDjKeMfFOlZH5w6v5YgaHH23byQ5SGiuKhkRoDe91CBeEWM5iFQekvt/+Z9IIGuT
         srctyZnkJaDywV17E2RamqB2EFO5zZdCVCpJ4C0s7HYb7YQCIZ+JBhaRbYQkUanwGrAr
         BoU81OXQIptA/T/9VvIZ/q/gH+SCE2ejtTuOH9hHLprjpGSdMmCASkRo+4AArR+yAY7g
         s6IF0hZ/c9ot76xrzmrCyLBAeteIhrk6mE5WIL1q6jtgNvBq2nStMEgjRtuxYP+JmYcg
         HKUA==
X-Gm-Message-State: AOJu0YynM+iZSu/vfdR9IRQ4i3ffN0EYWrsqpn3vGUps6skjLkZdpvHX
	XTYsEVjF3V+jyHO3a5H4aAq6jS09lSwBVtm1r7y3D3tr0MqiBKXJw0oNq80kJ3hP
X-Gm-Gg: ASbGncvGNoU1YiMTUa5tTfBN6mXanVXH8ZbZoNRXvBC6XGCwBt83v0bKtM4wx9GLctI
	KboqUNGJKK3okDHjctWEgfNiG9geYZ6of5GjMa69XjUnB0tCLUmhSPeJj7eF5EmXXwXLR7I3/kh
	/z7UzggbM9C2Q9xZZwR7f4B6n7jC0IgYfJ/Kj6n0eTbw70SFSKF8eKc4ONz6TZQWb+Ii1t9n5Ek
	5cE74+UtS8KwiFyWCYzWwGaQ/yMBtF/SDnWyNEvqVLZ7Or/N9vOecirNDY62M+Y2am2mEhao1sV
	VmB02uHwwZ2xKfuz8Z3b/zy8rmje5fA/e0Uf8rsxZvsdB1Sy2SWngxlGgZcNhfur8vxBtSmfSYS
	7rIkqQw==
X-Google-Smtp-Source: AGHT+IFFu5WS2sQOIbfenoYT7fIJPi+w8gD7u8rVmObA94A9G8gQ/G/OiNPBsYlYa9VKyBVrAbByeQ==
X-Received: by 2002:a17:902:d586:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23641b1aa38mr75864515ad.29.1749714492603;
        Thu, 12 Jun 2025 00:48:12 -0700 (PDT)
Received: from shankari-IdeaPad.. ([2409:4080:d3b:b88c:e03b:f4a8:ba59:f99b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6fa2f5sm7756115ad.170.2025.06.12.00.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:48:12 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org
Cc: Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf()
Date: Thu, 12 Jun 2025 13:18:01 +0530
Message-Id: <20250612074802.900256-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm following up on my patch titled: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for safe string copy
Link: https://lore.kernel.org/linux-kbuild/CAPRMd3kWRHvUE=FuRoGBXYR1POCL05sec4-9u6_Pb667TBFaiA@mail.gmail.com/T/#t
I wanted to check whether this change is considered valid and applicable, or if there are any concerns about the direction or scope.

Why I have proposed this change -
1. item_add_str() in nconf.c: k_menu_items[index].str is a fixed-size char array. To copy the full string whilemaking sure it’s always null-terminated, snprintf() writes up to N-1 bytes + null terminator. strncpy() could leave the destination unterminated if tmp_str is too long which might be unsafe for new_item().
2. fill_window() in nconf.gui.c: The intent is to print at most len characters, clipped by the window width. Using snprintf() with precision (%.*s) ensures that we never read/write beyond bounds. With strncpy(), again, we risk lack of null termination unless manually handled (as it was done with tmp[len] = '\0';), which is brittle.
3. dialog_inputbox() in nconf.gui.c: result is a user-editable string buffer, pre-initialized with init. *result_len is the max buffer size. snprintf() will write up to result_len - 1 chars and null-terminate; strncpy() could fail to null-terminate if init is too long.

Thank you for your time and guidance.

Best regards,  
Shankari Anand (1):


