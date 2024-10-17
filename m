Return-Path: <linux-kbuild+bounces-4163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6A9A249D
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 16:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C281C254D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 14:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E3D1DE4CF;
	Thu, 17 Oct 2024 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bZVI0BD0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C38C1DE4C8
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174209; cv=none; b=NKSIYEHcs9V1eDf1k7r2iCuYdACX41tY22w77G5FxFoYya4jInY83ipl97T+gc6OdFuJxzzcfg+Pp/dw6W3ql7c2uBmV1sWJC7tvoN1PgqA+u2+MCOFJiJDXQNMi6nYOQMTN0pussvA6nUYUGEMVfWvd60MsoFl4bER7nAPxbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174209; c=relaxed/simple;
	bh=ImKjS1mAlM/QGNcooKsvSkdmdgnP6JCFSjvMcq5jt2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk6KkqKi05QOLIIP7Q/qOYRoVXlRMZ4X2Gwim44MSFutW5+J+OzkDa7P7Noqv3NmMwxB02Ki2ZYnLc7jN8YjmUWqbbUdRE3XMf2pRMtD3IxOFGjDiwEIXp1CGiU71yv7R+hi+l/N+TVRcVqBTMCaG5xW5WmDLoN4Qs0JzWgv4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bZVI0BD0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f84907caso1273880e87.3
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174201; x=1729779001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=bZVI0BD04kEtK/l/7PQ3x1QdrXMwALUErZEw7IrgpfTZQZl9YoM6LTlsEoGz93ynlq
         c9mzxhucKmRLdXectCeptS5Jkwkr9gdfGWVzAyukSkl0WAGIRWwJyYC8ymyFcez4nBqH
         djVKSuEJI2oXLU1GGbXNkVAc4Ud5C4TIY60gBkAggx/Bc1WihSkBGwG9EN4jOL83DfXo
         +NVF3Pd/ZvmzEMrhaP6HALHOQdiTkDk8q87/+7i0dtUhhaMyOsPEgNVKX0fIbnhmOg5G
         eQilvHjSFRUFgyFLE5Y+wSTaKHhiVuwchyHkjHYBmw4Q/lH1n6Z3jpams3T5zl/1yZid
         UEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174201; x=1729779001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=akSFUOfhQsw4Gmdm+/aqCO66IsHAujhO9hThT/BshPHbx2LDic+bXTSmmEE6vb0Wle
         Ggd2O1t8oOhZ1+S1jNJq6SwLA1qFXZjLUkpZ501DYG8hsaI3oHm4TdvDwNApDXlBBPCD
         6cKMx6PSJ2UtQ9fWQRU3qmV7mycJ7rZp9hm13QYZkoI2ZS5GVsyU0xFUUJGq8rc1yHs+
         UC52j9bJj2jid+y93wlj3xOTjHUVpFcuZxO72G+AXzO+OSMA/j4XmJNPDRk4FMbpnLMQ
         0XWX/aKF3Fuj2kFqdPctchDQt9tTtF4Z/CO/rkSSzobT8AL6V1Un8rNjORYmtnQjofEe
         VrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs2sh4fr2qMM8FfXC+amcGbvKnWjhNDftL5S0LuCMVOfcol6wMB1u40mUxJyrYlzGzYtol/TjeucATUI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2w8XVviRmMwRmhnLK7l9jQ8Av8pwLpfozXvqwBQlg+ZW6q2K
	g04O6ID2BTAv/weyjB3ji8uhphwbngmmQWaa/Hf2bUgcjgAcAEvIbGH7kxYgREc=
X-Google-Smtp-Source: AGHT+IHtZ6iuGFS0h/96h+eqk0OJejp1EEqmyNTB75Id/1Au+oEGx2EvNsYPOJigxq2qwKknsnsYqA==
X-Received: by 2002:a05:6512:3b1e:b0:539:eb2f:a026 with SMTP id 2adb3069b0e04-53a03f36264mr5616478e87.33.1729174201351;
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29895da9sm301265766b.214.2024.10.17.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Message-ID: <cb0eb97c-bb47-4465-af4f-3b5dfcf41681@suse.com>
Date: Thu, 17 Oct 2024 16:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/19] gendwarfksyms: Add die_map debugging
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
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Debugging the DWARF processing can be somewhat challenging, so add
> more detailed debugging output for die_map operations. Add the
> --dump-die-map flag, which adds color coded tags to the output for
> die_map changes.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to use:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

