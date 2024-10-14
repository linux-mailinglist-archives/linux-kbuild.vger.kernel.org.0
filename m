Return-Path: <linux-kbuild+bounces-4095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49599CE4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F39728615E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0544595B;
	Mon, 14 Oct 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvse/qDo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB071AB6FC;
	Mon, 14 Oct 2024 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916941; cv=none; b=sI2Qi99hGajziSzrP0tESqHvqNoyw4aXtUzNtULyejcmt5HJ0tB5LtAmcqa3t6/LuZpAlAQZmY7L6ulYHym61xxexQKJHQpfWmNs4EjpX3zWz0vENMI5MgecWAsIYKalvdeW2EYGH+xjBqnP64S0gD6CBTsgPZIjkPhYa0od+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916941; c=relaxed/simple;
	bh=yp/vq9zlbq1HhG6QQGenrbEj/Q0rtKpwP4zYqsnuJjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lvsngb7xyjgTcjQLOOT6p6lGlH2w5dxU5m35k38pFJ3EVtoGw7R3D0A0BSptTnwxxMTruoEWc/7zgtScmdPa5uF5LGhcRSZj5wMCkktfS5sWuhN+ece0KTyaG7R9onTsap8UtERuKDkgahjPbEuzECSIbCUXqCVk/GDqBeNwyJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvse/qDo; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e4d16c2fso36812227b3.3;
        Mon, 14 Oct 2024 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728916939; x=1729521739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7yd6ocGPa+qHv0lpNEK+1T1208owehkBcsL1QtHm1E=;
        b=Mvse/qDoDBR/cwSUlSlaOarM8nvWCigOAWkCRpNXPf/nY/0TSCqyNrwsstgIHEYkAP
         WhmOhvPE+kwnY5E9lRymqOsTntcWJhgVQxgzuawUi/m2jma3VNP3lTNglQdZ/NWt5c/V
         bP2AaqqFOViaY9aCR8wEATnMebJJb6ZL+tHkbZJu8qxSKA+hOY6BYYcz82m9GSaTAKqf
         9dPyFQk4IX1FTchFOeFocpWh1kFSZ4eLnV/VN2UIsbPdIgQxRPSs38VRuQ9m8OSQ0QaQ
         btunCAtETWutaBd639CGxueiMGh9+cGcMKWaXfQrCAWrW9rFCfIDcMkUEKVUzkYmu72O
         qTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916939; x=1729521739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7yd6ocGPa+qHv0lpNEK+1T1208owehkBcsL1QtHm1E=;
        b=ssM/bp2ZZGHQsMB6f25hVN6ScUY5QG6n11GViWtmFKcPbEHONn9DLkQWBH84x61YZh
         u9wCXFNBUc6YtrsvCLY82sMWeCACa0xF+DSTka6AmB3IeppjitQynN6YlkV/lExrz2WE
         wl1WfN1tr6MbqEc2MKrevEHDEapE32IFiQblwonh536s90ujpSKoUt7anVt5v1KqA2bV
         xzHurw6bgAGfe7gnpZZQq9gP6DlTyL5GF6ftQTQC/9USRQrT7OiwKsvDj1PF7FQcxJHl
         U5qD5urL+P1AiO/0Ib+bojMh8sFSo58sQggYG1JxkoWPyj86NaglBSE3/RYsIjxQpFDY
         JboQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGuDjLOXQs+9Y60cojrM24k7Gmc7k0qHbS8xAVoiFduADgB+GXB/0z/lZlNFZjMVGYm+pAvwftkljGqUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IZbPDftZNSVjwF04ZsLe/cNXF7oTvyGmUIvsso9jC4DZ9TSY
	JQmLH3dSupbJ6VL2fwZW3qV+J/YeCDR864FCL6UXnrPVPZgnHfPhv8+DGA==
X-Google-Smtp-Source: AGHT+IFrpVozxAesIjCHUikzshrhyh8y99zvIO4C2XJjdes/VeBu3a+00IFj9Z4GGk++ezrzMs0IYA==
X-Received: by 2002:a05:690c:6711:b0:6db:deb7:d693 with SMTP id 00721157ae682-6e364347ac3mr62466697b3.22.1728916939240;
        Mon, 14 Oct 2024 07:42:19 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332bad8basm15669867b3.70.2024.10.14.07.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:42:18 -0700 (PDT)
Message-ID: <c1485484-15c1-4be5-b320-01443f4f3ae2@gmail.com>
Date: Mon, 14 Oct 2024 10:42:16 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] linux-kbuild: fix: process config options set to "y"
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-8-david.hunter.linux@gmail.com>
 <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Version 2: 
https://lore.kernel.org/all/20241014141345.5680-7-david.hunter.linux@gmail.com/

