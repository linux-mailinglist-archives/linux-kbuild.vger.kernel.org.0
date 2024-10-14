Return-Path: <linux-kbuild+bounces-4093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693899CE0F
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3C471F23B36
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189BE24B34;
	Mon, 14 Oct 2024 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HK1fpODQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C720EB;
	Mon, 14 Oct 2024 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916767; cv=none; b=BXmk4lvblavS03Ui03EcN//2VJv4LdzgHcibksHX6NcDPBOwljQGXT3izr/Tg6N9lvr8k8j4lSipAb2/4qGvVGtkY2mH7W1P2z8lRgjTnaJy6hBjtYydvONtvlX8e2V9aNL6Lj1VXgBmYXFtWB1sXkU9/I1aiDlvP6AE+Y+L7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916767; c=relaxed/simple;
	bh=ZAzyinGeb5v30d05WEZWymfTohD8S5Ezckao+QT/GyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+2sidhRLkBElSPYww986ZeH8MX3RQGs+3Z1+8ko/gkiGMuhOLusO5rUGOi9hmgH5Usa4dzbh/q4B3b1SS01asZGgde6Q8mpt0pNhC5nRjYBf+0CVGMZJxY6GABTwVcaHlHJdT3srHzBpHueQYrtGMhn3ddYEhL5YyJkMA3YtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HK1fpODQ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29028f3926so3817546276.2;
        Mon, 14 Oct 2024 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728916764; x=1729521564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=px3PmYhE5g/8MHb8iVpJ8q3sEvZNb9I3lpULVyJvaLY=;
        b=HK1fpODQgFZyDeoGNjYVTorfEyO0MrguUs5CreSAYL6lneXcFf3D1oTlIWfrvanMct
         8/ZE7RzS7OcgKxDpYcWfaCFgWHd5d84UAZdVtyqp7fCffgBdf4DSuoHhBZW1hMieEJNb
         k0v4G4ksJCUFiEr/LkeKocTlKc7Izucz38pj0Dl1WXDPtXDcY8sEJm1nI6GdS34Ouetj
         TCPU/3o3RRe5OT4Ga5olPs4/12UQ8MYrAwv9eeqk2wgBM/+msl/WZs14YaU73rS6AWKV
         4nahz4EUY3Oz3Hd/Ob3f5f2Qgcz5uY1QGE995q2aEXGzHq35yRSRxipjho82NUyDgTdU
         twyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916764; x=1729521564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px3PmYhE5g/8MHb8iVpJ8q3sEvZNb9I3lpULVyJvaLY=;
        b=tAqNXhh0o/QCqaTlVmqoGGOtBdOMBF0tl/3JReqS7OgrzwPpylfFUY344/kW5JUBKL
         NKmFYTcXXEGJNvhmN97L+TChI+py6QMxrKPrtekCaNSM4GgSihfBD/ZDIZA3zkPe1C0N
         JPgOgB3l90AohIJO3YYbteEA41WjDBwXziM1gYeGbn5pL1kXHL+VTwS5K255urdUWPRI
         7poLSzUtivuWx0r6eVZyPsm+imBjHFC/sQwbjvXE970RGcQUPXh6Hu2IOmNGvpvQ+kWv
         KZwMTNw2cTP1L2ByrinnTLc1XOKJWUmpuXUUBTr0WpVaWT5RcOnDzrOCyWHU1A2U1YPS
         9gWw==
X-Forwarded-Encrypted: i=1; AJvYcCVaHmZJvU9BjoxO0fL4Oh57TCLY3bgDF8WkT92WKHTlm7J+maqyuMumg+QdOl5nRbb8PRuFtx6gVa7teeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcz0RzKRCxDmrc7yMC7zLn7jRd/twASQGC5hj/tEhVpVVQeRGT
	Y1sN4TfcsdBa2wfUKae3XA8f7jGERBxR+Yi79h/Pcs375cVJndbP8BVjxw==
X-Google-Smtp-Source: AGHT+IHCjtSkZiK3/KZtZBi4TaK+ApT+pIe6khidPrnUvjFdlIjNjcMGNx89ygZzYSiNkVGElSVRLA==
X-Received: by 2002:a05:690c:4588:b0:6b1:1476:d3c5 with SMTP id 00721157ae682-6e36413fbd5mr62763607b3.12.1728916764537;
        Mon, 14 Oct 2024 07:39:24 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b61915sm15283447b3.26.2024.10.14.07.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:39:24 -0700 (PDT)
Message-ID: <309e2057-ea13-44ab-8c65-0448443bb5d2@gmail.com>
Date: Mon, 14 Oct 2024 10:39:21 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] linux-kbuild: fix: implement choice for kconfigs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-6-david.hunter.linux@gmail.com>
 <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

version 2: 
https://lore.kernel.org/all/20241014141345.5680-6-david.hunter.linux@gmail.com/

