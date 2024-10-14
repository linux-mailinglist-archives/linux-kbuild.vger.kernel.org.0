Return-Path: <linux-kbuild+bounces-4091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D858899CD02
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848B31F203B0
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5395C1547F3;
	Mon, 14 Oct 2024 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbmpeh+U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819E1AAC4;
	Mon, 14 Oct 2024 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916055; cv=none; b=BF2XBD7iLfWwy30O2A9WJ41Pq3hRdNX3ikFUwirLAu1yWgpFxgHSkt3jO+HGSRo5CZm9blAcyGUDuGnoGuVrm+ARHyWDb5aw1W4B9CoOY+j4rjBG/S8O3A6FBIwv3nsf/1Rj6bMjxnLzF6P0nYqcyiHkw7hkYim6LBKxBQtJG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916055; c=relaxed/simple;
	bh=7IXPUz8ydy3PQGytYh4w1aGLvxO912hKFGrv77OgNrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7erVGvpLSnTaqn+UBcqdwvDSkM9y3Kk7GyjChxUjzOgNNi7YlH+9qJKCSZtRq3+mGX6CIOT5gbqrRZJIVGCLqzPLuOL+IiSN/TxEFK3NDulx86CvzVdUaPY9Eog+xH91/DF0d22repFf1O+UfeUgQo9NCia6UmtSTODJHY5WA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbmpeh+U; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e314136467so37362677b3.0;
        Mon, 14 Oct 2024 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728916053; x=1729520853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IXPUz8ydy3PQGytYh4w1aGLvxO912hKFGrv77OgNrE=;
        b=Lbmpeh+UrpuRlkjTVTgwGFBvZzIGajEVyNQIoWlD50h0L3GLeo9A/Szri1hGVzHNLG
         t7kmUulfKKNwTHhlsdXaVVXgv10X2KJasXXYmE8p8I3rPKuwtz4GC1asHP4Wl8zvBUg/
         wmykVHbWwe6v7/ZnLK6m/beJiKSuN3B0cWfunA6BhdhT+1ChuVczcfxFYZQPsoOuh5+Q
         D3a9ZBvMcTSQtRmiR3fJC0aHB4bxxIyzBh9eND4W/X3mQE/4GgckZ/ifcIyrxCE700No
         BfCRwiBLgp2ihXT9FDlyEEP/Mr6ZoWu8lQXvAXbCMMrhsfxuFTIUnSgf/2bkbPHH+Uua
         JriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916053; x=1729520853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IXPUz8ydy3PQGytYh4w1aGLvxO912hKFGrv77OgNrE=;
        b=IVmlG1IoZPnwvSRk5K6RltsQFjlVh8Bph1xCVrTR1ujHxIimTLEzN/Zmqh0j9u+zWK
         hLGK1kvjG8afOdq2kZ4HHw/mM4bLJyBDv/hxpkcf8aTScB23jmZBiZO9xUkrFRlau5ij
         Xpvn6LDCO+ewdxVPKfmf4jsKaoQTBjpDWYd+lxuYgbA8W5bw2JBSBf+PptoLLkI4AM3L
         t3pknBzpSHGnx4v8n5bsRfrSosqqDsta4NgFH7YrdFqsC1hrlLHPbWP/dRR7ykcSdWlM
         F7tsiVeJiOEWZu5wU3NRDpD743VV1VThJiE48LEq06K4ra/o/I/6/wt4c0pIcwvc7k5s
         XjxA==
X-Forwarded-Encrypted: i=1; AJvYcCX+/zXOeJWRa6cycY/Nd6hSCRJ6EGGWkUc0TDXj0nnsGEKW31CWaWqzvO2L7hpC+eyMluKX4iiuIx+LvLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNxUv1oi2s7xJQCTYghWoLL7Sr8pz1kL5wVkm99RWl+JJYQlZ
	LIczKN2skdcA84FwfIJEclzpsKHFYmxMsjbR0U/4LQjy5xXDDW9z
X-Google-Smtp-Source: AGHT+IFwZNYemI+McTCHhRTO+ryzjpc+VV1MLDatp6h63Jr3jjkSNMcZI7rpEQ4Bk6KAq0HTvBb/uQ==
X-Received: by 2002:a05:690c:ed4:b0:6dd:f81a:80fb with SMTP id 00721157ae682-6e344c01e6amr71760087b3.1.1728916052849;
        Mon, 14 Oct 2024 07:27:32 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b6272esm15620357b3.4.2024.10.14.07.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:27:32 -0700 (PDT)
Message-ID: <a7a90948-a78c-47f0-9c5f-e82e0a496cc8@gmail.com>
Date: Mon, 14 Oct 2024 10:27:31 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] linux-kbuild: fix: ensure all defaults are tracked
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-4-david.hunter.linux@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-4-david.hunter.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

https://lore.kernel.org/all/20241014141345.5680-3-david.hunter.linux@gmail.com/

