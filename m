Return-Path: <linux-kbuild+bounces-7365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76CACDA3F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 10:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BF416913C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 08:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6D128A1C1;
	Wed,  4 Jun 2025 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AMvrb7aL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657C287506
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Jun 2025 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027055; cv=none; b=XXbTgP0k9pb/oVvvEpwfo5A3236+PnPFmZPWBl/izllnVACJqXKBHS/P16BikHJ7pz/F7QBPONYJ1/XFLywSEXvg/BvQ+0NDacW4mYRi10R63epdeFojoDi5CnPu752sDBrPyipxdZCgbXD97+1bxsU8YNUW+gEYijUnjp4OBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027055; c=relaxed/simple;
	bh=Ucyb7HM9q3iBWoY+J0DTOECfsiFV+K/mKL1I+Hi+Bh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucF+BZr9TQMwj2ZbrNxFyUpE86+kEa544kUvfCJ6nhrx9/1+AiNf8YWgFk9/AeBeJXEF3FJR/8SLtSJEGIuvfp3aEM7JVMH0ig+SBfN9WN5gfzSLxT7j0f0yeuhEMc5oWD+zGFnlaUb3a5CrLYeLUdI5gbbYxh63ms2/YSuF/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AMvrb7aL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so26909535e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jun 2025 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749027052; x=1749631852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3foMmPCBN/XslK94eXO9+AImwpoVgcIU0XR1j/KP7x8=;
        b=AMvrb7aLhr8rg2AFi+oXRe1iGMWyP2DFL8Qv1pYWjuBjsHrOule9bjoruvcJXS4Kb5
         CjEHjH4V0fPdDoWYnefW/lxpim6R3WlxLcitdgecwnbbMnS3pROFFtl6ZCwRWj2lqAHx
         TqMCgJK2ncvk8X78YFKQvKWR4kh/w2uoZ3uWeTPANAV5j1WEsj6lFdHbe//j5UjT61SQ
         HOnuRgVXAxhRwYFelK6TBb+oiQKHg/s/MGUFbd91cmPcJYhH7tahSz56ESJmFJl/7y3Q
         TftnrQ9nvZLnhsoX03V6icGdnphNlAeAkV/1DhnPR2nkjf1Gl7UrtyxlE+4ticjCpfOS
         9AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027052; x=1749631852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3foMmPCBN/XslK94eXO9+AImwpoVgcIU0XR1j/KP7x8=;
        b=acc2LwVEnlb0nDKANaRoYL8m14MKt3F2fwaEJ0eqr9s9P0elXLm7mbjk7+LrhUhGdc
         /Dz4ii+2f7ozkuNHfphd/z8zj23rE6aqS/PKfI9sPgVPwIjodcJ8FicSmqgelrs9wCdI
         PB61LGvQxX9Y7FtyvFf9dlHoIHOYZMUjLX66WQH1clD9yqP2hbFEb1KIP3/PdCR+2Go4
         K2ve8xartaWIXHq7bjfqi2beg5sed3b6B4Tt4jktcO4oPzZ5E720qh+0m0UWNtPwhuVR
         bWYN3THttSf75+TNEuYvso+rwp4PC329KPpJ1x76n/QyjK+Luo3Liiv5CH/0J30nVlMB
         ELfA==
X-Gm-Message-State: AOJu0YzwKuhbRcgNfVWia5pF2+iY/gBveroytAfMYIzo8xvBZRrH6K+R
	8BDxYTn4mUPRXhap6uoeNl+2LCLQFTggX94B3GpUwItyGkmstnYBYNKMP1Xh1yml2dY=
X-Gm-Gg: ASbGncurdpv25A53eOHRaOjKnht/F1yW8jiU2FDtpjNq1+zHb7eRNSzJOc5ot1vhx0C
	dYnBBuDvUeJwNxBaba8KJE0MLwTelG+QniqeT3bdRI2phicX5r4PeIcwOFmib26AeJ0Iw1CxFGu
	whfcfqw+Wg2+6v9ONTbVYCp3zhHmAWRSGkbUFvb9I+vFLqtpKuVE7ko8i5vuZ0OXSvS751vzFGY
	VjGXnm1mAsOrzE1L40zFn1TH1pBTpfNczsNYjIMa6obZlkD5T6xHukXkJeKcCn14AIXvnzQINOy
	6L0pZoGkd27L21zkwxkg+EXhxeSRcbNdMXtMezb76CEV+zRZsK52rHelVT9ykkrvGOZiOQ==
X-Google-Smtp-Source: AGHT+IGXuIW66YuEANUhSYmsO07+uY8r6rrbyfLLgRS1ue2JXGNF53sbcRUniQkWcRX66Kf/R9mD8Q==
X-Received: by 2002:a05:600c:3acf:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-451f0a6b1e0mr15804905e9.4.1749027051914;
        Wed, 04 Jun 2025 01:50:51 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5233b0723sm311469f8f.86.2025.06.04.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:50:51 -0700 (PDT)
Message-ID: <4fefa5cb-462f-4e13-9d45-f58775d78bab@suse.com>
Date: Wed, 4 Jun 2025 10:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: make __mod_device_table__* symbols static
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org
References: <20250602105539.392362-1-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250602105539.392362-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 12:55 PM, Masahiro Yamada wrote:
> The __mod_device_table__* symbols are only parsed by modpost to generate
> MODULE_ALIAS() entries from MODULE_DEVICE_TABLE().
> 
> Therefore, these symbols do not need to be globally visible, or globally
> unique.
> 
> If they are in the global scope, we would worry about the symbol
> uniqueness, but modpost is fine with parsing multiple symbols with the
> same name.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

