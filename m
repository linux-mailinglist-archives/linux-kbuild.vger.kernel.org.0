Return-Path: <linux-kbuild+bounces-7251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E5AC2CC7
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 02:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442C1540FE1
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 00:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0551C84B3;
	Sat, 24 May 2025 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS6R/Nnd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2B441C71;
	Sat, 24 May 2025 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748047754; cv=none; b=SmghQnTTSJgkR71b72pWHoRDthmUrnK8xXKNybjrnfeCZYcEzkmGgQ1+lzhQ7zza+EJhs4ZQef66NeaMPBNJSvTXoMxyZ8elAnLyefnxy/SfOgTVGz1YqaQwGLuJAEIpeA9Vcf8JMnq/54n7PVYmF5fx9MQ+ruKVMeSCpaahUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748047754; c=relaxed/simple;
	bh=xSvxiBLso91jGsngxigLpcK9seComB2lnzzpkTzcFms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TcHbf9PYNMfIxAE6z6qdxiavdzJQx/HkgVr6eRviz6EjRrAbsZHr9r9TTWdQroxTttfqbnVe8XymupmHZrMm1G+992xNJPa4W2NrB+bPgfJr/k7zr89WsOU0K9ZDmCy5/5dyUZFpdm2WesJEy8CezidawPd5A3mDEm273Qq3p5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS6R/Nnd; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3feaedb4085so317404b6e.0;
        Fri, 23 May 2025 17:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748047752; x=1748652552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6db6paId9+GbKHHJChm9bnYXe9inpg043b90OKEyOU=;
        b=TS6R/Nnd0KfpN8PxxgbXUH8tgBlmpTCI16zdi4ewKdfgFRZE/duYYhYXkEX4ESAP/j
         LTVkoCxR+YJXBprTrwei+qeUmcgCViOpD/Uhb7wXe5+n64LQjUGPCVEkRC1mHPwxEEQ7
         f49To25qUM/kumcw3/DcyY/IBWPI6c7i1lizJgE9FAzsl3j1I3bjxgGdDQCZtsS4498P
         ZJWU2OkFpm8EtY2oqlqOG3VLaF6prvF3ESEGunM1wMacfectfzrGiTsIH6lQh+jtaafE
         StyZczDNPEhhb9zXmqOLOzEnTL+TBCGDnNxozlDBFgKrJrx/MRvxzhy2jOoaZhuCLPsx
         j9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748047752; x=1748652552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6db6paId9+GbKHHJChm9bnYXe9inpg043b90OKEyOU=;
        b=rtdmR34q38ejgyp9cFHxQwSdlj3lYe5D3oLcxd+P7H/ZI+8eRCojKielxYTGxOENQD
         jmFUWkv1JLJmjqBoe6oJ4H9SeInNjI7qRZ42toWOKfaMy5DPH635dBLZbKHum6/R2Vsv
         OuNSHhQo1Nhz2z0jJuDWxsuynslBPsEPPNUQyD4xKNIBhrKP072EXhPGPCRy+QrfeOuU
         OWWeC3lzb7Rx2nQVPUS7ceA7meYneLh3pm3hnIsP5UD9yXoAY7c4GpFxiTMFqn3lLqC2
         4JP99NTlQR7r2NL8lWNAwGeSnP/CRSEHaWP7CziRlWH5N7swotiAL+xkr1zcwtItVctm
         a6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUv9gAiM9KRuvFRyV86d2e1hlgbQJ3WcQkssCzwgLSfgR6mdlVFxPfd+mlnfJl0Oh7Fe4g2bOeOM4lWZWo=@vger.kernel.org, AJvYcCWrfMyMYMu/aSD0G/AoUbU7N2AIOZy5+t/UCHOjpl+mZkILM+NuSU/exgbuPX6Ij9/SbNbyBvuMXaOBpJnR@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIMe7jtETT3LpfwDswMrfyI32hK7JJde6WpoT5Ffx66oiQn/F
	E43/ZjHK51piAvGJVyAwdgm4vLeLdCG+xRd4dOM59DtAzgOUXb+Tb46g
X-Gm-Gg: ASbGncvq4Z4kbJJOMAT8FSiHWRUYeHQ6f7bDhhQ0A/lrHf0lGdop5BCM4psxfsWI0pT
	Qv/5N2WW50/k1B8A3pm2mwykvtT7Qjr6ntS0zYUKQ/LuQlGBBWCZKSIpRt/zaY01dA12EFvX7bB
	IWjEVFkvrD+anUB5HZEwxCKGvE5kb64SBuzlmd5ttv4YiOhUOBkVpjKDx+mCzbwJqzl9jKQo4y8
	vsgreVRHHMGybQm/gYWZ/gEM8UVp77V9RyF5OY2bEV2hh8bAv42sKXAGUhmbwNnkWr9JOp3cLIY
	tga+WB/SpIls6HXdnD8+xSXp1S5bO3xYxs6OzzLopXRb6/sWN/JUDPgtKRzzD1SAE+yW+M/SCEa
	FuGeOy0OGxU5nzIjor6SH
X-Google-Smtp-Source: AGHT+IFgmPRSw7Q6ERORJeluUcpn0Y8teAuBrGOpBe0+GIsg983oxXFX99ieTlJu6rLNh19DONomUg==
X-Received: by 2002:a05:6808:2347:b0:401:e6b9:8893 with SMTP id 5614622812f47-40646813ebfmr486017b6e.7.1748047751836;
        Fri, 23 May 2025 17:49:11 -0700 (PDT)
Received: from [10.0.0.9] (104-50-4-201.lightspeed.sntcca.sbcglobal.net. [104.50.4.201])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d97d62aasm3178300b6e.5.2025.05.23.17.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 17:49:11 -0700 (PDT)
Message-ID: <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com>
Date: Fri, 23 May 2025 17:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3] kconfig: check for a NULL pointer before access
To: Bill Wendling <morbo@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
Content-Language: en-US
From: Bill Wendling <isanbard@gmail.com>
In-Reply-To: <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without cheecking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
v3:
  - Fix whitespace for real now.
  - Patch from another email account so that the whitespace is retained.
v2:
  - Fix whitespace
---
  scripts/kconfig/symbol.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..9c5068225328 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
  		if (prop->visible.tri == no)
  			continue;
  		def_sym = prop_get_symbol(prop);
-		if (def_sym->visible != no)
+		if (def_sym && def_sym->visible != no)
  			return def_sym;
  	}

-- 
2.49.0.1164.gab81da1b16-goog


