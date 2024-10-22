Return-Path: <linux-kbuild+bounces-4228-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1B9AA141
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 13:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB221C22693
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCD719CC12;
	Tue, 22 Oct 2024 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RvmdFMmj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09810154426
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597180; cv=none; b=qddpNTZNjYC9bUuh7OaHmqtouxSTWXOJbV0XuTbXXOhMY7Nu8m7zwefd1EAJanjmwueEukAAfOgqTNX09MmgXG3cnUziOroXcyut8arx366CG3OzjcwrqFowpvs5vVNgzU9wgr4i/bf/hEyBrwQikzc61ccTZVWTubijLKQdEZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597180; c=relaxed/simple;
	bh=Q7UvAeo7wgj55k0tHHcaQIz89W2aiZuE9pPZIebFQSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fca3d6Ud+u8D54GoUJFRvQJhe936B7KE5/XNGL9LirR15/qghNeRchhz2jxQrw19du5MljSe135Hb6YpVHIRxzRxUMLfxXrlSY030OnIKwG/seBZlzddZjxV1wD2UbDMZ62wCJwA3U34k0GJAkksHgVOrDvvmG94LICJ2OvO2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RvmdFMmj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso6250078a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597175; x=1730201975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VdmnWgCwPxxjygGThsGOmIi6siTSsGy/bxkMND48qlU=;
        b=RvmdFMmjjYHWYnajh/TV7Yo4jUiYxdg9WqunYp9YZ4vZ2Boc0uNgAIgqpd9T6u5QFQ
         zXWwBwFeVnCSBvqlHb1pkT+0tSLTK7pXcFYgVH32Fdoo9J6ZuRopWqBck6NDGw+ktMvZ
         JACvT0YIwNfSTjMugu/TxrVOanU4BGlLXrw4xIwf245lmulnNGjfjtt4p7LkROZp2a/Y
         NFC2bS1lAsCgSzUtMHp7rvjrlN13USTmio1K9HpNwR6qn+UtG0d9syUZEb4vI9BCBpEz
         0oLzM25D2f8fDQqkmnZe3RyPs9Mwm550p/yZ6A6eXsjpoFrgdLN0RveZAiLKVbG9YmOC
         iS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597175; x=1730201975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdmnWgCwPxxjygGThsGOmIi6siTSsGy/bxkMND48qlU=;
        b=lxXvQIbodu5y60unh1AED494aCrVyHMObRCpx0LkYSeBA7CR7pcYvbzHMXruTwYRfV
         y6Y82nu3/6DnTzdwRJ2ewuJ2j6vfxGNoqf9VXkwpaNyepgh4vQ0WtRPqrd2aYgy+Ui6q
         QY1HMhxLfhSDw4y/yIkOiQK7oeZkIGCbMqeJg1OTzXEYWUhe3I4Y+cAnEKMUiDsw3R39
         3wW01ykD6kqp/TxadxwSuLzRI4AW/dbNVackOhJvPRkSvJtbtiE2lljZOMI9dC+hHtEy
         UUNNhnRg54MtbQjeg7wmMl1VYEzcvpKhDdodVhXjGSRv0fF0r0TAfvTG412GS4fgs6h2
         T/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPjt5/hVEb0Ye0UBJH0T+z86PMiHQh94Uraz44m87YrqmDc2d9H7Zr7g+MXBaIjp0TsO231hsa36pakpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweXYRzSM/iWr2aiY4c7UhcTSs1ieQvbJS8oXG6GC3PbXnoV0QC
	NQ9BSV/LqDge+6zNRlLbBDkXUICcCKg/0YLbaWtKW300IEGPjPloqdq9HADKO9A=
X-Google-Smtp-Source: AGHT+IFwOWA+ThxyNU6js2FSv7eSZcv26U7aBvfGZRHfZ7plL8dQmDR2VvtmtU0l0YIs/RmLPfk0xA==
X-Received: by 2002:a05:6402:370c:b0:5ca:e5b:bbdb with SMTP id 4fb4d7f45d1cf-5cb7fcfdf2bmr1649962a12.18.1729597174872;
        Tue, 22 Oct 2024 04:39:34 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c737c4sm3006495a12.96.2024.10.22.04.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:39:34 -0700 (PDT)
Message-ID: <5dd0af61-05c7-4a17-8fbe-31a317824ad6@suse.com>
Date: Tue, 22 Oct 2024 13:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/19] gendwarfksyms: Add a cache for processed DIEs
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
 <20241008183823.36676-26-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-26-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Basic types in DWARF repeat frequently and traversing the DIEs using
> libdw is relatively slow. Add a simple hashtable based cache for the
> processed DIEs.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, free free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

