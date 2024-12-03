Return-Path: <linux-kbuild+bounces-4964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A19E1B69
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 12:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7C6164BEC
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19F81E47C6;
	Tue,  3 Dec 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C1+/yZjI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9131632E6
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226852; cv=none; b=iw7J5bGgpKHuZCHqf375xGwrURBRt2KdHRRsIlOCdFWn8e6iTDhRZ00QbHbj+pA3viOp1usAIfAHt+mugQ2XETQxYuhAlkhuO4n8yc8JbyjBatQOJdmbV5vZO93OmteYtuO/h7Vc6+2GFo7HRZ1X7xUgw78AO1/8SVIETqukf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226852; c=relaxed/simple;
	bh=iZ6iZsYDGgn6+nosV/i7U3c9sBZT+1+wu183Z3mPfA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmARPqkc54ElvJiJDNiqllzp2y87Y29mFTIW1KiAnEEjQYmfxN90Ducuk6WlO2IdV6XT3Ds1dBZ3nKq32Jp0ubmy5hOXPnDoB4vMnZ2f43tzIejpxT4Ag4TZYkORvrSG2uUVbq+VpNESiogSPu1x2trEzePIAV1ZdKYoDMBpzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C1+/yZjI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385eed29d7fso1607559f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733226848; x=1733831648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=C1+/yZjIPX22lJxVL5/59K8t2UzOxMgAMsfcH7jg7yWyPNbsHsdhExoI8UqKrCzj1D
         GYnWn2J1/IwyGF9bUNQOJRKG+ChCpUfdZno9hxSl7tfeIau8TMi206ETwDV7y7/n8Pp3
         KwzqWMkVebo2qOEgODlPjYMW99OEMCyIFwW3JUn5BM6lXh0p/t1oJWKCEmkdJOHqES9e
         QMfhKZ/heaYvjqad3m5S55UqsQmj1FwBcnmrrgoYIlrTMrOHgbdDKrYj2lvuQ/Py7ZU0
         C1BgnUljwa9mdnCWBb+1L6GHQR7Y8E1KmTi+yR95Wz4Hp7ScaJPPu+J9m+INB9zj1efY
         yuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226848; x=1733831648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=WIJ/OaRQ5nFLR2Om85IBEzPD/IZXAM3kbz/JR0walqy3f+/o1Evxp6hAZL1d05pm//
         4O18LkO60rH/4CjYmy+4ZO7ptpjGwUOB7dkmxNZ+lfRX30PQvw/RBID8/95xfzRzicIw
         jCnfE2w28IyGsDGaNqkuXMMrUoS7sqmHZivdcppU4+rdyzuSh3HrTR4rB1B0H+0cD252
         o5vu9VLNnq1eiFEKFwWKjz1YU67uYpr+ptX67dJ0hyhuF8TUR2Q1tU2V3nWdy829fU1U
         el2JoX65LoOiK+QebfPtlFJc6+YZi7Bv68ODFX/Gr51d1OY3fPKx/KqKYWSdLUG+V+L+
         U+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWaasF/SBJplouFPE0zUEakDJSpWAPfKC4ar5FLyGrFR4+WUcenNYhwuDc41/XFH+m3xQ396jiwgUQXBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0GF4ZYRM7QP19CD/2xJ3qlydViXnaLzwn0DudhCOdyaguzS/
	NHcyYtz3I6YztET4jTc4m4BY15Ca2FBXUyMafc9mVJz1eZxcFdT5Je+4hjNQm+k=
X-Gm-Gg: ASbGncuwS64KI7b0AuNs8yW6FFu+wYRXvOVDHtqw9A6mLiNuiiN0v+QF305ImCV2sDh
	RjpX+m0Y22apg+1EIDlzoVpPlRP1cBHL2kbkpweeWR4fY9QY7bJ7y9/yb4qhQMirvWm7ptqfTEA
	AVfb4QdWhBgbbt6QyKwS4gS8ih1oGOMvD3qnh22eMRUyKnr7T9kkEFPaGlnasvVckNZbKpg3UMA
	HwN55wP8MK3IWSfkyEWFM1+V9SRK2Wr2lLTtCpgW7OSaoYgvdTlBw==
X-Google-Smtp-Source: AGHT+IF3C+gAe9enWE6coDrJOE0PJBinw+OtrvrTgQQOl+8HAIq0aTYlzIw7cnuVNYgk8Zd7vO+IRQ==
X-Received: by 2002:a05:6000:2c2:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-385fd969071mr2152487f8f.2.1733226848550;
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385fa330ca0sm3064430f8f.11.2024.12.03.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Message-ID: <32fdbc0a-ba70-4d99-93c8-15ec8ebe6f70@suse.com>
Date: Tue, 3 Dec 2024 12:54:07 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] gendwarfksyms: Add symtypes output
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Add support for producing genksyms-style symtypes files. Process
> die_map to find the longest expansions for each type, and use symtypes
> references in type definitions. The basic file format is similar to
> genksyms, with two notable exceptions:
> 
>   1. Type names with spaces (common with Rust) in references are
>      wrapped in single quotes. E.g.:
> 
>      s#'core::result::Result<u8, core::num::error::ParseIntError>'
> 
>   2. The actual type definition is the simple parsed DWARF format we
>      output with --dump-dies, not the preprocessed C-style format
>      genksyms produces.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

