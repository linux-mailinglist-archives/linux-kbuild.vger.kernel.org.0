Return-Path: <linux-kbuild+bounces-5686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6095A2D782
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487AD167574
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4EC244AE0;
	Sat,  8 Feb 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgYSYej4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F43244ADF;
	Sat,  8 Feb 2025 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032894; cv=none; b=FWIakXCWPmeUBm01pK7ul6UgPrDTs+jBF8Lvy2zgs50jg3M+vcqnBmBV67FQfXliPI/j+rH2jH+q8RCc3hlOPKaRg6nLczYgmOE4WewIG34B5hwaJwnwzotwIlEitdoDusFwQNL44Bsr6LjD46+z2XqTPYl3O9usU0Ll5ehZTnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032894; c=relaxed/simple;
	bh=S/2EAtWp6JPLCvIE0+ZuLlyNzRcL0LTLF2JmlRHtFNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZInekpgHf4A7nX3qedZaXZOh7SVOIXL9FCgG4YHNSdeLTNeDIIK0qnj9kJuvRWjUrOdJuehbiYCoYymP6GrsKEZ0kf9It/WzV0wuOrisvwibIxOKIsrhh7hq39cDNaEmcnKJXOQUhRoPozvSU22ZtlqGAd8grmgeODwTTer4Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgYSYej4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab794ae3cf2so147289666b.2;
        Sat, 08 Feb 2025 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032891; x=1739637691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQwdxRW+PlqWzgd2iVA2/71Jy8/QEccppk3FUkvYKjs=;
        b=SgYSYej4Jesh6mqgmz+5jeBWXjyVGIEoZ6yLEZzKIsbiWRtKPaIzk6JC2aLET7PtLQ
         A1nep6dMNRbu9AhIdP2nzrM9HESdSxkNzQPI4E2a8dI/+sgP2Ier+Enyb7Cp2ub5zrIt
         Jjkgvsuc4BzLMCxnMyTZG0OnzMvo9FEGNX94Rztc6EQUUIhw2b9V9zB6d3fO0c6ZeHf8
         VnqgNHUXRfNYrnBhFJitArgES/Iac9sigpkZacbprGkERZeelqkKFlksrmvi23aD1KaB
         rDoxRFSWXLKA/DTJwaE++0lxaaR/dnHxj18ciYVXMHgxCYi8CKkNOnhxvhpELJS2aB3/
         UGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032891; x=1739637691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQwdxRW+PlqWzgd2iVA2/71Jy8/QEccppk3FUkvYKjs=;
        b=H7Y6e7hVUyTabnDpuWV6e8okQti03cLUSN8X16I/e0MZn+PSd2fltNqT+fvQMYuIGs
         1+WkJLEc4SexKK0zTadndtnswm6lS8g1wJYaTMN43vCQucyIeLQOGy/AnnRKcAg6NW39
         w7iyktVAGsQee6Siq20vtjkBPvaEfwThu4HbDMvxozN7/FzwwfqGEQhQ/ainLON4A4F5
         Ojk/ubPK9ep8AmsT0g/xm4pDf40twQVQZsgGK+eRSQLvjqhrIzgU5B6epr4tRYV3/MrU
         Qka3JtN9B18SmW36JYc+t+3S1tI+o7L+lFiMFUVuSOyDw6A3pajtr0uYSfCt4z2bxbiX
         GvTw==
X-Forwarded-Encrypted: i=1; AJvYcCWmrT//H4Xkd44JHczvpDhEWcprN27DIeItcKV6yyhHI7wkupXJNew9EsabbF0hCI4E8sN87TB8QQAEmLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mx+JtDwS0G58hqfgdcDwq1Hfgj7JH72qRdKNHgeT0o2wLUMg
	xD/7IRVGw4AhPOXKdxYCfEIiwKYMno9TzQiMjgPzvDtQAa+wjVoklDObuA==
X-Gm-Gg: ASbGncsHYJS5ZufBTMJ35yqgf6qilsquHuHXc3OBUHqs6KvCWpZ7ap/y3Wm/VQKXUgr
	b6qrpBwtYNDB2aQOfskbLI3EI92w3zmhWWTJ6awKAmE1dVpWIFx/CEOOfH9/GXHLrl8sCbpgmqO
	WBGQ9+/m3bfzARpELJEY27RGUfcL3VEgO5OklDLFqff8V0KUcxyKLnM+fzEIrB1NT8Nlk7ElAbi
	RAeU912MQBYpu1FBVlPTrpWxJk9afcM2ASaIU/H93+jHNtOg/BBmRHSqKzp7AS4qJr67Iqixbrf
	P2X9pX7qKdddtsqnFT38FJ/K4WauVQ==
X-Google-Smtp-Source: AGHT+IFUI9C+HEb6LHYERhuHBiIkskoP/oQNqw8dL11KmTdmFcq3J4PcDwYyNrizsj3s51UNF6x6Tg==
X-Received: by 2002:a17:907:3f90:b0:aa6:5201:7ae3 with SMTP id a640c23a62f3a-ab789bfc955mr786185566b.40.1739032890587;
        Sat, 08 Feb 2025 08:41:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:41:30 -0800 (PST)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v7 10/11] kconfig: Add loader.gif
Date: Sat,  8 Feb 2025 17:39:58 +0100
Message-Id: <20250208163959.3973163-11-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
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
2.39.5


