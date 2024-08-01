Return-Path: <linux-kbuild+bounces-2770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF2944D11
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 15:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5686F1C20B1E
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEA71A071A;
	Thu,  1 Aug 2024 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNzh5QwF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018F183CC5
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518560; cv=none; b=uZoklt02lHS8Q6phnE4CNJ+j91/MP39eIL+P3Jo0lt35eMca5n4sPUf7Bib8SE+0mM5DpJSIlg9wpT7CjtslTHwpItn9cCq0t7m3NHJal0dsqZBMd1p+CR4YldC5nAIlDTGaRXkLqKwsDr8Z3gfWBfAUcSPle3/QDl68D4uDd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518560; c=relaxed/simple;
	bh=9eBP+R9XsVnTmNq7U7lgMOReH2V1pGYxX7nDPUjhJT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i5rVWb7r4zLgKZHEYBwoOVc1pvBWWfJ7RDRBbff4jED9kBFet3u+6K74AqVq4YcIKtS2AHNw4RR3xkVyLpkcG5OIPirpPHc566y0X7qfG5YOw8Mvpkezgcz3C0y8zKpwfJLfOhaPEM2XrLAG+A5+kaJrT6ROHCC4VzELaekA/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNzh5QwF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36865a516f1so4868900f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2024 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722518557; x=1723123357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLb1qLgoWsW+gImJGbk5D6V8pIq+tCt6QWx4J0PTTdI=;
        b=ZNzh5QwFf6C1uxdMTQK9JcMegdc00eKyl137LvmM2Cty+13Vgl4jkbhrWBMcJPcYC7
         BL+KHDg/T78wo5k97Ukfl7xqOhiZqv+mJdDZ6LJuQTvieGpAfLuujLVJOU1dbF/PvEKI
         cMWSu11cM6KsWms9+Pbagq6P0HOygsHxSc9Wwf6Nn/qyELiUSrx8oa5u0rjzhdyTu3vE
         SXRZHf/vkVswVAST+uJBw8q+H+aCZJkcd2RiDfNhsvsWi+VDg1bAXwob4RKtsC4Pgvxw
         3EAo501T5PTG5pREiyqRO4oR5qeSKEUAjrGejlmvcqOIGXLf42EdOpclghWo2/uUYGI6
         ZVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518557; x=1723123357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLb1qLgoWsW+gImJGbk5D6V8pIq+tCt6QWx4J0PTTdI=;
        b=O/580wc5K9D/gPMwWgbbh2aRjzhq/Zb+Dh1SXkestCMs4K/kVqg1+eOwrQHR7tK14Z
         9CXppRpS+G809EhfHKNvk9Cedib+lPWxf0x/1PrfuMvVw/slYDT86QImOMRXQWRGfxNF
         q/a7c4c9+dqqMw/0tlUYSs6G3io9mSCP3lCuB7iD4qvicpwTHBokqZCwSvPSEBrxXcfc
         poyBui5yM0wbbbu2lCTS13ZH9ps61ZQcneh4bRYPGRbkSDxxc3YmdhU/hVvusxhsdlDH
         +pwzHQhZ08LuR+udEhvIdfV3TS1fYNrenyZjygyQSb26HFAyP+vpJrHazWnbYJuYr9+Z
         ZHdg==
X-Forwarded-Encrypted: i=1; AJvYcCWCRySRSRhYd57E8d0m2NcaU0sj+TUOQWBJeC5NcpJKW1JNs33BHc2Rgcs2fmXDZopdQV8C5r6wL4tCia9csdaBrtsm6vwJPlKNmrrI
X-Gm-Message-State: AOJu0Yw283+wXM9GIs3YLcZAvHeiAYgGQqRCfVJsOBm5OJ6x62Ya+h67
	0Qjm6wfYoBI02GDyG0lfD7S7mS1S5P/k+5HQYNBMdEKbOcZ3G9ny7J8eRhgw1L0=
X-Google-Smtp-Source: AGHT+IHdTYeZX9njsSBlMwhSuCCo533pJKpUTj72cVr421XYQxWRKflFBRYYw+B2+9i+EmUm4OKw/A==
X-Received: by 2002:adf:f107:0:b0:368:7e54:baaa with SMTP id ffacd0b85a97d-36baacbd019mr2170850f8f.4.1722518556920;
        Thu, 01 Aug 2024 06:22:36 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baccae2sm59558925e9.30.2024.08.01.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:22:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
In-Reply-To: <20240606133615.986035-1-masahiroy@kernel.org>
References: <20240606133615.986035-1-masahiroy@kernel.org>
Subject: Re: [PATCH] slimbus: generate MODULE_ALIAS() from
 MODULE_DEVICE_TABLE()
Message-Id: <172251855614.319902.436135083925671177.b4-ty@linaro.org>
Date: Thu, 01 Aug 2024 14:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 06 Jun 2024 22:36:14 +0900, Masahiro Yamada wrote:
> Commit 9e663f4811c6 ("slimbus: core: add support to uevent") added the
> MODALIAS=slim:* uevent variable, but modpost does not generate the
> corresponding MODULE_ALIAS().
> 
> To support automatic module loading, slimbus drivers still need to
> manually add MODULE_ALIAS("slim:<manf_id>:<prod_code>:*"), as seen in
> sound/soc/codecs/wcd9335.c.
> 
> [...]

Applied, thanks!

[1/1] slimbus: generate MODULE_ALIAS() from MODULE_DEVICE_TABLE()
      commit: 9b6e704955fa8db55d11f2e7be5d723c8186ffc6

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


