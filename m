Return-Path: <linux-kbuild+bounces-3525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC959766B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 12:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24CEB223E1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 10:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CF719F414;
	Thu, 12 Sep 2024 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GoU7zJiT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27E19258D
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Sep 2024 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726136904; cv=none; b=H7nuHhfexT+JyaehyRxv6VHrynyjkIhonZFkmFm0uPiSD5acR2WGnyJRCY613EC1Sb61Z8MHuZm4ZRBvScbDATgqQSWDN9YLB0tsN4w5FmZ/AeV3dkFe5/ssETm69VV7PyptX4xnAvdfeuCzgfmnW10Cjz+Sa1D4en9iz0ZABw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726136904; c=relaxed/simple;
	bh=PAV4FkicyGirycpFelMM9rAtqpx8O1P09tyQ5d3LSJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wu9Gvt+TtoMGw9LnqXcLyMbNh5cLpYu8GKVL8Ytr+GvJK/o5Dtw/6O5u5ZLCLyYFioJW2XTlZtNskMo28DkEdX9igfxblxXeEX5iGYWuojjeuGu0zcOC4T6MSAvuiNAHonWxDrfa7ybxH8UES3B7+5qsXpRwAxeyy6GqCoNJhcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GoU7zJiT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so317844666b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Sep 2024 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726136901; x=1726741701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hMMIAeIq6ngig/u7/oyMUwjRb0NTBFMbk8f4JUhPjk=;
        b=GoU7zJiTkURHDqOs9GOycv0scs5DDKa/Tf7MkI15PEx2W6aqqZflWOZtpfaU3lfk4e
         N8hPnbjKGwJXLHOcpHO7xNYKnsfLeMJkKIVyO8nqDMzM05JyK9tP7pDYZXzAvcDN6wfq
         dlfPGNC3neO0fx0DwDPnqm1+FISI0VNuDzPX4My8fzXgljIn5vmJyVXLpPT36HrN/YNN
         sTXtQuSm3LGbu68eBzFTcn4aCBbD9c3kzMpYEJFEy17rrCJr7oKSxDBEiWXRvwnMomKi
         re0MyVBpwrx1N1P4RpJZe2E9OIIuB4p04faHL5Z53z9TJ4oueM31+59WycQYKgrWxhFQ
         ImfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726136901; x=1726741701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hMMIAeIq6ngig/u7/oyMUwjRb0NTBFMbk8f4JUhPjk=;
        b=YTAYmeyqxat7r6GD2vuRJ4D6Kbzjn85PoA+BkByDI39tGq1mO1Yl4pu1xYpyDBUfhq
         w+qhynEoO/WdiXJW3iHYGFl6p22mCajqkLHbxy3zhLO9hbdtdSOi7mPOWAzGuFss5KJz
         OgmEP9XaJA2eln+A6sVDukd/usv7wIyN5jd24YqL4S8U972PEnCbrVqFXJIx3W4pZt3F
         XGNs7UGQ/T8VDTw6Id8AfpanHRl5SyPKjZXARRyDskQG7Gu/YG3KTei8mSh0oMjguorl
         iGosgDOx0pq6iT1pL7ktW5zB5n3tOTOadGJjSSZxMrtjfM4xF2TcP6B25c3Qu+ja0Xdj
         T0EA==
X-Forwarded-Encrypted: i=1; AJvYcCWV87QeiJmB/Pp6qjt+sFxWyMgKb6bbJFdeQer+LAvud7wmqzQnaraY4R3gVa0O1E1F75YgN8drDcJZwFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrUIuL6SxRpKnN6aZHHspK+lSKEfXkK2b7NQB+op+AjMnCmrg
	ov6YdOvlINaXnoUIU9cAz6EBxIPd45Tl2FzKrw/2VhYDUGeYRQxgrSA2+q1UKnY=
X-Google-Smtp-Source: AGHT+IEewD5Ol7roADv6Jj0UYR3y7brfrq1xLM2ZFdqn9+fQwDXCvDx/TUxbpqTHHJAxgNiQXUxpWw==
X-Received: by 2002:a17:907:7ea7:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a902a8c26ffmr254441166b.25.1726136900343;
        Thu, 12 Sep 2024 03:28:20 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d87sm729255566b.6.2024.09.12.03.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 03:28:20 -0700 (PDT)
Message-ID: <5625ef4f-324d-4bc9-ac5f-2374d29a0543@suse.com>
Date: Thu, 12 Sep 2024 12:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] gendwarfksyms: Add symbol versioning
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-35-samitolvanen@google.com>
 <286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com>
 <CABCJKudJR13PJgjr9-5Ff9Dzmb7=pSx7JWM5qTyR8oYRdtSDDA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKudJR13PJgjr9-5Ff9Dzmb7=pSx7JWM5qTyR8oYRdtSDDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/11/24 18:03, Sami Tolvanen wrote:
> On Wed, Sep 11, 2024 at 3:08 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>> On 8/15/24 19:39, Sami Tolvanen wrote:
>> More importantly, it made me think which names are included in the CRC
>> calculation and which ones are omitted.
>>
>> If I'm looking correctly, names of structs, enums and enumerators make
>> it into the calculation. On the other hand, names of struct members,
>> function parameters and exports (functions/variables) are missing.
>>
>> I think the names of struct members and function parameters should be
>> added as well. If the code changes 'struct A { int cols; int rows; }' to
>> 'struct A { int rows; int cols; }' then that should be recognized as
>> a different API/ABI. The same applies to function parameters.
> 
> I did leave out member names because typically renaming a member
> doesn't change the ABI, but you're right, it might help capture these
> types of changes where fields with identical types are reordered for
> some reason. I'll add names.
> 
>> I'm not sure about export names. I would probably include them as well,
>> if only for consistency.
> 
> I would rather leave out the symbol names to have consistent CRCs
> between symbols that have identical types. Or is there an actual
> benefit in including the symbol name in the CRC? The names are already
> rather explicitly involved when symbol versions are checked.

Ok with me. I can't think of a strong argument to do it one way or the
other.

-- Petr

