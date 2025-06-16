Return-Path: <linux-kbuild+bounces-7517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC400ADB266
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 15:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989A71883D20
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 13:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4C4285C98;
	Mon, 16 Jun 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et/m7OFA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75512BF013
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081483; cv=none; b=WOSkGIcHuAMScWEysoIE5D7XpE+wPBpnYVxPMPiTBjJ6OnV/rL7MTenkK4elH4rRtTFpLdFy9PaCtwxZg/msT7yaBoy4chHsymV9j6MaidJVMYK7F3/s2Chr03KWq29G4QjDn4fJ6wGBSTwspyDiLTXF5hzE9AGz1ygV09E8lDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081483; c=relaxed/simple;
	bh=C8C1GkZWqLOBCJ1Soi3MAPo8JNo2DcYxae6tyD+Tf3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwbMK6bplf2I1JeF9clyMHj5AVAx082Ba2lh9ZVxLEFYcHPrW16pDEuDz0RYsE9sYxxKq43fSM5whgJLdUy/c7zBk1S2uVe3e4CFvctgXutoXI0a0F1pF79f8TNs9pgtQFInqU4L/yL1wmrzUyMihACAzQRPqt/vjCGPbFTo47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et/m7OFA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531e146a24so28077555e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750081480; x=1750686280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sOurFL1GrrOYlA/EcfGPBXDNGxk6Mfk8lxe9vaqU0yY=;
        b=et/m7OFAjvWQliXDCb59fDOVVIWbJlqzUBd+oiN9Rko6dubq99R8NiTo9NTWZKf0gq
         uD5/AJgfAgclJ0+r84kunNzgbqoaVFyidQ2s0z40d8mlYecHH7/UgjUNg+pyq9MUdARm
         YUG9hHWRUHhkXWni9urEOsuuHBmGObjyOlXBTHg9qvaB8GDlHqfHiF6VnVp06JklJnGp
         TQ260uXAatZqJnd8L4Y0ZLYKq3ZbERA4iJSzyIm75aJJxoT3DI4m5J3jmRxdhW3wV/Ua
         2gQBzKiCCKn6Lvjj1SCIRG0UB0JUXCVvvOTSGcUCB82wmRje1ihLaynGNFSQrvV9fqvB
         W+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081480; x=1750686280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOurFL1GrrOYlA/EcfGPBXDNGxk6Mfk8lxe9vaqU0yY=;
        b=ryp67Y38We6s/cxk7hh7znTesLCsbgb5YadUiAGPRd3DPe2NfwIwZeUJx8IABEMSXf
         dbzNWmx/K4PeglMKAYkZ2Aqai/Bl4qgT8OqzJvLquaEsCEmzJtWhElQ63z0QASjCJrWj
         zRBrOx81vqIAxKQPvXM1onpYpqoYQ5LPrkYN0tO8ISUpRLd3djBkETaKOkBwvqF50a6r
         fHd1BBiUgr9+OnvmsZqNeRucuoUPleMlmYfNKy17Kv1HC7T+WeST1CMSz/MPQ77ng17K
         O2ev7X56mzWVaXOR4W5/pZQbpKBHv5+PvI/pDmYD3a1RHVKkJRAxhhB5ahNHmoycBAlP
         SB4g==
X-Gm-Message-State: AOJu0YyGPhfrPSsCNsvIsxYMGF/c3PYyWEvycxKXu0cnHApy1emcZb7w
	BKCdaDCuX93bEgylvsHujClxaUCVIdFdvzye3aYpK6L9olh4BQatshCDrr/9IQ==
X-Gm-Gg: ASbGncuczkLSopxwxWzO8Ibg2hw/wQ31ooV3jCFa3MaekcYWydj94wBh2aLl6nA7Nye
	lJbO8mUAVu3Qc1o2uG9mDH3BNdwxzWaTgMLgeedgKJgSuDf2RnlwcYGSZvWmu3bPxlx3PSU/PZD
	gfcRgN/oumVViDdfgPqZdZ9ld6Yb2swbktKaa+3w+0e2gL3gPmCLOZesR0ZhiVmUVXZKxWAwMji
	2hCzf/NezYkQ3R4xtQTjyXjIvtPm+Ath/gKhjsUwu6WRHrYLjcAzgPmc2RzJ+V4aGdqUtY5Jwdh
	3GuSFXfgjiG9ZP1Sxe9K6GvXX2YwN+wV0nY/jC8M3M8I/r1LqfcVBL75N/BXbbS4
X-Google-Smtp-Source: AGHT+IFvN1bakOUcIkxU3sUHiyvLAcYiOF1dF4DaZMNPRcDqPP4qXETo6zRzA0n7B0e4dHXKhx20nA==
X-Received: by 2002:a05:6000:178a:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a57236654amr8834877f8f.2.1750081479898;
        Mon, 16 Jun 2025 06:44:39 -0700 (PDT)
Received: from [192.168.0.3] ([91.80.31.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6078csm11008710f8f.21.2025.06.16.06.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:44:39 -0700 (PDT)
Message-ID: <9aaea19f-cd15-44fe-8d61-984f7ff316b7@gmail.com>
Date: Mon, 16 Jun 2025 15:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/25 at 15:04, Masahiro Yamada wrote:
> On Thu, Jun 5, 2025 at 3:36 AM Franco Martelli <martellif67@gmail.com> wrote:
>>
>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
>> ---
>>
>> Dear Linux hacker,
>>
>> I've written a patch that allows to compare the tristate value of two
>> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
> 
> 
> I do not understand why this needs to be implemented in
> menuconfig.
> scripts/diffconfig is already available.
> 
> I think the comparison mode is rather distracting.
> 

When a new stable release of a distribution is available, in the Linux
kernel many things has changed, this patch comes in help in this
situations, it allows to easily compare the customized .config file
built for the previous version of the distribution, with the one
provided by the new software distribution, used as reference.
Generally it can be helpful when the differences between .config files
are huge, because you can navigate across them in the menu window.

Kind regards,
-- 
Franco Martelli

