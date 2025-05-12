Return-Path: <linux-kbuild+bounces-7086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F0BAB3B51
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 16:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18FFD188854A
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0F622A7E7;
	Mon, 12 May 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CUe3jbED"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E47215789
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061421; cv=none; b=Qs1nrlK5os8ZOXwWtdScps1CAg4iHx1rLAd3iITikTvur8D/mOCBTPoJcYogkwtLuhHXuFfGQJHid6aVZuXagB1d9ccqbREgfLCPnblt7mYU2hJMirXEuvrmrT0iKK6Qgs2MzIZypyb/uSoJo8gSoZ3KbsyZGzQHnkTMnnAUMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061421; c=relaxed/simple;
	bh=qRQcaOUpeo+w9STztCfLsnLWPkkRfSGsi9z619ONGvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2RboFP3Q7bu7KAkV7gTI9RU3RnffphnAmns3VPktnMtf8xxgc6OJbY90358QsOjnQveFn/5nk1xBqgpSOfdxCy++0N8ir3Xilmp0D4kfjQN1ZzDMVE2rQN+NHjCPruuSzW8S0+ZiyoFayCaJSFxXSj/LCpThXg5qV7WG21OZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CUe3jbED; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad21a5466f6so618166466b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061417; x=1747666217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00F8vgPv2qdGuX6Cd8Cq3yaacUVZeZ+szyLkg5+fpw4=;
        b=CUe3jbEDkc4Y4TNfnyPpRbK+dk5tU4RdOlyekKWeW6am0rcUelpzh62wG7kr/BenpV
         wugC1SnTrNqRQ4xo+pbI7H4PV2jPcBO9REK7VoYcwQElgJDYoKzt/We93tEJDqviGrXl
         kFTdr9xn51IIffZkFsG+MfXRUHzvjm4PSIwNoFcKB8ienFcekCedw8oLyMT2x+6p23NJ
         DP9+FHjrMRUDYsHJ03U2mJGluPf/itFBVgJtmn1qO8VaB0oMP/kBlw2QMgjEXgUohi4W
         OpecpjwcQmj/GBKkl8NQHIvj44tcM7fb7Nh3F/u9D7zlQUdlwBu0IHdwjhbYRV2wZb0F
         /ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061417; x=1747666217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00F8vgPv2qdGuX6Cd8Cq3yaacUVZeZ+szyLkg5+fpw4=;
        b=fSdy2cEwjD82Brr7BCUKGY0331oIjyDIi4VgeynzwgeCBJXH5HU70Ia78eVwWTa98Q
         FKfHNiN+d1ic++sq3OdbT14YshYlhUNNYvZ3KEbH9J3nurQnHblsxkJh/H/lYHp8R0lj
         Kae/jQPlQJ21wR1+CdcYpkncWDGCrfFHPFBe49fL5Cuxi+hsqgaSmBVyQQecvepPtgaR
         xlhe9HUMcs+r/lP0NsxoCKP1we5ae+DN0Aun5P3jZwDcCkOGb21ypLbCaEqXxJLoOlRu
         2O94euOcQI2LefsVhQj8Dv6QvDPw0+/zb/MyxvSMEMZH1T8RDR9nvvPHBpq0vEnKYEJD
         YAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUj3h1aT3+uqEF1CFRC5GVSyfz3ID+ltYJKKX3XLQPofHOL021M5dCQXeTZU3wH/ntC23w+tCiUb6JZk+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkjN+DHlOQlBonSuAHnfi2TJ8b1amNLOcm1fUwNudsB5bRs2Cp
	h4mSPbOS2rsriHxUGKHK6sMeCzdISq3k3vk/wLznbP81yjVWZlSmP4cFenhk98E=
X-Gm-Gg: ASbGncsgaqV+U0sv5l9+fs3/7t0y91W0eH8O4pyqNwpT1H62zf/mGOb1i0vklmzPi6q
	h0V7TeAhsK0jIcji2dS9uxU5xPv1/Vrp6z8Ncwq1L3pyoR3JGegJYiDUbIMIjTtdso2zxMW7jXY
	YuBbiZUQq2JmikEOocB9fFDcCk2MT/T9Wp6gfLU3nLOR5Crtsn9gvKhGf/PYaRfd/P+dBdCuk9n
	wJLIlEseEPSkQB2qZG8GWwixknX8vxNVxpCkdvDEZ46NF85U4i8Wmz1EF7WYAv+fmqIvBkc6tTP
	Rx8GVRPUPDpE6glgRihS0Vmi/O+LBypJvokdxtOLz9StleRmJndWwQ==
X-Google-Smtp-Source: AGHT+IEAugwrNbmdiwL9waoe9elCWs6yrSk4vexACydUYW5x12Eutr3ba2qSc5mhsZMIdM3Hq6hQ5g==
X-Received: by 2002:a17:907:7f2a:b0:ad2:52fb:e899 with SMTP id a640c23a62f3a-ad252fbeb25mr487001566b.12.1747061417129;
        Mon, 12 May 2025 07:50:17 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24677c9e1sm303738166b.88.2025.05.12.07.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:50:16 -0700 (PDT)
Message-ID: <1b80a538-aa2c-4695-a67b-f253367d91a4@suse.com>
Date: Mon, 12 May 2025 16:50:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] modules: Add macros to specify modinfo prefix
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-3-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-3-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> The __MODULE_INFO macros always use __MODULE_INFO_PREFIX. The only way
> to use a different prefix is to override __MODULE_INFO_PREFIX, which is
> not very useful.
> 
> The new macro will be used in file2alias.c to generate modalias for
> builtin modules.
> 
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

