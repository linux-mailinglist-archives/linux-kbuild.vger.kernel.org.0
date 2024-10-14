Return-Path: <linux-kbuild+bounces-4094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5199CE36
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB3C285203
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509871AAE02;
	Mon, 14 Oct 2024 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTUGCUT/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31E1AB6DD;
	Mon, 14 Oct 2024 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916881; cv=none; b=KhYUTpEYacQBrL6a9nCdeMmRSZ7/4buZOo5G0TvAUWy0zlVsG9aP3u2W+Fla/y6Zh9hrLdFaxbem/UdNJBwDHd8fgfivSygAOALYZqEQ9p9CfVvKHv6UabTuz1HcQMmxeCPnad8kTBK+DdMBNn24Xsv6kEECW0M/OI6/DuqEExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916881; c=relaxed/simple;
	bh=poO1b4aOOl4KxcNSMPtHE5c3OpdVVV7KBRYV8RfpmPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGKCNoAM2YVFJVDMVj7UNWPLi7UaL1dtXljUqvrXhqeALtvWbHbGr7+vXdIpzcF4eL3e6UN4HmVExkelNsH0IR1mHZkuc4Jtp7G7dD3IbmKBDKvY0qwkoLgqgU3i3d4OGnSMdfNpKbVlUc2g12upDAkcAhezj+/jg507jeniuvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTUGCUT/; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so3690607276.3;
        Mon, 14 Oct 2024 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728916879; x=1729521679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+RUbcnctgVo0yHfaNa75XTL/Dsjylm+oWJiYZAGfmI=;
        b=PTUGCUT/1Qnckdr5VRB6h/hRmEYvtMn5LluuHf4r9w4MqFL4LclP61VW2LNzIgEw7E
         IZsqKKFxpDQU/ypzKmypXzqZpH4e1zBrGlGW7xvUsg/9guswi6NelOzRuyfoTOdo0cl1
         xV0jbCZSKXHUncSD6ApX4Wv/qsAVHd9spbc5gOsvj085cWmROZdx4yTikqFI82hZvKDs
         kk/d+8T0hnZPboVwg9N97sGzIMbdaj2dcZoe7XFdtTH/2vKcN02k7e96yyIc9JR1aac/
         gQzgGY0g0z+EVFwpUMxOP+bcQU6/jZRd7roy5TWs7TwgyPYud4E9Z/haGhvc7l8ZJ+iG
         j7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916879; x=1729521679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+RUbcnctgVo0yHfaNa75XTL/Dsjylm+oWJiYZAGfmI=;
        b=waxemJJwaPhZc6wTqscqwi+po3Cl2l7MH/sX4YX533VVQLSnOtxpvXScQKD6VA9Y1z
         VJ8YIpolS0jaDoSOoxVKZyXcrHUQDZlRffqVTRQmtWAfIGXmC83EN7T68aXNawS+XvbW
         qPu9mgU/DGm3pbfRKK/CTHljj+7opVH1CZyMRP2mBx6QEVji0FSi+AnGR5f4hmf2JJtj
         ZEOaP0J2m/ukp8Gq9Exp5uVA9fTvGdlmHc1oyklZe2Hdtm0b232nBy/s2sB2C2UE84rE
         8G3K4r9q4R7a4JEPRDGIEFDgVvr7Fs5Qvd4KBo5D1OxamM7r+vxd8FCxLK1hyzO9PeUL
         6gog==
X-Forwarded-Encrypted: i=1; AJvYcCXWKOrCrcuyTcbnOznU166RdSVezGqy0iQgIu72LeCDuQ1oqSxzSqqx/3tHv0LdFSasY/8pBN84LK+yOT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeMyksdvq+47gRp+r82fISv6Zt6WfJlrsUfUc8kuDeeDEUgWy/
	Z5+WGs5NxiOBA/ZN5up5Lw7kP77xQipm70v0ALFaMh3BzSx3rsLt
X-Google-Smtp-Source: AGHT+IGQubHr9ZiXzGYy4dV7cpuxvQehMmYCUwhCmcdGah8JYEzV/e0Q7ah7aEsKhuP87W15U1rgJQ==
X-Received: by 2002:a05:6902:1607:b0:e29:492:72ef with SMTP id 3f1490d57ef6-e2919d83eefmr7517932276.20.1728916878799;
        Mon, 14 Oct 2024 07:41:18 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef1e3d5sm2370041276.39.2024.10.14.07.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:41:18 -0700 (PDT)
Message-ID: <7d59b479-9fa4-49a1-906a-ef6a30951faa@gmail.com>
Date: Mon, 14 Oct 2024 10:41:16 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] linux-kbuild: fix: configs with defaults do not need
 a prompt
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-7-david.hunter.linux@gmail.com>
 <CAK7LNARNteNvrbTeNTz71XTFjjL4XjLC-CT2UjVsGRpP_ToPKg@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNARNteNvrbTeNTz71XTFjjL4XjLC-CT2UjVsGRpP_ToPKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

version 2: 
https://lore.kernel.org/all/20241014141345.5680-4-david.hunter.linux@gmail.com/

