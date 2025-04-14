Return-Path: <linux-kbuild+bounces-6597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42FA88586
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 16:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7166817F0C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DA8274FE4;
	Mon, 14 Apr 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tj76nPcf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B3275114
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640563; cv=none; b=EAe+guG3GaIiBJeOo3zrhUsH3/YsqhD6JF0LFPT1uTI2IA/pwBF1r8nY02r+8aPuO4Y3R82dgFh013a+h/rCycJI99IJKDAu4b1HuPoiX26J5iZkfzOj/AazldL864dWhTXJGORre53MZ8gcYz/yzPNrGH3C6mj12BIzp0/DhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640563; c=relaxed/simple;
	bh=xx6uWN8s5ku8r03CWkc238xZYS+l5IgarCkezAtVCj4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=l33byKsUPZlEhOJwXtMZdS0IrVzpWTlsrOpvd7Rr615AFZbCJhS8Twky4hk8zd3x3IkybnlEPSCeCcHA0zmMBRtfECPBtUKDEwAAK0o2FQpXZI6QmWPmoMZkaAyxIJlSwu7OrwHIpLU0NK4rA5Pef0aCJGnmEjmQ/KlbkXLP980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tj76nPcf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f2f391864so2454261f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744640559; x=1745245359; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WvErva8RE1Xl0CS0JpCsCufYwnWymF0ErrsF7qxVK4=;
        b=Tj76nPcfh3n6MKMQBo+Df25/qTKL4jInFWLG2AbvkRchY5hU65g6VGdOCMnXflUWND
         PhxgHJbk/TosMNPaJYkESEBmPsUCSr6n50L/e1wGA0Xm8mwivO4F5BA2/THUKpAGaY3K
         HArT/ng6DggDE949z2Rb0sf1x2ideYJysKvK7dIU2wUZ4xuJjymPnkTFdAWqbb3VkT6y
         JJLJEBzxFhYcf64HM8y8SWXAQLvZ6y5v11KeV+ny3hQLvARelvzxzNJqziofdxHrJYKp
         W6981Dldlao0oDzeurdPcpUeWUUDR+iu7onvR32Zo+Uy6bNV6IMi409iZ899fhk/LdAr
         FDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640559; x=1745245359;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WvErva8RE1Xl0CS0JpCsCufYwnWymF0ErrsF7qxVK4=;
        b=Omvx5T5MA0258JKrDK5ZhhOK7y7wDDtM+xuB20AbyyrHIo+bncbp/EU9YT8ospuG5v
         GHXMcGVT6FQzvQPbdsKnuPqZaa+txo0n60OL9OogVylIyA7mUL94Wzqc7rcOR5fm2o53
         eBzuls0kmGlZT9h4Z6C7JX7vkP1d41OkB4lxa60BeAdCAOQw7g9lXjJ1gjHhK5NXn4Y5
         Ry147WRHMJ+fliNLD5SvBY2J/fp7BnMqvpOg8p+3tF2t8iRF0UAskAi2qAzWB7Vzkijb
         rvlicPHQ9XGvcJnxDyq59kpdAy2hs1LPS445iwdy8khdHNwqL3C2Pc48htbXY5bCk7gN
         xYkw==
X-Gm-Message-State: AOJu0YyqDLErBroOf/Kh0VEJSBc25HMfw1wskZh4+zyeDxjI9fEER6F6
	XAddYFtyOH3On1yXH5dMzLpRo8FV77jJcwRk5Wmc5v2cSlLTYB97GaLfMdR6nEFZP5QY1ZNihQk
	=
X-Gm-Gg: ASbGncvU6LnaXfxuYT1rDFbvIaG74mMl2Ha6j0fDOkBKrl7ELimdXTz3YksMJIqwmat
	r4wACs9zL9DpjnDTjSCjrU3x3PhWYCS/RR4zgcYhJs4XbkPXNIET/SXETyqAJLuuX1KbBViMXeK
	R6/gt2SCy7wiC4TuuQRda5CyJ/QLTSZY4WlxgmqfCHmdO+66ZT4KmDcpnRJuGPdz5eJdgFr+rIB
	fDQyZhCnRnEfb/MqiREXPtS+HlS75mmAd1VjafijbkWCCk2EMMq0vg6cSk0J7QyYqrvNc5+3XlL
	TP2VKCittd3t43SnGX24Hzw2kZY/mmoxholY2b4e9UOBq5RJejvnL0yHLexyL1XSSM/0Dxg/6dh
	zOUqAg+aIDouMcueB3GTQ8qolBWGkB5Hy1fFk
X-Google-Smtp-Source: AGHT+IHmobykP660N+whqxZFfNFt8txRryPjcIAGFOI18Hkg1o4s8k7YZhhX3BqfgFzIms7oLrxGCg==
X-Received: by 2002:a05:6000:2906:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39eaaed2345mr8329993f8f.49.1744640559100;
        Mon, 14 Apr 2025 07:22:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm11261088f8f.17.2025.04.14.07.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:22:38 -0700 (PDT)
Message-ID: <4b19fae4-ba5d-45b6-ae4a-8b59c178f529@suse.com>
Date: Mon, 14 Apr 2025 16:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] correct disabling of -Wstringop-overflow
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As was done up to 6.5, disabling of warnings needs to probe for the
positive command line option. Hence why there is cc-disable-warning.

Fixes: a5e0ace04fbf ("init: Kconfig: Disable -Wstringop-overflow for GCC-11")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Makefile
+++ b/Makefile
@@ -1054,7 +1054,7 @@ NOSTDINC_FLAGS += -nostdinc
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
 #Currently, disable -Wstringop-overflow for GCC 11, globally.
-KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
+KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-disable-warning,stringop-overflow)
 KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
 # disable invalid "can't wrap" optimizations for signed / pointers

