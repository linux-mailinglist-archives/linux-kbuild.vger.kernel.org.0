Return-Path: <linux-kbuild+bounces-1862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853968C6CC1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 21:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17EAB1F21B27
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 19:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E813BBF6;
	Wed, 15 May 2024 19:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7QHva4l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702E3219F;
	Wed, 15 May 2024 19:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715800859; cv=none; b=M6KiNCLR9RZqb3/g1p7AFXd7Xpag1+MOUlNpkrArGRSPKOZrDzUUBbiUaUAZ/YYA+p5nDpG3vbu1tI2CfNk3T/HS06HZa8CZ3XsYcE5w6JUMhm1NjcJ2pNMu3WLNY8rse6PWyacyijUe/hPNv60Djwwqy20AvcJcuNiBBjgQ1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715800859; c=relaxed/simple;
	bh=mALUPOVcttwB9qRxaA1SdKjINTvZA+iSVd2vEFtwBUE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W/y2LizUwx9a/4ZMc7h5OvJVWdePFr+5YOe6MABZD0L0LCxdjCuOyKTY0l2g9TII6VXk3yfyFZUWWX5PGoCK85jGCafH75gDHqbCnnOzUGA+9i1LVIX2pD0qhgz3LabwevV88khev8lEoTzab7wxiqT47C9X665PVD3mdcXolfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7QHva4l; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b387e2e355so5393896a91.3;
        Wed, 15 May 2024 12:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715800858; x=1716405658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNueC7ZKAj24dbCHR5J8M8dXZRLKiw95Yk/WlGq9LKQ=;
        b=d7QHva4lIrKor0Uc3XPwtuzKtMu7XzuLWN9RgxZZujYyhjjmsenL63kwuq8IwwTmWr
         O5Swg4qZY2S70PpPfW0FmlhdxkgLD0RJapW8V62e2c3u9iY1W416kpxHIn7SsNHLgAjG
         ANAd77Cqf8wetu3pHlSd7x5EHixcGYWVN2OAkmOp1IW5bWRR4cDmigpqq2pzCy6J/JCr
         GbjuaOzCjEdYMuzH3N7jX/wKGDcZo6/KUpwsdcMV286rXDxsbFS0Lh9Oy4TaDtkSKATX
         uSYwyhJwoX/gvctmYS4IuSB9W0Gi8Bxlnm1JovM46tXiz/sKtVqKZDUfSO4HYyLPAAkU
         IrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800858; x=1716405658;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNueC7ZKAj24dbCHR5J8M8dXZRLKiw95Yk/WlGq9LKQ=;
        b=XHsQrTIClLPtF6I1tF0ZYbycQK6z9vlBdadda/lRhCmc5SWqcNIHc8a2fDvwm36nkT
         zEq/hQQWbqx3yrhUYOuXN5E1e/3tkUy/I1mlln0lQBdf3CWd82tahGDtjPYOG3WhD60L
         ZZ3UQskK3NU28v3m0d4kS3lMjsgp8b2HPQDnZoxGe/A32sCkrq6t0umFH+8dYZXCpIrN
         3qFPhzaVc09MzPF4f1999LOEaqpc4fBzDxQt3Hm50YUT2E30KuZlfXXetjrgGH2O1cmx
         ncdHcvhP5uRVCqaRHwUACdhAqIBHrrqalF688oHxzhClSsYa317627hGHWgbDCOf0KPa
         iABw==
X-Forwarded-Encrypted: i=1; AJvYcCVwPEYmcw8YLEGZ1oOLX6IxIIvsSFkPYRnNCm4h9UQ/BWRcDogjyE1z9fZkibXUQ5USayoH6ROQEDCnShrg3EiNGCTQSFrAkrz4LFBg
X-Gm-Message-State: AOJu0YzadzLjHqAhYwsXKON2ZpXxSp05Oy5GP+KJ36gexecOnwTZ2gep
	qygyVP8GYD1FnkFPNr2JQRw97BnxweTdTx4cRg6Hk2ynwMGGJyYb
X-Google-Smtp-Source: AGHT+IFKH8rw3Fz6k+LmxtrjcjjBo6Vy7IYyv+XuX4LGiXifIXZFWwASHWUZW1MnV33xluMUFJ+kqA==
X-Received: by 2002:a17:90a:cf86:b0:2b8:ffa3:f0d7 with SMTP id 98e67ed59e1d1-2b8ffa3fc22mr11571859a91.34.1715800857555;
        Wed, 15 May 2024 12:20:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2b628849965sm13927791a91.15.2024.05.15.12.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 12:20:56 -0700 (PDT)
Message-ID: <19db38dd-b265-45d3-af1c-85d4cb8d075a@gmail.com>
Date: Wed, 15 May 2024 12:20:55 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/net/dsa/dsa_loop_bdinfo.c build problems
From: Florian Fainelli <f.fainelli@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Stephen Langstaff <stephenlangstaff1@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, OlteanV@gmail.com
References: <212a9464-d52b-4730-95b9-5a0aebd38c91@gmail.com>
 <CAHx5RXCWW5M-eW5v65bAkQWZemsU2NTvDv3jA9_XKz=+YP56Qg@mail.gmail.com>
 <688e54ec-3b29-4e3b-a2c3-f2c83b9c97b7@lunn.ch>
 <CAHx5RXBFdzsgKXR94gdZd2b=uz8PJDg4OjLPJxKtsdhcjJq3Qw@mail.gmail.com>
 <e307a237-68e3-40c9-be31-4fe3d560ada2@lunn.ch>
 <CAHx5RXCF0=Soz_k88RGvJFGrajaxn=mVnqpb99GAQ=b7XOcWiw@mail.gmail.com>
 <732d8bb2-1d4f-4958-b130-0bd15a407271@gmail.com>
 <CAHx5RXDaweFTF_Qt0GdBH4nBeMqwL4VVto7xzHBvFgFL5n=Ebg@mail.gmail.com>
 <c8c01e53-0a45-4319-88ff-bfb0caba150c@lunn.ch>
 <CAHx5RXDzN93WaYFe2bk6m2TmMC+A9vsmhodRFmZi17cFY5CrWQ@mail.gmail.com>
 <949fcbea-23dc-44c1-9146-c358b15b9253@lunn.ch>
 <b7d6fdcb-4b01-4bc1-8e4b-3cf4ccb951e3@gmail.com>
Content-Language: en-US
In-Reply-To: <b7d6fdcb-4b01-4bc1-8e4b-3cf4ccb951e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Olek and Masahiro,

On 5/14/24 21:05, Florian Fainelli wrote:
> 
> 
> On 5/14/2024 9:17 AM, Andrew Lunn wrote:
>> On Tue, May 14, 2024 at 05:08:24PM +0100, Stephen Langstaff wrote:
>>> On Tue, May 14, 2024 at 1:32 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>
>>>> So try to making FIXED_PHY = m, and load it after dsa_loop_bdinfo.ko.
>>>
>>> In my configuration FIXED_PHY is selected by several other modules:
>>>    │ Selected by [y]:
>>>    │   - FSL_DPAA_ETH [=y] && NETDEVICES [=y] && ETHERNET [=y] &&
>>> NET_VENDOR_FREESCALE [=y] && FSL_DPAA [=y] && FSL_FMAN [=y]
>>>    │   - FWNODE_MDIO [=y] && NETDEVICES [=y] && MDIO_DEVICE [=y] &&
>>> (ACPI [=y] || OF [=y] || COMPILE_TEST [=n])
>>>    │   - OF_MDIO [=y] && NETDEVICES [=y] && MDIO_DEVICE [=y] && OF [=y]
>>> && PHYLIB [=y]
>>>
>>> ...so it looks pretty tied up with the MDIO support which I guess I
>>> will need for the real PHY!
>>>
>>> If I sorted out building the dsa_loop_bdinfo.c code as a built-in do
>>> you think that would solve the ordering issue?
> 
> I have re-created the issue with CONFIG_FIXED_PHY=y and for a reason I 
> do not yet understand the following rule:
> 
> obj-$(CONFIG_FIXED_PHY)                += dsa_loop_bdinfo.o
> 
> does not result in the kernel image containing the dsa_loop_bdinfo.o 
> object symbols. I am fairly sure this worked when this was submitted 
> back then, so give me a day or two to figure out why. AFAICT the make 
> rule is simply not executed.

Bisection landed on 227d72063fccb2d19b30fb4197fba478514f7d83 ("dsa: 
simplify Kconfig symbols and dependencies") which appeared in v5.13 and 
specifically this hunk being reverted back to how it was before gets us 
the build results we want:

diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 7ffd2d03efaf..5da6424bc6f8 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -45,7 +45,7 @@ obj-$(CONFIG_ARCNET) += arcnet/
  obj-$(CONFIG_DEV_APPLETALK) += appletalk/
  obj-$(CONFIG_CAIF) += caif/
  obj-$(CONFIG_CAN) += can/
-obj-$(CONFIG_NET_DSA) += dsa/
+obj-y += dsa/
  obj-$(CONFIG_ETHERNET) += ethernet/
  obj-$(CONFIG_FDDI) += fddi/
  obj-$(CONFIG_HIPPI) += hippi/

Masahiro, for context in drivers/net/dsa/Makefile we have this bit:

obj-$(CONFIG_NET_DSA_LOOP)      += dsa_loop.o
ifdef CONFIG_NET_DSA_LOOP
obj-$(CONFIG_FIXED_PHY)         += dsa_loop_bdinfo.o
endif

whereby we want dsa_loop.o to follow the value of CONFIG_NET_DSA_LOOP, 
and we want dsa_loop_bdinfo.o to be either built as a module or built 
into the kernel and we want to follow the value of CONFIG_FIXED_PHY 
because there is a functional dependency between the two objects.

Prior to Olek's change this would work just fine because we would always 
descend into drivers/net/dsa/ but after his change, and assuming that 
CONFIG_NET_DSA=m which is the case, then we no longer get 
dsa_loop_bdinfo.o to be built at all when CONFIG_FIXED_PHY=y. 
Essentially only obj-m rules are being processed, obj-y rules are not.

That does not really seem intuitive to me as to why any suggestions on 
how to fix that, short of unconditionally descending into the tree like 
we used to?

Reproducer configuration available here:

https://gist.github.com/ffainelli/2650a832803b502b94b2d247209f61b1

rm drivers/net/dsa/*.o
ARCH=x86 make drivers/net/dsa/
ls drivers/net/dsa/dsa_loop_bdinfo.o

Thanks!
-- 
Florian


