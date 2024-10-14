Return-Path: <linux-kbuild+bounces-4092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A2199CDF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5B41F23A18
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EDE1A0724;
	Mon, 14 Oct 2024 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsFDWGdF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4617E1AA793;
	Mon, 14 Oct 2024 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916685; cv=none; b=Dj5/f3ULstvq4qRp2pMJWb6cj1510qDCj3OMshkS5qlDEbgMDGQkiBMxDSSH233140/XApVHeLlU/7bkx5245EFa/qIZefIZNBNXM+cmUCPB0qGNLXu6ZKnZsFvaN4rUiTmLEmpJXQomGDDDAI3/T+ceQfIxyLJUtJJ8QiDZ2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916685; c=relaxed/simple;
	bh=owwnjThLfakHhe5ARwRbi6jw739M9wIYH8WQUXH0+RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0Suz1gmUbBw2nsJ3StxF8oHn7fN+Z3aJSSmQagAR8hF9ITXBVjL8yoQlsQSaNwmPMJOTOJepEN7d160+7b5qA0Z4RN+uPB+8wEEPfiIVBGdnRH2fLOUduV+kNhnRsKgU76OmaKiilUwwG8cihBqamLpu3GFReFs67IPRWe6HHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsFDWGdF; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e290200a560so3751831276.1;
        Mon, 14 Oct 2024 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728916683; x=1729521483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WU/WSO9mNbBclMCOEiZKWLWuiGoo8N3sN7OChae2Z90=;
        b=SsFDWGdFitiddy7rHWxZzMoVktAS2hF+Qzr/bMddkx5UKXDdhc8LR5L74MiSVwyUTS
         ADjwqQBPnqAAoFLmJfSgjqSpZfhHsI0wxw3AgntP3lku6cIDx5Kf46SuXx0Vet/TG3mA
         afMNDrmLK18/2x+zH+bCGl2fOsjITVn0kxvsGhRhN+B46b5gDKYx3VNczwZSFZfdQa2K
         2TzblSB10KrAk0FeZLfr7Gtu1wmnGY8U7MlMDihJV7tMqC0wazeKZgcZq6O5snMMsotH
         xHPQDT9oxq5PnwF0IjKc3hCCfyhEFSPISNUCtDKZZ3kRtKx3TFIEDUqqO6iXv6Vg9qef
         zrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916683; x=1729521483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU/WSO9mNbBclMCOEiZKWLWuiGoo8N3sN7OChae2Z90=;
        b=i0rAOaBD4yXLcbzLYZVCo8lRYks7xGsTajl9fUC1ms6vXpviHAHI2FUgGESb6vX4uV
         6/rlxE3N/6dHr0lom7j1te/fvKmxWpic3xvj/6AQ6SAAPBr6ajib5HkROuzyPgsA7+iw
         m1zDvit0QuRvEznEVJSKzRhqdA2mnEjaM5oIu4fFIGmVU4GXTGncCXTw7qrGE4OZMa5h
         vRLhhzIMAf7/ZrrMKV9h/M1VNuiRDv168Ns0+qfWpkxlv7tzKIA6YzQXvBynWBn9SLwh
         XEbq0N/E3yMC057d2/HrUlReC4d/nu1jMS44O2eOGgPM/8c1Kxy01fBpKFwABiZ8+2LO
         nZfg==
X-Forwarded-Encrypted: i=1; AJvYcCXGIPtxq/anjVpHFqQmfAfK4Vxk4K6DSiOTx5O4nUS1xywl/INa7XvEDnkn0lvlQClfFqrSEHlZm2EPLyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVHtLYZSNCRnVco76MDcRIy3Zd3vSrQ2aM5buvmVQCWsaEwN3
	/Ca2HNXrrINNSi67qXWNeplIvDKfNF6P9550XId1tAHryVOdOolH0KTcxw==
X-Google-Smtp-Source: AGHT+IE5XmDhEqAbGBxzDIa2YqzZtcy+1skVyM8fpjHB8iw+at+jdN0IZDc8rQ/WNP9LTsS+IPefnQ==
X-Received: by 2002:a05:6902:27c7:b0:e25:ce5f:42cc with SMTP id 3f1490d57ef6-e2931b557ccmr5759254276.32.1728916683220;
        Mon, 14 Oct 2024 07:38:03 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef5e065sm2450841276.51.2024.10.14.07.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:38:02 -0700 (PDT)
Message-ID: <fff1f9ce-28b2-4ba1-a118-3a7cef722bdc@gmail.com>
Date: Mon, 14 Oct 2024 10:38:02 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] linux-kbuild: fix: ensure selected configs were
 turned on in original
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-5-david.hunter.linux@gmail.com>
 <CAK7LNARdzUro3A00wU7XScXa=582vtY+nZ5-zkN89_3mS70Fag@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNARdzUro3A00wU7XScXa=582vtY+nZ5-zkN89_3mS70Fag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 23:45, Masahiro Yamada wrote:

> I believe defined($orig_configs{$conf} is always true here
> because it was already checked a few lines above.
> 
> 
>      # We only need to process if the depend config is a module
>      if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
>          next;
>      }
> 
> 
> If $conf is not present in the original .config,
> the 'next' statement skips the current iteration.
> 


Good point, I will remove this portion for the series patch.



