Return-Path: <linux-kbuild+bounces-7815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21367AEFE82
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E475D3ADEC2
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 15:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A443270548;
	Tue,  1 Jul 2025 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1VbE696O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DA1DDC15
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384407; cv=none; b=Pp0IMX0jCimFuGk34rKQxsu000Msyj+eSLd/L9dq+jDju9tRdNBuIP/FoJY8DjqIcIFby8rgVT0DeOpSqTzv04dF3WgKaYtIzIfAqaFiZVa14q+h/OaskUb8DsUVWI7L8nHMsC+j2z7NM8rmla+AGPj7PeU7yMO5s4D5oCReJHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384407; c=relaxed/simple;
	bh=xIDuTWlVNtbxYRGDgUiY1kjsuLGle4dbWyJlIAE+380=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fub2GR0oAsxuJT1h+u04+tkMB4S8u3th8yigCJl+Jtv/2i1Dkbg4r5IAeg5uY6SxqUZ03mbGwtBLA/Ts0dSSP08CqvU/rNT+eDX0/RtNX69JqAlM/38USju6NIF7+sf9bDaA7DvL3rCGgnoWGi8pDLJb7ir82Cvo8P5YNfcr8Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1VbE696O; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10877411a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751384403; x=1751989203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
        b=1VbE696OYiaiox+YaJXNomL05Y6DDUeNjKWfqZ2iJpfoaLkieOxAUYxXXIt4L7xJ/U
         6xxfh/YlBk2XaEDMzN3Dbu/uqFL/f0JPQOukXc4fU20PttFoSC8LhRJ8F/diwbnQsQpm
         WIJBGJFa2SHkdYADd/jRfSvrBr9LHzNnrXFxzXpmMHzvS2QiKLzJhc3ukkSE/p4x/sp1
         W2CTVWxEBO4VXcNX2rpCtRpKLuwZsaKzubSZlhlRkTydGD91r1vAeDpctiwLybCYtfMd
         gnmoyqarvsu713fh+/FCtqx4IRnA/UyPx+z8Gqd7UxgvQDJwUrzED/PCZyIWEWsQylZ6
         ex2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384403; x=1751989203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
        b=v6M91WR6drS8dFKEqhxlh3ROkL+nNDMUn5GcEYsDCY/dFvuKfEMQMGpfp22LqBWJfG
         5rXl5Pl2s7O9X4riNR8HLAdtNKZUHzH020Ruv6GqklGGhvqI4w7xDf8hRyjI2cJvr5Hj
         CS0C9qZhzMmM91k1O/OctY/HtYmXST0pqPU2I1PFgfD8aYhhqaPTcyg6HA1u9rT+1JIt
         we8JpDb36n3rDyn6n6YmK/F2lXKjztZTtoQVJKjnniUlWRL12uPBeunzmtEo3IkHUHVX
         tvkql2SeGHkbZReVzvI1X/ZFN+l+MljD8W1OggdxE1Itchc1Bxm39zYoLVPKKdFA6f/C
         bZpA==
X-Forwarded-Encrypted: i=1; AJvYcCW9HMhPmEJ4r37fj4G24azGvtdi9Sz8oguIVVDqei4exMhpJVA63aoX85sCaxK/isL6XmGE8+CqC2RsMLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys32uXFOqqmhWBE8kBSyHK+s2ECIxL4FiMiXbmRpk+4SUDUDdG
	rJhd/wDFfXEkOSethC5noDZ/FjvcS6ViOhZsrh6rRQ7k1iJVodxZA/T1oCX9DvOKnnY=
X-Gm-Gg: ASbGncszJ2zpW/Ynpt5xmXzwpYoMpUkf2M1mdunonky8yUArtHK/eMukwSik30DqaLr
	rV2aotEu8a+5e1Pj38JBQg2nOoY22jlR8mlfDqAvy1/T4KbTlQ7ObUNBkWVWHHoL/gcKoS570UN
	j0OrMBsQMFAHzxqC6iK8KVH3qsmV5rx3aDv/2xV/HOuKi40CEhjA9Cqo8kWl2dMg6E+wFb1CNRe
	knM67d2FHyo4RQorxVe+tngplnUSE5j6iWMq4BSa8m/+HLpeFyrQt6oeLQHsgsvypzlGFcHXNGf
	Vpt/4pUV6AUu45n3nv/pf71f5FumNWI90x+0U5zmJDeGKHIOqmoMpQnotTbJLz6IXivBpDZ3+6F
	jrAZZT8LenfM81G3Ozz/2G7mAk+wS
X-Google-Smtp-Source: AGHT+IFbVlpj3QgOb1lb2mwjuHq/uY0ogPM6n+DDSiv55WQWMetHGs7+SzXxABdKNyldpmd3rH0BFg==
X-Received: by 2002:a17:907:3c89:b0:adb:2e9d:bc27 with SMTP id a640c23a62f3a-ae3501a3fdfmr1843016566b.54.1751384402511;
        Tue, 01 Jul 2025 08:40:02 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae35365a149sm902911966b.64.2025.07.01.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:40:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] clocksource/drivers/nxp-timer: Don't call platform driver struct nxp_stm_probe
Date: Tue,  1 Jul 2025 17:39:56 +0200
Message-ID: <20250701153956.151075-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xIDuTWlVNtbxYRGDgUiY1kjsuLGle4dbWyJlIAE+380=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoZAFMd9hfYvSDdH6NlNBCtd+mWzxIpcu7SzyJL Vv4ihk8tK+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGQBTAAKCRCPgPtYfRL+ TqoQB/4rMtlq6IeeAFEak8bwAIxskqFVJckOHDLYXcaqI/AQtZonNEwemRE5kIU49xfq0xBknb8 WhbD/au1vD8NX+pejwkunkUi5xvElERYZRYVKvWQFVAEw1BMBdrlv6kvnn9TWJxTv87WAynCtIr SWR2UwkRj10qxtpywXotdOkYjDCLCgCiKaFSTrrIk++QUOF9RPF0U3BaPi73Klw9UXo4ULu9ezt BnyyX4XQ5OcLWlmOo/xIXUBxTEGqeZe62jhHXhB1ulxXU/EVYUhc5JrgqSiEIHGhO7DLzxbILD3 MET4Jx+ac2dRs2Nzp2FOUYMXZilVx0hHfkvu/t9LewvM9oqj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There are a few rules in the modpost step checking for section
mismatches that depend on an object's name. The checks for objects with
a name ending in (e.g.) _probe are more lax than they should be for
platform drivers.

So rename the driver struct to end in "_driver" which is the common
thing to do.

Note that this results indeed in a section mismatch, i.e.:

	WARNING: modpost: vmlinux: section mismatch in reference: nxp_stm_driver+0x0 (section: .data) -> nxp_stm_timer_probe (section: .init.text)

that should be fixed. If the relevant device is already available with
all dependencies probed when the driver is registered, the right
approach to do that is using module_platform_driver_probe() instead of
module_platform_driver(). Otherwise it's more complicated.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clocksource/timer-nxp-stm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..1a70c9013921 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -482,14 +482,14 @@ static const struct of_device_id nxp_stm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
 
-static struct platform_driver nxp_stm_probe = {
+static struct platform_driver nxp_stm_driver = {
 	.probe	= nxp_stm_timer_probe,
 	.driver	= {
 		.name		= "nxp-stm",
 		.of_match_table	= nxp_stm_of_match,
 	},
 };
-module_platform_driver(nxp_stm_probe);
+module_platform_driver(nxp_stm_driver);
 
 MODULE_DESCRIPTION("NXP System Timer Module driver");
 MODULE_LICENSE("GPL");

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0


