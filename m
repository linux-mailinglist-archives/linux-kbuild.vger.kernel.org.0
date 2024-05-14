Return-Path: <linux-kbuild+bounces-1855-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AFA8C5B2F
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 20:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB2F9B220BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 18:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6678D180A9E;
	Tue, 14 May 2024 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc6TgOx5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA2180A92;
	Tue, 14 May 2024 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715711836; cv=none; b=TAEDYn0ljCfpQMxhetvu0629bUnAG6Q+rXu7yeyo/vw3sapR3BBkHws50QRtGqu0rXKwQCtFt72MDTjNTMdr/e17Xg2zt6GI8YkHqUtWUkx1XE4La/nhqNGvwhniTtcDwZoBIs6O73zDXJ2iawVALiT8DAJ24eVbQssO+A+hNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715711836; c=relaxed/simple;
	bh=4Myv3xtmDAuXHEhCvC8owexJwqXWv9V4/KLrsmGT9jo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M0OqnloY/CXPQxS+On1OIrvzJbONB1RJ/EdFYQdA0ouYmlt26v7evmTKtk3l1Os1IKAg70grgA1sno4NH4diaoOz+nqlqbFa5G/X9CSqilaOyC4r/HqZbhGLdPv0zj7JcsjmKxo2DXPo49+6P9/B203ajWSX/KoUSkPc4fYEPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc6TgOx5; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3fa13f018so74129661fa.3;
        Tue, 14 May 2024 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715711833; x=1716316633; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6smwb6gdiy2UYrMze+iz4FO60WqVgDUqAJSkPN14yak=;
        b=Bc6TgOx5kEqe2drXjMISx8WcIUWEpIe+XpXJV86CLZZ/urb00BXl6lC0dfcW3M9Y7g
         Ts+fJSPNW5+QJdnGCt2LAbq+kRxn6iB2KNizAFPE3zak6DW9gM7JGr180JnohSISnQ0Q
         xanMrY7wiFXVYJngx7R8wi3QtuOoNXTdHeVhr3cAO0QW+yz5Vuf2wVdB55vcEKc5Pr37
         d/Hic0BWu5VKNazHMc1aXtmnF1D2M4UWDeTbjNmHI1YK1CGTnVwuX5Q+pEnplhACbQLL
         J4/8KGlaJBstMdxdC1CAOAX0AF+jUyEtmpNckJbh2lhmawJGY0dRWG2gCWKUmLFRT69M
         LIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715711833; x=1716316633;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6smwb6gdiy2UYrMze+iz4FO60WqVgDUqAJSkPN14yak=;
        b=kAwWuMyM1YhZT2PZP5QV3BVO4avH8EmaDXVzqzQz/e7cMGHGhzLF3rqmVR5+Tm+Ly+
         lMPkWbyTuZ6sRcqQwNloDTG68zYfmq6AXt18NrZzBdeZiBH70/QKKyoz75wgopVgdivg
         L5WB3LIzokKJC94MgPyzfGsjZfooVsMyVDu/qm9eTRSdajNMtFaMzo/QTkmFyJEPqyEu
         VL9N9xDujVvZZuvySPmV6qWY/tuEavuGPozfHj4IB3RxlCKi7Bvrg0CqTtE2oLuiZ/A0
         8ugdKibwvzB92YNb2++H7pRcD9QhdH8a3KRaoMp1ql6Pd3ItLh8LzcjqXUKRXpxv8xcH
         PaHA==
X-Forwarded-Encrypted: i=1; AJvYcCV4X3r5INlfYkqn6KyCjLuNXzBaAyHwMhS3MiB98t02IfWgpYkD01uwj1H5RHRqrLWFNnYYFgf3HUw4MdfG//d27cDY7tncJHHKyxfJ
X-Gm-Message-State: AOJu0YzEqRxtQp2jwuDQe6rze//XHw1pGXtXC++J+sa/DOen1goi5/DY
	ffFbiH/xKtNXe8bKVBLLQhV8LBZAssInEoiY8zMut6r9MDq6segoHQgtBQ==
X-Google-Smtp-Source: AGHT+IFuZJHBRzu8nxXeg85FM9ibS4X/s30rmmbXIUWA4rsJQsZOLE8Ll5cwYgdf0Mn1AHWaAPOWBg==
X-Received: by 2002:a2e:6812:0:b0:2df:49b:27f1 with SMTP id 38308e7fff4ca-2e51fd2e03emr102121591fa.4.1715711832438;
        Tue, 14 May 2024 11:37:12 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-52.xnet.hr. [88.207.43.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4201da9895csm45735195e9.44.2024.05.14.11.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 11:37:11 -0700 (PDT)
Message-ID: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
Date: Tue, 14 May 2024 20:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PROBLEM linux-next] Error in "make olddefconfig" and "make
 menuconfig"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mr. Bagas,

While bisecting a problem in linux-next tree, I came across the problem:

marvin@defiant:~/linux/kernel/linux-next$ git describe
v6.7-rc5-2761-gefc11f34e25f
marvin@defiant:~/linux/kernel/linux-next$ make olddefconfig
make[2]: *** No targets.  Stop.
make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
make: *** [Makefile:234: __sub-make] Error 2
marvin@defiant:~/linux/kernel/linux-next$ make menuconfig
make[2]: *** No targets.  Stop.
make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
make: *** [Makefile:234: __sub-make] Error 2
marvin@defiant:~/linux/kernel/linux-next$ 

Now, this occurred for the first time, and I don't know how to bail out.

I recall in past couple of years you have some insightful advice.

Thank you very much.

Best regards,
Mirsad Todorovac

