Return-Path: <linux-kbuild+bounces-7366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55164ACDA95
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 11:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9B43A471C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 09:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E073D28C5D6;
	Wed,  4 Jun 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WxZFvWXm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AC28C2D5
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Jun 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028212; cv=none; b=PYl7cDu7DsM7ihB9mXV6Y2mI3+SF+CakpxUtLETXwMJFQmKxVCh1jURWdaKhvl4DFOQUPmPesKEdW2Ta/Dx1mO05ZDK+SdQJDNYQnI87wgAKLIvOhaEAAn9Q/J2NjSfJmFYPdzeBuoRgkYisSFwciQSNItFtbYh1f2dbVNP5wKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028212; c=relaxed/simple;
	bh=oMW4MaSwYK2mtMHKkMAV4IJupcfvcbWA0rhfA8QumkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyTHkieUONaHNKjZtFRTjBga0L3FN1SEJRjaqvV3sx/JLxZ5L45jNQGELBBANwGjZ5HnHlHLsnFJPfO3jmPi9U+Le8GZE/Iz+hBOLOjYKMDFPguAk6pLn+VcGc/CZpZDolMLjCA7Je1A/MStBUMuipnj1Sq5/vkqouWryjJx0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WxZFvWXm; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a366843fa6so3479003f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jun 2025 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749028209; x=1749633009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=WxZFvWXmWUyomFHlC3XbrdIdOPi/tsaJ3iKX36VyBqNPlfZsk7/CuWYTdpBAZXcfZl
         n+pbUrGPvRyd1leBkaCDvhYitVP44K+WSPbYLnH1sV4WSDuERuTH5esa4KMWYbZSlGOn
         kh+v6mEkZdIypchHCjVff8rqlSXDq+hZr99VkK5NVP5P2k/SPJsVruErjCpTVxgMz8mX
         2WOUpsNq5qWl4yKo6r2MvX7cLUryBkF2xsrlnbNu8YB33RCgPjdpXAJ3UzpfmVEU+D0y
         uduETeb0VxtapyjwN+RRFG6t3DiKh96zhZL/242U+j+9cCDE83KP7QiJ9vaiqdBqnmCH
         c9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028209; x=1749633009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=lPEEAjx42YgtCe2TYNKYfAPRZ1NaDucQPwyPpO/5AKr06yc+eeIY5Za9SdiHnQzDaL
         vOYGZwkAmmNqG+kpKlS9D54SkxG6Mbi4LALnpBTCH04JV1MhJv4P2wkRq/tKjOa/bsx8
         ON0f/wE93R0ckazN81xpTrWA2RA0G6qd5j5Va+loPnGL20OxMZz0TVTGydPBqLToxVYi
         AuFyCdH7TQfvZNFPOj8WpTQThQ7ZnRM+oudkikUP2gh3R5or+/Mf3rOHKr8P2HEo3Mnf
         Pe1Raek2VL6WmmHAISNK2aaHdLXq37z7pa3tReYOv3U894PmrW7/g70kcOsAz74YiWtQ
         H1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVvHJZ+wxQA0HmBzcBQ3+5GEhSCRw1xzQpbRjpgwGU/1jSt5QgcKCBsSLb6XzXRXHGIOH2JRI/IWUA4u1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyopRsqkfaNe1x3RIJx8mZfdSZ+ldFJ4f16dJeppSRDDxEkWo7j
	HdN5nN3Iuhidlr2GP3JAAQ0fcBQw2hbtBzlg8RWT9nrW0tYPWcIf3GMRGa6wiNmzsBI=
X-Gm-Gg: ASbGncvE1ST5Knv1kQunKqAgHOftZS7cSSUq6LXLEj+ehvc9R7KZu1T2sfgKdlpfv8I
	38U2ximIkRz9ZpyeIuNxJ5WKt4QFLrPlMUZkpdALlwp72GBch65P5HzWI1gAOTsPtCARfvTOj63
	Ztkfza2F5A451w9XMSYyg/xyLhrjJxopKvQ9ZByOZ9JTKM90S+9NOTR38ZwhP4uepL5+u9Hcpw1
	o9skp6JH3xy46UrIF0VOdPAksTddJCQhZQyiYloipsNeXoqnNL0Uu95arxoIwoCnEin4c/IUO4J
	TZ/4Cd0AsTarwXs8hVEKxOZg4gPE7izfWpUsyrann0h9vg+Kenizb1aWmS/OjFt74BMKUw==
X-Google-Smtp-Source: AGHT+IHwbnqda0WUALZPR6BH5wV/ac7KPGSXsO6qAre2G/QftXFom+glyTD0clAk18FXdlE5JE+qRA==
X-Received: by 2002:a05:6000:4011:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a51d6832f3mr1560987f8f.0.1749028208696;
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5215e4ce1sm877352f8f.37.2025.06.04.02.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Message-ID: <95f14895-5c30-44e6-b185-824aacf0f997@suse.com>
Date: Wed, 4 Jun 2025 11:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Wrap EXPORT_SYMBOL_GPL_FOR_MODULES() example in
 literal code block
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 2:51 AM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning:
> 
> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix the warning by wrapping EXPORT_SYMBOL_GPL_FOR_MODULES() example in
> literal code block, just like other examples in symbol namespaces
> documentation.
> 
> Fixes: 707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250526180350.06b825de@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

An earlier patch for the problem was sent in
https://lore.kernel.org/all/20250526211039.163449-1-khaledelnaggarlinux@gmail.com/.

The fix should go through the kbuild tree as the problem currently
originates on its for-next branch.

-- 
Thanks,
Petr

