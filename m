Return-Path: <linux-kbuild+bounces-633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F32E839BCF
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 23:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 180A4B27134
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 22:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946044EB52;
	Tue, 23 Jan 2024 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WWMLuXO4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF24EB29
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706047578; cv=none; b=IquL9fJ81mn1sjpX/uJkAMHQfZW1+ePGzaRQtRXMYC59U89qTkARfwYQRu86UlPbzPjkH14z2l2oNOiaoCSUzfFMoJP/gEq4Uk06L7mDxf4wVKcxWfbIov5d32Vhz1ff+3Dyou1smVJonlXiuU3TyP1TnEAPuLAdl26JfPBdbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706047578; c=relaxed/simple;
	bh=meSKnuOdhgy7gcRPOlUjLkTPmz4xSbL8Ff1ES37ltmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiNOKfoB7ltHuAuqYG42Rp9ADpAGgC5+ILL4b8GCF62JiZKXMx0SpYJJwat2wakfM77HZX8pI2LIYVBXH+yXrkxVB3SkHQytlERnVpodh1zG+bV1vOXkMUr75jyv0pMNsWJam6wKdeJuYEn2YiUApOZFnS4sDh91eZwqRpF6yIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WWMLuXO4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6dd72c4eb4aso1131067b3a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706047576; x=1706652376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vq5AuVtFfbnm7KmCdFym6eR8lK3cF/V0+/5wIAUspAY=;
        b=WWMLuXO47WtsxAtO0ouCUYsiaKqfKOoDTwi2/1mbK1WUL9585n790X5N0aou5bseB7
         gWcD7ep3SaFCp9cdeagKQPX9z4fuDhRjivd+2FWY6Cew2ymqjyzoEvvk8zdx+wyJiszh
         11Wv/fT9PcRAZ/199Cwcf8l3iMpnfF20eQCnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706047576; x=1706652376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq5AuVtFfbnm7KmCdFym6eR8lK3cF/V0+/5wIAUspAY=;
        b=U078lr3W11Ryfyga0Wmp7HnvAj//sya4pQID98UFyZxQF8Y7hpScGdJBJzfNaRlkRv
         raOnfYk4usBgs/SqEV8fTRXuHzjrSfUEVyEBBMIWOVQNYH7QUGfSzagRmKw6gdIHb5u3
         cAu0xVGEEVmwXfUUdmEcuVFpTIvlj3jHou1P+7gZO7th8/qIPON8nY/naVArbhJVROZX
         3rNnSfUuZq8dqFD9ucjUYNgranb/yFQNvzniXVSkrsVoIFUw8hi5q0UC/DgeRAa+tFMx
         +22YI7w8kLi6EDXm7E/Q1bK8CMeI3EuhmjM/CirvPZsybTx2IzPTQSC7xA4bxwmAxyxY
         rLxg==
X-Gm-Message-State: AOJu0YyIQjO9xwjXLC5Yx46JUODlKlqrQJA0Xiwo1YR/RURwr8+Hr8O+
	34h5bEn+8828RK7H/4RKdf6cNpVNs4YHFblSbOVKNfsAsH0froMHyMAgmuUGpg==
X-Google-Smtp-Source: AGHT+IEdVicNP58IhFXYtzEbHaHvo9B2Vu+JPgRZ94CmAr/MeKEbwhzMtBto0WE4UQD2qQdKhczlCw==
X-Received: by 2002:a05:6a00:99d:b0:6db:c9d2:12de with SMTP id u29-20020a056a00099d00b006dbc9d212demr4353111pfg.49.1706047576571;
        Tue, 23 Jan 2024 14:06:16 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:81da:d4e1:ee51:c4d6])
        by smtp.gmail.com with UTF8SMTPSA id m6-20020a62f206000000b006dd897cd81csm95631pfh.53.2024.01.23.14.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 14:06:16 -0800 (PST)
Date: Tue, 23 Jan 2024 14:06:14 -0800
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	Abhijit Gangurde <abhijit.gangurde@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] firmware: coreboot: Generate aliases for coreboot
 modules
Message-ID: <ZbA4VthTMPT7BSRo@google.com>
References: <20240112131857.900734-1-nfraprado@collabora.com>
 <20240112131857.900734-3-nfraprado@collabora.com>
 <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>

On Sun, Jan 14, 2024 at 07:09:29PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 12, 2024 at 10:18:31AM -0300, Nícolas F. R. A. Prado wrote:
> > Generate aliases for coreboot modules to allow automatic module probing.
> 
> ...
> 
> > (no changes since v1)
> 
> Same Q as per v1.

I don't have v1 in my inbox, and this wasn't addressed in v3 either. But
copy/pasted off the archives:

"Don't you want to have a driver data or so associated with this?"

These drivers are super simple, and I doubt they will end up with
multiple tags per driver, so it seems unlikely we'd ever need it.
Additionally, struct coreboot_device already includes the tag
information, so anything that could be included in driver data could be
parsed out by the driver at probe time, if absolutely needed.

Brian

