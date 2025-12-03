Return-Path: <linux-kbuild+bounces-9965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E9CA1840
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 21:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C00113004B8E
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 20:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836D3242D6E;
	Wed,  3 Dec 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdHECC4F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC55E398FA5
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Dec 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792350; cv=none; b=ItQQlSRMkWC+bHvcVcmd9WJeS9hiZwa5i7ciCBe5aidAW0K+3mDWUWcdPs9JPs2kEpsWcpcKjQiNFenePVxjuPQvApGBjhpdu5DX3Uno1bVT8uy4f01pNbF0gBYOTbRC0CpOVvEVXk7dxMbqj8Iju3IaR2MnV1310EpQhWmObZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792350; c=relaxed/simple;
	bh=AG9GrROvweeacWEAdRTVykiH1D+eyLznjpshHadtW48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ddh91meN8jIQshOlvshFYSpBDdQlP09joBrZRgyn6lYhjyYz+xLvJLDJuj+Fa7720kkVGxLwaYTdsQv3N1bOorB19qQRVzT4PZ+8MhG5n0Td25AH/cVheTa/YuZMGKDQLq29UnbbC2YmThT84EwcYbnFbqNzmlQfLxlGiVe8oWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdHECC4F; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37ba5af5951so1491681fa.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Dec 2025 12:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764792347; x=1765397147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnUb7wkPZTtLzr68E4z+N8DU80QWM8TPlOvaXkpc0Ak=;
        b=YdHECC4FrU/ZYmt//3wcVULxh3vQlNUwX+f3YyONFgyID72I1KAV9P6O1r5isdHMat
         mYXygo+TaMYQau0KOA2TdRnVx7nUdxIfMGHZFbHL60n/6RCK/n0330KeMfkyH/tF2xkR
         UTPtx3GpIpqUYW8t7biwbVCZnuRatRnYqLIotYnpdM/4ny3TLff8PHLzuU/7+WADQgRR
         fgDkr+g8R3vi+Lahdv02gZTzLIrTKbMBkjL9CIvA4fAiquVWkuItIJYLlrd/LYUkH5KS
         kqdFQkMV+b6PEirUSGf8nhM7Sgm0yhYmKbI1JDaYo102Rmv7c1GSyCE+H3W9bSjjyGYc
         yJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764792347; x=1765397147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnUb7wkPZTtLzr68E4z+N8DU80QWM8TPlOvaXkpc0Ak=;
        b=kmzqXuB3Ncz8eo3mPfmKiAyxvq1+t2F5UB0oHDzhHvaurTO0TILASKvFEg/ynXFi1M
         /rswo0usi0Wp9VTz6T5FgZMw/++9XGYvVAYG7L0+7bHEcw3jK5d5x75dp/ku8nnn8mko
         UARCTOugXnhGEG5sbtoQ6EeEg+CT1CZcUl5l8p0DdV160vdaj617jQ32G83nYXiiO58K
         W6TXIzpstCn+uD0Wq9f0JBlH+EDEs2qySbkeyavc0nOlJg1MtS06N24B5L8098vfxk8y
         NTojotsH9rngkI4h8SwNrj/hklrkIk4YWfwKs2HlVs3X7KB4rgQ9D3Z69YE5Tz0LkxRO
         c2vA==
X-Gm-Message-State: AOJu0YxF5K4Z0rZHsQI0McKpevxqLRZS8rBQ3gkLfWFhljKByRP0K559
	CH30kqmkycQJZ6rHDrQQ1YD4ulcOIPU9VCbrv7N1TPIc6hcuOtCCh/NX
X-Gm-Gg: ASbGnctQ6stWZHZr07PzMkuuU7pR6bBXh9lPCFhnnfXLWEgxk3r+X/z4mNHwHYq9zvz
	atmPB6ff5ocJoLPOuELSkxCCr6GbLE+b97SxaoCFhvZU6KLL1A8olNSsZKhvnQPK2q4MBlPujeP
	P+TT1Zts8GBWl/J+ZsVGwnX7O52Moqv+3uFaW3IUyGTwPkeErF+87gdaHGTxQsFO7FCjsYY6OQ0
	WX5q21GEVQtg3TFXSSxSV+xV2cXZozsB+HwO22OLj8g8+tKWbGslUjq0LJ/eLml56roiqyRvGJI
	k3Hte05hXfJ8cbwHu2wulXgr7BmISUtzzOc4zVfCKSX/C5UASt5JQrHhtcr09/p7dk7l0yuXTdo
	5UzHu3uo49EwUF3jSgga08FzuSw6iClomXuZC4IJEVVaKrX5airR6G811Uu0I7toji6xRBM/Eml
	ymbA6hjr0=
X-Google-Smtp-Source: AGHT+IFcrgyNy9/ys9WRk5jnvE4VJKw6Gba3tzTM5kC/GYNY8kJZ0Zuoj8YiWvo44qtPhCxdA2OHmw==
X-Received: by 2002:a2e:3510:0:b0:37d:1911:7a45 with SMTP id 38308e7fff4ca-37e639571femr9547531fa.42.1764792346686;
        Wed, 03 Dec 2025 12:05:46 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37d236dd782sm44470811fa.15.2025.12.03.12.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 12:05:45 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: regressions@lists.linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Date: Wed,  3 Dec 2025 23:05:03 +0300
Message-ID: <20251203200536.102101-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Askar Safin <safinaskar@gmail.com>:
> #regzbot introduced: d1d0963121769d8d16150b913fe886e48efefa51

#regzbot report: https://lore.kernel.org/lkml/20251009075149.1083040-1-safinaskar@gmail.com/
#regzbot invalid: there is no bug, kbuild works as documented

-- 
Askar Safin

