Return-Path: <linux-kbuild+bounces-6261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28937A6A66E
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 13:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25167A47D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 12:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3817156CA;
	Thu, 20 Mar 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PvKhbGaB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4309134A8
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742474883; cv=none; b=Ep5EdoDQbEjyJ1i+P167BkqRniuhzHCHIKIyWqixiPNNeTjX32ya78Rxsvchrp148sKhu0FuQAk6rCxI5hawqe1QmImq685taIrqZVt8RsAexLodbgJLzfgMVuu0RHKgRH3Tm6OdgYizqtKo9dfcanPpCE6UGS/dxEADYrMs9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742474883; c=relaxed/simple;
	bh=IDXJl1i8J/l2RNFsvY0vgM0l739CZxYxycHd2ToDpb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cdm89Snjwf2mXjlck3M+Vmr5W4N/ZoEsioEmydU9wu5cdiXNQGXscRkKidrlxwb/v0Bl+lulRLsEQuuos9MO8P1dfeO8tEaEeJ6t93/CBwHHtZA91QsNqhiVfqsPvakLZfaqRAJ0MnYVUawI2RB0g9ptzC+T46Rgiti6o6MPXzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PvKhbGaB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso7932245e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742474880; x=1743079680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRTmEzyfg+Wz6HIOSkkIOgmGqmh0KFaXiwIBIUrCw2k=;
        b=PvKhbGaBGw+zOo34+cdp03/WbjbcwwhOEEjLib/s6Zx3BkvkhBWFlTSK5iMHfsSLbb
         WD1skXKZBqhuAMl5ONYxYizUvavv/FCOUDxyvpARuf2OXA5X5NyVTNYtSd0zvkX66zru
         ie2tV3jQdzZTFSUkZbtxpNhgxR1xY7P+hH80RdWf3COONqCcirJj9sJ5ObTRLSxnJz0n
         1XNkyT6jZiIzJ8+OUtqiX67lywSQ4s/05Ok9TNi2f2KYQYlMCSKyIbRQfV7oBAqnDD7U
         eiSWkdppj4ea4m2LjW2OXkkSB8pM9W7HrX8LX/Zb8/7i7VEN8Eb/SwAm6ZIMysj4J0NX
         Wo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474880; x=1743079680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRTmEzyfg+Wz6HIOSkkIOgmGqmh0KFaXiwIBIUrCw2k=;
        b=vDPe7vVxFMp4UguJl70arrhftGKqgmsqr83WZ1yBCKP6I1QrNKyUCD2ymJz6GhxyCl
         QRrYXBJkXMRJPkdCr+V7qsQ25ufyHyWKBOvTe+i6qMDB0kAauEc0m5D87BfNZXhzfO52
         JJdr3OGjuOofE0de6ftCkY8ZQnGbe2fJaq4U05HalwXtEA+2tpJ+1M4bs2qLjBXu0EGO
         v+CzY5ZLSrrteOvTwDhzAGB/Y3RSaRdh+EKS8gphB6silXZKrQ9rJXuZ4m2oXcw+Rg/F
         c5tFLmclHRmilUuX7naM+lBXxZY3CmRyhf5Wtb+i6+SNRYZ2FMWcI091QYXpn6FI51Cf
         uzQg==
X-Forwarded-Encrypted: i=1; AJvYcCVVzmYzJNybbe4EvZcLIv81TI1egIvDZIWCYF4uSCRuVI/W7n7+tXARRu3dx9x22DP4965EsOUTb/YFuXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TKLGXGfyLKcp+CMAK+UvoH7sdil/JNIKttWAOlfAnXk+rq5V
	MFd5EFLK6IZbsKQ80U1Vrq5n/PbzJBjRJAzPC8dIpwkqYAamzOok+gxm0DP5d6g=
X-Gm-Gg: ASbGncuwIpOb1q1sdDINHZqAmQTW7+kJ2z7yRPdRL7mCstALXIWWIwyb19m3fVmXX9X
	iU0+lv7cifD8tiJ7a610O+KAQtjGFB4ffw+xzpBVvaBnEziOm0eiF0Gu+cy2OPGsfrovHffTEXG
	UWqsDVVqodxnO9Q6iXhIXA/UVBpEUyKZP0Zqrit29SPUDjXkebRBYPzIMVK+f3aLGUHPoJ+40Ie
	AHeKlTh5rDWnSo12WKrd9Zr/goVgaW9xv9GkwynT3bxRj0xT5DQksv4OxCyOf1oOeL79PcUNhld
	+te/YTclSjk9l7N5LQF82LC/meuu2PC083HCYcZgvYZHMbqF
X-Google-Smtp-Source: AGHT+IFK8cnKd03UI58c58N9tTUhbs8lTuMEB2+nvwJxneGk0ZnWe422V+Lm7Z/j4ELAov50+NMyvQ==
X-Received: by 2002:a05:600c:3b92:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-43d438a1d8bmr63258995e9.29.1742474880123;
        Thu, 20 Mar 2025 05:48:00 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f589bfsm47675145e9.22.2025.03.20.05.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:47:59 -0700 (PDT)
Message-ID: <efc4dde0-66f0-45fd-8018-00e94c3497b8@suse.com>
Date: Thu, 20 Mar 2025 13:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] rust: extend `module!` macro with integer
 parameter support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
 <Q_mSCTsSMDQ6DylWZTrkH1Wru3fQ1LFIiuk1pHElSsTc12fDdaCrgzWvEEQRE2_WBxOBzPuCE-qBJjw7LhHbjQ==@protonmail.internalid>
 <nh23cbbpf5yk6mafn7gz7urlau22egilideytnnh7paagusaih@t7y7q7jha4fz>
 <87frj8dmlb.fsf@kernel.org>
 <CANiq72kyAx=wbvYWBTmPb4eppfvGuFsjVMa49nZBrXGbLEDiCw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72kyAx=wbvYWBTmPb4eppfvGuFsjVMa49nZBrXGbLEDiCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/20/25 13:00, Miguel Ojeda wrote:
> On Thu, Mar 20, 2025 at 11:26 AM Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> As far as I understand, Miguel would take patch 1-5 for v6.15 and
>> modules would take patch 6-7 for v6.16. At least that is my
>> understanding from [1], @Petr and @Miguel please correct me if I am
>> wrong.
> 
> So I offered that as an option -- I assume it is OK since nobody said
> anything (please correct me if I am wrong), and it would help get
> things moving.
> 
> So I will take 1-5 later today or tomorrow unless someone shouts.

Yep, looks good to me.

-- 
Thanks,
Petr

