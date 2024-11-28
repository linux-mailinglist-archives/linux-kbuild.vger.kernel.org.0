Return-Path: <linux-kbuild+bounces-4910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960F9DBA04
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 16:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0936716308A
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 15:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C38819ADB0;
	Thu, 28 Nov 2024 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu0M1xbw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C2F143C7E;
	Thu, 28 Nov 2024 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806249; cv=none; b=f0ElZ0Tn1Zt4svpgb1W0PT/BiJRIY3DD74Ts6x2HHGzvRbN15qVc9mHyrI2+RMPBviWOxzY61J24agkYo4Xhpx/M0S2O2tqJCB8WI+PwJsSM9+CI2+KW7Jni2kr1Jzw40A1vlk/vw/hYZMwWhBfRPLGhB9yfhGW2ECttnzFwZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806249; c=relaxed/simple;
	bh=77J/xRBf5jmm4QwldScb0ONrImHfD5MgbFEuFczMx98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5bOSPuDXNbew2T7xFAXQHlNqw70yM/BaNWvTAqA9gu+SOyjf3Voh2dE1tfVbg+BwD5DoNN453NvNOtFIPw2qZBWe37qXkLEl2qfDPIStqgZYvNomQl0f7bvBjubiJP9c6kQGsL8KU8YTrMpvUq5rmK5b/f3FuECGRbDCPZ/Tps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu0M1xbw; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ea53011deaso471186b6e.1;
        Thu, 28 Nov 2024 07:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732806247; x=1733411047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77J/xRBf5jmm4QwldScb0ONrImHfD5MgbFEuFczMx98=;
        b=Lu0M1xbwC3D0s6hbYo5KalEnmbSjF0sDtKtRfBR128rZnI2XZZq1xypmEnFChvHRd9
         Wti0kAxK1yGtdWJgWShU5KLyRx5ZOpTq6R2SvL6+gBVjPEGHAiar/OaxRH56WkEo9MpX
         WUR174XOM5i9WdomXPflZoL8KC2DxZ04n2qKsvmJ/ddS9znLl9KWTG/40sdp1ezbaeDB
         tjdRJSsLyKArrhMlebQIltSoK/2BusuZjuIuJlInO1AIo3Mlmznm9l9U+B9pNnlCv2+E
         ZKSLWfff2s5Z7W66d0OCRICb3qob5gHBeSIqbKJubh53iJe80nMZlt2m1uplBklF2xqW
         bGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806247; x=1733411047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77J/xRBf5jmm4QwldScb0ONrImHfD5MgbFEuFczMx98=;
        b=ksnve6das7CC+qn5q7S8hK66NYnk18eggnciKmwfRxhAYX23pkeSwaKsCaZSRgbcx8
         rw5fsvP3tcaGySQatXjg8jHHDedqp67NPqG8Skp4DEZ6fTjb/U09IorZWYtLbdKNhdkZ
         mrdCGNMu7BYjrpODJKcc0bMBtSAXAT1bAiCPjaj7SogepAKq2Up5ABKwbNwaqZDqTKd9
         VSL38EELFAMqYTxs96m4Tw1B26kOze23hGSkY8zO20g8RAtdxDhysCTzgCJ05N3SxSxI
         /LWNKFuGgVk3mx/aTEty+Bc1YFdnWu4nWu5K/FJj2kvdCN96FmzoaN6kODhJfhzMu8zN
         XVew==
X-Forwarded-Encrypted: i=1; AJvYcCXndZ0CcDS7enix86YQkh9s3MgYSTQh38crFWBvnOzLt1oSwflDFcwz3sJNiAExsp90yozGY0f3yQ4MueI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLStSdw/ClK5cMMsDtPXen65PVo10FunHIf0cbMLeQb4o1KKl
	mopQoTemtLR6nSQM2tyYHUyzN4S/SSXVZn/Vd9IbpuY+67NfS7Ad
X-Gm-Gg: ASbGnctlQY9p4xqhY/Jms2S5jkuqtKXQAP+Ey9NGyQI9sKIvL4i1SswX4Rd1xFHVl5O
	RCfI+LKD2g9g0sIgGbsG5XZEiOPJKs3rshzGszS+QD9Lvl/2RMzCLJM4pW2azOtnYDDEeiH5moF
	VNygyjSgmfOyK/q7yb9H51biRrk7m5bKq5Nc0v3uCUaQ2hjgaNFxJNFPivM8BQ7BL7DFxc67olE
	1JkvNRlB5P079KuwUN95JxmEn1VaIhBlFKS9YIHcSk9by05km7XVukiGcod5GIFGLk4E6iX/czf
	V3LqW8E3SOaDk0HG+EK1Dn22vY1ZIfqKEK6orQc=
X-Google-Smtp-Source: AGHT+IHgfG7cxupaz0/QYS9FhKN+szjY5HK8uGbcdXwI//DyhCwye6+WdSOkAoW8M9vrNnb3NOtcTw==
X-Received: by 2002:a05:6808:f8e:b0:3e6:769:354e with SMTP id 5614622812f47-3ea6dc288ccmr6543321b6e.25.1732806246979;
        Thu, 28 Nov 2024 07:04:06 -0800 (PST)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82c9135esm205990241.27.2024.11.28.07.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:04:05 -0800 (PST)
Message-ID: <835eb46d-1169-427f-b866-979ee65340bb@gmail.com>
Date: Thu, 28 Nov 2024 10:04:02 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] streamline_config.pl: check prompt for bool
 options
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com,
 Steven Rostedt <rostedt@goodmis.org>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-8-david.hunter.linux@gmail.com>
 <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
 <20725773-8456-448f-a91e-f926d94bcb63@gmail.com>
 <CAK7LNAREx+QUT3BA5disV6kkq9uX1i8nZS_nRJwJZHHdGKCXHw@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNAREx+QUT3BA5disV6kkq9uX1i8nZS_nRJwJZHHdGKCXHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Understood.

