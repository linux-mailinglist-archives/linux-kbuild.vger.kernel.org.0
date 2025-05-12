Return-Path: <linux-kbuild+bounces-7088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B37AB3B5B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 16:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6474A3B2CCD
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 14:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7E321ABCF;
	Mon, 12 May 2025 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C+kdhAh6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783C1AA791
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061554; cv=none; b=fDDZqaAC4/1p749eU2uXDrCxKV8Q/Vsv+bv275hO/B8HW0tNTqcu3Se1u/mll8WK3fjuD5/4yBOXOHEh6ASGIHMcSYiQptYVco+aZ/nOj/AVMZpZ1Z0z+BUm9jLYmi7H2vFQ1FUWojPBQLYYFWk29+W8TK9v0tYrLb9GX66XK30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061554; c=relaxed/simple;
	bh=YxitOD7J5I/UtmC0dH1Zgo6JjFI+JvFFNRDPbpGHmgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF40JfcZsBT62U5LU3w0X+/FPXdgreSjudU+LM4xNw4JT1Akn3nXPt7vTFWxZPYevE5zu8FSoFZegNsWihp66Ad36TTGR/EiAkdbd8y+K3CRM+j7W8YaQ6f6geN9izEsJQbFOg2MOsrl2vE/XbkpctYBxGYT0df4Ln697kctWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C+kdhAh6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so9550126a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061551; x=1747666351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sL36AD5JIr2gOBFJxdoW/HqoISwrQ7JPwgG6VNc1uf0=;
        b=C+kdhAh69DteB2BlK49StjkovVk5QGefpdiIDMppJH8Roh88hmkOLxPnR2DFzMTA49
         px7Zge4kUxF1RoVICBL5j8NHQJAs6CpfCFF3r+fCpcrjp0YdQcZwNbgzLA07AACn8b6G
         FT2bJSDP9JhssTniyiEShJ0+sBG+2wsGV8OwUsnnR8pM3k1GbXXjLs323ZTRvdZJTVpi
         LYMkPqQ+4n/851xe2A47BY/MEZ+wcGNctxvI9pDXiJuYYxKK7yC0Pm5y/esfaeoAshbt
         7VKFudT42eWaQhoI0x32XIDpW41zCvmYDEJfya8i5mu4WD/bqry2FSZQD07rtiAsSMVR
         qyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061551; x=1747666351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sL36AD5JIr2gOBFJxdoW/HqoISwrQ7JPwgG6VNc1uf0=;
        b=dmrBqH2hcKjX60XPnXLhbcLV2fwlOz1HKQ+Q0css1pkpEENMuckSh2RNHbm434Ccej
         /dgYub+rtOh8DwimWI2syxH7YCySwaSjrJTgD2pfB3/0jMgIhP3CpYwQ2ChFq1U64dJz
         OGONEf3dJRxMQqzctie69Ljyja+n8u6H5wDj6UBaguVv8QkLxyjiDAZ7VItn/+QnIfKs
         fVtWcJwjFVkg+ei7haid48Ajd86ebjMP9V2l3N6P6180lVb+Wl9JId0iVVyVd2M3WKf0
         hQD8vTX5AIJDh6w77uLUnfH/TIKnhLVKtbm3GXrUsv6zLXKhyWne/JXvSlOPHARarXF3
         R0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpMnWvm3KxKCEWehNZAudwA20a0Q2488KA0i+jz2U5sIqPxTW+H1lDNYMEWcjkGPOMjvv2AOJXXBkP0zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4E6ReyyWFpc9IugcvlVVQwaw71d6uGpQMiqilyW2fC+lSK6RO
	lG5hlh/Og54gkyHmvy91epOo+zy/5ntPrbyNM6iK1jhjRMv0ft1M7ObA+3Y9MnU=
X-Gm-Gg: ASbGncvyAzjkqVAZ/O99ilv7mSgD1EDGIIyHkDe2T36hr1krTu6Qh3trEW40YZsLcki
	Mm2M55Bcaq5V7afdGCFN1sG4d7UUOjlTl+4dFYHPTb1wRL8lBLB/7Go6t78+kJCvNnd/K6N3qis
	rYYqynSHt5UsaJsvKJxbNUcAvQlr0Hwa4RHaIhmzrMKayqxjDUd7dQ4nN+M0cTbYlU3jYF7x5eh
	N2sKuZNT1azqkCC0mVZkARVafuwJfb687TWtSALkkPv3Oi8Fcw6yrPSobyfOvtj2pNIDCuBQaBi
	Y5h0UH07TLlnfpczoy6BDTXYLqPCqzJByKCqc6GDj//ePebeV1m2tg==
X-Google-Smtp-Source: AGHT+IE/pkPyU+0I7L6tAz+2K5JYCY+Yzm4eb6rt65pfdv4WcrCBgFVGHp5u/6We4LlRpbOxpUQzww==
X-Received: by 2002:a05:6402:510d:b0:5ee:497:89fc with SMTP id 4fb4d7f45d1cf-5fca081ad13mr11822462a12.33.1747061550973;
        Mon, 12 May 2025 07:52:30 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd0142152bsm3717001a12.19.2025.05.12.07.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:52:30 -0700 (PDT)
Message-ID: <66feb171-f528-44e8-990a-ad0c85fa52fd@suse.com>
Date: Mon, 12 May 2025 16:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-5-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-5-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> For some modules, modalias is generated using the modpost utility and
> the section is added to the module file.
> 
> When a module is added inside vmlinux, modpost does not generate
> modalias for such modules and the information is lost.
> 
> As a result kmod (which uses modules.builtin.modinfo in userspace)
> cannot determine that modalias is handled by a builtin kernel module.
> 
> $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> modpost if the module is built separately.
> 
> To fix this it is necessary to generate the same modalias for vmlinux as
> for the individual modules. Fortunately '.vmlinux.export.o' is already
> generated from which '.modinfo' can be extracted in the same way as for
> vmlinux.o.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

