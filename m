Return-Path: <linux-kbuild+bounces-7145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53FABB011
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 May 2025 13:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78C0117892F
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 May 2025 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A1D213253;
	Sun, 18 May 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dvu7mXo5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6611FFC46
	for <linux-kbuild@vger.kernel.org>; Sun, 18 May 2025 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567836; cv=none; b=k7SLjEHOiANLNF5R5qn/N6J/4mmV9NwNQiCT1/vX8DYaPELn6Zx8qBM9GRR+bTSRaq++8AEE0Fb2xnBJEnE9MLKTzQvRwQmfoMkmPYCxsD6xk8BMMQP6PtG5qp7W6v3dkJCZHkhw0je5yCQz66QaPIsCaC7r7ZdBGrQSYKkXBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567836; c=relaxed/simple;
	bh=jkdiG0lJ94nElrybyviFXtXTYbeXbXBXBnbvmhZs2hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmfcoiBfNMeKq5Sbns+hVlC67TKqIdcEwl0Df2hm2fU4I5jPazTjpe+yljF+yQ2XogPnPDgJUXH5yi3+dEGqHgrDjzlKwEsEXuZL4TLaNmB+6Rn76UHfBG4/vuE6VLcssSqKDKDNOVDjloT6Yvkm7JIdnySMP/2cT3ArU1jkThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dvu7mXo5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so24475155e9.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 May 2025 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747567832; x=1748172632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBIA1MI9/yicy05NsDe+86Fp64IqgnRMLxKdcioKfYA=;
        b=dvu7mXo5TeW02fvoBHlKTWfNS8SeySbzEoyVsFudg61XYEvJyQxlHPDKDhwMEUEvBc
         MhxiuYbwi7gN+y9QLwuMLnGkCpv+sI38nlUYU72aET/T+nNqX+r0SxytqLL+B/L/M5Zm
         qjcJqJgWzIiZTfyG/VEAECIdKRC41pSFkKwl3yX1jKqaNIEmAMqAhaQWN7kUuMIdw/qK
         6OADlMBZxY6AnkMiFGn8P0Loa/vdWU9hFR/BlZ479q54WYUBTg4jQJXPtlvt4BGJHlBe
         sjNHzL84wu1hZl8XHWAYrkGFgoGJSMsFxoKhawEjctVsZAMD4eLPxKnK5NYjLR5A9/lk
         unOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567832; x=1748172632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBIA1MI9/yicy05NsDe+86Fp64IqgnRMLxKdcioKfYA=;
        b=hm2K8nN58v7vl6XePpd9MxnpkL02Dfa0u2y8KfA9NuR1AGitJumcIPyxyo092nXHKX
         npKs6gv9QjOb4XPrVhFBc1/oIx4QTmDBsitCl2aa/0f5itbjgI4V4XHzO/hhcrke7wka
         fQyf8UHfgoZvWytzbyNz8Zpb0cbwWSyqU0Ht7fMJlxInDIlA0D9MfL9iHCnb19gCxipO
         srnhFvOeUSMEqvCqRU61BJqOULtDCqz+qtsoebOOA8HZpv/9BD6Ab4WhfjYLxGJT/wUM
         u4FG5n0iO5OJk4PduWeAb6xjit7ysGhKjccyDVR3qdyxsZ43XdMkIWFx4srVex38YO0i
         UAWw==
X-Forwarded-Encrypted: i=1; AJvYcCUj2VaJIYA9q3A5csd2VKMkH8MfGBEJMWIQ/bZ3X2wvT2Q6JJ19QclRNz3UYdZ4kRyX4nZw/W+0ktpOXn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPAaQkH/aOItgZGs7CUOBg2CPrXYiB32MTULO55HcdaoZamYx
	/KyZrW7nfLz4dzZ712m82iJ3MMDbv2rPqVMplA8pQVtIzquDoWDfInpgxU0ZfqwI/VY=
X-Gm-Gg: ASbGnctuCHJHUK9YFoacFGuw5tfgqsH/iuMm+QlqHsGwUn50gSLPP1MVN0LAeywy0sp
	EIpgMmqn/vGvk1S+AgFRHJxaX1ksD76BzPY8L8X3J2fgqqfb+67DWvoDBGot+H4eNqYQIcGCLvy
	qlHFRkEFo+77Y4/tPDDhVx33Rx/y48uDKUeG2nToIX/zTG5aF+vFvf9TIZy1LZykg4+0sZGUQSk
	V58QgtQtfW+QqxMX9q/0iYuYb5v0TPaKK5E5fzQfsYjEEuhRBficoqO4yvvVxu0myUk9sXK2lTF
	IZDLEQTgGNzppj3SzyzhBOfITo8zvQuA9MvUQXXlnDL5lBhLVkSEeA==
X-Google-Smtp-Source: AGHT+IF34B9iB4YYbEjDrj12bkfULgsY6pZqvIhu7M+OeX0JALzMAOn3pM/55PvEI45+GQTKRphZsw==
X-Received: by 2002:a05:600c:6296:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-442fefee254mr84736685e9.12.1747567832613;
        Sun, 18 May 2025 04:30:32 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59701dsm99293335e9.35.2025.05.18.04.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 04:30:32 -0700 (PDT)
Message-ID: <d4810834-b10f-4de9-bf41-bc9e5cf23b91@suse.com>
Date: Sun, 18 May 2025 13:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org,
 hpa@zytor.com, samitolvanen@google.com, da.gomez@samsung.com,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
 <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/17/25 08:48, Masahiro Yamada wrote:
> On Wed, May 14, 2025 at 5:48 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> On 5/2/25 16:12, Peter Zijlstra wrote:
>>> Hi!
>>>
>>> Implement means for exports to be available to an explicit list of named
>>> modules. By explicitly limiting the usage of certain exports, the abuse
>>> potential/risk is greatly reduced.
>>>
>>> Changes since v2:
>>>
>>>  - switch to "module:" prefix (Masahiro)
>>>  - removed some patch noise (Masahiro)
>>>  - strstarts() and strlen() usage for prefixes (Masahiro)
>>>  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
>>>
>>> Not making using of glob_match() / fnmatch(); this would result in more
>>> complicated code for very little gain.
>>
>> @Masahiro, please let me know if you're still reviewing the modpost or
>> other changes, or the series now looks good to you. I'd like to take it
>> for v6.16-rc1.
> 
> 
> The first patch was applied to linux-kbuild.
> 
> I think I can take it.

Ok, that works for me.

-- 
Thanks,
Petr

