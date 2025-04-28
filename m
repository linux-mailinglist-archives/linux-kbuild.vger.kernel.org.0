Return-Path: <linux-kbuild+bounces-6766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A09A9F2A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 15:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDDB81883A3F
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 13:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BB6230BC6;
	Mon, 28 Apr 2025 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fbfAri0D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F02040AB
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2025 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848031; cv=none; b=au+M0L7qBie8CY6uwrlPvhoOd+G6fm3wDQ6MoAcRcqUYYrqSRzgFlRZUHIg09GrTQvuEftIBaTvLcCbOl+skTm662de6MfmP7MN+x8Jx9v8TXtRP7J3jhzdr751RWu698Iciuhafc+AKuj1dGMvMCVknLhYZt1fIDy9o23TnHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848031; c=relaxed/simple;
	bh=8Ze9MKPRr2ibTiFbLm3WcNCVvEbM/ekMvV4s7tGQnxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMHOs4mJzFZkOY49nbZkOtajXRmP9W+s9t3+LpruNapOy63sPHOPBYlhBCx3HhqSL6D7eZYpOV08te9B2DEvZfJrNjCsypkLQBf7QbLVB8hhqpbZkWEfOtHJLf2h3O0EdQr0DjEZQR232OhiEbSBjZWfFZpDIJWrNZOqSIP7XT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fbfAri0D; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so6241532a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2025 06:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745848027; x=1746452827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsbHP9q7QPdde2LygIdicngaffCZ7TvF689TrjkFFsw=;
        b=fbfAri0DEJAiPZ1Y4eVLbzkIU7dOwOwHXz3h42i6v+8xhJhUwW3/sAE5vaiBM34cdl
         65InoTPgb0jTjSifXnd4jdCD/EHMlLaMFCtRGev8ZDvMYtGjJ0sOXp40ZM7UZC6zDEry
         EbW1oNg9M0iq0mhPOOREnQH4vEhmWJDJfV3zdTuUkmGVFf2Sd6DVHAZsKRnbz0Bt21uc
         lZuz6R5SlDdR1pcamkzv4u4aKr76szotKqnT+uSySlRPPZmyCQkoKrVrMUOgnE2NLNl7
         GqnfYhMZdl6XYmNhJM+SOnf51cpGuhVZ9pxYqQ7jyUg8u3qDbJf5sL/n2yKdbChrKPlw
         mCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848027; x=1746452827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsbHP9q7QPdde2LygIdicngaffCZ7TvF689TrjkFFsw=;
        b=uBItDza+tKaNDyI7K0ymVdboKcoj/j4kHDU7TrgNNbv2x3tw9c1gd07YST+PI0eNcU
         THg9Bmn9on2Q1daLG2MW9h4YleBs8mjyOcwNEX5JYHFJW2ybsZOfNrykuSprdf4S0rpK
         nplY9tq9h7Tm0Gy1OZH1JZ/dDXKfN6dDsKJIjBGEfTK32RzPs9Mp2rURzydKOPwfdDdb
         +DvOfukQAeYJa8emLhJuD3zQhpz3gd3MBkZblMW3E8JjF9qj4nfVPdzMTALSObluuAMF
         k8FIbiZUP3TO5L/YgSTbrHCv22AvWMd3apf1N/D/HHaZylbnkqzNmeKeXq3MNb5Eu4aa
         mvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4oKDaWXVNbCaGw6/0b0e0gNLJdiyHUqNWQr2KdtZg9Pa2hU9x+P6Xu8a9M5IdbBKOAUEQcPsTWWXCRz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjA1EXKQrWrJ3R8q3SSes22V8OmunIQACh/P0JoKzWVp5GE8R
	NCaP4NwhiJMdZGZBlbhKeLl2cBOV9gKPjQnc/JTBK1lIFft9Wu53MJctmukqrEI=
X-Gm-Gg: ASbGnctN5nfWY6ftB5rts9Us1Wd6J7AA37QUe0IuYHfX871bz2WRbSJ5wc4XPnoFjhb
	mjYVCS8pSyCMjv7BaIx0N15p4YDcJ+M/GMB0Vtd0yCXfFSiQHEEgZzVSxMD+BQVUZDr/FA8q+U+
	tJOf8Fsh389juRR+3RQ5Y2KnZiPsoG++nzbQSh5eZAoQLVvYQiyz+7F6CScrNWucbXQka2l/J3p
	oYLKaaYcMZ1xqCaMyLx6Kten8xvy66+HJYX+L97Stlp+dOkv05tD0+ce5gsj8DkMyanXglA19n7
	cz383exO8G3fBvJjD836cwg4x8OltFZCdEPlTHbd97+TdcSwTtj4Jg==
X-Google-Smtp-Source: AGHT+IGqzwh1ITeNsAX9KP5aHUN5/8acCZdGikSmJ/7V9wS42pujwbYDhXZIt1HuZsg7+acKpE7tzg==
X-Received: by 2002:a17:907:1b22:b0:aca:a687:a409 with SMTP id a640c23a62f3a-ace71098d4bmr1176725166b.17.1745848027469;
        Mon, 28 Apr 2025 06:47:07 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm622902966b.33.2025.04.28.06.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:47:07 -0700 (PDT)
Message-ID: <65c912cc-3a27-4b0b-913e-784ff6d07221@suse.com>
Date: Mon, 28 Apr 2025 15:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add generated modalias to modules.builtin.modinfo
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/25 18:16, Alexey Gladkov wrote:
> The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> get information about builtin modules. Among other information about the module,
> information about module aliases is stored. This is very important to determine
> that a particular modalias will be handled by a module that is inside the
> kernel.
> 
> There are several mechanisms for creating modalias for modules:
> 
> The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
> the aliases go into the '.modinfo' section of the module if it is compiled
> separately or into vmlinux.o if it is builtin into the kernel.
> 
> The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> modpost utility. In this case, vmlinux.o no longer has this information and
> does not get it into modules.builtin.modinfo.
> 
> For example:
> 
> $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
> generated by modpost if the module is built separately.

Could you explain what is currently broken because the device-table
alias information isn't available? I think adding this information is
reasonable, both for consistency and so kmod can display accurate
information, but is there more that I'm missing?

-- 
Thanks,
Petr

