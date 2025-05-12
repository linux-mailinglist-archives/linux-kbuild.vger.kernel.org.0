Return-Path: <linux-kbuild+bounces-7087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E604AB3B56
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 16:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01B4C7AF873
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 14:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6FB1E503C;
	Mon, 12 May 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R7BTSxSh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1873E217704
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061469; cv=none; b=NgKcFX/+X2pvSqROaVW3TzpPKJsOUtegpFJhgiBAIWQm25S2P7C3DyhH82cd0cM7/fqOyIcL2ve8Zk0amStyZOY2Pe3bIYi70W8b14QcdvRB3bcPI+LWpQ0sw790Nci4BdvFUOxUnuYDo5KCaY7VDcjmn6BSlW0tiAtuw2GDjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061469; c=relaxed/simple;
	bh=D8ERM3wxNy4SIqS55lDq5eZ7zd9yV+0Q1RkUN1uIjB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMrqRzL1wzNLqMqwWewYFS9gvZBqrDsH8rXov1ILV0kvUzekuAHXYQsMgYpgNE3fMh5iE5u9PqEHEMATSykWZeVxp+9U+x0BkAT/Zk0KtHEL+dQpJ8GsWz1QiiBam/uwl0ph+g4HOM7ahptlQ08ILwYqt7yt6Pjza9gN/5N84UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R7BTSxSh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so7431741a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061465; x=1747666265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lu0Ka+btw04+FB5hra+I3uxj0tOrSX2sD4d9HHszObc=;
        b=R7BTSxShnp1HCUpcRfNPaal36O0Gyi6CYe9RgmOIcW1R1ReGctNVyla2//Jf7hr8Ol
         V9EArf5W0YJvRXMyyCQuPj3JdIV4BNPrDjL2vCcnFNpTAq2kJlsvtkKwc7aMLmWCgX5Y
         Df588aGPLk3/j3gvDT8GfsIZW82eUzdd7P+OE/NdPLoaFXcDZjYq7Z1KwjP9sfueBr75
         iWXOMAleKBbX/aRTQ0u9W6tRtZKDgdW4t5l3hhqUkwkFsnVBo70rGYmP3D4dvkQApcGd
         M9Z2C+V2f4vJlIHafUTxLGHcBuUix9839MFzdZY1xCfL4oKVz/XfAqCkXCNP+aUeFCsX
         n5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061465; x=1747666265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu0Ka+btw04+FB5hra+I3uxj0tOrSX2sD4d9HHszObc=;
        b=sp4l9+lCaYoL9LY7j5pugcY+HhQyjvInWz3aqQPqhz+lEw8do1J/V1fLj4y6efblxG
         fQAV8hApHV2czvRM6ucTkezmzQ9d6QFMLP3jDek4Sle+AuyeafZAvjKvQALZK3TGEx0y
         dI5qdcXQwjlA3oWxUmz8EEKvt8FLtMrA/+MKNopaI7BLiUClAOLKsq2x//VpN6vNW9uc
         zXj92jb1YPDOmGEdNR0NVe1h+ruq0u59AEVLW14dTiF9vK59JzBS8qbUfbbd9kHA97aB
         t2ktiLE1n2ph/o4vnU3Q3545DctEF6Sd39gLM18wil6cwidC2EpovRkKtp2SbqeYuLqD
         CEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+fNLTPK9b7Gr/NBY238w9a8DYI4hrq0A6VKPLX24cA9PFpdWyy1hVm/jTmV40wjIBd/4GsNT48mLPOcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mWm1s9bxMoXOaQBy5CoqLjtL99H7bDwlU1PgG6PYk6tfWU3m
	kAxJSjUl4Lo2dr8vkLZ4VhKksUDLbOxoKeM41x6X879UDlxdRMGKO0G0wIGmJ15/vxDHrGYCPq3
	Z
X-Gm-Gg: ASbGncu4Ggfomgwdsnrzsp3kRdn41GHW9OOJ7W3dYF3IvLw8O+JykjBT60mZSZkMdxL
	mC9JqhltOPzrFFwXPBaZfd58Tb6P99FlCv5AQW9+YJJ6pLs7GddolWQKZr2JH7XrGeEq5OsS+zj
	uEgIH8mwoNeu10x5awSSyM17lTY9rEP2EqkCVHDO6m7HQADbGR7aGSkA7TP0BOAo5V19OSPlKgO
	GWxWzRWelpSjyNuesXzaVDhrqWSoKFCsLGtAIuIUXFM3aNkljUPGUKOfwmVr1UOq+k5YvkOkBTg
	GEgxXki+NEwdkfgyGluM/doB8tAvzk6Smn7ljcFore1pUZ0gpthWQA==
X-Google-Smtp-Source: AGHT+IE2/toU+HufXX22qwPZasaD7jOUf2RnZh1MyhP01PfRZenyqlX4Nm3L0S8HlwQimighlo0svA==
X-Received: by 2002:a05:6402:1ecc:b0:5fb:1bd5:f73c with SMTP id 4fb4d7f45d1cf-5fca07eb6dbmr10848327a12.22.1747061465297;
        Mon, 12 May 2025 07:51:05 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d701394sm5775759a12.52.2025.05.12.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:51:05 -0700 (PDT)
Message-ID: <27d93a59-5542-4b5f-bc08-25aa7bff21a3@suse.com>
Date: Mon, 12 May 2025 16:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-4-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-4-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> In order to avoid symbol conflicts if they appear in the same binary, a
> more unique alias identifier can be generated.
> 
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

